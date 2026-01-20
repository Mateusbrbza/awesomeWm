local settings = {}

---------- Theme ----------
settings.themes = {
    "PowerArrow_Matcha", -- 1
    "PowerArrow_CalmRed", -- 2
    "PowerArrow_Catppuccin" -- 3
}

settings.chosen_theme = settings.themes[3] -- replace number inside of [] with a theme number from the list above

settings.enableTitlebar = false -- Set to true if you wish to have title bars on top of applications (i.e to have buttons: close, minimise, etc )

settings.gapsize = 5 -- set your gap size here

settings.focusOnHover = false -- set to false if you don't want the window to focused on mouse hover

---------- Startup Programs ----------
-- Required package: nitrogen
settings.useNitrogen = true

-- Required Package: picom
settings.usePicom = true

-- Requires network manager
settings.useNMApplet = true

-- Required Package: lxpolkit
settings.useLxPolkit = true

-- Required Package: flameshot
settings.useFlameShot = true

-- Required Package: blueman
settings.useBlueman = true

---------- Get your local weather ID from https://openweathermap.org/ ----------
settings.weatherID = 3463237 -- Set this to your own weather ID

return settings
