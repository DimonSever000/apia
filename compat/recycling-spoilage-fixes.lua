



local r = data.raw.recipe["biosynthesizer-recycling"]

if r and r.results then
  for i, res in pairs(r.results) do
    if res.name == "raw-larvae" or res.name == "piranha-roe" then
      r.results[i] = {type = "item", name = "spoilage", amount = 10}
    end
  end
end