

script.on_event(defines.events.on_chunk_generated, function(event)

  if storage.carnova_spawned_spidertron then return end

  local surface = event.surface
  if surface.name ~= "carnova" then return end

  local area = event.area

  if not (
    area.left_top.x <= 0 and area.right_bottom.x > 0 and
    area.left_top.y <= 0 and area.right_bottom.y > 0
  ) then
    return
  end

  local rng = game.create_random_generator(surface.map_gen_settings.seed + 777)

  local position

	local min_radius = 20
	local max_radius = 50

	for i = 1, 30 do
	  local angle = rng() * math.pi * 2
	  local radius = min_radius + rng() * (max_radius - min_radius)

	  local candidate = {
		x = math.cos(angle) * radius,
		y = math.sin(angle) * radius
	  }

	  if surface.can_place_entity{
		name = "rotting-spidertron-remains",
		position = candidate
	  } then
		position = candidate
		break
	  end
	end


  position = position or {0, 0}

  local entity = surface.create_entity{
    name = "rotting-spidertron-remains",
    position = position,
    force = "neutral"
  }


  if entity and entity.valid and entity.get_inventory then
    local inv = entity.get_inventory(defines.inventory.chest)
	
    if inv then
	
	  local function safe_insert(name, count)
        if prototypes.item[name] then
          inv.insert{name = name, count = count}
        end
      end
	  
      safe_insert("pistol", 1)
      safe_insert("firearm-magazine", math.random(1, 50))
      safe_insert("iron-plate", math.random(5, 100))
      safe_insert("copper-plate", math.random(5, 100))
      safe_insert("steel-plate", math.random(5, 100))
      safe_insert("electronic-circuit", math.random(5, 100))
      safe_insert("repair-pack", math.random(2, 25))
    end
  end

  storage.carnova_spawned_spidertron = true
end)
