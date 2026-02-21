local util = require("util")
local apia_utils = {}


function apia_utils.surface_conditions(planet)
	local surface_conditions
	if planet == "apia" then
		surface_conditions = 
		{
			{
				property = "pressure",
				min = 2525,
				max = 2525
			},
			{
				property = "gravity",
				min = 31.5625,
				max = 31.5625
			}
		}
	elseif planet == "carnova" then
		surface_conditions = 
		{
			{
				property = "pressure",
				min = 2525,
				max = 2525
			},
			{
				property = "gravity",
				min = 25.25,
				max = 25.25
			}
		}
	elseif planet == "apia-carnova" then
		surface_conditions = 
		{
			{
				property = "pressure",
				min = 2525,
				max = 2525
			},
		}
	end
	return surface_conditions
end
	

function apia_utils.add_tech_prerequisites(tech_name, prerequisites)
  local tech = data.raw.technology[tech_name]
  tech.prerequisites = tech.prerequisites or {}
  for _, prereq in ipairs(tech.prerequisites) do
    if prereq == prerequisites then
      return
    end
  end
  table.insert(tech.prerequisites, prerequisites)
end


function apia_utils.add_science_pack(tech_name, science_pack)
  local tech = data.raw.technology[tech_name]
  -- If `tech.unit` doesn't exist then it is a trigger tech rather than a science tech, cannot modify it in this way
  if tech.unit then
    tech.unit.ingredients = tech.unit.ingredients or {}
    table.insert(tech.unit.ingredients, science_pack)
  else
    log("Apia-Carnova: Unable to add science to tech `" .. tech_name .. "` due to it being a trigger technology, skipped.")
  end
end

function apia_utils.add_tech_effect(tech_name, effect)
  local tech = data.raw.technology[tech_name]
  tech.effects = tech.effects or {}
  table.insert(tech.effects, effect)
end

function apia_utils.add_ingredient_to_recipe(recipe_name, ingredient)
  local recipe = data.raw.recipe[recipe_name]
  if not recipe or not recipe.ingredients then
    return
  end

  local new_name = ingredient.name or ingredient[1]

  for _, ing in pairs(recipe.ingredients) do
    local name = ing.name or ing[1]
    if name == new_name then
      return
    end
  end

  table.insert(recipe.ingredients, ingredient)
end


function apia_utils.add_crafting_categories(proto, categories)
    if not proto or not proto.crafting_categories then return end
    for _, cat in pairs(categories) do
        local exists = false
        for _, existing in pairs(proto.crafting_categories) do
            if existing == cat then
                exists = true
                break
            end
        end
        if not exists then
            table.insert(proto.crafting_categories, cat)
        end
    end
end


return apia_utils