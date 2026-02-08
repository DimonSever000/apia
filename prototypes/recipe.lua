local seconds = 60
local minutes = 60*seconds

data:extend(
{
  {
    type = "recipe",
    name = "larvae-cultivation",
    icon = "__apia__/graphics/icons/larvae-cultivation.png",
	category = "apicultural",
    subgroup = "apiculture-processes",
    order = "a-b[raw-larvae]",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2500,
        max = 2500
      },
	  {
        property = "gravity",
        min = 50,
        max = 50
      }
    },
    enabled = false,
    allow_productivity = true,
    reset_freshness_on_craft = true,
	auto_recycle = false,
	show_amount_in_title = false,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "raw-larvae", amount = 1},
	  {type = "item", name = "nutrients", amount = 5},
      {type="fluid", name="royal-jelly", amount=50}
    },
    results =
    {
      {type = "item", name = "raw-larvae", amount = 4}
    },
  },
  {
    type = "recipe",
    name = "nutrients-from-larvae",
    icon = "__apia__/graphics/icons/nutrients-from-larvae.png",
    category = "apicultural-or-hand-crafting",
    subgroup = "apiculture-processes",
    order = "d-a[nutrients-from-larvae]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 4,
    ingredients = {{type = "item", name = "raw-larvae", amount = 4}},
    results = {{type="item", name="nutrients", amount=6}},
  },
  {
    type = "recipe",
    name = "fossil-larvae-processing",
    icon = "__apia__/graphics/icons/fossil-larvae-processing.png",
    category = "apicultural-or-hand-crafting",
    subgroup = "apiculture-processes",
    order = "b-b[fossil-larvae]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients = {{type = "item", name = "fossil-larvae", amount = 1}},
    results =
    {
		{type = "item", name = "stone", amount = 1, probability = 0.33},
		{type = "item", name = "iron-ore", amount = 1, probability = 0.15},
		{type = "item", name = "copper-ore", amount = 1, probability = 0.10},
		{type = "item", name = "phosphorus", amount = 1, probability = 0.02},
    },
  },
  {
    type = "recipe",
    name = "phosphoric-acid",
    category = "apicultural-or-chemistry",
    subgroup = "apiculture-products",
	order = "e-a[recipes][phosphoric-acid]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 4,
	ingredients =
	{
		{type = "item", name = "phosphorus", amount = 10},
		{type="fluid", name="water", amount= 80}
    },
    results = {{type="fluid", name="phosphoric-acid", amount=100}},
  },
  {
    type = "recipe",
    name = "battery-from-phosphoric-acid",
	icon = "__apia__/graphics/icons/battery-from-phosphoric-acid.png",
	category = "apicultural-or-chemistry",
	subgroup = "apiculture-products",
	order = "e-a[recipes][battery-from-phosphoric-acid]",
    energy_required = 4,
    enabled = false,
	allow_productivity = true,
    ingredients =
    {
      {type = "fluid", name = "phosphoric-acid", amount = 20},
      {type = "item", name = "iron-plate", amount = 1},
      {type = "item", name = "copper-plate", amount = 1}
    },
    results = {{type="item", name="battery", amount=1}},
  },
  {
    type = "recipe",
    name = "processing-unit-from-phosphoric-acid",
	icon = "__apia__/graphics/icons/processing-unit-from-phosphoric-acid.png",
    category = "apicultural-or-electronics-with-fluid",
	subgroup = "apiculture-products",
	order = "e-a[recipes][processing-unit-from-phosphoric-acid]",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
		{type = "item", name = "electronic-circuit", amount = 20},
		{type = "item", name = "advanced-circuit", amount = 2},
		{type = "fluid", name = "phosphoric-acid", amount = 10}
    },
    results = {{type="item", name="processing-unit", amount=1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "explosives-from-phosphorus",
	icon = "__apia__/graphics/icons/explosives-from-phosphorus.png",
    category = "apicultural-or-chemistry",
	subgroup = "apiculture-products",
	order = "e-a[recipes][explosives-from-phosphoric-acid]",
    energy_required = 4,
    enabled = false,
    ingredients =
    {
		{type = "item", name = "phosphorus", amount = 1},
		{type = "item", name = "carbon", amount = 3},
		{type = "fluid", name = "water", amount = 10}
    },
    results = {{type="item", name="explosives", amount=2}},
	auto_recycle = false,
	enabled = false,
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "artillery-shell-with-phosphorus",
    energy_required = 15,
    enabled = false,
    ingredients =
    {
		{type = "item", name = "radar", amount = 1},
		{type = "item", name = "phosphorus", amount = 2},
		{type = "item", name = "tungsten-plate", amount = 4},
		{type = "item", name = "explosives", amount = 8}
    },
    results = {{type="item", name="artillery-shell-with-phosphorus", amount=1}},
  },
  {
    type = "recipe",
    name = "flamethrower-ammo-from-phosphorus",
	icon = "__apia__/graphics/icons/flamethrower-ammo-from-phosphorus.png",
    category = "chemistry",
    enabled = false,
    energy_required = 6,
    ingredients =
    {
		{type = "item", name = "steel-plate", amount = 5},
		{type = "item", name = "phosphorus", amount = 3}
    },
    results = {{type="item", name="flamethrower-ammo", amount=1}},
  },
  {
    type = "recipe",
    name = "biolubricant-from-royal-jelly",
    icon = "__apia__/graphics/icons/biolubricant-from-royal-jelly.png",
    category = "apicultural",
    subgroup = "apiculture-products",
	order = "e-a[recipes][biolubricant-from-royal-jelly]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 3,
	ingredients =
    {
		{type = "fluid", name="royal-jelly", amount = 100},
		{type = "fluid", name="water", amount = 20}
    },
    results =
    {
		{type = "fluid", name="lubricant", amount = 40}
    },
  },
  {
    type = "recipe",
    name = "honeycombs-processing",
    icon = "__apia__/graphics/icons/honeycombs-processing.png",
    category = "apicultural-or-hand-crafting",
    subgroup = "apiculture-processes",
    order = "c-b[honeycombs]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 3,
    ingredients = {{type = "item", name = "honeycombs", amount = 1}},
    results =
    {
		{type = "item", name = "wax", amount = 2},
		{type = "item", name = "honey", amount = 1},
    },
  },
  {
    type = "recipe",
    name = "nutrients-from-honey",
    icon = "__apia__/graphics/icons/nutrients-from-honey.png",
    category = "apicultural",
    subgroup = "apiculture-processes",
    order = "d-b[nutrients-from-honey]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 4,
    ingredients = {{type = "item", name = "honey", amount = 1}},
    results = {{type="item", name="nutrients", amount=4}},
  },
  {
    type = "recipe",
    name = "nutrients-from-polysaccharides",
    icon = "__apia__/graphics/icons/nutrients-from-polysaccharides.png",
    category = "apicultural",
    subgroup = "apiculture-processes",
    order = "d-c[nutrients-from-polysaccharides]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 2,
    ingredients = {{type = "item", name = "polysaccharides", amount = 5}},
    results = {{type="item", name="nutrients", amount=30}},
  },
  {
    type = "recipe",
    name = "honey-processing",
    icon = "__apia__/graphics/icons/honey-processing.png",
    category = "apicultural",
    subgroup = "apiculture-products",
    order = "e-a[recipes][honey-processing]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 6,
    ingredients = {{type = "item", name = "honey", amount = 10}},
    results =
    {
		{type = "item", name = "polysaccharides", amount = 3},
		{type = "fluid", name = "water", amount = 80}
    },
  },
  {
    type = "recipe",
    name = "honey-dehydration",
    icon = "__apia__/graphics/icons/honey-dehydration.png",
    category = "apicultural",
    subgroup = "apiculture-products",
    order = "e-a[recipes][honey-dehydration]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 8,
    ingredients = {{type = "item", name = "honey", amount = 10}},
    results =
    {
		{type = "item", name = "polysaccharides", amount = 4},
    },
  },
  {
    type = "recipe",
    name = "bioplastic-from-wax",
    icon = "__apia__/graphics/icons/bioplastic-from-wax.png",
    category = "apicultural",
    subgroup = "apiculture-products",
	order = "e-a[recipes][bioplastic-from-wax]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 3,
    ingredients =
	{
		{type = "item", name = "wax", amount = 10},
		{type = "fluid", name = "steam", amount = 20},
		{type = "fluid", name = "phosphoric-acid", amount = 60},
    },
    results =
	{
		{type = "item", name = "plastic-bar", amount = 10},
    },
  },
  {
    type = "recipe",
    name = "wax-platform",
    always_show_made_in = true,
    category = "crafting-with-fluid",
    energy_required = 16,
	allow_productivity = false,
    ingredients =
    {
		{type = "fluid", name = "royal-jelly", amount = 400},
		{type = "item", name = "wax", amount = 50},
    },
    results = {{type="item", name="wax-platform", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "honeycombs",
    icon = "__apia__/graphics/icons/honeycombs.png",
    category = "artificial-hive-process",
    order = "c-a[honeycombs]",
    hide_from_player_crafting = true,
    auto_recycle = false,
    preserve_products_in_machine_output = true,
    energy_required = 10,
    ingredients = {},
    results =
    {
		{type = "item", name = "honeycombs", amount = 10}
    },
    enabled = false
  },
  {
    type = "recipe",
    name = "solid-fuel-from-polysaccharides",
    icon = "__apia__/graphics/icons/solid-fuel-from-polysaccharides.png",
    category = "apicultural",
	subgroup = "apiculture-products",
	order = "e-a[recipes][solid-fuel-from-polysaccharides]",
    enabled = false,
	auto_recycle = false,
    allow_productivity = true,
    energy_required = 8,
    ingredients =
	{
		{type = "item", name = "polysaccharides", amount = 1},
		{type = "item", name = "wax", amount = 4}
    },
    results =
    {
		{type = "item", name = "solid-fuel", amount = 1},
    },
  },
  {
    type = "recipe",
    name = "rocket-fuel-from-phosphoric-acid",
    icon = "__apia__/graphics/icons/rocket-fuel-from-phosphoric-acid.png",
    category = "apicultural",
	subgroup = "apiculture-products",
    order = "e-a[recipes][rocket-fuel-from-phosphoric-acid]",
    enabled = false,
	auto_recycle = false,
    allow_productivity = true,
    energy_required = 10,
	ingredients =
    {
		{type = "item", name = "solid-fuel", amount = 10},
		{type = "fluid", name =  "phosphoric-acid", amount = 30},
    },
    results = {{type="item", name="rocket-fuel", amount=1}},
  },
  {
    type = "recipe",
    name = "apicultural-science-pack",
    icon = "__apia__/graphics/icons/apicultural-science-pack.png",
    category = "apicultural",
	subgroup = "science-pack",
    enabled = false,
	auto_recycle = false,
    allow_productivity = true,
    energy_required = 6,
    ingredients =
	{
      {type = "item", name = "polysaccharides", amount = 4},
      {type = "item", name = "wax", amount = 10},
	  {type = "fluid", name = "royal-jelly", amount = 100},
    },
    results =
    {
      {type = "item", name = "apicultural-science-pack", amount = 1},
    },
	surface_conditions =
    {
      {
        property = "pressure",
        min = 2500,
        max = 2500
      },
	  {
        property = "gravity",
        min = 50,
        max = 50
      }
    },
  },
  {
    type = "recipe",
    name = "artificial-hive",
    category = "apicultural",
	subgroup = "apiculture",
    energy_required = 16,
    enabled = false,
	auto_recycle = false,
    allow_productivity = false,
    reset_freshness_on_craft = true,
    ingredients =
    {
      {type = "item", name = "wax", amount = 100},
	  {type = "item", name = "honeycombs", amount = 30},
      {type = "item", name = "electronic-circuit", amount = 10},
      {type = "item", name = "electric-engine-unit", amount = 5},
      {type = "fluid", name = "lubricant", amount = 100},
    },
    results = {{type = "item", name = "artificial-hive", amount = 1}},
	surface_conditions =
    {
      {
        property = "pressure",
        min = 2500,
        max = 2500
      },
	  {
        property = "gravity",
        min = 50,
        max = 50
      }
    },
  },
  {
    type = "recipe",
    name = "bio-solar-panel",
    category = "apicultural",
	subgroup = "apiculture",
    energy_required = 20,
    enabled = false,
	auto_recycle = false,
    allow_productivity = false,
    reset_freshness_on_craft = true,
    ingredients =
    {	
		{type = "item", name = "electronic-circuit", amount = 25},
		{type = "item", name = "nutrients", amount = 100},
		{type = "item", name = "landfill", amount = 2},
		{type = "item", name = "tree-seed", amount = 5},
		{type = "fluid", name = "water", amount = 200},
    },
    results = {{type = "item", name = "bio-solar-panel", amount = 1}},
	surface_conditions =
    {
		{
			property = "pressure",
			min = 2500,
			max = 2500
		},
		{
			property = "gravity",
			min = 50,
			max = 50
		}
    },
  },
  {
    type = "recipe",
    name = "biosynthesizer",
    category = "apicultural-or-assembling",
	subgroup = "apiculture",
    surface_conditions =
    {
		{
			property = "pressure",
			min = 2500,
			max = 2500
		},
		{
			property = "gravity",
			min = 50,
			max = 50
		}
    },
    energy_required = 20,
    ingredients =
    {
		{type = "item", name = "nutrients", amount = 50},
		{type = "item", name = "raw-larvae", amount = 50},
		{type = "item", name = "steel-plate", amount = 20},
		{type = "item", name = "electronic-circuit", amount = 5},
		{type = "item", name = "landfill", amount = 2}
    },
    results = {{type="item", name="biosynthesizer", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "bioreactor",
    category = "apicultural",
	subgroup = "apiculture",
    surface_conditions =
    {
		{
			property = "pressure",
			min = 2500,
			max = 2500
		},
		{
			property = "gravity",
			min = 50,
			max = 50
		}
    },
    energy_required = 25,
    ingredients =
    {
		{type = "item", name = "nutrients", amount = 50},
		{type = "item", name = "steel-plate", amount = 50},
		{type = "item", name = "electronic-circuit", amount = 20},
		{type = "item", name = "refined-concrete", amount = 30},
		{type = "fluid", name = "water", amount = 200}
    },
    results = {{type="item", name="bioreactor", amount=1}},
    enabled = false,
  },
  {
    type = "recipe",
    name = "flamethrower-capsule",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {type = "item", name = "flamethrower-ammo", amount = 3},
      {type = "item", name = "electronic-circuit", amount = 3},
      {type = "item", name = "iron-gear-wheel", amount = 3}
    },
    results = {{type="item", name="flamethrower-capsule", amount=1}}
  },
})




local function add_ingredient_to_recipe(recipe_name, ingredient)
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


if settings.startup["apia-vanila-science"].value then
	add_ingredient_to_recipe(
	  "overgrowth-yumako-soil",
	  { type = "item", name = "phosphorus", amount = 4 }
	)
	add_ingredient_to_recipe(
	  "overgrowth-jellynut-soil",
	  { type = "item", name = "phosphorus", amount = 4 }
	)
end