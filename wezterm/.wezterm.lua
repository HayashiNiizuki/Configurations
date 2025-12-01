-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
-- config.initial_cols = 120
-- config.initial_rows = 28

-- or, changing the font size and color scheme
config.font = wezterm.font 'Monego'
config.font_size = 12

-- if not can't start
config.enable_wayland = false

-- default tab bar is ugly
config.use_fancy_tab_bar = false

-- color scheme
config.color_scheme = 'One Half Black (Gogh)'

-- fullscreen on startup
local mux = wezterm.mux
wezterm.on('gui-startup', function(window)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

-- Finally, return the configuration to wezterm:
return config