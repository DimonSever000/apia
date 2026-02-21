require("__space-age__/prototypes/planet/planet-vulcanus-map-gen")
local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")
local asteroid_functions = require("__space-age__/prototypes/planet/asteroid-spawn-definitions")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local planet_catalogue_aquilo = require("__space-age__.prototypes.planet.procession-catalogue-aquilo")
local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")
local planet_lib = require("__PlanetsLib__.lib.planet")


local apia_carnova_orbit = 
{
    type = "space-location",
    name = "apia-carnova-orbit",
    icon = "__apia__/graphics/icons/space/apia-carnova-orbit-icon.png",
	starmap_icon = "__apia__/graphics/icons/empty-icon-64.png",
	icon_size = 64,
	starmap_icon_size = 64,
	--sprite_only = true,
	draw_orbit = true,
	--hidden = true,
	magnitude = 0.3,
	label_orientation = 0.1,
	solar_power_in_space = 120,
	subgroup = "planets",
	order = "c-c-[apia-carnova-orbit]",
	asteroid_spawn_influence = 1.5,
	asteroid_spawn_definitions = asteroid_functions.spawn_definitions(asteroid_functions.gleba_apia_carnova_orbit, 0.9),
	orbit =
	{
		parent = data.raw["space-location"]["star"],
		distance = 25,
		orientation = 0.14
    }
}

PlanetsLib:extend
{
	apia_carnova_orbit,
	{
		type = "planet",
		name = "apia",
		icon = "__apia__/graphics/icons/space/apia.png",
		starmap_icon = "__apia__/graphics/icons/space/starmap-planet-apia.png",
		map_gen_settings = planet_map_gen.apia(),
		starmap_icon_size = 512,
		gravity_pull = 10,
		magnitude = 0.75,
		label_orientation = 0.15,
		order = "c-a-[apia]",
		subgroup = "planets",
		draw_orbit = false,
		orbit =
		{
			parent = apia_carnova_orbit,
			distance = 1.5,
			orientation = 0.9,
		},
		pollutant_type = nil,
		solar_power_in_space = 120,
		surface_properties =
		{
			["day-night-cycle"] = 15 * minute,
			["magnetic-field"] = 15,
			["pressure"] = 2525,
			["solar-power"] = 50,
			["gravity"] = 31.5625
		},
		platform_procession_set =
		{
		  arrival = {"planet-to-platform-b"},
		  departure = {"platform-to-planet-a"}
		},
		planet_procession_set =
		{
		  arrival = {"platform-to-planet-b"},
		  departure = {"planet-to-platform-a"}
		},
		surface_render_parameters=
		{
		  fog =
		  {
			fog_type = "gleba",
			shape_noise_texture =
			{
			  filename = "__core__/graphics/clouds-noise.png",
			  size = 2048
			},
			detail_noise_texture =
			{
			  filename = "__core__/graphics/clouds-detail-noise.png",
			  size = 2048
			},
			color1 = {204, 169, 129, 1.0},
			color2 = {192, 151, 104, 1.0},
			tick_factor = 0.000001,
		  },
		  clouds = effects.default_clouds_effect_properties(),
		  day_night_cycle_color_lookup =
		  {
			{0.00, "__space-age__/graphics/lut/gleba-1-noon.png"},
			{0.15, "__space-age__/graphics/lut/gleba-2-afternoon.png"},
			{0.25, "__space-age__/graphics/lut/gleba-3-late-afternoon.png"},
			{0.35, "__space-age__/graphics/lut/gleba-4-sunset.png"},
			{0.45, "__space-age__/graphics/lut/gleba-5-after-sunset.png"},
			{0.55, "__space-age__/graphics/lut/gleba-6-before-dawn.png"},
			{0.65, "__space-age__/graphics/lut/gleba-7-dawn.png"},
			{0.75, "__space-age__/graphics/lut/gleba-8-morning.png"},
		  },
		},
		procession_graphic_catalogue = planet_catalogue_aquilo, 
		asteroid_spawn_influence = 1,
		asteroid_spawn_definitions = asteroid_functions.spawn_definitions(asteroid_functions.gleba_apia_carnova_orbit, 0.9),
		persistent_ambient_sounds =
		{
		  base_ambience =
		  {
			{sound = {filename = "__space-age__/sound/wind/base-wind-gleba-night.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = 0.85}}},
			{sound = {filename = "__apia__/sound/beehive/beehive.ogg", volume = 0.2, advanced_volume_control = {darkness_threshold = -0.7}}}
		  },
		  wind = {filename = "__space-age__/sound/wind/wind-gleba.ogg", volume = 0.8},
		  crossfade =
		  {
			order = {"wind", "base_ambience"},
			curve_type = "cosine",
			from = {control = 0.35, volume_percentage = 0.2},
			to = {control = 2, volume_percentage = 100.0}
		  },
		  semi_persistent =
		  {
			{
			  sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/wind-gust", 6, 0.4)},
			  delay_mean_seconds = 10,
			  delay_variance_seconds = 5
			},
			{
			  sound =
				{
				  filename = "__space-age__/sound/world/weather/rain.ogg", volume = 0.25,
				  advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.2, volume_percentage = 0.6}, to = {1.2, 100.0 }}}}
				}
			},
			{
			  sound =
				{
				  variations = sound_variations("__space-age__/sound/world/semi-persistent/night-birds", 14, 0.4),
				  advanced_volume_control =
				  {
					fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
					darkness_threshold = 0.85
				  }
				},
				delay_mean_seconds = 10,
				delay_variance_seconds = 5
			}
		  }
		},
		ticks_between_player_effects = 2
	},
	{
		type = "planet",
		name = "carnova",
		icon = "__apia__/graphics/icons/space/carnova.png",
		starmap_icon = "__apia__/graphics/icons/space/starmap-planet-carnova.png",
		map_gen_settings = planet_map_gen.carnova(),
		starmap_icon_size = 512,
		gravity_pull = 10,
		--distance = 22,
		--orientation = 0.1,
		magnitude = 1,
		label_orientation = 0.15,
		order = "c-b-[carnova]",
		subgroup = "planets",
		pollutant_type = nil,
		solar_power_in_space = 120,
		orbit =
		{
			parent = apia_carnova_orbit,
			distance = 1.5,
			orientation = 0.4,
			sprite =
			{
				type = "sprite",
				filename = "__apia__/graphics/icons/space/apia-carnova-orbit.png",
				size = 380,
				scale = 0.3,
			}
		},
		surface_properties =
		{
			["day-night-cycle"] = 10 * minute,
			["magnetic-field"] = 0,
			["pressure"] = 2525,
			["solar-power"] = 75,
			["gravity"] = 25.25
		},
		platform_procession_set =
		{
		  arrival = {"planet-to-platform-b"},
		  departure = {"platform-to-planet-a"}
		},
		planet_procession_set =
		{
		  arrival = {"platform-to-planet-b"},
		  departure = {"planet-to-platform-a"}
		},
		surface_render_parameters=
		{
		  fog =
		  {
			fog_type = "gleba",
			shape_noise_texture =
			{
			  filename = "__core__/graphics/clouds-noise.png",
			  size = 2048
			},
			detail_noise_texture =
			{
			  filename = "__core__/graphics/clouds-detail-noise.png",
			  size = 2048
			},
			color1 = {204, 169, 129, 1.0},
			color2 = {192, 151, 104, 1.0},
			tick_factor = 0.000001,
		  },
		  clouds = effects.default_clouds_effect_properties(),
		  day_night_cycle_color_lookup =
		  {
			{0.00, "__space-age__/graphics/lut/gleba-1-noon.png"},
			{0.15, "__space-age__/graphics/lut/gleba-2-afternoon.png"},
			{0.25, "__space-age__/graphics/lut/gleba-3-late-afternoon.png"},
			{0.35, "__space-age__/graphics/lut/gleba-4-sunset.png"},
			{0.45, "__space-age__/graphics/lut/gleba-5-after-sunset.png"},
			{0.55, "__space-age__/graphics/lut/gleba-6-before-dawn.png"},
			{0.65, "__space-age__/graphics/lut/gleba-7-dawn.png"},
			{0.75, "__space-age__/graphics/lut/gleba-8-morning.png"},
		  },
		},
		procession_graphic_catalogue = planet_catalogue_aquilo, 
		asteroid_spawn_influence = 1,
		asteroid_spawn_definitions = asteroid_functions.spawn_definitions(asteroid_functions.gleba_apia_carnova_orbit, 0.9),
		persistent_ambient_sounds =
		{
		  base_ambience =
		  {
			{sound = {filename = "__space-age__/sound/wind/base-wind-gleba-night.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = 0.85}}},
			{sound = {filename = "__space-age__/sound/wind/base-wind-gleba-day.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = -0.7}}}
		  },
		  wind = {filename = "__space-age__/sound/wind/wind-gleba.ogg", volume = 0.8},
		  crossfade =
		  {
			order = {"wind", "base_ambience"},
			curve_type = "cosine",
			from = {control = 0.35, volume_percentage = 0.2},
			to = {control = 2, volume_percentage = 100.0}
		  },
		  semi_persistent =
		  {
			{
			  sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/wind-gust", 6, 0.4)},
			  delay_mean_seconds = 10,
			  delay_variance_seconds = 5
			},
			{
			  sound =
				{
				  filename = "__space-age__/sound/world/weather/rain.ogg", volume = 0.25,
				  advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.2, volume_percentage = 0.6}, to = {1.2, 100.0 }}}}
				}
			},
			{
			  sound =
				{
				  variations = sound_variations("__space-age__/sound/world/semi-persistent/night-birds", 14, 0.4),
				  advanced_volume_control =
				  {
					fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
					darkness_threshold = 0.85
				  }
				},
				delay_mean_seconds = 10,
				delay_variance_seconds = 5
			}
		  }
		},
		player_effects =
		{
		  type = "cluster",
		  cluster_count = 10,
		  distance = 8,
		  distance_deviation = 8,
		  action_delivery =
		  {
			type = "instant",
			source_effects =
			{
			  type = "create-trivial-smoke",
			  smoke_name = "carnova-raindrops",
			  speed = {-0.05, 0.5},
			  initial_height = 1,
			  speed_multiplier = 2,
			  speed_multiplier_deviation = 0.05,
			  starting_frame = 2,
			  starting_frame_deviation = 2,
			  offset_deviation = {{-96, -56}, {96, 40}},
			  speed_from_center = 0.01,
			  speed_from_center_deviation = 0.02
			}
		  }
		},
		ticks_between_player_effects = 1
	},
}

