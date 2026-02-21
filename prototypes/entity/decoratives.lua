local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local base_sounds = require ("__base__.prototypes.entity.sounds")
local spoilage_sound = sound_variations("__space-age__/sound/mining/spoilage", 3, 0) --at zero vol until the correct particle fx are in place
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")



local piranha_roots_orange = table.deepcopy(data.raw["optimized-decorative"]["knobbly-roots-orange"])
piranha_roots_orange.name = "piranha-roots-orange"
piranha_roots_orange.autoplace = nil
piranha_roots_orange.collision_mask = {layers={doodad=true, ground_tile=true}, colliding_with_tiles_only=true, not_colliding_with_itself=true}


data:extend({
	piranha_roots_orange,
	{
		name = "flesh-fingers",
		type = "optimized-decorative",
		order = "b[cover]-z[carnova][flesh-fingers]",
		collision_box = {{-1, -1}, {1, 1}},
		collision_mask = {layers={doodad=true}, colliding_with_tiles_only=true, not_colliding_with_itself=true},
		walking_sound = base_tile_sounds.walking.small_bush,
		render_layer = "object",
		pictures =
		{
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-01.png",
			width = 224,
			height = 128,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-02.png",
			width = 290,
			height = 175,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-03.png",
			width = 253,
			height = 215,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-04.png",
			width = 320,
			height = 149,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-05.png",
			width = 210,
			height = 192,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-06.png",
			width = 210,
			height = 192,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-07.png",
			width = 275,
			height = 240,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-08.png",
			width = 131,
			height = 124,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-09.png",
			width = 122,
			height = 88,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-10.png",
			width = 119,
			height = 69,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-11.png",
			width = 90,
			height = 85,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-12.png",
			width = 157,
			height = 106,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-13.png",
			width = 137,
			height = 130,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-14.png",
			width = 83,
			height = 87,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		  {
			filename = "__apia__/graphics/decorative/flesh-fingers/bob-fingers-small-15.png",
			width = 105,
			height = 49,
			shift = util.by_pixel(0, -0.25),
			scale = 0.5
		  },
		}
	},
})