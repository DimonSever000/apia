



if mods["orbital-cannon"] then
	data:extend
	{
		{
			type = "orbital-cannon-link",
			name = "apia-carnova",
			source = "apia",
			target = "carnova",
			link_type = "transport",
			requested_slots = 7,
		},
		{
			type = "orbital-cannon-link",
			name = "carnova-apia",
			source = "carnova",
			target = "apia",
			link_type = "transport",
			requested_slots = 7,
		}
	}
end