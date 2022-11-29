# Aimbot Script

## New Version

This script is Has Been Updated By D_E_L_T_A. Check out the original creator version [here](https://github.com/Exunys).

Original Project: **https://github.com/Exunys/Aimbot-V2**

### About

Feel free to edit any of the global settings inside the script.
Editable settings :
- Aimbot Enabled / Disabled
- Aim Body Part
- Aim Speed

This script also has FOV customization, circle color, circle filled, circle thickness, circle radius (fov or size), circle position and how many sides does the circle have (set to 64 for a circle, anything below 3 won't work)

### Adjustable settings for both of the Scripts

```lua
--// Aimbot

Aimbot.Enabled   = true   -- Determines whether or not the Aimbot script will lock onto players.
Aimbot.TeamCheck = false  -- If set to true then the script would only lock your aim at enemy team members.
Aimbot.AimPart   = "Head" -- What body part of the closest enemy the aimbot script would lock at.
Aimbot.AimTime   = 0      -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.
```

### Settings (For the script with the FOV Circle)

```lua
--// FOV Circle

Aimbot.CircleColor = Color3.fromRGB(255, 255, 255) -- (RGB) Color that the FOV circle would appear as.
Aimbot.CircleTransparency = 0.7 -- Transparency of the circle.
Aimbot.CircleRadius = 80 -- The radius of the circle / FOV.
Aimbot.CircleFilled = false -- Determines whether or not the circle area will be filled.
Aimbot.CircleVisible = true -- Determines whether or not the circle will be visible.
Aimbot.CircleThickness = 0 -- The thickness of the circle.
```

## Script

Load the script by using the code below
```lua
local Aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hyperium-Byte/Aimbot-Script-Forked/main/Aimbot%20Script.lua"))()
```
