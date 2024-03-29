local wezterm = require 'wezterm'

local function gsettings(key)
  return wezterm.run_child_process({"gsettings", "get", "org.gnome.desktop.interface", key})
end

local config = wezterm.config_builder()

config = {
  window_close_confirmation = 'NeverPrompt',
  color_scheme = 'Catppuccin Mocha',
  cursor_blink_ease_out = "Linear",
  window_decorations = "RESIZE",
  default_cursor_style = 'BlinkingBar',
  window_background_opacity = 0.9,
  tab_bar_at_bottom = true,
  initial_rows = 35,
  initial_cols = 100,
  hide_tab_bar_if_only_one_tab = true,
  enable_wayland = true,
  cursor_blink_rate = 800,
  font = wezterm.font_with_fallback { "Hasklug Nerd Font Mono", 'Noto Color Emoji' },

  keys = {
    {
      key = 'n',
      mods = 'SHIFT|CTRL',
      action = wezterm.action.ToggleFullScreen,
    }
  }
}

local success, stdout = gsettings("cursor-theme")

if success then
  config.xcursor_theme = stdout:gsub("'(.+)'\n", "%1")
end

success, stdout = gsettings('cursor-size')

if success then
  config.xcursor_size = tonumber(stdout)
end

if config.enable_wayland and os.getenv("WAYLAND_DISPLAY") then
  success, stdout = gsettings("text-scaling-factor")

  if success then
    config.font_size = (config.font_size or 13.0) * tonumber(stdout)
  end
end

return config
