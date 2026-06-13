local apia_utils = require("lib")



if settings.startup["apia-vanila-science"].value then
	apia_utils.add_ingredient_to_recipe
	(
	  "overgrowth-yumako-soil",
	  { type = "item", name = "phosphorus", amount = 4 }
	)
	apia_utils.add_ingredient_to_recipe
	(
	  "overgrowth-jellynut-soil",
	  { type = "item", name = "phosphorus", amount = 4 }
	)
	apia_utils.add_recycling_result("overgrowth-yumako-soil","phosphorus",1)
	apia_utils.add_recycling_result("overgrowth-jellynut-soil","phosphorus",1)
end