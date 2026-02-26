data:extend({
	{
		type = "bool-setting",
		name = "apia-vanila-science",
		setting_type = "startup",
		default_value = true
	},
	{
		type = "bool-setting",
		name = "apia-science-promethium",
		setting_type = "startup",
		default_value = true
	},
	{
		type = "bool-setting",
		name = "apia-science-research-productivity",
		setting_type = "startup",
		default_value = true
	},
	{
		type = "int-setting",
		name = "apia-lymph-consumption-percent",
		setting_type = "startup",
		default_value = 0,
		minimum_value = 0,
		maximum_value = 90,
		allowed_values = {0, 10, 20, 30, 40, 50, 60, 70, 80, 90},
	}
})