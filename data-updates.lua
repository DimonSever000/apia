local util = require("util")
local apia_utils = require("lib")




for type_name, _ in pairs(defines.prototypes.item) do
  if data.raw[type_name] then
    for _, item in pairs(data.raw[type_name]) do
		apia_utils.generate_refresh_recipe(item)
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




require("__apia__.compat.recycling-spoilage-fixes")
require("__apia__.compat.overgrowth-soil")
require("__apia__.compat.productivity-technologies")
require("__apia__.compat.bioprocessing-tab")
require("__apia__.compat.orbital-cannon")