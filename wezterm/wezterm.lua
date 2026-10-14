local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Theme (Ghostty: theme = "Catppuccin Mocha")
config.color_scheme = 'Catppuccin Mocha'

-- Font (Ghostty: font-family = "Hack", font-size = 16)
config.font = wezterm.font 'Hack'
config.font_size = 14

-- Line height (Ghostty: adjust-cell-height = 4, i.e. 4 extra pixels per line).
-- WezTerm uses a multiplier instead of pixels; 1.2 is roughly 4px on a 16pt Hack cell.
config.line_height = 1.2

-- Window padding (Ghostty: window-padding-x = 10, window-padding-y = 8)
config.window_padding = {
  left = 10,
  right = 10,
  top = 8,
  bottom = 8,
}

-- Split panes
config.keys = {
  -- Cmd+D: new pane to the right (side by side)
  { key = 'd', mods = 'CMD', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  -- Cmd+Shift+D: new pane below (stacked)
  { key = 'd', mods = 'CMD|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
}

return config
