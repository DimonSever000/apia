require ("util")

local remnants =
{
  {
    type = "corpse",
    name = "artificial-hive-remnants",
    icon = "__apia__/graphics/icons/artificial-hive.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "smelting-machine-remnants",
    order = "d[artificial-hive]",
    selection_box = {{-2, -2}, {2, 2}},
    tile_width = 5,
    tile_height = 5,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__apia__/graphics/entity/artificial-hive/artificial-hive-remnants.png",
      line_length = 1,
      width = 1024,
      height = 1024,
      frame_count = 1,
      direction_count = 1,
      --shift = util.by_pixel( -1.5, -5.5),
      scale = 0.25,
    }
  },
  {
    type = "corpse",
    name = "bio-solar-panel-remnants",
    icon = "__base__/graphics/icons/solar-panel.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "a-c-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__apia__/graphics/entity/bio-solar-panel/bio-solar-panel-remnants.png",
      line_length = 1,
      width = 290,
      height = 282,
	  frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(3.5, 0),
      scale = 0.5
    },
  },
  {
    type = "corpse",
    name = "biosynthesizer-remnants",
    icon = "__apia__/graphics/entity/biosynthesizer/biosynthesizer-icon.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "a-c-a",
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    tile_width = 5,
    tile_height = 5,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__apia__/graphics/entity/biosynthesizer/biosynthesizer-remnants.png",
      line_length = 1,
      width = 500,
      height = 500,
	  frame_count = 1,
      direction_count = 1,
      scale = 0.35,
	  shift = {0, -0.35},
    },
  },
  {
    type = "corpse",
    name = "bioreactor-remnants",
    icon = "__apia__/graphics/entity/bioreactor/bioreactor-icon.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "a[bioreactor]",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__apia__/graphics/entity/bioreactor/bioreactor-remnants.png",
      line_length = 1,
      width = 250,
      height = 250,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel( 0, 0),
      scale = 0.5
    }
  },
}


for k, remnant in pairs (remnants) do
  if not remnant.localised_name then
    local name = remnant.name
    if name:find("%-remnants") then
      remnant.localised_name = {"remnant-name", {"entity-name."..name:gsub("%-remnants", "")}}
    end
  end
end

data:extend(remnants)
