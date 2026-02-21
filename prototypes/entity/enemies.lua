require ("__base__.prototypes.entity.enemy-constants")
require ("__base__.prototypes.entity.biter-animations")
require ("__apia__.prototypes.entity.piranha-animations")

local biter_ai_settings = require ("__base__.prototypes.entity.biter-ai-settings")
local enemy_autoplace = require ("__base__.prototypes.entity.enemy-autoplace-utils")
local sounds = require ("__base__.prototypes.entity.sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

local make_unit_melee_ammo_type = function(damage_value)
  return
  {
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damage_value , type = "physical"}
        }
      }
    }
  }
end

data:extend(
{
  {
    type = "unit",
    name = "piranha",
    icon = "__base__/graphics/icons/fish-entity.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    max_health = 15,
    order = "b-b-y-b",
    subgroup = "enemies",
    resistances = {},
    healing_per_tick = 0.01,
	collision_mask = {layers={ground_tile=true}, colliding_with_tiles_only=true},
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.biter(),
    attack_parameters =
    {
      type = "projectile",
      range = 0.5,
      cooldown = 35,
      cooldown_deviation = 0.15,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(10),
      sound = sounds.biter_roars(0.35),
      animation = piranha_attackanimation(4),
      range_mode = "bounding-box-to-bounding-box"
    },
    impact_category = "organic",
    vision_distance = 30,
    movement_speed = 0.35,
    distance_per_frame = 0.125,
    --absorptions_to_join_attack = { pollution = 4 },
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    corpse = nil,
    dying_explosion = "small-spitter-die",
    dying_sound = sounds.biter_dying(0.5),
    working_sound = sounds.biter_calls(0.4, 0.75),
    run_animation = piranha_runanimation(4),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.biter_walk(0, 0.3),
    ai_settings = biter_ai_settings,
	resistances =
    {
      {
        type = "physical",
        decrease = 4,
        percent = 10
      },
      {
        type = "fire",
        percent = 100
      }
    },
  },
  {
    type = "unit-spawner",
    name = "piranha-spawner",
    icon = "__apia__/graphics/entity/piranha-spawner/piranha-spawner-icon.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 150,
    order = "b-b-y-a",
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 4,
        percent = 12
      },
      {
        type = "fire",
        percent = 70
      }
    },
    working_sound =
    {
      sound = {category = "enemy", filename = "__base__/sound/creatures/spawner.ogg", volume = 0.6, modifiers = volume_multiplier("main-menu", 0.7) },
      max_sounds_per_prototype = 3
    },
    dying_sound =
    {
      variations = sound_variations("__base__/sound/creatures/spawner-death", 5, 0.7, volume_multiplier("main-menu", 0.55) ),
      aggregation = { max_count = 2, remove = true, count_already_playing = true }
    },
    healing_per_tick = 0.02,
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
	collision_mask = {layers={ground_tile=true}, colliding_with_tiles_only=true},
    map_generator_bounding_box = {{-2.35, -2.35}, {2.35, 2.35}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    damaged_trigger_effect = hit_effects.biter(),
    impact_category = "organic",
    -- in ticks per 1 pu
    --absorptions_per_second = { pollution = { absolute = 20, proportional = 0.01 } },
    corpse = "piranha-spawner-corpse",
    dying_explosion = "small-spitter-die",
    max_count_of_owned_units = 10,
    max_friends_around_to_spawn = 3,
    graphics_set =
    {
      animations =
      {
        {
			filename = "__apia__/graphics/entity/piranha-spawner/piranha-spawner-1.png",
			line_length = 1,
			width = 256,
			height = 256,
			direction_count = 1,
			shift = util.by_pixel(0, 0),
			scale = 0.25
		},
		{
			filename = "__apia__/graphics/entity/piranha-spawner/piranha-spawner-2.png",
			line_length = 1,
			width = 256,
			height = 256,
			direction_count = 1,
			shift = util.by_pixel(0, 0),
			scale = 0.25
		},
		{
			filename = "__apia__/graphics/entity/piranha-spawner/piranha-spawner-3.png",
			line_length = 1,
			width = 256,
			height = 256,
			direction_count = 1,
			shift = util.by_pixel(0, 0),
			scale = 0.25
		},
      }
    },
    result_units = {{"piranha", {{0, 1}, {1, 1}}}},
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace =
	{
		control = "carnova_enemy_base",
		order = "b[enemy]-a[spawner]",
		force = "enemy",
		probability_expression = "enemy_autoplace_base(0, 1)*0.02",
		richness_expression = 1,
	},
    call_for_help_radius = 50,
    spawn_decorations_on_expansion = true,
	loot = {{item = "piranha-roe", probability = 1, count_min = 3, count_max = 6}},
    spawn_decoration =
    {
		{
			type = "create-decorative",
			decorative = "split-gill-red-2x2",
			spawn_min = 3,
			spawn_max = 3,
			spawn_min_radius = 1,
			spawn_max_radius = 1
		},
		{
			type = "create-decorative",
			decorative = "split-gill-red-2x2",
			spawn_min = 4,
			spawn_max = 6,
			spawn_min_radius = 1,
			spawn_max_radius = 3
		},
		{
			type = "create-decorative",
			decorative = "split-gill-red-1x1",
			spawn_min = 4,
			spawn_max = 6,
			spawn_min_radius = 1,
			spawn_max_radius = 3
		},
		{
			decorative = "piranha-roots-orange",
			spawn_min = 2,
			spawn_max = 4,
			spawn_min_radius = 1,
			spawn_max_radius = 2
		},
    }
  },
  {
    type = "corpse",
    name = "piranha-spawner-corpse",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__apia__/graphics/entity/piranha-spawner/piranha-spawner-icon.png",
	collision_mask = {layers={ground_tile=true}, colliding_with_tiles_only=true},
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    dying_speed = 0.03,
    time_before_removed = 15 * 60 * 60,
    subgroup="corpses",
    order = "[carnova]-[piranha-spawner]",
    animation =
    {
		{
			filename = "__apia__/graphics/entity/piranha-spawner/piranha-spawner-corpse.png",
			line_length = 1,
			width = 256,
			height = 256,
			direction_count = 1,
			shift = util.by_pixel(0, 0),
			scale = 0.25
		},
    },
    decay_animation =
    {
		{
			filename = "__apia__/graphics/entity/piranha-spawner/piranha-spawner-decay.png",
			line_length = 4,
			frame_count = 4,
			width = 256,
			height = 256,
			direction_count = 1,
			shift = util.by_pixel(0, 0),
			scale = 0.25
		},
    },
    decay_frame_transition_duration = 6 * 60,
    -- use_decay_layer = true,
    final_render_layer = "lower-object-above-shadow" -- this is essentially ignored when 'use_decay_layer' is true
  },
})
