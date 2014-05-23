theme = {}

theme.font          = "profont 8"
--theme.taglist_font          = "taglisticons 8"


theme.fg_widget_text = "#a0a0a0"
theme.fg_line = "#78b270"

theme.bg_normal = "#21222f"
theme.bg_focus  = "#285577"
theme.bg_urgent = "#e80000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal = "#a0a0a0"
theme.fg_focus  = "#ffffff"
theme.fg_urgent = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = 1
theme.border_normal = "#0a0a0a"
theme.border_focus  = "#404040"
theme.border_marked = "#e80000"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#404040"
theme.titlebar_bg_normal = "#0a0a0a"
-- }}}

-- Display the taglist squares
theme.taglist_squares_sel   = "~/.config/awesome/themes/archie/taglist/squarefw.png"
theme.taglist_squares_unsel = "~/.config/awesome/themes/archie/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "~/.config/awesome/themes/archie/submenu.png"
theme.menu_height = "12"
theme.menu_width  = "100"
theme.menu_fg_focus = "#dddddd"
theme.menu_bg_focus = "#3d3d3d"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "~/.config/awesome/themes/archie/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "~/.config/awesome/themes/archie/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "~/.config/awesome/themes/archie/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "~/.config/awesome/themes/archie/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "~/.config/awesome/themes/archie/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "~/.config/awesome/themes/archie/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/themes/archie/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "~/.config/awesome/themes/archie/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/themes/archie/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "~/.config/awesome/themes/archie/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "~/.config/awesome/themes/archie/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "~/.config/awesome/themes/archie/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "~/.config/awesome/themes/archie/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "~/.config/awesome/themes/archie/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/themes/archie/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/themes/archie/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/themes/archie/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "~/.config/awesome/themes/archie/titlebar/maximized_focus_active.png"

theme.wallpaper = "~/.config/awesome/themes/archie/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = "~/.config/awesome/themes/archie/layouts/fairh.png"
theme.layout_fairv = "~/.config/awesome/themes/archie/layouts/fairv.png"
theme.layout_floating  = "~/.config/awesome/themes/archie/layouts/floating.png"
theme.layout_magnifier = "~/.config/awesome/themes/archie/layouts/magnifier.png"
theme.layout_max = "~/.config/awesome/themes/archie/layouts/max.png"
theme.layout_fullscreen = "~/.config/awesome/themes/archie/layouts/fullscreen.png"
theme.layout_tilebottom = "~/.config/awesome/themes/archie/layouts/tilebottom.png"
theme.layout_tileleft   = "~/.config/awesome/themes/archie/layouts/tileleft.png"
theme.layout_tile = "~/.config/awesome/themes/archie/layouts/tile.png"
theme.layout_tiletop = "~/.config/awesome/themes/archie/layouts/tiletop.png"
theme.layout_spiral  = "~/.config/awesome/themes/archie/layouts/spiral.png"
theme.layout_dwindle = "~/.config/awesome/themes/archie/layouts/dwindle.png"

-- {{{ Misc
theme.volume_icon = "~/.config/awesome/themes/archie/icons/spkr_01.png"
theme.volume2_icon = "~/.config/awesome/themes/archie/icons/spkr_02.png"
theme.bat_icon_0 = "~/.config/awesome/themes/archie/icons/bat_0.png"
theme.bat_icon_10 ="~/.config/awesome/themes/archie/icons/bat_10.png"
theme.bat_icon_30 ="~/.config/awesome/themes/archie/icons/bat_30.png"
theme.bat_icon_50 ="~/.config/awesome/themes/archie/icons/bat_50.png"
theme.bat_icon_80 ="~/.config/awesome/themes/archie/icons/bat_80.png"
theme.bat_icon_100 ="~/.config/awesome/themes/archie/icons/bat_100.png"
theme.cpu_icon ="~/.config/awesome/themes/archie/icons/cpu.png"
theme.ram_icon ="~/.config/awesome/themes/archie/icons/ram.png"
theme.netup_icon ="~/.config/awesome/themes/archie/icons/net_up.png"
theme.netdown_icon ="~/.config/awesome/themes/archie/icons/net_down.png"
-- WIFI SUPERMAN
theme.wifi_icon_0 ="~/.config/awesome/themes/archie/icons/superman_0.png"
theme.wifi_icon_25 ="~/.config/awesome/themes/archie/icons/superman_25.png"
theme.wifi_icon_50 ="~/.config/awesome/themes/archie/icons/superman_50.png"
theme.wifi_icon_75 ="~/.config/awesome/themes/archie/icons/superman_75.png"
theme.wifi_icon_100 ="~/.config/awesome/themes/archie/icons/superman_100.png"
-- WIFI ORIGINAL
--theme.wifi_icon_0 ="~/.config/awesome/themes/archie/icons/wifi_0.png"
--theme.wifi_icon_25 ="~/.config/awesome/themes/archie/icons/wifi_25.png"
--theme.wifi_icon_50 ="~/.config/awesome/themes/archie/icons/wifi_50.png"
--theme.wifi_icon_75 ="~/.config/awesome/themes/archie/icons/wifi_75.png"
--theme.wifi_icon_100 ="~/.config/awesome/themes/archie/icons/wifi_100.png"
theme.clock_icon ="~/.config/awesome/themes/archie/icons/clock.png"
theme.hdd_icon_1 ="~/.config/awesome/themes/archie/icons/hdd_01.png"
theme.hdd_icon_2 ="~/.config/awesome/themes/archie/icons/hdd_02.png"
-- }}}

theme.awesome_icon = "~/.config/awesome/themes/archie/arch.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
