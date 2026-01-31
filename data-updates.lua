
local function add_crafting_categories(proto, categories)
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

add_crafting_categories(data.raw.character.character, {
    "apicultural-or-hand-crafting"
})

add_crafting_categories(data.raw["god-controller"].default, {
    "apicultural",
    "apicultural-or-hand-crafting",
    "apicultural-or-assembling",
    "apicultural-or-chemistry",
    "apicultural-or-electronics-with-fluid"
})

add_crafting_categories(data.raw["assembling-machine"]["assembling-machine-2"], {
    "apicultural-or-hand-crafting",
    "apicultural-or-assembling",
    "apicultural-or-electronics-with-fluid"
})

add_crafting_categories(data.raw["assembling-machine"]["assembling-machine-3"], {
    "apicultural-or-hand-crafting",
    "apicultural-or-assembling",
    "apicultural-or-electronics-with-fluid"
})

add_crafting_categories(data.raw["assembling-machine"]["chemical-plant"], {
    "apicultural-or-chemistry"
})

add_crafting_categories(data.raw["assembling-machine"]["electromagnetic-plant"], {
    "apicultural-or-electronics-with-fluid"
})


table.insert(data.raw.lab["lab"].inputs, "apicultural-science-pack")
table.insert(data.raw.lab["biolab"].inputs, "apicultural-science-pack")