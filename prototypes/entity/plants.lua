local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local spoilage_sound = sound_variations("__space-age__/sound/mining/spoilage", 3, 0) --at zero vol until the correct particle fx are in place

local spoilage_sound_trigger =
{
  {
    type = "play-sound",
    sound = spoilage_sound,
    damage_type_filters = "fire"
  }
}

data:extend(
{
  {
    type = "simple-entity",
    name = "wild-hive",
    icon = "__apia__/graphics/entity/wild-hive/wild-hive_icon.png",
	icon_size = 256,
    flags = {"placeable-neutral", "placeable-off-grid"},
	autoplace =
	{
	  probability_expression = "apia_biome2 * 0.000005",
	  richness_expression = "random_penalty_at(1, 0.85)",
	  tile_restriction = {"apia-biome2"}
	},
    minable =
    {
      mining_particle = "boompuff-mining-particle",
      mining_time = 1,
      results =
      {
	    {type = "item", name = "honeycombs", amount = 40},
        {type = "item", name = "spoilage", amount = 20},
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = spoilage_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-boompuff", 5, 0.6),
    emissions_per_second = { pollution = -0.001 },
    max_health = 100,
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1, -1}, {1, 1}},
    --drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c[apia]-b[normal]-g[wild-hive]",
    impact_category = "tree",
	render_layer = "object",
    pictures =
    {
      {
        filename = "__apia__/graphics/entity/wild-hive/wild-hive.png",
		width = 600,
		height = 600,
		shift = util.by_pixel( 0.0, 0.0 ),
		--animation_speed = 0.4,
		--frame_count = 44,
		--line_length = 11,
        scale = 0.25
      }
	},
	stateless_visualisation =
	{
	  {
		  count = 1,
		  render_layer = "smoke",
		  offset_x = 0,
		  offset_y = -1,
		  animation =
		  {
			filename = "__space-age__/graphics/entity/sulfuric-acid-geyser/sulfuric-acid-geyser-gas-outer.png",
			frame_count = 47,
			line_length = 16,
			width = 90,
			height = 188,
			animation_speed = 0.3,
			shift = util.by_pixel(-6, -89),
			scale = 1,
			tint = util.multiply_color({r=169, g=150, b=95}, 0.3)
		  }
      },
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/boompuff", 5, 0.8),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 8
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "dark-mud-decal",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 2
          },
          {
            type = "create-decorative",
            decorative = "mycelium",
            spawn_min = 1,
            spawn_max = 3,
            spawn_min_radius = 1,
            spawn_max_radius = 2
          },
		  {
            type = "create-decorative",
            decorative = "worms-decal",
            spawn_min = 1,
            spawn_max = 2,
            spawn_min_radius = 1,
            spawn_max_radius = 1
          },
        }
      }
    }
  },
  {
    type = "tree",
    name = "honey-mushroom",
    icon = "__apia__/graphics/icons/honey-mushroom.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
	autoplace =
	{
	  probability_expression = "apia_biome4 * apia_biome_detail * 0.0005",
	  richness_expression = "random_penalty_at(3, 1.4)",
	  tile_restriction = {"apia-biome4"}
	},
    minable =
    {
      mining_particle = "yumako-mining-particle",
      mining_time = 1,
      results =
      {
        {type = "item", name = "honey", amount = 20},
		{type = "item", name = "wood", amount = 4}
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = spoilage_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
    emissions_per_second = { pollution = -0.001 },
    max_health = 50,
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1, -1}, {1, 1}},
    --drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c[apia]-b[normal]-g[honey-mushroom]",
    impact_category = "tree",
    pictures =
    {
      {
        filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_00.png",
		width = 256,
		height = 256,
		scale = 0.7,
      },
	  {
        filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_01.png",
		width = 256,
		height = 256,
		scale = 0.7,
      },
	  {
        filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_02.png",
		width = 256,
		height = 256,
      },
	  {
        filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_03.png",
		width = 256,
		height = 256,
		scale = 1.1,
      },
	  {
        filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_04.png",
		width = 256,
		height = 256,
		scale = 1.7,
      },
	  {
        filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_05.png",
		width = 256,
		height = 256,
		scale = 1.7,
      },
	  {
        filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_06.png",
		width = 256,
		height = 256,
		scale = 1.7,
      },
	},
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/yumako-tree", 6, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.2,
      average_pause_seconds = 8
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "dark-mud-decal",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 2
          },
		  {
            type = "create-decorative",
            decorative = "curly-roots-orange",
            spawn_min = 1,
            spawn_max = 1,
            spawn_min_radius = 0,
            spawn_max_radius = 1
          },
		  {
            type = "create-decorative",
            decorative = "yellow-lettuce-lichen-cups-3x3",
            spawn_min = 1,
            spawn_max = 5,
            spawn_min_radius = 1,
            spawn_max_radius = 2
          },
        }
      }
    }
  },
})
