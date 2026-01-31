local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local robot_animations = {}

robot_animations.flamethrower =
{

  idle =
  {
    layers =
    {
      {
        filename = "__apia__/graphics/entity/flamethrower-robot/flamethrower-robot.png",
        priority = "high",
        line_length = 16,
        width = 56,
        height = 59,
        direction_count = 16,
        shift = util.by_pixel(0, 0.25),
        scale = 0.5
      },
      {
        filename = "__apia__/graphics/entity/flamethrower-robot/flamethrower-robot-mask.png",
        priority = "high",
        line_length = 16,
        width = 28,
        height = 21,
        direction_count = 16,
        shift = util.by_pixel(0, -4.75),
        apply_runtime_tint = true,
        scale = 0.5
      }
    }
  },
  shadow_idle =
  {
    filename = "__apia__/graphics/entity/flamethrower-robot/flamethrower-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 88,
    height = 50,
    direction_count = 16,
    shift = util.by_pixel(25.5, 19),
    scale = 0.5,
    draw_as_shadow = true
  },
  in_motion =
  {
    layers =
    {
      {
        filename = "__apia__/graphics/entity/flamethrower-robot/flamethrower-robot.png",
        priority = "high",
        line_length = 16,
        width = 56,
        height = 59,
        animation_speed = 1,
        direction_count = 16,
        shift = util.by_pixel(0, 0.25),
        y = 59,
        scale = 0.5
      },
      {
        filename = "__apia__/graphics/entity/flamethrower-robot/flamethrower-robot-mask.png",
        priority = "high",
        line_length = 16,
        width = 28,
        height = 21,
        animation_speed = 1,
        direction_count = 16,
        shift = util.by_pixel(0, -4.75),
        apply_runtime_tint = true,
        y = 21,
        scale = 0.5
      }
    }
  },
  shadow_in_motion =
  {
    filename = "__apia__/graphics/entity/flamethrower-robot/flamethrower-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 88,
    height = 50,
    animation_speed = 1,
    direction_count = 16,
    shift = util.by_pixel(25.5, 19),
    scale = 0.5,
    draw_as_shadow = true
  }
}


local robots =
{
  {
    type = "combat-robot",
    name = "flamethrower",
    icon = "__apia__/graphics/icons/flamethrower.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map", "not-repairable"},
    resistances =
    {
      {
        type = "fire",
        percent = 95
      },
      {
        type = "acid",
        decrease = 0,
        percent = 80
      }
    },
    subgroup="capsule",
    order = "d[flamethrower]-a[robot]",
    max_health = 60,
    alert_when_damaged = false,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    damaged_trigger_effect = hit_effects.flying_robot(),
    dying_explosion = "defender-robot-explosion",
    time_to_live = 60 * 45,
    follows_player = true,
    friction = 0.01,
    range_from_player = 6.0,
    speed = 0.01,
    working_sound =
    {
      sound = { filename = "__base__/sound/fight/defender-robot-loop.ogg", volume = 0.7 },
      persistent = true
    },
    destroy_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-entity",
          entity_name = "defender-robot-explosion"
        }
      }
    },
    attack_parameters =
    {
      type = "stream",
      ammo_category = "flamethrower",
	  ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "flamethrower-fire-stream",
            source_offset = {0.15, -0.5}
          }
        }
      },
      cooldown = 1,
      movement_slow_down_factor = 0.4,
      gun_barrel_length = 0.8,
      gun_center_shift = {0, -1},
      range = 15,
      min_range = 3,
      cyclic_sound =
      {
        begin_sound = {filename = "__base__/sound/fight/flamethrower-start.ogg", volume = 0.7, priority = 64},
        middle_sound = {filename = "__base__/sound/fight/flamethrower-mid.ogg", volume = 0.7, priority = 64},
        end_sound = {filename = "__base__/sound/fight/flamethrower-end.ogg", volume = 0.7, priority = 64}
      }
    },
    water_reflection = robot_reflection(0.8),
    idle = robot_animations.flamethrower.idle,
    in_motion = robot_animations.flamethrower.in_motion,
    shadow_idle = robot_animations.flamethrower.shadow_idle,
    shadow_in_motion = robot_animations.flamethrower.shadow_in_motion
  },
}

data:extend(robots)