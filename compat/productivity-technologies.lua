



-- muluna thruster-fuel-productivity
if data.raw["technology"]["thruster-fuel-productivity"] then
    table.insert
	(
        data.raw["technology"]["thruster-fuel-productivity"].unit.ingredients,
        {"apicultural-science-pack", 1}
    )
	table.insert
	(
        data.raw["technology"]["thruster-fuel-productivity"].prerequisites,
        "apicultural-science-pack"
    )
else
    data:extend({
        {
            type = "technology",
            name = "thruster-productivity",
            icons = util.technology_icon_constant_productivity("__apia__/graphics/technology/thruster-productivity.png"),
            PlanetsLib_recipe_productivity_effects = 
			{
                purge_other_effects = true,
                effects = 
				{
                    {
                        type = "fluid",
                        name = "thruster-fuel",
                        change = 0.1
                    },
                    {
                        type = "fluid",
                        name = "thruster-oxidizer",
                        change = 0.1
                    }
                }
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
        }
    })
end