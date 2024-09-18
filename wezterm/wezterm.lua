-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("Hack Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 16
config.line_height = 1.1

-- config.color_scheme = "Tokyo Night"
-- config.color_scheme = "matrix"
-- config.color_scheme = "Matrix (terminal.sexy)"
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Solarized Dark Higher Contrast"

config.automatically_reload_config = true

-- Adding keybindings to match iTerm’s pane splits with Super key
config.keys = {
	-- Vertical split (Cmd+D in iTerm)
	{ key = "d", mods = "SUPER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	-- Horizontal split (Cmd+Shift+D in iTerm)
	{ key = "D", mods = "SUPER|SHIFT", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
}

-- config.enable_tab_bar = false

-- config.window_decorations = "RESIZE"

config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

return config
