data:extend({
  {
    type = "noise-expression",
    name = "carnova_segmentation_multiplier",
    expression = "1"
  },
  {
    type = "noise-expression",
    name = "carnova_spot_size",
    expression = "50"
  },

  {
    type = "noise-function",
    name = "carnova_simple_billows",
    parameters = {"seed1", "octaves", "input_scale"},
    expression = "abs(quick_multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = seed1, input_scale = input_scale, output_scale = 1, offset_x = 10000, octaves = octaves, octave_input_scale_multiplier = 0.5, octave_output_scale_multiplier = 0.75})"
  },
  
  -- Гарантированный спаун-остров с естественной формой
  {
    type = "noise-expression",
    name = "carnova_spawn_island_boost",
    expression = "carnova_spawn_island_shape * carnova_spawn_island_falloff * 20",
    local_expressions = {
      -- Базовое расстояние от центра
      base_dist = "sqrt(x*x + y*y)",
      
      -- Шум для кривой формы (разные радиусы в разных направлениях)
      shape_noise_x = "0.8 + multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 12345, octaves = 2, persistence = 0.7, input_scale = 1/100} * 0.4",
      shape_noise_y = "0.7 + multioctave_noise{x = y, y = x, seed0 = map_seed, seed1 = 23456, octaves = 2, persistence = 0.7, input_scale = 1/120} * 0.6",
      
      -- Искаженное расстояние с учетом шума формы
      distorted_dist = "sqrt((x*shape_noise_x)*(x*shape_noise_x) + (y*shape_noise_y)*(y*shape_noise_y))",
      
      -- Основная форма острова (радиус ~40-60 тайлов)
      carnova_spawn_island_core = "clamp(1.2 - distorted_dist / 45, 0, 1.5)",
      
      -- Детализация краев
      edge_detail = "multioctave_noise{x = x*1.5, y = y*1.5, seed0 = map_seed, seed1 = 34567, octaves = 3, persistence = 0.6, input_scale = 1/25} * 0.3",
      
      -- Финальная форма с детализацией
      carnova_spawn_island_shape = "clamp(carnova_spawn_island_core + edge_detail, 0, 1)",
      
      -- Плавный спад
      carnova_spawn_island_falloff = "clamp(1.5 - base_dist / 35, 0, 1)"
    }
  },

  {
    type = "noise-expression",
    name = "carnova_elevation",
    expression = "lerp(scattered_islands, clustered_archipelago, 0.7) + carnova_spawn_island_boost",
    local_expressions = {
      scattered_islands = "-18 + 35 * clamp(scattered_peaks * 2.5 - 1.8, 0, 1) + 12 * island_detail",
      clustered_archipelago = "-16 + 40 * clamp(archipelago_density * 2.0 - 1.3, 0, 1) + 18 * (pow(voronoi_large * max(0, voronoi_cell * 1.5 - 0.3) + 0.8 * voronoi_small * max(0, aux + 0.4), 0.65))",
      scattered_peaks = "abs(amplitude_corrected_multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 1000, input_scale = segmentation_mult / 2.2, offset_x = -15000, octaves = 5, persistence = 0.75, amplitude = 1.2})",
      archipelago_density = "abs(amplitude_corrected_multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 2000, input_scale = segmentation_mult / 1.5, offset_x = 8000, octaves = 4, persistence = 0.7, amplitude = 1.2})",
      island_detail = "min(carnova_simple_billows{seed1 = 2100, octaves = 4, input_scale = segmentation_mult / 1.8}, carnova_simple_billows{seed1 = 3100, octaves = 4, input_scale = segmentation_mult / 1.3}, carnova_simple_billows{seed1 = 4100, octaves = 4, input_scale = segmentation_mult})",
      voronoi_large = "voronoi_facet_noise{x = x + carnova_wobble_x * 3.5, y = y + carnova_wobble_y * 3.5, seed0 = map_seed, seed1 = 'carnova-archipelagos', grid_size = 90, distance_type = 'euclidean', jitter = 0.85}",
      voronoi_cell = "voronoi_cell_id{x = x + carnova_wobble_x * 3.5, y = y + carnova_wobble_y * 3.5, seed0 = map_seed, seed1 = 'carnova-archipelagos', grid_size = 90, distance_type = 'euclidean', jitter = 0.85}",
      voronoi_small = "voronoi_facet_noise{x = x + carnova_wobble_x * 3.5, y = y + carnova_wobble_y * 3.5, seed0 = map_seed, seed1 = 'carnova-islands', grid_size = 35, distance_type = 'euclidean', jitter = 0.9}",
      segmentation_mult = "carnova_segmentation_multiplier / 12"
    }
  },

  -- Маска спаун-острова с естественной формой
  {
    type = "noise-expression",
    name = "carnova_spawn_island_mask",
    expression = "clamp(carnova_spawn_shape_noise - 0.3, 0, 1) * carnova_spawn_falloff",
    local_expressions = {
      -- Базовое расстояние
      base_dist = "sqrt(x*x + y*y)",
      
      -- Шум для естественной формы
      carnova_spawn_shape_noise = "0.7 + multioctave_noise{x = x*0.8, y = y*0.8, seed0 = map_seed, seed1 = 45678, octaves = 3, persistence = 0.65, input_scale = 1/40} * 0.6",
      
      -- Спад на расстоянии
      carnova_spawn_falloff = "clamp(1.8 - base_dist / 30, 0, 1)"
    }
  },

  {
    type = "noise-expression",
    name = "carnova_aux_scale",
    expression = "carnova_segmentation_multiplier * 2.0"
  },
  {
    type = "noise-expression",
    name = "carnova_wobble_x",
    expression = "multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 12243, octaves = 4, persistence = 0.7, input_scale = carnova_aux_scale / 60, output_scale = 0.7}"
  },
  {
    type = "noise-expression",
    name = "carnova_wobble_y",
    expression = "multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 13243, octaves = 4, persistence = 0.7, input_scale = carnova_aux_scale / 60, output_scale = 0.7}"
  },
  {
    type = "noise-expression",
    name = "carnova_aux",
    expression = "0.5 + multioctave_noise{x = x + carnova_wobble_x * 140 / carnova_aux_scale, y = y + carnova_wobble_y * 140 / carnova_aux_scale, seed0 = map_seed, seed1 = 14243, octaves = 4, persistence = 0.8, input_scale = carnova_aux_scale / 12, output_scale = 1}"
  },
  {
    type = "noise-expression",
    name = "carnova_temperature",
    expression = "temperature_basic - 30"
  },
  {
    type = "noise-expression",
    name = "carnova_high_frequency_peaks",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.9, seed0 = map_seed, seed1 = 1, octaves = 4, input_scale = 1/15})"
  },
  {
    type = "noise-expression",
    name = "carnova_land_mask",
    expression = "clamp((elevation + 8) / 16, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "carnova_land_height",
    expression = "clamp((elevation + 4) / 20, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "carnova_archipelago_mask",
    expression = "clamp(carnova_land_mask * 1.5 - 0.1, 0, 1) + carnova_spawn_island_mask * 0.6"
  },
  {
    type = "noise-expression",
    name = "carnova_ocean_depth",
    expression = "clamp(-elevation / 25, 0, 1)"
  },
  
  -- Глубокий океан пятнами
  {
    type = "noise-expression",
    name = "carnova_deep_ocean_noise",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 3000, octaves = 3, input_scale = 1/200}"
  },
  {
    type = "noise-expression",
    name = "carnova_deep_ocean_mask",
    expression = "carnova_ocean_depth > 0.5 + carnova_deep_ocean_noise * 0.15"
  },
  
  -- Обычный океан
  {
    type = "noise-expression",
    name = "carnova_ocean_mask",
    expression = "carnova_ocean_depth > 0.1"
  },
  
  -- Береговая линия (побережье)
  {
    type = "noise-expression",
    name = "carnova_coastal_zone",
    expression = "clamp((1 - carnova_land_height) * 2.0 - 1.2, 0, 1)"
  },
  
  {
    type = "noise-expression",
    name = "carnova_biome_noise",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.85, seed0 = map_seed, seed1 = 500, octaves = 4, input_scale = 1/40}"
  },
  {
    type = "noise-expression",
    name = "carnova_biome_detail",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 600, octaves = 3, input_scale = 1/15}"
  },
  
  -- Шум для распределения внутренних биомов
  {
    type = "noise-expression",
    name = "carnova_inland_distribution",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.75, seed0 = map_seed, seed1 = 700, octaves = 3, input_scale = 1/35}"
  },
  
  -- Глубокий океан
  {
    type = "noise-expression",
    name = "carnova_deep_ocean",
    expression = "carnova_deep_ocean_mask * 1000"
  },
  
  -- Обычный океан
  {
    type = "noise-expression",
    name = "carnova_ocean",
    expression = "(carnova_ocean_mask * (1 - carnova_deep_ocean_mask)) * 500"
  },
  
  -- 4 БИОМА с умеренным бустом на спаун-острове
  
  -- Биом 1: Побережье
  {
    type = "noise-expression",
    name = "carnova_biome1",
    expression = "carnova_archipelago_mask * carnova_coastal_zone * 400 - abs(carnova_biome_detail - 0.2) * 0.3 + elevation * 0.2 + carnova_spawn_island_mask * 350"
  },
  
  -- Биом 2: Внутренний биом 1
  {
    type = "noise-expression", 
    name = "carnova_biome2",
    expression = "carnova_archipelago_mask * clamp(carnova_land_height * 1.5 - 0.05, 0, 1) * 450 - abs(carnova_biome_detail - 0.35) * 0.25 + elevation * 0.5 + carnova_inland_distribution * 0.5 + carnova_spawn_island_mask * 400"
  },
  
  -- Биом 3: Внутренний биом 2
  {
    type = "noise-expression",
    name = "carnova_biome3",
    expression = "carnova_archipelago_mask * clamp(carnova_land_height * 2.0 - 0.5, 0, 1) * 500 - abs(carnova_biome_detail - 0.5) * 0.2 + elevation * 0.8 + carnova_inland_distribution * 0.7 + carnova_spawn_island_mask * 380"
  },
  
  -- Биом 4: Внутренний биом 3
  {
    type = "noise-expression",
    name = "carnova_biome4",
    expression = "carnova_archipelago_mask * clamp(carnova_land_height * 4.0 - 3.0, 0, 1) * 550 - abs(carnova_biome_detail - 0.65) * 0.15 + elevation * 1.2 + carnova_inland_distribution * 0.9 + carnova_spawn_island_mask * 250"
  },
  
  -- Буст для внутренних биомов
  {
    type = "noise-expression",
    name = "carnova_inland_boost",
    expression = "clamp(carnova_land_height - 0.1, 0, 1) * 60 - clamp(carnova_land_height - 0.7, 0, 1) * 40 + carnova_spawn_island_mask * 30"
  },
  
  -- Плавные переходы между биомами
  {
    type = "noise-expression",
    name = "carnova_biome_blend",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 750, octaves = 2, input_scale = 1/60}"
  },
  
  {
    type = "noise-expression",
    name = "carnova_final_land",
    expression = "carnova_archipelago_mask"
  },
  {
    type = "noise-expression",
    name = "carnova_moisture",
    expression = "0.8 + multioctave_noise{x = x, y = y, persistence = 0.82, seed0 = map_seed, seed1 = 800, octaves = 3, input_scale = 1/80} * 0.2"
  },
  {
    type = "noise-expression",
    name = "carnova_island_variety",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.78, seed0 = map_seed, seed1 = 900, octaves = 3, input_scale = 1/30}"
  },
  


{
    type = "noise-expression",
    name = "carnova_bones_probability",
    local_expressions = {
        biome4_mask = "clamp(carnova_land_height * 4.0 - 3.0, 0, 1)",
        biome5_noise = "abs(multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 950, octaves = 2, persistence = 0.6, input_scale = 1/20})",
        biome5_mask = "clamp(biome4_mask * (biome5_noise - 0.8), 0, 1)"
    },
    expression = "biome5_mask * (500 + elevation * 1.0 + carnova_inland_distribution * 0.8 + carnova_spawn_island_mask * 100)"
},

{
    type = "noise-expression",
    name = "carnova_bones_richness",
    local_expressions = {
        richness = "control:bones:richness",
        size = "control:bones:size",
		biome4_mask = "clamp(carnova_land_height * 4.0 - 3.0, 0, 1)",
        biome5_noise = "abs(multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 950, octaves = 2, persistence = 0.6, input_scale = 1/20})",
		biome5_mask = "clamp(biome4_mask * (biome5_noise - 0.8), 0, 1)",
    },
    expression = "1000 * biome5_mask * richness / size"
},

{
    type = "noise-expression",
    name = "carnova_flesh_tree_probability",
    local_expressions = {
        -- Маска для биомов 2, 3, 4
        biome234_mask = "clamp(carnova_land_height * 1.5 - 0.05, 0, 1)",
        
        -- Меньшие пятна: более высокочастотный шум с большим количеством октав
        flesh_tree_noise = "abs(multioctave_noise{x = x * 1.8, y = y * 1.8, seed0 = map_seed, seed1 = 960, octaves = 5, persistence = 0.5, input_scale = 1/10})",
        
        -- Создаем отступ используя более размытую версию костей
        bones_blurred = "abs(multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 950, octaves = 1, persistence = 0.9, input_scale = 1/30}) * clamp(carnova_bones_probability / 100, 0, 1)",
        
        -- Сильный отступ от размытых костей
        bones_avoidance = "clamp(1 - bones_blurred * 5.0, 0, 1)",
        
        -- Высокий порог для создания меньших, более редких пятен
        tree_mask = "clamp(flesh_tree_noise - 0.88, 0, 1)",
        
        -- Дополнительный шум для неравномерности
        variation = "0.7 + multioctave_noise{x = x * 3.0, y = y * 3.0, seed0 = map_seed, seed1 = 963, octaves = 2, persistence = 0.6, input_scale = 1/6} * 0.3"
    },
    expression = "biome234_mask * tree_mask * bones_avoidance * variation * (450 + carnova_inland_distribution * 0.3 + carnova_spawn_island_mask * 40)"
},

{
    type = "noise-expression",
    name = "carnova_lymph_brine_probability",
    expression = "0.1 * carnova_land_mask * clamp(abs(multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 970, octaves = 4, persistence = 0.6, input_scale = 1/18}) - 0.82, 0, 1) * 0.05 * control:lymph:size"
},

{
    type = "noise-expression",
    name = "carnova_lymph_brine_richness",
    local_expressions = {
        richness_ctrl = "control:lymph:richness",

        -- расстояние от центра
        dist = "sqrt(x*x + y*y)",

        -- мягкий рост богатства с расстоянием (примерно +30% к 2000 тайлам)
        dist_multiplier = "1 + clamp(pow(dist / 2000, 0.6), 0, 2)",

        -- небольшой шум, чтобы точки отличались
        richness_noise = "1 + multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 971, octaves = 2, persistence = 0.7, input_scale = 1/120} * 0.15"
    },
    expression = "40000 * richness_ctrl * dist_multiplier * richness_noise * carnova_land_mask"
},

	{
    type = "noise-expression",
    name = "carnova_enemy_base_radius",
    expression = "sqrt(control:carnova_enemy_base:size) * (15 + 4 * enemy_base_intensity)"
  },
  {
    type = "noise-expression",
    name = "carnova_enemy_base_frequency",
    expression = "(0.00002 + 0.000006 * enemy_base_intensity) * control:carnova_enemy_base:frequency"
  }
})