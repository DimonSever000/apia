local asteroid_functions = require("__space-age__/prototypes/planet/asteroid-spawn-definitions")


asteroid_functions.apia_carnova_orbit_ratio = {1, 6, 1 , 0}

asteroid_functions.apia_carnova_orbit_chunks = 0.0030
asteroid_functions.apia_carnova_orbit_medium = 0.0025

asteroid_functions.gleba_apia_carnova_orbit =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.gleba_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.apia_carnova_orbit_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_medium =
  {
    {position = 0.1, probability = asteroid_functions.gleba_medium, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.5, probability = asteroid_functions.weighted_average(asteroid_functions.gleba_medium, asteroid_functions.apia_carnova_orbit_medium, 0.5) * 3, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.9, probability = asteroid_functions.apia_carnova_orbit_medium, angle_when_stopped = asteroid_functions.medium_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.gleba_ratio},
    {position = 0.9, ratios = asteroid_functions.apia_carnova_orbit_ratio},
  }
}

asteroid_functions.apia_carnova_orbit_aquilo =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.apia_carnova_orbit_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.aquilo_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_medium =
  {
    {position = 0.1, probability = asteroid_functions.apia_carnova_orbit_medium, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.medium_angle}
  },
  probability_on_range_big =
  {
    {position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.big_angle},
    {position = 0.9, probability = asteroid_functions.aquilo_big, angle_when_stopped = asteroid_functions.big_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.apia_carnova_orbit_ratio},
    {position = 0.4, ratios = asteroid_functions.aquilo_ratio},
    {position = 0.9, ratios = asteroid_functions.aquilo_ratio}
  }
}
