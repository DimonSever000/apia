local explosion_animations = require("__space-age__.prototypes.entity.explosion-animations")
local smoke_animations = require("__base__.prototypes.entity.smoke-animations")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")


data:extend{
  {
    type = "explosion",
    name = "nuke-effects-apia",
    flags = {"not-on-map"},
    hidden = true,
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/atomic-bomb.png"}
    },
    localised_name = {"entity-name.nuke-explosion"},
    order = "a-d-a-b",
    subgroup = "explosions",
    height = 0,
    animations = util.empty_sprite(),
    surface_conditions =
    {
		{
			property = "pressure",
			min = 2500,
			max = 2500
		},
		{
			property = "gravity",
			min = 50,
			max = 50
		}
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "set-tile",
            tile_name = "royal-jelly-lake2",
            radius = 8,
            apply_projection = true,
            tile_collision_mask = { layers={out_of_map=true} }
          },
          {
            type = "set-tile",
            tile_name = "royal-jelly-lake",
            radius = 12,
            apply_projection = true,
            tile_collision_mask = { layers={water_tile=true} }
          }
        }
      }
    }
  }
}

local function atomic_rocket_surface_explosion(explosion_name)
  -- target index 2, otherwise the lava tiles can remove cliffs first and you'd not get the achievement for cliff destruction.
  table.insert(data.raw.projectile["atomic-rocket"].action.action_delivery.target_effects, 2, {
    type = "create-entity",
    check_buildability = true,
    entity_name = explosion_name
  })
end
atomic_rocket_surface_explosion("nuke-effects-apia")