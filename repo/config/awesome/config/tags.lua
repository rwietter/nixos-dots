-- tags  / layouts
-- ~~~~~~~~~~~~~~~
-- requirements
-- ~~~~~~~~~~~~
local awful = require("awful")
local lmachi = require("mods.layout-machi")
local bling = require("mods.bling")

-- misc/vars
-- ~~~~~~~~~

-- bling layouts
local mstab = bling.layout.mstab
local equal = bling.layout.equalarea
local deck = bling.layout.deck

-- layout machi  
lmachi.editor.nested_layouts = {
	[""] = awful.layout.suit.floating,
	[""] = awful.layout.suit.spiral,
	[""] = deck,
	[""] = awful.layout.suit.fair,
	[""] = awful.layout.suit.fair.horizontal,
	[""] = awful.layout.suit.fair.vertical,
}

-- names/numbers of layouts
local names = { "", "", "", "", "", "" }
local l = awful.layout.suit

-- Configurations
-- **************

-- default tags
-- tag.connect_signal(
-- 	"request::default_layouts",
-- 	function()
-- 		awful.layout.append_default_layouts({ l.tile, l.floating, lmachi.default_layout, equal, mstab, deck })
-- 	end
-- )

tag.connect_signal(
	"request::default_layouts",
	function()
		awful.layout.append_default_layouts({
			l.tile, -- default (vertical)
			l.tile.bottom, -- stack (horizontal)
			l.floating, -- floating layout
			lmachi.default_layout, -- layout machi
			equal, -- layout equalarea (bling)
			mstab, -- layout mstab (bling)
			deck -- layout deck (bling)
		})
	end
)

-- set tags
screen.connect_signal(
	"request::desktop_decoration",
	function(s)
		screen[s].padding = {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0
		}
		-- awful.tag(names, s, awful.layout.layouts[1])
		awful.tag(names, s, l.tile.bottom) -- layout padrão horizontal
	end
)
