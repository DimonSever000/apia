



if mods["bioprocessing-tab"] and data.raw["item-group"]["bioprocessing"] then
	data.raw["item-subgroup"]["apiculture-processes"].group = "bioprocessing"
	data.raw["item-subgroup"]["apiculture-products"].group = "bioprocessing"
	data.raw["item-subgroup"]["apiculture"].group = "bioprocessing"
	data.raw["item-subgroup"]["sarciculture-processes"].group = "bioprocessing"
	data.raw["item-subgroup"]["sarciculture-products"].group = "bioprocessing"
	data.raw["item-subgroup"]["refresh"].group = "bioprocessing"
end