local asteroid_util = require("__space-age__/prototypes/planet/asteroid-spawn-definitions")


data:extend{
  {
    type = "space-connection",
    name = "apia-carnova-orbit-apia",
    subgroup = "planet-connections",
    from = "apia-carnova-orbit",
    to = "apia",
    order = "g[apia-carnova-orbit]",
    length = 1000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.apia_carnova_orbit_ratio)
  },
  {
    type = "space-connection",
    name = "apia-carnova-orbit-carnova",
    subgroup = "planet-connections",
    from = "apia-carnova-orbit",
    to = "carnova",
    order = "g[apia-carnova-orbit]",
    length = 1000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.apia_carnova_orbit_ratio)
  },
  {
    type = "space-connection",
    name = "gleba-apia-carnova-orbit",
    subgroup = "planet-connections",
    from = "gleba",
    to = "apia-carnova-orbit",
    order = "g[apia-carnova-orbit]",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_apia_carnova_orbit)
  },
  {
    type = "space-connection",
    name = "apia-carnova-orbit-aquilo",
    subgroup = "planet-connections",
    from = "apia-carnova-orbit",
    to = "aquilo",
    order = "g[apia-carnova-orbit]b",
    length = 30000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.apia_carnova_orbit_aquilo)
  },
}

if mods["pelagos"] then
	data:extend
	({
		{
			type = "space-connection",
			name = "pelagos-apia-carnova-orbit",
			subgroup = "planet-connections",
			from = "pelagos",
			to = "apia-carnova-orbit",
			order = "g-z[apia-carnova-orbit]",
			length = 15000,
			asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_apia_carnova_orbit)
		}
	})
end