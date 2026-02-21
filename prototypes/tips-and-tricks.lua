
data:extend(
{
	{
		type = "tips-and-tricks-item",
		name = "apia-briefing",
		tag = "[planet=apia]",
		category = "space-age",
		order = "b-y",
		trigger =
		{
			type = "research",
			technology = "planet-discovery-apia-carnova"
		},
		simulation =
		{
		  init_update_count = 200,
		  mute_wind_sounds = false,
		  planet = "apia",
		  init =
			[[
			require("__core__/lualib/story")
				game.simulation.camera_position = {0, 0}
				
				-- Море
				for x = -15, 15, 1 do
				  for y = -10, 10 do
					game.surfaces[1].set_tiles{{position = {x, y}, name = "royal-jelly-lake"}}
				  end
				end
				
				-- Биомы острова
				local tiles = {}
				
				-- Центральный массив apia-biome2
				for x = -4, 2, 1 do
				  for y = -2, 2, 1 do
					table.insert(tiles, {position = {x, y}, name = "apia-biome2"})
				  end
				end
				
				-- Дополнительные клетки apia-biome2
				local biome2_cells = {
				  {-2, 3}, {-1, 3}, {0, 3}, {1, 3},
				  {-2, -3}, {-1, -3}, {0, -3}, {1, -3},
				  {-5, -1}, {-5, 0}, {-5, 1}, {-6, 0},
				  {3, -2}, {4, -1}, {5, -2}, {6, -1}, {7, -2},
				  {3, 1}, {4, 2}, {5, 3}, {6, 4}, {7, 3},
				  {3, -4}, {4, -5}, {5, -4}, {6, -5},
				  {4, 0}, {5, 1}, {6, 0}, {7, 1}, {8, 0},
				  {8, 2}, {9, 1}, {9, -1}, {10, 0},
				  {7, -3}, {8, -4}, {9, -3},
				  {8, 4}, {9, 5}, {10, 4}
				}
				
				for _, pos in ipairs(biome2_cells) do
				  table.insert(tiles, {position = {pos[1], pos[2]}, name = "apia-biome2"})
				end
				
				-- Береговая линия apia-biome1
				local biome1_cells = {
				  -- Север
				  {-3, 3}, {2, 3}, {-2, 4}, {1, 4}, {0, 4},
				  -- Юг
				  {-3, -3}, {2, -3}, {-1, -4}, {0, -4}, {1, -4},
				  -- Запад
				  {-5, -2}, {-5, 2}, {-6, -1}, {-6, 1}, {-7, 0},
				  -- Восток (основной)
				  {4, -3}, {5, -3}, {6, -3}, {7, -4}, {8, -5},
				  {9, -4}, {10, -3},
				  -- Восток (верхний)
				  {4, 3}, {5, 4}, {6, 5}, {7, 5}, {8, 5},
				  {9, 6}, {10, 5}, {11, 4},
				  -- Восток (центральный)
				  {8, 1}, {9, 2}, {10, 1}, {11, 0}, {10, -1}
				}
				
				for _, pos in ipairs(biome1_cells) do
				  table.insert(tiles, {position = {pos[1], pos[2]}, name = "apia-biome1"})
				end
				
				-- Центральные клетки apia-biome3
				local biome3_cells = {
				  {0, 0}, {1, 1}, {-1, -1}, {1, 0}, {-1, 1}
				}
				
				for _, pos in ipairs(biome3_cells) do
				  table.insert(tiles, {position = {pos[1], pos[2]}, name = "apia-biome3"})
				end
				
				-- Устанавливаем все тайлы
				game.surfaces[1].set_tiles(tiles)
				
				-- Ульи
				local hives = {
				  {position = {6.5, 1.2}},
				  {position = {0.5, 1.5}}
				}
				
				for _, hive in ipairs(hives) do
				  game.surfaces[1].create_entity{name = "wild-hive", position = hive.position}
				end
				
				-- Личинки
				local larvae_positions = {
				  -- Северные
				  {-2, 7}, {3, 6}, {-1, 8}, {2, 7}, {0, 9}, {-4, 6},
				  -- Южные
				  {1, -7}, {-3, -6}, {2, -8}, {-2, -7}, {0, -9}, {3, -9},
				  -- Западные
				  {-8, 1}, {-7, -2}, {-9, 3}, {-6, -3}, {-10, 0}, {-8, -4},
				  -- Восточные
				  {8, 0}, {7, 3}, {9, 2}, {6, 4}, {10, 1}, {7, -3},
				  {11, 2}, {9, -2}, {12, 0}, {8, 5}, {10, -4}, {13, 3},
				  -- Диагональные
				  {-6, 5}, {6, -5}, {5, 7}, {-5, -7}, {8, 6}, {-8, -5},
				  -- Угловые
				  {-10, 5}, {12, 6}, {-10, -5}, {12, -4},
				  {-12, 3}, {14, 2}, {-12, -3}, {13, -2}
				}
				
				for _, pos in ipairs(larvae_positions) do
				  game.surfaces[1].create_entity{name = "larvae", position = {pos[1], pos[2]}}
				end
			]]
		}
	},
	{
		type = "tips-and-tricks-item",
		name = "carnova-briefing",
		tag = "[planet=carnova]",
		category = "space-age",
		order = "b-z",
		trigger =
		{
			type = "research",
			technology = "planet-discovery-apia-carnova"
		},
		simulation =
		{
		  init_update_count = 200,
		  mute_wind_sounds = false,
		  planet = "carnova",
		  init =
		  [[
		  require("__core__/lualib/story")
		  game.simulation.camera_position = {0, 0}

		  -- Море
		  for x = -15, 15, 1 do
			for y = -10, 10 do
			  game.surfaces[1].set_tiles{
				{position = {x, y}, name = "blood-lake1"}
			  }
			end
		  end

		  -- Биомы острова
		  local tiles = {}

		  -- Центральный массив carnova-biome2
		  for x = -4, 2, 1 do
			for y = -2, 2, 1 do
			  table.insert(tiles, {
				position = {x, y},
				name = "carnova-biome2"
			  })
			end
		  end

		  -- Дополнительные клетки carnova-biome2
		  local biome2_cells =
		  {
			{-2, 3}, {-1, 3}, {0, 3}, {1, 3},
			{-2, -3}, {-1, -3}, {0, -3}, {1, -3},

			{-5, -1}, {-5, 0}, {-5, 1}, {-6, 0},

			{3, -2}, {4, -1}, {5, -2}, {6, -1}, {7, -2},
			{3, 1}, {4, 2}, {5, 3}, {6, 4}, {7, 3},

			{3, -4}, {4, -5}, {5, -4}, {6, -5},

			{4, 0}, {5, 1}, {6, 0}, {7, 1}, {8, 0},
			{8, 2}, {9, 1}, {9, -1}, {10, 0},

			{7, -3}, {8, -4}, {9, -3},
			{8, 4}, {9, 5}, {10, 4}
		  }

		  for _, pos in ipairs(biome2_cells) do
			table.insert(tiles, {
			  position = {pos[1], pos[2]},
			  name = "carnova-biome2"
			})
		  end

		  -- Береговая линия carnova-biome1
		  local biome1_cells =
		  {
			-- Север
			{-3, 3}, {2, 3}, {-2, 4}, {1, 4}, {0, 4},
			-- Юг
			{-3, -3}, {2, -3}, {-1, -4}, {0, -4}, {1, -4},
			-- Запад
			{-5, -2}, {-5, 2}, {-6, -1}, {-6, 1}, {-7, 0},
			-- Восток (основной)
			{4, -3}, {5, -3}, {6, -3}, {7, -4}, {8, -5},
			{9, -4}, {10, -3},
			-- Восток (верхний)
			{4, 3}, {5, 4}, {6, 5}, {7, 5}, {8, 5},
			{9, 6}, {10, 5}, {11, 4},
			-- Восток (центральный)
			{8, 1}, {9, 2}, {10, 1}, {11, 0}, {10, -1}
		  }

		  for _, pos in ipairs(biome1_cells) do
			table.insert(tiles, {
			  position = {pos[1], pos[2]},
			  name = "carnova-biome1"
			})
		  end

		  -- Центральные клетки carnova-biome3
		  local biome3_cells =
		  {
			{0, 0}, {1, 1}, {-1, -1}, {1, 0}, {-1, 1}
		  }

		  for _, pos in ipairs(biome3_cells) do
			table.insert(tiles, {
			  position = {pos[1], pos[2]},
			  name = "carnova-biome3"
			})
		  end

		  -- Устанавливаем все тайлы
		  game.surfaces[1].set_tiles(tiles)

		  -- Flesh-tree (6 штук, роща)
		  local trees =
		  {
			{position = {0.5, 1.5}},
			{position = {-1.2, 1.0}},
			{position = {1.8, 0.2}},
			{position = {-0.8, -1.4}},
			{position = {0.9, -2.0}},
			{position = {2.2, 1.6}}
		  }

		  for _, tree in ipairs(trees) do
			game.surfaces[1].create_entity{
			  name = "flesh-tree",
			  position = tree.position
			}
		  end
		  ]]
		}
	},
})