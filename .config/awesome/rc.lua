local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local vicious = require("vicious")

----| Errors |--------------------------------------------------------------------------------------------------
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end

----| Theme |---------------------------------------------------------------------------------------------------
config_dir = ("~/.config/awesome/")
themes_dir = (config_dir .. "/themes")
beautiful.init(themes_dir .. "/archie/theme.lua")

----| Variables |-----------------------------------------------------------------------------------------------
terminal = "urxvt"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"
altkey = "Mod1"

----| Layouts |-------------------------------------------------------------------------------------------------
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}

----| Wallpaper |-----------------------------------------------------------------------------------------------
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end


----| Tags |----------------------------------------------------------------------------------------------------
tags = {}
--for s = 1, screen.count() do tags[s] = awful.tag({ "1:main", "2:web", "3:im", "4:file", "5:share", "6:code", "7:misc"}, s,
for s = 1, screen.count() do tags[s] = awful.tag({ "1", "2", "3", "4", "5", "6", "7"}, s,
{layouts[1], layouts[2], layouts[6], layouts[2], layouts[2], layouts[2], layouts[1]}) end

----| Menu |----------------------------------------------------------------------------------------------------
myawesomemenu = {
   { "wallpaper", "nitrogen"},
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

editorsmenu = {
   { "gedit", "gedit" },
   { "vim", "urxvt -e vim" }
}

graphicsmenu = {
   { "gimp", "gimp" },
   { "inkscape", "inkscape" },
   { "libreo draw", "libreoffice -draw" }
}

officemenu = {
   { "libreo base", "libreoffice -base" },
   { "libreo calc", "libreoffice -calc" },
   { "libreo draw", "libreoffice -draw" },
   { "libreo impress", "libreoffice -impress" },
   { "libreo math", "libreoffice -math" },
   { "libreo writer", "libreoffice -writer" }
}

programming = {
	{ "geany", "geany" }
}

soundmenu = {
   { "alsamixer", "urxvt -e alsamixer" },
   { "ncmpcpp", "urxvt -e ncmpcpp" }
}

networkmenu = {
   { "dwb", "dwb" },
   { "filezilla", "filezilla" },
   { "rtorrent", "urxvt -e rtorrent" },
   { "weechat", "urxvt -e weechat" },
   { "wicd", "wicd-gtk" }
}

systemmenu = {
   { "htop", "urxvt -e htop" },
   { "lxappearance", "lxappearance" },
   { "nitrogen", "nitrogen" },
   { "ranger", "urxvt -e ranger" },
   { "thunar", "thunar" },
   { "virtualbox","virtualbox"}
}

videomenu = {
   { "totem", "totem" },
   { "vlc", "qvlc"},
   { "xfburn", "xfburn" }
}

viewersmenu = {
   { "shotwell", "shotwell" }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu },
                                    { "editors", editorsmenu},
                                    { "graphics", graphicsmenu },
                                    { "network", networkmenu },
                                    { "office", officemenu },
                                    { "programming", programming },
                                    { "sound", soundmenu },
                                    { "system", systemmenu },
                                    { "video", videomenu },
                                    { "terminal", terminal }
                                  }
                        })
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

menubar.utils.terminal = terminal

----| Wibox |---------------------------------------------------------------------------------------------------
----| Cpu widget |----------------------------------------------------------------------------------------------
cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, "<span color='"..beautiful.fg_widget_text.."'> $2%  $3%  $4%  $5%</span>", 3)

cpuwidget:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("urxvt -e htop", true) end),
  awful.button({ }, 3, function () awful.util.spawn("urxvt -e top", true) end)
))

cpuicon = wibox.widget.imagebox(beautiful.cpu_icon)

cpuicon:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("urxvt -e htop", true) end),
  awful.button({ }, 3, function () awful.util.spawn("urxvt -e top", true) end)
))

----| Memory widget |-------------------------------------------------------------------------------------------
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, "<span color='"..beautiful.fg_widget_text.."'> $2 MB</span>", 21)

memwidget:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("urxvt -e htop", true) end),
  awful.button({ }, 3, function () awful.util.spawn("urxvt -e top", true) end)
))

memicon = wibox.widget.imagebox(beautiful.ram_icon)

memicon:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("urxvt -e htop", true) end),
  awful.button({ }, 3, function () awful.util.spawn("urxvt -e top", true) end)
))

----| Net widget |----------------------------------------------------------------------------------------------
netwidget = wibox.widget.textbox()
vicious.register(netwidget, vicious.widgets.net,"<span color='"..beautiful.fg_widget_text.."'> ${wlo1 down_kb} kB/s   ${wlo1 up_kb} kB/s </span>", 1)

downicon = wibox.widget.imagebox(beautiful.netdown_icon)
upicon = wibox.widget.imagebox(beautiful.netup_icon)

----| File system widget |--------------------------------------------------------------------------------------
fswidgetr = wibox.widget.textbox()
vicious.register(fswidgetr, vicious.widgets.fs, "<span color='"..beautiful.fg_widget_text.."'> ${/ avail_gb}GB</span>", 63)

fswidgeth = wibox.widget.textbox()
vicious.register(fswidgeth, vicious.widgets.fs, "<span color='"..beautiful.fg_widget_text.."'> ${/home avail_gb}GB</span>", 63)

fsicon_1 = wibox.widget.imagebox(beautiful.hdd_icon_1)
fsicon_2 = wibox.widget.imagebox(beautiful.hdd_icon_2)

----| Battery widget |------------------------------------------------------------------------------------------
baticon = wibox.widget.imagebox()
vicious.register(baticon, vicious.widgets.bat,
  function (widget, args)
    if args[2] > 89 then 
      baticon:set_image(beautiful.bat_icon_100)
    elseif args[2] > 59 then
      baticon:set_image(beautiful.bat_icon_80)
    elseif args[2] > 39 then
      baticon:set_image(beautiful.bat_icon_50)
    elseif args[2] > 19 then
      baticon:set_image(beautiful.bat_icon_30)
    elseif args[2] > 6 then
      baticon:set_image(beautiful.bat_icon_10)
    else
      baticon:set_image(beautiful.bat_icon_0)
      end
  end, 131, "BAT0")

batwidget = wibox.widget.textbox()
vicious.register(batwidget, vicious.widgets.bat, "<span color='"..beautiful.fg_widget_text.."'> $2%</span>", 131, "BAT0")

----| Wireless widget |----------------------------------------------------------------------------------------
wificon = wibox.widget.imagebox()
vicious.register(wificon, vicious.widgets.wifi,
  function (widget, args)
    if args["{linp}"] > 85 then 
      wificon:set_image(beautiful.wifi_icon_100)
    elseif args["{linp}"] > 60 then
      wificon:set_image(beautiful.wifi_icon_75)
    elseif args["{linp}"] > 35 then
      wificon:set_image(beautiful.wifi_icon_50)
    elseif args["{linp}"] > 4 then
      wificon:set_image(beautiful.wifi_icon_25)
    else
      wificon:set_image(beautiful.wifi_icon_0)
      end
  end, 51, "wlo1")

wificon:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("wicd-gtk", true) end)
))

----| Volume widget |------------------------------------------------------------------------------------------
volwidget = wibox.widget.textbox()
vicious.register(volwidget, vicious.widgets.volume,"<span color='"..beautiful.fg_widget_text.."'> $1%</span>",3,"Master")

volwidget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn("amixer -q sset Master toggle", false) end),
    awful.button({ }, 3, function () awful.util.spawn("urxvt -e alsamixer", true) end),
    awful.button({ }, 4, function () awful.util.spawn("amixer sset Master playback 1%+", false) end),
    awful.button({ }, 5, function () awful.util.spawn("amixer sset Master playback 1%-", false) end)
))

volicon = wibox.widget.imagebox()

volicon:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn("amixer -q sset Master toggle", false) end),
    awful.button({ }, 3, function () awful.util.spawn("urxvt -e alsamixer", true) end),
    awful.button({ }, 4, function () awful.util.spawn("amixer sset Master playback 1%+", false) end),
    awful.button({ }, 5, function () awful.util.spawn("amixer sset Master playback 1%-", false) end)
))

vicious.register(volicon, vicious.widgets.volume,
  function (widget, args)
    if args[1] == 0 or args[2] == "♩" then
      volicon:set_image(beautiful.volume2_icon)
    else
      volicon:set_image(beautiful.volume_icon)
    end
  end,
  3, "Master")
  

----| Clock widget |--------------------------------------------------------------------------------------------
--mytextclock = awful.widget.textclock("<span color='"..beautiful.fg_widget_text.."'>%A, %d. %b, %H:%M</span>  ", 60)
mytextclock = awful.widget.textclock("<span color='"..beautiful.fg_widget_text.."'>%H:%M</span>  ", 60)
clockicon = wibox.widget.imagebox(beautiful.clock_icon)

----| Separator widgets |---------------------------------------------------------------------------------------
space = wibox.widget.textbox(" ")
line = wibox.widget.textbox("<span color='"..beautiful.fg_line.."'> | </span>")


mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({
                                                      theme = { width = 250 }
                                                  })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do

    mypromptbox[s] = awful.widget.prompt()
    
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    mywibox[s] = awful.wibox({ position = "top", height = "12", screen = s })

    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mytaglist[s])
    left_layout:add(space)
    left_layout:add(space)
    left_layout:add(space)
    left_layout:add(space)
    left_layout:add(mylayoutbox[s])
    left_layout:add(space)
    left_layout:add(space)
    left_layout:add(space)
    left_layout:add(volicon)
    left_layout:add(volwidget)
    left_layout:add(space)
    left_layout:add(mypromptbox[s])

    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    left_layout:add(space)
    right_layout:add(cpuicon)
    right_layout:add(cpuwidget)
    right_layout:add(space)
    right_layout:add(space)
    right_layout:add(memicon)
    right_layout:add(memwidget)
    right_layout:add(space)
    right_layout:add(downicon)
    right_layout:add(netwidget)
    right_layout:add(upicon)
    right_layout:add(space)
    --right_layout:add(line)
    right_layout:add(fsicon_1)
    right_layout:add(fswidgetr)
    right_layout:add(space)
    right_layout:add(fsicon_2)
    right_layout:add(fswidgeth)
    right_layout:add(space)
    right_layout:add(baticon)
    right_layout:add(space)
    right_layout:add(wificon)
    right_layout:add(space)
    right_layout:add(mytextclock)

    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    --layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),
	
	awful.key({ modkey,           }, "d", function() awful.util.spawn("dwb") end),
    awful.key({ modkey,           }, "c", function() awful.util.spawn("firefox") end),
    awful.key({ modkey, "Shift"   }, "y", function() awful.util.spawn("urxvt -e ytube-dl") end),
    awful.key({ modkey,           }, "b", function() awful.util.spawn("urxvt -e tmux new-session -s rtorrent rtorrent") end),
    awful.key({ modkey,           }, "f", function() awful.util.spawn("urxvt -e ranger") end),
    awful.key({ modkey,           }, "v", function() awful.util.spawn("urxvt -e vim") end),
    awful.key({ modkey,           }, "i", function() awful.util.spawn("urxvt -e weechat-curses") end),
    awful.key({ modkey, "Shift"   }, "n", function() awful.util.spawn("urxvt -e ncmpcpp") end),
    awful.key({ modkey,           }, "g", function() awful.util.spawn("geany") end),
    awful.key({ modkey, "Shift"   }, "x", function() awful.util.spawn("xflock4") end),
    awful.key({ modkey, "Shift"   }, "s", function() awful.util.spawn("xfce4-screenshooter") end),
    awful.key({ modkey,           }, "Up", function() awful.util.spawn("amixer sset Master playback 1%+", false) end),
    awful.key({ modkey,           }, "Down", function() awful.util.spawn("amixer sset Master playback 1%-", false) end),
    awful.key({ modkey, "Shift"   }, "Down", function() awful.util.spawn("amixer -q sset Master toggle", false) end),
    awful.key({ modkey,           }, "s", function() awful.util.spawn("/home/nu/.config/awesome/terminals.sh") end),
    awful.key({ modkey,           }, "t", function() awful.util.spawn("/home/nu/.config/awesome/tmux.sh") end),
    awful.key({ modkey,           }, "y", function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({
														theme = { width = 250 }
                                                  })
                                              end
                                          end),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey, "Shift"   }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

----| Rules |---------------------------------------------------------------------------------------------------
awful.rules.rules = {
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     size_hints_honor = false } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "geany" },
      properties = { floating = false } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
      { rule = { class    = "Gimp" },									properties = { tag = tags[1][7], switchtotag = false } },
      { rule = { class    = "URxvt", name = "ranger" },					properties = { tag = tags[1][4], switchtotag = false } },
      { rule = { class    = "Dwb"},							properties = { tag = tags[1][2], switchtotag = true } },
      { rule = { class    = "Chromium"},							properties = { tag = tags[1][2], switchtotag = true } },
      { rule = { class    = "Firefox"},							properties = { tag = tags[1][2], switchtotag = true } },
      { rule = { class    = "URxvt", name = "rtorrent" },				properties = { tag = tags[1][5], switchtotag = false } },
}

----| Signals |-------------------------------------------------------------------------------------------------
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

----| Autostart |-----------------------------------------------------------------------------------------------
awful.util.spawn_with_shell("/home/nu/./.autostart.sh")
awful.util.spawn_with_shell("run_once xfce4-volumed")
awful.util.spawn_with_shell("run_once xcompmgr")
awful.util.spawn_with_shell("run_once xfce4-power-manager")
awful.util.spawn_with_shell("run_once gnome-screensaver")

