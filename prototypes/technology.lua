


data:extend(
{
  {
    type = "technology",
    name = "planet-discovery-apia",
    icons = util.technology_icon_constant_planet("__apia__/graphics/technology/apia.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "apia",
        use_icon_overlay_constant = true
      },
    },
    prerequisites = {"agricultural-science-pack", "electromagnetic-science-pack"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
		{"agricultural-science-pack", 1},
		{"electromagnetic-science-pack", 1},
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "parasites",
    icon = "__apia__/graphics/technology/parasites.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "larvae-cultivation"
      },
      {
        type = "unlock-recipe",
        recipe = "nutrients-from-larvae"
      },
	  {
        type = "unlock-recipe",
        recipe = "fossil-larvae-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "biosynthesizer"
      }
    },
    prerequisites = {"planet-discovery-apia"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "larvae"
    }
  },
  {
    type = "technology",
    name = "phosphorus",
    icon = "__apia__/graphics/technology/phosphorus.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "phosphoric-acid"
      },
	  {
        type = "unlock-recipe",
        recipe = "processing-unit-from-phosphoric-acid"
      },
	  {
        type = "unlock-recipe",
        recipe = "explosives-from-phosphorus"
      },
	  {
        type = "unlock-recipe",
        recipe = "flamethrower-ammo-from-phosphorus"
      },
    },
    prerequisites = {"parasites", "explosives"},
    research_trigger =
    {
      type = "craft-item",
      item = "phosphorus",
    }
  },
  {
    type = "technology",
    name = "phosphate-battery",
    icon = "__apia__/graphics/technology/phosphate-battery.png",
	icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "battery-from-phosphoric-acid"
      },
    },
    prerequisites = {"phosphorus"},
    research_trigger =
    {
      type = "craft-fluid",
      fluid = "phosphoric-acid",
    }
  },
  {
    type = "technology",
    name = "apiculture",
    icon = "__apia__/graphics/technology/apiculture.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "honeycombs-processing"
      },
    },
    prerequisites = {"planet-discovery-apia"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "wild-hive"
    }
  },
  {
    type = "technology",
    name = "honey-processing",
    icon = "__apia__/graphics/technology/honey-processing.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "nutrients-from-honey"
      },
	  {
        type = "unlock-recipe",
        recipe = "honey-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "honey-dehydration"
      },
	  {
        type = "unlock-recipe",
        recipe = "nutrients-from-polysaccharides"
      },
	  {
        type = "unlock-recipe",
        recipe = "biolubricant-from-royal-jelly"
      }
    },
    prerequisites = {"apiculture", "parasites"},
    research_trigger =
    {
      type = "craft-item",
      item = "honey",
      count = 10
    }
  },
  {
    type = "technology",
    name = "wax-processing",
    icon = "__apia__/graphics/technology/wax-processing.png",
    icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "bioplastic-from-wax"
      },
	  {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-polysaccharides"
      },
	  {
        type = "unlock-recipe",
        recipe = "rocket-fuel-from-phosphoric-acid"
      },
	  {
        type = "unlock-recipe",
        recipe = "wax-platform"
      },
    },
    prerequisites = {"apiculture", "phosphorus"},
    research_trigger =
    {
      type = "craft-item",
      item = "wax",
      count = 10
    }
  },
  {
    type = "technology",
    name = "artificial-hive",
    icon = "__apia__/graphics/technology/artificial-hive.png",
    icon_size = 256,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "artificial-hive"
      },
    },
    prerequisites = {"wax-processing", "honey-processing"},
	research_trigger =
	{
      type = "craft-item",
      item = "polysaccharides",
      count = 10
    }
  },
  {
    type = "technology",
    name = "apicultural-science-pack",
    icon = "__apia__/graphics/technology/apicultural-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "apicultural-science-pack"
      },
    },
    prerequisites = {"artificial-hive"},
    research_trigger =
    {
      type = "craft-item",
      item = "artificial-hive",
    }
  },
  {
    type = "technology",
    name = "flamethrower-robot",
    icon = "__apia__/graphics/technology/flamethrower-robot.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "flamethrower-capsule",
      },
    },
    prerequisites = {"apicultural-science-pack", "defender", "flamethrower"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"military-science-pack", 1},
        {"apicultural-science-pack", 1}
      },
      time = 60
    },
  },
  {
    type = "technology",
    name = "bio-solar-panel",
    icon = "__apia__/graphics/technology/bio-solar-panel.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bio-solar-panel",
      },
    },
    prerequisites = {"apicultural-science-pack", "solar-energy"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"production-science-pack", 1},
		{"utility-science-pack", 1},
        {"apicultural-science-pack", 1},
      },
      time = 60
    },
  },
  {
    type = "technology",
    name = "bioreactor",
    icon = "__apia__/graphics/technology/bioreactor.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bioreactor",
      },
    },
    prerequisites = {"apicultural-science-pack"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"production-science-pack", 1},
		{"utility-science-pack", 1},
        {"apicultural-science-pack", 1},
      },
      time = 60
    },
  },
  {
    type = "technology",
    name = "phosphorus-shell",
    icon = "__apia__/graphics/technology/phosphorus-shell.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "artillery-shell-with-phosphorus",
      },
    },
    prerequisites = {"apicultural-science-pack", "artillery"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"production-science-pack", 1},
		{"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"apicultural-science-pack", 1},
      },
      time = 60
    },
  },
  {
    type = "technology",
    name = "agriculture-productivity",
    icons = util.technology_icon_constant_productivity("__apia__/graphics/technology/agriculture-productivity.png"),
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "yumako-processing",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "jellynut-processing",
        change = 0.1
      },
    },
    prerequisites = {"apicultural-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"apicultural-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "honeycomb-processing-productivity",
    icons = util.technology_icon_constant_productivity("__apia__/graphics/technology/honeycomb-processing-productivity.png"),
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "honeycombs-processing",
        change = 0.1
      },
    },
    prerequisites = {"apicultural-science-pack"},
    unit =
    {
      count_formula = "1.2^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"apicultural-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "thruster-productivity",
    icons = util.technology_icon_constant_productivity("__apia__/graphics/technology/thruster-productivity.png"),
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "thruster-oxidizer",
        change = 0.1
      },
	  {
        type = "change-recipe-productivity",
        recipe = "advanced-thruster-oxidizer",
        change = 0.1
      },
	  {
        type = "change-recipe-productivity",
        recipe = "thruster-fuel",
        change = 0.1
      },
	  {
        type = "change-recipe-productivity",
        recipe = "advanced-thruster-fuel",
        change = 0.1
      },
    },
    prerequisites = {"apicultural-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
        {"apicultural-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "biter-egg-productivity",
    icons = util.technology_icon_constant_productivity("__apia__/graphics/technology/biter-egg-productivity.png"),
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "biter-egg",
        change = 0.05
      },
    },
    prerequisites = {"apicultural-science-pack", "captivity"},
    unit =
    {
      count_formula = "2^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
		{"production-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1},
		{"apicultural-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "lubricant-productivity",
    icons = util.technology_icon_constant_productivity("__apia__/graphics/technology/lubricant-productivity.png"),
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "lubricant",
        change = 0.1
      },
	  {
        type = "change-recipe-productivity",
        recipe = "biolubricant",
        change = 0.1
      },
	  {
        type = "change-recipe-productivity",
        recipe = "biolubricant-from-royal-jelly",
        change = 0.1
      },
    },
    prerequisites = {"apicultural-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"production-science-pack", 1},
        {"space-science-pack", 1},
        {"apicultural-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
})




local function add_tech_prerequisites(tech_name, prerequisites)
  local tech = data.raw.technology[tech_name]
  tech.prerequisites = tech.prerequisites or {}
  for _, prereq in ipairs(tech.prerequisites) do
    if prereq == prerequisites then
      return
    end
  end
  table.insert(tech.prerequisites, prerequisites)
end


local function add_science_pack(tech_name, science_pack)
  local tech = data.raw.technology[tech_name]
  -- If `tech.unit` doesn't exist then it is a trigger tech rather than a science tech, cannot modify it in this way
  if tech.unit then
    tech.unit.ingredients = tech.unit.ingredients or {}
    table.insert(tech.unit.ingredients, science_pack)
  else
    log("Apia: Unable to add science to tech `" .. tech_name .. "` due to it being a trigger technology, skipped.")
  end
end

local function add_tech_effect(tech_name, effect)
  local tech = data.raw.technology[tech_name]
  tech.effects = tech.effects or {}
  table.insert(tech.effects, effect)
end


if settings.startup["apia-vanila-science"].value then
add_tech_prerequisites("refined-flammables-7", "apicultural-science-pack")
add_science_pack("refined-flammables-7", { "apicultural-science-pack", 1 })
add_tech_prerequisites("overgrowth-soil", "apicultural-science-pack")
add_science_pack("overgrowth-soil", { "apicultural-science-pack", 1 })
end

if settings.startup["apia-science-promethium"].value then
add_tech_prerequisites("promethium-science-pack", "apicultural-science-pack")
add_science_pack("promethium-science-pack", { "apicultural-science-pack", 1 })
end

if settings.startup["apia-science-research-productivity"].value then
add_science_pack("research-productivity", { "apicultural-science-pack", 1 })
end

add_tech_effect("plastic-bar-productivity",
  { type = "change-recipe-productivity", recipe = "bioplastic-from-wax", change = 0.1 })
add_tech_effect("rocket-fuel-productivity",
  { type = "change-recipe-productivity", recipe = "rocket-fuel-from-phosphoric-acid", change = 0.1 })
add_tech_effect("processing-unit-productivity",
  { type = "change-recipe-productivity", recipe = "processing-unit-from-phosphoric-acid", change = 0.1 })
  