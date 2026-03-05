--[[
    Catppuccin Mocha — flat pill bar, no powerline arrows.
    Based on PowerArrow_Catppuccin widgets with the full Mocha palette applied.
    CPU temperature removed (non-functional).
    Volume via PipeWire/wpctl.
--]]

local gears    = require("gears")
local lain     = require("lain")
local awful    = require("awful")
local wibox    = require("wibox")
local settings = require("../settings")

local math, os = math, os
local my_table = awful.util.table or gears.table

-- ─────────────────────────────────────────────────────────────────
-- Theme base
-- ─────────────────────────────────────────────────────────────────
local theme     = {}
theme.dir       = os.getenv("HOME") .. "/.config/awesome/themes/Catppuccin"
theme.wallpaper = theme.dir .. "/wallpaper.png"
theme.font      = "JetBrainsMono Nerd Font 16"
theme.taglist_font = "JetBrainsMono Nerd Font 14"

-- ─────────────────────────────────────────────────────────────────
-- Catppuccin Mocha — full palette
-- ─────────────────────────────────────────────────────────────────
local base      = "#1e1e2e"
local mantle    = "#181825"
local crust     = "#11111b"
local surface0  = "#313244"
local surface1  = "#45475a"
local surface2  = "#585b70"
local overlay0  = "#6c7086"
local overlay1  = "#7f849c"
-- local overlay2  = "#9399b2"
local text      = "#cdd6f4"
local subtext1  = "#bac2de"
-- local subtext0  = "#a6adc8"
local lavender  = "#b4befe"
local blue      = "#89b4fa"
local sapphire  = "#74c7ec"
local sky       = "#89dceb"
local teal      = "#94e2d5"
local green     = "#a6e3a1"
local yellow    = "#f9e2af"
local peach     = "#fab387"
local maroon    = "#eba0ac"
local red       = "#f38ba8"
local mauve     = "#cba6f7"
local pink      = "#f5c2e7"
-- local flamingo  = "#f2cdcd"
-- local rosewater = "#f5e0dc"

-- ─────────────────────────────────────────────────────────────────
-- Beautiful properties
-- ─────────────────────────────────────────────────────────────────
theme.fg_normal  = text
theme.fg_focus   = base
theme.fg_urgent  = red
theme.bg_normal  = base
theme.bg_focus   = blue
theme.bg_urgent  = red

-- Taglist
theme.taglist_fg_focus    = base
theme.taglist_bg_focus    = blue
theme.taglist_fg_occupied = blue
theme.taglist_bg_occupied = surface0
theme.taglist_fg_empty    = overlay0
theme.taglist_bg_empty    = base
theme.taglist_fg_urgent   = red
theme.taglist_bg_urgent   = base

-- Tasklist
theme.tasklist_bg_focus        = surface1
theme.tasklist_fg_focus        = blue
theme.tasklist_bg_normal       = surface0
theme.tasklist_fg_normal       = subtext1
theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon    = false

-- Borders
theme.border_width  = 2
theme.border_normal = surface0
theme.border_focus  = blue
theme.border_marked = mauve

-- Titlebar
theme.titlebar_bg_focus  = surface0
theme.titlebar_bg_normal = base
theme.titlebar_fg_focus  = blue

-- Menu
theme.menu_height       = 24
theme.menu_width        = 150
theme.menu_fg_normal    = text
theme.menu_fg_focus     = base
theme.menu_bg_normal    = mantle
theme.menu_bg_focus     = blue
theme.menu_submenu_icon = theme.dir .. "/icons/submenu.png"
theme.awesome_icon      = theme.dir .. "/icons/awesome.png"

-- Taglist squares
theme.taglist_squares_sel   = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel = theme.dir .. "/icons/square_unsel.png"

-- Layouts
theme.layout_tile       = theme.dir .. "/icons/tile.png"
theme.layout_tileleft   = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop    = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv      = theme.dir .. "/icons/fairv.png"
theme.layout_fairh      = theme.dir .. "/icons/fairh.png"
theme.layout_spiral     = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle    = theme.dir .. "/icons/dwindle.png"
theme.layout_max        = theme.dir .. "/icons/max.png"
theme.layout_fullscreen = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier  = theme.dir .. "/icons/magnifier.png"
theme.layout_floating   = theme.dir .. "/icons/floating.png"

-- Widget icons
theme.widget_ac           = theme.dir .. "/icons/ac.png"
theme.widget_battery      = theme.dir .. "/icons/battery.png"
theme.widget_battery_low  = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty= theme.dir .. "/icons/battery_empty.png"
theme.widget_mem          = theme.dir .. "/icons/mem.png"
theme.widget_cpu          = theme.dir .. "/icons/cpu.png"
theme.widget_net          = theme.dir .. "/icons/net.png"
theme.widget_hdd          = theme.dir .. "/icons/hdd.png"
theme.widget_music        = theme.dir .. "/icons/note.png"
theme.widget_music_on     = theme.dir .. "/icons/note.png"
theme.widget_music_pause  = theme.dir .. "/icons/pause.png"
theme.widget_music_stop   = theme.dir .. "/icons/stop.png"
theme.widget_vol          = theme.dir .. "/icons/vol.png"
theme.widget_vol_low      = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no       = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute     = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail         = theme.dir .. "/icons/mail.png"
theme.widget_mail_on      = theme.dir .. "/icons/mail_on.png"
theme.widget_task         = theme.dir .. "/icons/task.png"
theme.widget_scissors     = theme.dir .. "/icons/scissors.png"
theme.widget_weather      = theme.dir .. "/icons/dish.png"

-- Titlebar icons
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

theme.useless_gap = settings.gapsize

-- ─────────────────────────────────────────────────────────────────
-- Helpers
-- ─────────────────────────────────────────────────────────────────
local markup = lain.util.markup

-- Wrap a widget in a flat colored block, no rounding, no gaps between blocks
local function segment(widget, bg_color, left_pad, right_pad)
    left_pad  = left_pad  or 6
    right_pad = right_pad or 6
    return wibox.widget {
        wibox.container.margin(widget, left_pad, right_pad, 0, 0),
        bg     = bg_color,
        widget = wibox.container.background,
    }
end

-- ─────────────────────────────────────────────────────────────────
-- Clock & Calendar
-- ─────────────────────────────────────────────────────────────────
local clock = awful.widget.watch(
    "date +'%a %d %b %R'", 60,
    function(widget, stdout)
        widget:set_markup(markup.fontfg(theme.font, lavender, " " .. stdout:gsub("%s+$", "") .. " "))
    end
)

theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "JetBrainsMono Nerd Font Bold 12",
        fg   = text,
        bg   = mantle,
    }
})

-- ─────────────────────────────────────────────────────────────────
-- MPD
-- ─────────────────────────────────────────────────────────────────
local mpdicon = wibox.widget.imagebox(theme.widget_music)
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            mpdicon:set_image(theme.widget_music_on)
            widget:set_markup(markup.fontfg(theme.font, green,
                " " .. mpd_now.artist .. " — " .. mpd_now.title .. " "))
        elseif mpd_now.state == "pause" then
            mpdicon:set_image(theme.widget_music_pause)
            widget:set_markup(markup.fontfg(theme.font, overlay1, " mpd paused "))
        else
            mpdicon:set_image(theme.widget_music)
            widget:set_text("")
        end
    end
})

-- ─────────────────────────────────────────────────────────────────
-- Memory
-- ─────────────────────────────────────────────────────────────────
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, sky, " " .. mem_now.used .. "MB "))
    end
})

-- ─────────────────────────────────────────────────────────────────
-- CPU
-- ─────────────────────────────────────────────────────────────────
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        local pct   = tonumber(cpu_now.usage) or 0
        local color = pct >= 80 and red or (pct >= 50 and peach or sapphire)
        widget:set_markup(markup.fontfg(theme.font, color, " " .. cpu_now.usage .. "% "))
    end
})

-- ─────────────────────────────────────────────────────────────────
-- Weather
-- ─────────────────────────────────────────────────────────────────
local weathericon = wibox.widget.imagebox(theme.widget_weather)
theme.weather = lain.widget.weather({
    city_id = settings.weatherID,
    notification_preset = { font = "JetBrainsMono Nerd Font 13", fg = text, bg = mantle },
    weather_na_markup = markup.fontfg(theme.font, overlay0, "N/A "),
    settings = function()
        local descr = weather_now["weather"][1]["description"]:lower()
        local units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, yellow, descr .. " @ " .. units .. "°C "))
    end
})

-- ─────────────────────────────────────────────────────────────────
-- Volume  (PipeWire via wpctl)
-- ─────────────────────────────────────────────────────────────────
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = { widget = wibox.widget.textbox() }

local function vol_update()
    awful.spawn.easy_async("wpctl get-volume @DEFAULT_AUDIO_SINK@", function(stdout)
        local raw   = stdout:match("Volume: ([%d%.]+)") or "0"
        local muted = stdout:find("%[MUTED%]") ~= nil
        local pct   = math.floor(tonumber(raw) * 100)

        if muted or pct == 0 then
            volicon:set_image(theme.widget_vol_mute)
        elseif pct <= 33 then
            volicon:set_image(theme.widget_vol_no)
        elseif pct <= 66 then
            volicon:set_image(theme.widget_vol_low)
        else
            volicon:set_image(theme.widget_vol)
        end

        local color = muted and maroon or teal
        theme.volume.widget:set_markup(markup.fontfg(theme.font, color, " " .. pct .. "% "))
    end)
end

vol_update()
gears.timer { timeout = 5, autostart = true, call_now = false, callback = vol_update }

theme.volume.widget:buttons(my_table.join(
    awful.button({}, 4, function() awful.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+", false) vol_update() end),
    awful.button({}, 5, function() awful.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-", false) vol_update() end),
    awful.button({}, 3, function() awful.spawn("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle", false) vol_update() end)
))

-- ─────────────────────────────────────────────────────────────────
-- Net
-- ─────────────────────────────────────────────────────────────────
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, green,
            " " .. net_now.received .. " ↓↑ " .. net_now.sent .. " "))
    end
})

-- ─────────────────────────────────────────────────────────────────
-- Screen connect
-- ─────────────────────────────────────────────────────────────────
function theme.at_screen_connect(s)
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then wallpaper = wallpaper(s) end
    gears.wallpaper.maximized(wallpaper, s, false)

    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    s.mypromptbox = awful.widget.prompt()

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
        awful.button({}, 1, function() awful.layout.inc( 1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc( 1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)
    ))

    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    s.mywibox = awful.wibar({ position = "top", screen = s, height = 32, bg = crust, fg = text })

    -- Each widget group is wrapped in a rounded colored segment.
    -- Colors rotate through the Catppuccin palette to give each block its own identity.
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left
            layout  = wibox.layout.fixed.horizontal,
            spacing = 2,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist,
        { -- Right — blocks sit flush, alternating surface1/surface0 backgrounds
            layout = wibox.layout.fixed.horizontal,
            -- Systray: background must match the bar itself so icon backgrounds don't clash
            wibox.container.background(wibox.container.margin(wibox.widget.systray(), 6, 6, 4, 4), crust),
            segment(wibox.widget { memicon,     mem.widget,              layout = wibox.layout.fixed.horizontal }, surface0),
            segment(wibox.widget { cpuicon,     cpu.widget,              layout = wibox.layout.fixed.horizontal }, surface1),
            segment(wibox.widget { weathericon, theme.weather.widget,    layout = wibox.layout.fixed.horizontal }, surface0),
            segment(wibox.widget { volicon,     theme.volume.widget,     layout = wibox.layout.fixed.horizontal }, surface1),
            segment(wibox.widget { neticon,     net.widget,              layout = wibox.layout.fixed.horizontal }, surface0),
            segment(clock, surface1, 8, 8),
            -- Layoutbox: forced to 24×24 so the layout icon renders at a readable size
            wibox.container.background(
                wibox.container.margin(
                    wibox.container.constraint(s.mylayoutbox, "exact", 24, 24),
                    6, 6, 4, 4
                ),
                surface0
            ),
        },
    }
end

return theme
