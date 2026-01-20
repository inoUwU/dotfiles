local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.automatically_reload_config = true
config.font_size = 12.0
config.line_height = 1.2
config.use_ime = true
config.color_scheme = "zenwritten_dark"
config.cursor_thickness = "2pt"
config.status_update_interval = 1000
config.scrollback_lines = 3500
config.animation_fps = 144
config.window_background_opacity = 0.80
config.hide_tab_bar_if_only_one_tab = true

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"

	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end

	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
	}
end)

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "nu.exe" }
	config.font = wezterm.font("HackGen Console NF", { weight = "Regular", stretch = "Normal", style = "Normal" })
end
if wezterm.target_triple == "x86_64-apple-darwin" then
	config.default_prog = { "zsh" }
	config.macos_window_background_blur = 20
end

return config
