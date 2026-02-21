require ("__base__.prototypes.entity.pipecovers")
local animation_speed = 0.16

local function biosynthesizer_pipe_h_pictures()
  return util.sprite_load("__apia__/graphics/entity/biosynthesizer/biosynthesizer-pipe-connections-h",
  {
    repeat_count = frames,
    scale = 0.5
  })
end

local function biosynthesizer_pipe_v_pictures()
  return util.sprite_load("__apia__/graphics/entity/biosynthesizer/biosynthesizer-pipe-connections-v",
  {
    repeat_count = frames,
    scale = 0.5
  })
end


return
{
  graphics_set =
  {
    animation =
    {
      layers =
      {
		{
			filename = "__apia__/graphics/entity/biosynthesizer/biosynthesizer-animation.png",
			width = 500,
			height = 500,
			line_length = 8,
			animation_speed = animation_speed,
			frame_count = 60,
			scale = 0.35,
			shift = {0, -0.35},
		},
		{
			filename = "__apia__/graphics/entity/biosynthesizer/biosynthesizer-shadow.png",
			width = 900,
			height = 700,
			line_length = 1,
			animation_speed = animation_speed,
			frame_count = 1,
			repeat_count = 60,
			scale = 0.35,
			draw_as_shadow = true,
			shift = {0, -0.35},
		},
      }
    },
    frozen_patch = 
	{
		filename = "__apia__/graphics/entity/biosynthesizer/biosynthesizer-frozen.png",
		width = 500,
		height = 500,
		line_length = 8,
		animation_speed = animation_speed,
		frame_count = 60,
		scale = 0.35,
		shift = {0, -0.35},
	},
    working_visualisations =
    {
		{
			effect = "uranium-glow",
			fadeout = true,
			light = {intensity = 0.2, size = 9.9, shift = {0, 0}, color = {1, 0, 0}}
		},
		{
			fadeout = true,
			effect = "flicker",
			animation = 
			{
				filename = "__apia__/graphics/entity/biosynthesizer/biosynthesizer-emission.png",
				width = 500,
				height = 500,
				line_length = 8,
				animation_speed = animation_speed,
				priority = "extra-high",
				frame_count = 60,
				blend_mode = "additive",
				draw_as_glow = true,
				scale = 0.35,
				shift = {0, -0.35},
			},
		},
		{
			always_draw = true,
			name = "output-pipe",
			enabled_by_name = true,
			north_animation = biosynthesizer_pipe_v_pictures(),
			east_animation = biosynthesizer_pipe_h_pictures(),
			east_secondary_draw_order = -10,
			south_animation = biosynthesizer_pipe_v_pictures(),
			west_animation = biosynthesizer_pipe_h_pictures(),
			west_secondary_draw_order = -10,
		},
		{
			always_draw = true,
			name = "input-pipe",
			enabled_by_name = true,
			north_animation = biosynthesizer_pipe_h_pictures(),
			north_secondary_draw_order = -10,
			east_animation = biosynthesizer_pipe_v_pictures(),
			south_animation = biosynthesizer_pipe_h_pictures(),
			south_secondary_draw_order = -10,
			west_animation = biosynthesizer_pipe_v_pictures(),
		},
    }
  },
  light_flicker =
  {
    minimum_intensity = 0,
    maximum_intensity = 0,
    derivation_change_frequency = 0,
    derivation_change_deviation = 0.,
    border_fix_speed = 0,
    minimum_light_size = 0,
    light_intensity_to_size_coefficient = 0.0,
    color = {0, 0, 0, 1}
  }
}