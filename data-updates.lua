local util = require("util")
local apia_utils = require("lib")



local refresh_overlay_icon = "__apia__/graphics/icons/refresh.png"
local force_include = { }
local force_exclude = { }

local function generate_freshness_recipe_icon(item)
  local icons = {}

  if item.icons then
    for i = 1, #item.icons do
      icons[#icons+1] = table.deepcopy(item.icons[i])
    end
  else
    icons[#icons+1] = {
      icon = item.icon,
      icon_size = item.icon_size
    }
  end

  icons[#icons+1] = {
    icon = refresh_overlay_icon,
    icon_size = 64
  }

  return icons
end

local function generate_refresh_recipe(item)

  if force_exclude[item.name] then return end


  if (item.spoil_result ~= "spoilage" and item.spoil_to_trigger_result == nil) then
    if not force_include[item.name] then return end
  end

  if not item.spoil_ticks and not force_include[item.name] then return end

  if item.fuel_category == "nutrients" then return end

  local recipe_name = item.name .. "-refresh-freshness"

  local recipe =
  {
    type = "recipe",
    name = recipe_name,
    category = "refresh",
	subgroup = "refresh",
	order = item.order,
    hidden = false,
    enabled = false,
    --hide_from_player_crafting = true,
    allow_productivity = false,
    allow_as_intermediate = false,
    allow_decomposition = false,
    allow_quality = false,
    reset_freshness_on_craft = true,
    energy_required = 2,
    localised_name = {"recipe-name.refresh-freshness", {"item-name."..item.name}},
    icons = generate_freshness_recipe_icon(item),
    ingredients =
	{
      {type = "item", name = item.name, amount = 1, ignored_by_productivity = 1},
	  {type = "fluid", name = "lymph", amount = 10, ignored_by_productivity = 10},
    },
    results =
	{
      {type="item", name=item.name, amount=1, ignored_by_productivity = 1},
	  {type = "fluid", name = "dirty-lymph", amount = 10, ignored_by_productivity = 10},
	  -- ignored_by_productivity just in case
    }
  }

  data:extend({recipe})
  
  apia_utils.add_tech_effect("refreshment",
	{ type = "unlock-recipe", recipe = recipe_name})
  
end

for type_name, _ in pairs(defines.prototypes.item) do
  if data.raw[type_name] then
    for _, item in pairs(data.raw[type_name]) do
      generate_refresh_recipe(item)
    end
  end
end





apia_utils.add_crafting_categories(data.raw.character.character, {
    "apicultural-or-hand-crafting"
})

apia_utils.add_crafting_categories(data.raw["god-controller"].default, {
    "apicultural",
    "apicultural-or-hand-crafting",
    "apicultural-or-assembling",
    "apicultural-or-chemistry",
    "apicultural-or-electronics-with-fluid"
})

apia_utils.add_crafting_categories(data.raw["assembling-machine"]["assembling-machine-2"], {
    "apicultural-or-hand-crafting",
    "apicultural-or-assembling",
    "apicultural-or-electronics-with-fluid"
})

apia_utils.add_crafting_categories(data.raw["assembling-machine"]["assembling-machine-3"], {
    "apicultural-or-hand-crafting",
    "apicultural-or-assembling",
    "apicultural-or-electronics-with-fluid"
})

apia_utils.add_crafting_categories(data.raw["assembling-machine"]["chemical-plant"], {
    "apicultural-or-chemistry"
})

apia_utils.add_crafting_categories(data.raw["assembling-machine"]["electromagnetic-plant"], {
    "apicultural-or-electronics-with-fluid"
})


table.insert(data.raw.lab["lab"].inputs, "apicultural-science-pack")
table.insert(data.raw.lab["biolab"].inputs, "apicultural-science-pack")



if settings.startup["apia-vanila-science"].value then
	apia_utils.add_ingredient_to_recipe(
	  "overgrowth-yumako-soil",
	  { type = "item", name = "phosphorus", amount = 4 }
	)
	apia_utils.add_ingredient_to_recipe(
	  "overgrowth-jellynut-soil",
	  { type = "item", name = "phosphorus", amount = 4 }
	)
end