require ("util")

function piranha_runanimation(scale)
  return
  {
    layers=
    {
      util.sprite_load("__apia__/graphics/entity/piranha/piranha-run",
        {
          slice = 8,
          frame_count = 16,
          direction_count = 16,
          scale = scale * 0.5,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "gleba",
          usage = "enemy",
        }
      ),
    }
  }
end

function piranha_attackanimation(scale)
  return
  {
    layers=
    {
      util.sprite_load("__apia__/graphics/entity/piranha/piranha-run",
        {
          slice = 8,
          frame_count = 16,
          direction_count = 16,
          scale = scale * 0.5,
          multiply_shift = scale,
          allow_forced_downscale = true,
          surface = "gleba",
          usage = "enemy",
        }
      ),
    }
  }
end

function piranha_dieanimation(scale)
  return
  {
    layers=
    {
      util.sprite_load("__apia__/graphics/entity/piranha/piranha-run",
        {
          slice = 8,
          frame_count = 16,
          direction_count = 16,
          scale = scale * 0.5,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          allow_forced_downscale = true,
          surface = "gleba",
          usage = "enemy"
        }
      ),
    }
  }
end

function piranha_decay_animation(scale)
  return
  {
    layers=
    {
      util.sprite_load("__apia__/graphics/entity/piranha/piranha-run",
        {
          slice = 8,
          frame_count = 16,
          direction_count = 16,
          scale = scale * 0.5,
          multiply_shift = scale,
          flags = {"corpse-decay"},
          allow_forced_downscale = true,
          surface = "gleba",
          usage = "corpse-decay"
        }
      ),
    }
  }
end