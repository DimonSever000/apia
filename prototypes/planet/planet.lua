require("__space-age__/prototypes/planet/planet-vulcanus-map-gen")
local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")
local asteroid_util = require("__space-age__/prototypes/planet/asteroid-spawn-definitions")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local planet_catalogue_aquilo = require("__space-age__.prototypes.planet.procession-catalogue-aquilo")
local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")
local gleba = data.raw["planet"]["gleba"]
local planet_lib = require("__PlanetsLib__.lib.planet")


planet_map_gen.apia = function()
  return
  {
    property_expression_names =
    {
      elevation = "apia_elevation",
      temperature = "apia_temperature",
      moisture = "apia_moisture",
      aux = "apia_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
    },
    cliff_settings = {},
    autoplace_controls = {},
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
			["apia-biome1"] = {},
			["apia-biome2"] = {},
			["apia-biome3"] = {},
			["apia-biome4"] = {},
			["royal-jelly-lake"] = {},
			["royal-jelly-lake2"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
		
        }
      },
      ["entity"] =
      {
        settings =
        {
			["larvae"] = {},
			["wild-hive"] = {},
			["honey-mushroom"] = {},
        }
      }
    }
  }
end

PlanetsLib:extend{{
    type = "planet",
    name = "apia",
    icon = "__apia__/graphics/icons/apia.png",
    starmap_icon = "__apia__/graphics/icons/starmap-planet-apia.png",
	map_gen_settings = planet_map_gen.apia(),
    starmap_icon_size = 512,
	gravity_pull = 10,
    magnitude = gleba.magnitude*3/5,
    label_orientation = 0.5,
    order = "d[apia]",
    subgroup = "satellites",
	draw_orbit = true,
	orbit = {
      orientation = 0.65,
      distance = 1.8,
      parent = {
        type = "planet",
        name = gleba.name,
      },
      sprite = {
        type = "sprite",
        filename = "__apia__/graphics/icons/apia.png",
        size = 64,
        scale = 0.25,
      }
    },
    pollutant_type = nil,
    solar_power_in_space = 200,
    surface_properties =
    {
        ["day-night-cycle"] = 12 * minute,
        ["magnetic-field"] = 15,
        pressure = 2500,
        ["solar-power"] = 25,
        gravity = 50
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
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora, 0.9),
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
}

data:extend{
  {
    type = "space-connection",
    name = "gleba-apia",
    subgroup = "planet-connections",
    from = "gleba",
    to = "apia",
    order = "g[apia]",
    length = 1000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora)
  },
}