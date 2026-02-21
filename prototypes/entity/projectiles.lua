local sounds = require("__base__.prototypes.entity.sounds")
local smoke_animations = require("__base__.prototypes.entity.smoke-animations")
local util = require("util")
local smoke_fast_animation = smoke_animations.trivial_smoke_fast
local trivial_smoke = smoke_animations.trivial_smoke



local phosphorus_cloud = table.deepcopy(data.raw["smoke-with-trigger"]["poison-cloud"])
phosphorus_cloud.name = "phosphorus-cloud"
phosphorus_cloud.affected_by_wind = true
phosphorus_cloud.color = {0.1, 0.1, 0.1, 0.01}
phosphorus_cloud.created_effect =
{
  {
    type = "cluster",
    cluster_count = 10,
    distance = 4,
    distance_deviation = 5,
    action_delivery =
    {
      type = "instant",
      target_effects =
      {
        {
          type = "create-smoke",
          show_in_tooltip = false,
          entity_name = "phosphorus-cloud-visual-dummy",
          initial_height = 0
        },
        {
          type = "play-sound",
          sound = sounds.poison_capsule_explosion
        }
      }
    }
  },
  {
    type = "cluster",
    cluster_count = 11,
    distance = 8 * 1.1,
    distance_deviation = 2,
    action_delivery =
    {
      type = "instant",
      target_effects =
      {
        {
          type = "create-smoke",
          show_in_tooltip = false,
          entity_name = "phosphorus-cloud-visual-dummy",
          initial_height = 0
        }
      }
    }
  }
}
phosphorus_cloud.action =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "nested-result",
        action =
        {
          type = "area",
          radius = 11,
          entity_flags = {"breaths-air"},
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "damage",
                damage = { amount = 7, type = "fire"}
              },
			  {
                type = "damage",
                damage = { amount = 3, type = "poison"}
              }
            }
          }
        }
      }
    }
  }
}

local phosphorus_cloud_visual_dummy = table.deepcopy(data.raw["smoke-with-trigger"]["poison-cloud-visual-dummy"])
phosphorus_cloud_visual_dummy.name = "phosphorus-cloud-visual-dummy"
phosphorus_cloud_visual_dummy.affected_by_wind = true
phosphorus_cloud_visual_dummy.color = {0.1, 0.1, 0.1, 0.01}



data:extend
{
	phosphorus_cloud, 
	phosphorus_cloud_visual_dummy,
}


data:extend(
{
  {
    type = "projectile",
    name = "flamethrower-capsule",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            show_in_tooltip = true,
            entity_name = "flamethrower"
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    enable_drawing_with_mask = true,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule.png",
          flags = { "no-crop" },
          width = 28,
          height = 20,
          priority = "high"
        },
        {
          filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule-mask.png",
          flags = { "no-crop" },
          width = 28,
          height = 20,
          priority = "high",
          apply_runtime_tint = true
        }
      }
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule-shadow.png",
      flags = { "no-crop" },
      width = 26,
      height = 20,
      priority = "high"
    },
    smoke = 
	{
		{
			name = "smoke-fast",
			deviation = {0.15, 0.15},
			frequency = 1,
			position = {0, 0},
			starting_frame = 3,
			starting_frame_deviation = 5,
		}
	}
  },
  {
    type = "artillery-projectile",
    name = "artillery-projectile-with-phosphorus",
    flags = {"not-on-map"},
    hidden = true,
    reveal_map = true,
    map_color = {1, 1, 0},
    picture =
    {
      filename = "__base__/graphics/entity/artillery-projectile/shell.png",
      draw_as_glow = true,
      width = 64,
      height = 64,
      scale = 0.5
    },
    shadow =
    {
      filename = "__base__/graphics/entity/artillery-projectile/shell-shadow.png",
      width = 64,
      height = 64,
      scale = 0.5
    },
    chart_picture =
    {
      filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",
      flags = { "icon" },
      width = 64,
      height = 64,
      priority = "high",
      scale = 0.25
    },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 7.0,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 700 , type = "physical"}
                  },
                  {
                    type = "damage",
                    damage = {amount = 700 , type = "explosion"}
                  },
                }
              }
            }
          },
          {
            type = "create-trivial-smoke",
            smoke_name = "artillery-smoke",
            initial_height = 0,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.005,
            offset_deviation = {{-4, -4}, {4, 4}},
            max_radius = 3.5,
            repeat_count = 4 * 4 * 15
          },
		  {
			  type = "create-smoke",
			  entity_name = "phosphorus-cloud",
			  repeat_count = 8,
			  random_offset = true,
			  offset_deviation = {{-8, -8}, {8, 8}}
		  },
          {
            type = "create-entity",
            entity_name = "big-artillery-explosion"
          },
          {
            type = "show-explosion-on-chart",
            scale = 8/32
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "medium-scorchmark-tintable",
            check_buildability = true
          },
          {
            type = "invoke-tile-trigger",
            repeat_count = 1
          },
          {
          type = "destroy-decoratives",
          from_render_layer = "decorative",
          to_render_layer = "object",
          include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
          include_decals = false,
          invoke_decorative_trigger = true,
          decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
          radius = 3.5 -- large radius for demostrative purposes
          },
        }
      }
    },
    height_from_ground = 280 / 64
  },
})
