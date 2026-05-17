--[[------------------
-------MONITORS-------
----------------------]]

hl.monitor({
	output = "DP-1",
	mode = "highres",
	position = "auto",
	scale = 1,
	sdr_max_luminance = 60,
	sdrsaturation = 0.8
})

--[[--------------------
-------MY PROGRAMS------
------------------------]]

local terminal = "alacritty"
local fileManager = "dolphin"
local menu = "wofi --show drun"
local obsidian = "obsidian"
local browser = "zen-browser --ProfileManager"
local tor = "torbrowser-launcher"
local lock = "hyprlock"
local shutdown = "shutdown now"
local restart = "shutdown -r now"
local videoEditor = "kdenlive"
local imageEditor = "gimp"
local vectorEditor = "inkscape"
local wallpaper = "hyprpaper"
local statusBar = "waybar"

local batnot = "bash -c 'sleep 300 && /home/sela/10x/batnot/batnot/bin/python /home/sela/10x/batnot/batnot.py'"


--[[-----------------
-----AUTOSTART-------
---------------------]]

hl.on("hyprland.start", function()
	hl.exec_cmd(wallpaper)
	hl.exec_cmd(statusBar)
	hl.exec_cmd(batnot)
	end)

--[[-------------------------------
------ENVIRONMENT VARIABLES--------
-----------------------------------]]

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Nord")

--[[------------------------
---------PERMISSIONS--------
-----------------------------]]



--[[-------------------------
-----LOOK AND FEEL-----------
-----------------------------]]

hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 2,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(225, 169, 78, 1)" } },
			inactive_border = { colors = { "rgba(199, 106, 38, 0.9)" } }
		},

		resize_on_border = false,

		allow_tearing = false,

		layout = "master"
	},

	decoration = {
		rounding = 5,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 0.9,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)"
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696
		}

	},

	animations = {
		enabled = true
	}
})

-- Animations
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Workspace rules

hl.workspace_rule({ workspace = "r[1-2]", layout = "dwindle" })
hl.workspace_rule({ workspace = "10", layout = "scrolling" })

hl.config({
	dwindle = {
		force_split = 0,
		smart_split = false
		}
	})

hl.config({
	master = {
		new_status = "master"
		}
	})

hl.config({
	scrolling = {
		column_width = 0.6,
		fullscreen_on_one_column = true
		}
})

-- INPUT

hl.config({
	input = {
		kb_layout = "gb",

		follow_mouse = 1,

		sensitivity = 0,

		scroll_method = "on_bottom_down",
		scroll_button = 274,

		touchpad = {
			natural_scroll = true
		},

	}
})

-- Gestures

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace"
})

hl.gesture({
	fingers = 4,
	direction = "horizontal",
	action = "move"
})

--[[-------------
--------KEYBINDS
--]]

local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({action = "toggle"}))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
-- hl.bind(mainMod .. " + P",hl.dsp.window.float())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(obsidian))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(tor))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd(videoEditor))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(imageEditor))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(vectorEditor))

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(shutdown))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd(restart))

-- Swap with master
hl.bind(mainMod .. " + Tab", hl.dsp.layout("swapwithmaster master"))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. "+" .. key,         hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. "+ SHIFT +" .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move focus with arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

------------------------------
-- WINDOWS AND WORKSPACES
-----------------------------

hl.window_rule({
	name = "suppress-maximize-events",
	match = {
		class = "*",
	},
	suppress_event = "maximize"
})

hl.window_rule({
	name = "fix-drag-issues",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = false,
		fullscreen = false,
		pin = false
	}
})
