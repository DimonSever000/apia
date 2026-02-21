local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local patch_for_inner_corner_of_transition_between_transition = tile_graphics.patch_for_inner_corner_of_transition_between_transition




table.insert(water_tile_type_names, "royal-jelly-lake")
table.insert(water_tile_type_names, "royal-jelly-lake2")

local royal_jelly_lake = table.deepcopy(data.raw.tile["water"])
royal_jelly_lake.name = "royal-jelly-lake"
royal_jelly_lake.order = "a[apia][royal-jelly-lake]"
royal_jelly_lake.subgroup = "apia-tiles"
royal_jelly_lake.fluid = "royal-jelly"
royal_jelly_lake.collision_mask = tile_collision_masks.oil_ocean_shallow()
royal_jelly_lake.effect_color = { 204, 169, 129 } --{ 202, 150, 93 }
royal_jelly_lake.map_color={194, 159, 119 }
royal_jelly_lake.default_cover_tile = "wax-platform"
royal_jelly_lake.autoplace = {probability_expression = "apia_ocean"}
royal_jelly_lake.walking_speed_modifier = 0.8
royal_jelly_lake.vehicle_friction_modifier = 4
royal_jelly_lake.walking_sound = tile_sounds.walking.oil_deep
royal_jelly_lake.landing_steps_sound = tile_sounds.landing.oil
royal_jelly_lake.driving_sound = base_tile_sounds.driving.oil
royal_jelly_lake.lowland_fog = true


local royal_jelly_lake2 = table.deepcopy(data.raw.tile["water"])
royal_jelly_lake2.name = "royal-jelly-lake2"
royal_jelly_lake2.order = "a[apia][royal-jelly-lake2]"
royal_jelly_lake2.subgroup = "apia-tiles"
royal_jelly_lake2.fluid = "royal-jelly"
royal_jelly_lake2.collision_mask = tile_collision_masks.oil_ocean_deep()
royal_jelly_lake2.effect_color = { 192, 151, 104 }--{ 180, 130, 70 }
royal_jelly_lake2.map_color={182, 141, 94 }
royal_jelly_lake2.default_cover_tile = "wax-platform"
royal_jelly_lake2.autoplace = {probability_expression = "apia_deep_ocean"}
royal_jelly_lake2.walking_speed_modifier = 0.5
royal_jelly_lake2.vehicle_friction_modifier = 10
royal_jelly_lake2.walking_sound = tile_sounds.walking.oil_deep
royal_jelly_lake2.landing_steps_sound = tile_sounds.landing.oil
royal_jelly_lake2.driving_sound = base_tile_sounds.driving.oil
royal_jelly_lake2.lowland_fog = true
--midland-cracked-lichen
--midland-cracked-lichen-dull
--midland-yellow-crust
--midland-yellow-crust-3
--midland-yellow-crust-4

local apia_biome1 = table.deepcopy(data.raw.tile["volcanic-smooth-stone"])
apia_biome1.name = "apia-biome1"
apia_biome1.order = "a[apia][apia-biome1]"
apia_biome1.subgroup = "apia-tiles"
apia_biome1.autoplace = {probability_expression = "apia_biome1"}
apia_biome1.map_color={76, 59, 42 }

local apia_biome2 = table.deepcopy(data.raw.tile["midland-cracked-lichen"])
apia_biome2.name = "apia-biome2"
apia_biome2.order = "a[apia][apia-biome2]"
apia_biome2.subgroup = "apia-tiles"
apia_biome2.autoplace = {probability_expression = "apia_biome2"}
apia_biome2.map_color={101, 84, 51 }

local apia_biome3 = table.deepcopy(data.raw.tile["midland-yellow-crust-3"])
apia_biome3.name = "apia-biome3"
apia_biome3.order = "a[apia][apia-biome3]"
apia_biome3.subgroup = "apia-tiles"
apia_biome3.autoplace = {probability_expression = "apia_biome3"}
apia_biome3.map_color={154, 109, 56 }

local apia_biome4 = table.deepcopy(data.raw.tile["midland-yellow-crust"])
apia_biome4.name = "apia-biome4"
apia_biome4.order = "a[apia][apia-biome4]"
apia_biome4.subgroup = "apia-tiles"
apia_biome4.autoplace = {probability_expression = "apia_biome4"}
apia_biome4.map_color={172, 112, 46 }

local wax_platform = table.deepcopy(data.raw.tile["midland-yellow-crust-4"])
wax_platform.name = "wax-platform"
wax_platform.order = "a[apia][wax-platform]"
wax_platform.subgroup = "apia-tiles"
wax_platform.layer = apia_biome4.layer + 10
wax_platform.is_foundation = true
wax_platform.collision_mask = tile_collision_masks.ground()
wax_platform.searchable = true
wax_platform.mined_sound = base_sounds.deconstruct_bricks(0.8)
wax_platform.minable = {mining_time = 0.5, result = "wax-platform"}
wax_platform.map_color={200, 139, 59 }


data:extend({
  royal_jelly_lake,
  royal_jelly_lake2,
  apia_biome1,
  apia_biome2,
  apia_biome3,
  apia_biome4,
  wax_platform,
})