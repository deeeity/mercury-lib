--[[

  __  __                                
 |  \/  |                               
 | \  / | ___ _ __ ___ _   _ _ __ _   _ 
 | |\/| |/ _ \ '__/ __| | | | '__| | | |
 | |  | |  __/ | | (__| |_| | |  | |_| |
 |_|  |_|\___|_|  \___|\__,_|_|   \__, |
                                   __/ |
                                  |___/ 

edited: 1/15
developers:
v3rm AbstractPoo	discord Abstract#8007
v3rm 0xDEITY		discord Deity#0228

]]

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Library = {
	Themes = {
		Dark = {
			Main = Color3.fromHSV(262/360, 60/255, 34/255),
			Secondary = Color3.fromHSV(240/360, 40/255, 63/255),
			Tertiary = Color3.fromHSV(260/360, 60/255, 148/255),

			StrongText = Color3.fromHSV(0, 0, 1),		
			WeakText = Color3.fromHSV(0, 0, 172/255)
		},
		Serika = {
			Main = Color3.fromRGB(50, 52, 55),
			Secondary = Color3.fromRGB(80, 82, 85),
			Tertiary = Color3.fromRGB(226, 183, 20),

			StrongText = Color3.fromHSV(0, 0, 1),		
			WeakText = Color3.fromHSV(0, 0, 172/255)
		},
		Ocean = {
			Main = Color3.fromRGB(35, 40, 40),
			Secondary = Color3.fromRGB(60, 65, 65),
			Tertiary = Color3.fromRGB(85, 150, 145),
			
			StrongText = Color3.fromHSV(0, 0, 1),		
			WeakText = Color3.fromHSV(0, 0, 172/255)
		},
		Cyan = {
			Main = Color3.fromRGB(30, 30, 35),
			Secondary = Color3.fromRGB(50, 50, 55),
			Tertiary = Color3.fromRGB(70, 130, 180),
			
			StrongText = Color3.fromHSV(0, 0, 1),		
			WeakText = Color3.fromHSV(0, 0, 172/255)
		}
	},
	Theme = nil

}
Library.__index = Library

local selectedTab

function Library:set_defaults(defaults: table, options: table)
	defaults = defaults or {}
	options = options or {}
	for option, value in next, options do
		defaults[option] = value
	end
	return defaults
end

function Library:object(class: string, properties: table)
	local localObject = Instance.new(class)

	local forcedProps = {
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Font = Enum.Font.SourceSans,
		Text = ""
	}

	for property, value in next, forcedProps do
		pcall(function()
			localObject[property] = value
		end)
	end

	local customHandlers = {
		Centered = function(value)
			if value then
				localObject.AnchorPoint = Vector2.new(0.5, 0.5)
				localObject.Position = UDim2.fromScale(0.5, 0.5)
			end	
		end
	}

	for property, value in next, properties do
		if customHandlers[property] then
			customHandlers[property](value)
		else
			localObject[property] = value
		end
	end

	local methods = {}

	methods.AbsoluteObject = localObject

	function methods:tween(options: table)
		local options = Library:set_defaults({
			Length = 0.2,
			Style = Enum.EasingStyle.Linear,
			Direction = Enum.EasingDirection.InOut
		}, options)

		local ti = TweenInfo.new(options.Length, options.Style, options.Direction)
		options.Direction = nil
		options.Style = nil 
		options.Length = nil

		TweenService:Create(localObject, ti, options):Play()
	end

	function methods:round(radius: number)
		radius = radius or 6
		Library:object("UICorner", {
			Parent = localObject,
			CornerRadius = UDim.new(0, radius)
		})
		return methods
	end

	function methods:object(class: string, properties: table)
		local properties = properties or {}
		properties.Parent = localObject
		return Library:object(class, properties)
	end

	function methods:stroke(color: Color3, thickness: number, strokeMode: Enum.ApplyStrokeMode)
		thickness = thickness or 1
		strokeMode = strokeMode or Enum.ApplyStrokeMode.Border
		self:object("UIStroke", {
			ApplyStrokeMode = strokeMode,
			Color = color,
			Thickness = thickness
		})
		return methods
	end

	return setmetatable(methods, {
		__index = function(_, property)
			return localObject[property]
		end,
		__newindex = function(_, property, value)
			localObject[property] = value
		end,
	})
end

function Library:darken(color: Color3, f: number)
	local h, s, v = Color3.toHSV(color)
	f = 1 - ((f or 15) / 80)
	return Color3.fromHSV(h, math.clamp(s/f, 0, 1), math.clamp(v*f, 0, 1))
end

function Library:lighten(color: Color3, f: number)
	local h, s, v = Color3.toHSV(color)
	f = 1 - ((f or 15) / 80)
	return Color3.fromHSV(h, math.clamp(s*f, 0, 1), math.clamp(v/f, 0, 1))
end

--[[ old lighten/darken functions, may revert if contrast gets fucked up

	function Library:darken(color: Color3, f: number)
		local h, s, v = Color3.toHSV(color)
		f = f or 15
		return Color3.fromHSV(h, s, math.clamp(v - (f/255), 0, 1))
	end

	function Library:lighten(color: Color3, f: number)
		local h, s, v = Color3.toHSV(color)
		f = f or 15
		return Color3.fromHSV(h, s, math.clamp(v + (f/255), 0, 1))
	end
	
]]

function Library:set_status(txt)
	self.statusText.Text = "Status | " .. txt
end

function Library:set_button_functions(button: Instance, default: Color3, hover: Color3, down: Color3)

end

function Library:create(options: table)
	options = self:set_defaults({
		Name = "Mercury",
		Size = UDim2.fromOffset(600, 400),
		Theme = self.Themes.Dark,
		Link = "https://github.com/repos"
	}, options)

	local gui = self:object("ScreenGui", {
		Parent = (RunService:IsStudio() and LocalPlayer.PlayerGui) or game:GetService("CoreGui"),
		ZIndexBehavior = Enum.ZIndexBehavior.Global
	})

	local core = gui:object("Frame", {
		Size = options.Size,
		BackgroundColor3 = options.Theme.Main,
		Centered = true
	}):round(10)

	local tabButtons = core:object("ScrollingFrame", {
		Size = UDim2.new(1, -40, 0, 25),
		Position = UDim2.fromOffset(5, 5),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ScrollBarThickness = 0,
		ScrollingDirection = Enum.ScrollingDirection.X,
		AutomaticCanvasSize = Enum.AutomaticSize.X
	})

	tabButtons:object("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 4)
	})

	local closeButton = core:object("ImageButton", {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(14, 14),
		Position = UDim2.new(1, -11, 0, 11),
		ImageColor3 = options.Theme.StrongText,
		Image = "http://www.roblox.com/asset/?id=8497487650",
		AnchorPoint = Vector2.new(1)
	})

	local urlBar = core:object("Frame", {
		Size = UDim2.new(1, -10, 0, 25),
		Position = UDim2.new(0, 5,0, 35),
		BackgroundColor3 = options.Theme.Secondary
	}):round(5)

	local searchIcon = urlBar:object("ImageLabel", {
		AnchorPoint = Vector2.new(0, .5),
		Position = UDim2.new(0, 5,0.5, 0);
		BackgroundTransparency = 1,
		ImageColor3 = options.Theme.Tertiary,
		Size = UDim2.fromOffset(16, 16),
		Image = "http://www.roblox.com/asset/?id=8497489946"
	})

	local link = urlBar:object("TextLabel", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 26, 0.5, 0),
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -30, .6, 0),
		Text = options.Link,
		TextColor3 = options.Theme.WeakText,
		TextSize = 14,
		TextScaled = false,
		TextXAlignment = Enum.TextXAlignment.Left
	})

	local shadowHolder = core:object("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = 0
	})

	local shadow = shadowHolder:object("ImageLabel", {
		BackgroundTransparency = 1,
		Centered = true,
		ZIndex = 0,
		ImageTransparency = 0.7,
		Size = UDim2.new(1, 47, 1, 47),
		ImageColor3 = Color3.fromRGB(0, 0, 0),
		SliceCenter = Rect.new(49, 49, 450, 450),
		Image = "rbxassetid://6014261993"
	})

	local content = core:object("Frame", {
		BackgroundColor3 = self:darken(options.Theme.Secondary, 10),
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 1, -20),
		Size = UDim2.new(1, -10, 1, -86)
	}):round(7) -- Sept

	local status = core:object("TextLabel", {
		AnchorPoint = Vector2.new(0, 1),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 5, 1, -6),
		Size = UDim2.new(0.2, 0, 0, 10),
		Font = Enum.Font.SourceSans,
		Text = "Status | Idle",
		TextColor3 = options.Theme.Tertiary,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left
	})

	local homeButton = tabButtons:object("TextButton", {
		Name = "hehehe siuuuuuuuuu",
		BackgroundTransparency = 0, -- yeah?
		BackgroundColor3 = options.Theme.Secondary,
		Size = UDim2.new(0, 125, 0, 25)
	}):round(5)

	local homeButtonText = homeButton:object("TextLabel", {
		TextColor3 = options.Theme.StrongText,
		AnchorPoint = Vector2.new(0, .5),
		BackgroundTransparency = 1,
		TextSize = 14,
		Text = "Mercury",
		Position = UDim2.new(0, 25, 0.5, 0),
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, -45, 0.5, 0),
		Font = Enum.Font.SourceSans
	})

	local homeButtonIcon = homeButton:object("ImageLabel", {
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 5, 0.5, 0),
		Size = UDim2.new(0, 15, 0, 15),
		Image = "http://www.roblox.com/asset/?id=8497544895",
		ImageColor3 = options.Theme.StrongText
	})

	local homePage = content:object("Frame", {
		Size = UDim2.fromScale(1, 1),
		Centered = true,
		BackgroundTransparency = 1
	})

	local tabs = {}
	
	-- size handling lol 
--[[ 	setmetatable(tabs, {
		__newindex = function(self, i, v)
			rawset(self, i, v)
			local absoluteSize = tabButtons.AbsoluteSize.X
			local newSize = #self + 1
			for _, t in next, self do
				local tab = t[2]
				tab.Size = UDim2.new(0, absoluteSize/newSize, 1, 0)
			end
		end
	}) ]]
	selectedTab = homeButton

	tabs[#tabs+1] = {homePage, homeButton}

	do
		local down = false
		local hovered = false

		homeButton.MouseEnter:connect(function()
			hovered = true
			homeButton:tween{BackgroundTransparency = ((selectedTab == homeButton) and 0.15) or 0.3}
		end)

		homeButton.MouseLeave:connect(function()
			hovered = false
			homeButton:tween{BackgroundTransparency = ((selectedTab == homeButton) and 0.15) or 1}
		end)

		homeButton.MouseButton1Down:connect(function()
			down = true
			homeButton:tween{BackgroundTransparency = 0}
		end)

		UserInputService.InputEnded:connect(function(key)
			if key.UserInputType == Enum.UserInputType.MouseButton1 then
				down = false
				homeButton:tween{BackgroundTransparency = ((selectedTab == homeButton) and 0.15) or (hovered and 0.3) or 1}
			end

		end)

		homeButton.MouseButton1Click:Connect(function()
			for _, tabInfo in next, tabs do
				local page = tabInfo[1]
				local button = tabInfo[2]
				page.Visible = false
			end
			selectedTab:tween{BackgroundTransparency = ((selectedTab == homeButton) and 0.15) or 1}
			selectedTab = homeButton
			homePage.Visible = true
			homeButton.BackgroundTransparency = 0
		end)
	end

	self.SelectedTabButton = homeButton

	local homePageLayout = homePage:object("UIListLayout", {
		Padding = UDim.new(0, 10),
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center
	})

	local homePagePadding = homePage:object("UIPadding", {
		PaddingTop = UDim.new(0, 10)
	})

	local profile = homePage:object("Frame", {
		AnchorPoint = Vector2.new(0, .5),
		BackgroundColor3 = options.Theme.Secondary,
		Size = UDim2.new(1, -20,0, 100)
	}):round(7)

	local profilePictureContainer = profile:object("ImageLabel", {
		Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100),
		BackgroundColor3 = self:lighten(options.Theme.Secondary, 10),
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 10, 0.5),
		Size = UDim2.fromOffset(80, 80)
	}):round(100)

    --[[
        os.date("%X")
    ]]

	local displayName; do
		local h, s, v = Color3.toHSV(options.Theme.Tertiary)
		--local c = Color3.fromHSV(h, math.clamp(s/3, 0, 1), math.clamp(v*2, 0, 1))
		-- was using #efe4ff but for themes sake am using the above
		local c = self:lighten(options.Theme.Tertiary, 55)

		local displayName = profile:object("TextLabel", {
			RichText = true,
			Text = "Welcome, <font color='rgb(" ..  math.floor(c.R*255) .. "," .. math.floor(c.G*255) .. "," .. math.floor(c.B*255) .. ")'> <b>" .. LocalPlayer.DisplayName .. "</b> </font>",
			TextScaled = true,
			Position = UDim2.new(0, 105,0, 10),
			TextColor3 = self:lighten(options.Theme.Tertiary, 30),
			Size = UDim2.new(0, 400,0, 40),
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	end

	local profileName = profile:object("TextLabel", {
		Text = "@" .. LocalPlayer.Name,
		TextScaled = true,
		Position = UDim2.new(0, 105,0, 47),
		TextColor3 = self:lighten(options.Theme.Tertiary, 10),
		Size = UDim2.new(0, 400,0, 20),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left
	})

	local timeDisplay = profile:object("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 105, 1, -10),
		Size = UDim2.new(0, 400,0, 20),
		AnchorPoint = Vector2.new(0, 1),
		TextColor3 = self:darken(options.Theme.WeakText, 20),
		TextScaled = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		Text = tostring(os.date("%X")):sub(1, os.date("%X"):len()-3)
	})

	do
		local desiredInterval = 1
		local counter = 0
		RunService.Heartbeat:Connect(function(step)
			counter += step  
			if counter >= desiredInterval then
				counter -= desiredInterval
				local date = tostring(os.date("%X"))
				timeDisplay.Text = date:sub(1, date:len()-3)
			end
		end)
	end

	local quickAccess = homePage:object("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -20, 0, 180)
	})

	quickAccess:object("UIGridLayout", {
		CellPadding = UDim2.fromOffset(10, 10),
		CellSize = UDim2.fromOffset(55, 55),
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center
	})

	quickAccess:object("UIPadding", {
		PaddingBottom = UDim.new(0, 10),
		PaddingLeft = UDim.new(0, 70),
		PaddingRight = UDim.new(0, 70),
		PaddingTop = UDim.new(0, 5)
	})

	return setmetatable({
		statusText = status,
		container = content,
		navigation = tabButtons,
		Theme = options.Theme,
		Tabs = tabs,
		quickAccess = quickAccess
	}, Library)
end

function Library:tab(options)
	options = self:set_defaults({
		Name = "New Tab",
		Icon = "rbxassetid://8497544895"

	}, options)

	local tab = self.container:object("ScrollingFrame", {
		AnchorPoint = Vector2.new(0, 1),
		Visible = false,
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0, 1),
		Size = UDim2.fromScale(1, 1),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 0,
		ScrollingDirection = Enum.ScrollingDirection.Y
	})

	local quickAccessButton = self.quickAccess:object("TextButton", {
		BackgroundColor3 = self.Theme.Secondary
	}):round(5)

	local quickAccessIcon = quickAccessButton:object("ImageLabel", {
		BackgroundTransparency = 1,
		ImageColor3 = self.Theme.StrongText,
		Image = options.Icon,
		Size = UDim2.fromScale(0.5, 0.5),
		Centered = true
	})

	tab:object("UIListLayout", {
		Padding = UDim.new(0, 10),
		HorizontalAlignment = Enum.HorizontalAlignment.Center
	})

	tab:object("UIPadding", {
		PaddingTop = UDim.new(0, 10)
	})

	local tabButton = self.navigation:object("TextButton", {
		BackgroundTransparency = 1,
		BackgroundColor3 = self.Theme.Secondary,
		Size = UDim2.new(0, 125, 0, 25)
	}):round(5)

	self.Tabs[#self.Tabs+1] = {tab, tabButton}

	do
		local down = false
		local hovered = false

		tabButton.MouseEnter:connect(function()
			hovered = true
			tabButton:tween{BackgroundTransparency = ((selectedTab == tabButton) and 0.15) or 0.3}
		end)

		tabButton.MouseLeave:connect(function()
			hovered = false
			tabButton:tween{BackgroundTransparency = ((selectedTab == tabButton) and 0.15) or 1}
		end)

		tabButton.MouseButton1Down:connect(function()
			down = true
			tabButton:tween{BackgroundTransparency = 0}
		end)

		UserInputService.InputEnded:connect(function(key)
			if key.UserInputType == Enum.UserInputType.MouseButton1 then
				down = false
				tabButton:tween{BackgroundTransparency = ((selectedTab == tabButton) and 0.15) or (hovered and 0.3) or 1}
			end

		end)

		tabButton.MouseButton1Click:Connect(function()
			for _, tabInfo in next, self.Tabs do
				local page = tabInfo[1]
				local button = tabInfo[2]
				page.Visible = false
			end
			selectedTab:tween{BackgroundTransparency = ((selectedTab == tabButton) and 0.15) or 1}
			selectedTab = tabButton
			tab.Visible = true
			tabButton.BackgroundTransparency = 0
		end)

		quickAccessButton.MouseEnter:connect(function()
			quickAccessButton:tween{BackgroundColor3 = self.Theme.Tertiary}
		end)

		quickAccessButton.MouseLeave:connect(function()
			quickAccessButton:tween{BackgroundColor3 = self.Theme.Secondary}
		end)

		quickAccessButton.MouseButton1Click:connect(function()
			tabButton.Visible = true
		end)
	end

	local tabButtonText = tabButton:object("TextLabel", {
		TextColor3 = self.Theme.StrongText,
		AnchorPoint = Vector2.new(0, .5),
		BackgroundTransparency = 1,
		TextSize = 14,
		Text = options.Name,
		Position = UDim2.new(0, 25, 0.5, 0),
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, -45, 0.5, 0),
		Font = Enum.Font.SourceSans
	})

	local tabButtonIcon = tabButton:object("ImageLabel", {
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 5, 0.5, 0),
		Size = UDim2.new(0, 15, 0, 15),
		Image = options.Icon,
		ImageColor3 = self.Theme.StrongText
	})

	local tabButtonClose = tabButton:object("ImageButton", {
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -5, 0.5, 0),
		Size = UDim2.fromOffset(14, 14),
		Image = "rbxassetid://8497487650",
		ImageColor3 = self.Theme.StrongText
	})

	tabButtonClose.MouseButton1Click:connect(function()
		tabButton.Visible = false
	end)

	return setmetatable({
		statusText = self.statusText,
		container = tab,
		Theme = self.Theme
	}, Library)
end

function Library:button(options)
	options = self:set_defaults({
		Name = "Button",
		Description = nil,
		Callback = function() end
	}, options)

	local buttonContainer = self.container:object("TextButton", {
		BackgroundColor3 = self.Theme.Secondary,
		Size = UDim2.new(1, -20, 0, 52)
	}):round(7)

	local text = buttonContainer:object("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(10, (options.Description and 5) or 0),
		Size = (options.Description and UDim2.new(0.5, -10, 0, 22)) or UDim2.new(0.5, -10, 1, 0),
		Text = options.Name,
		TextSize = 22,
		TextColor3 = self.Theme.StrongText,
		TextXAlignment = Enum.TextXAlignment.Left
	})

	if options.Description then
		local description = buttonContainer:object("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(10, 27),
			Size = UDim2.new(0.5, -10, 0, 20),
			Text = options.Description,
			TextSize = 18,
			TextColor3 = self.Theme.WeakText,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	end

	local icon = buttonContainer:object("ImageLabel", {
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -11, 0.5, 0),
		Size = UDim2.fromOffset(26, 26),
		Image = "rbxassetid://8498776661",
		ImageColor3 = self.Theme.WeakText
	})

	buttonContainer.MouseButton1Click:connect(function()
		options.Callback()
	end)
end

return setmetatable(Library, {
	__index = function(_, i)
		return rawget(Library, i:lower())
	end
})