

<p align="center" href="https://discord.gg/jaunk8nhN5">
  <img src="https://media.discordapp.net/attachments/929706675022233640/933723518321967144/banner.jpg"/>
</p>

# Mercury

Mercury is a free and open sourced Roblox UI library.

- https://discord.gg/jaunk8nhN5
- https://discord.com/users/480805591221010456
- https://discord.com/users/452466034822217739

## Loadstring
```lua
-- Last Update: 1/19
loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
```

## Features:
- Customizable (Themes)
- Browser-Like navigation
- Buttons
- Sliders
- Dropdowns
- Inputs
- Color Picker

... more to be added.

Created by [Deity#0228] and [Abstract#8007]

## Documentation

### Get the Library
```lua
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
```

### Create the GUI
```lua
local GUI = Mercury:Create{
    Name = "Mercury",
    Size = UDim2.fromOffset(600, 400),
    Theme = self.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}
```

### Tabs
```lua
local Tab = GUI:Tab{
	Name = "New Tab",
	Icon = "rbxassetid://8569322835"
}
```

### Buttons
```lua
Tab:Button{
	Name = "Button",
	Description = nil,
	Callback = function() end
}
```

### Toggles
```lua
Tab:Toggle{
	Name = "Toggle",
	StartingState = false,
	Description = nil,
	Callback = function(state) end
}
```

### Dropdowns
```lua
Tab:Dropdown{
	Name = "Dropdown",
	StartingText = "Select...",
	Description = nil,
	Items = {},
	Callback = function(item) return end
}
```

### Sliders
```lua
Tab:Slider{
	Name = "Slider",
	Default = 50,
	Min = 0,
	Max = 100,
	Callback = function() end
}
```

### Keybinds
```lua
Tab:Keybind{
	Name = "Keybind",
	Keybind = nil,
	Description = nil
}
```

### Prompt
```lua
GUI:Prompt{
	Followup = false,
	Title = "Prompt",
	Text = "Prompts are cool",
	Buttons = {
		ok = function()
			return true
		end
		no = function()
			return false
		end
	}
}
```

### Color Picker
```lua
GUI:ColorPicker{
	Style = Library.ColorPickerStyles.Simple,
	Callback = function(color) end
}
```


**PLEASE NOTE THAT THE LOWER- AND UPPERCASE LETTERS DON'T MATTER WHEN CALLING LIBRARY FUNCTIONS.**
