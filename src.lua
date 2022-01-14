--[[
  __  __                                
 |  \/  |                               
 | \  / | ___ _ __ ___ _   _ _ __ _   _ 
 | |\/| |/ _ \ '__/ __| | | | '__| | | |
 | |  | |  __/ | | (__| |_| | |  | |_| |
 |_|  |_|\___|_|  \___|\__,_|_|   \__, |
                                   __/ |
                                  |___/ 
edited: 1/14

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
	f = f or 15
	return Color3.fromHSV(h, s, math.clamp(v - (f/255), 0, 1))
end

function Library:lighten(color: Color3, f: number)
	local h, s, v = Color3.toHSV(color)
	f = f or 15
	return Color3.fromHSV(h, s, math.clamp(v + (f/255), 0, 1))
end

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

	local tabButtons = core:object("Frame", {
		Size = UDim2.new(1, -40, 0, 25),
		Position = UDim2.fromOffset(5, 5),
		BackgroundTransparency = 1
	})

	tabButtons:object("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Left
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
		Size = UDim2.new(0, 125, 1, 0)
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
		Image = "http://www.roblox.com/asset/?id=8497544895"
	})

	local homePage = content:object("Frame", {
		Size = UDim2.fromScale(1, 1),
		Centered = true,
		BackgroundTransparency = 1
	})

	local tabs = {}
	selectedTab = homeButton
	
	table.insert(tabs, {homePage, homeButton})

	do
		local down = false
		local hovered = false
		
		homeButton.MouseEnter:Connect(function()
			hovered = true
			if not selectedTab == homeButton then
				homeButton:tween{
					Style = Enum.EasingStyle.Quint,
					BackgroundTransparency = 0
				}
			end
		end)

		homeButton.MouseLeave:Connect(function()
			hovered = false
			if not (down or (selectedTab == homeButton)) then
				homeButton:tween{
					Style = Enum.EasingStyle.Quint,
					BackgroundTransparency = 1
				}
			end
		end)

		homeButton.MouseButton1Down:Connect(function()
			down = true
			homeButton:tween{
				Style = Enum.EasingStyle.Quint,
				BackgroundColor3 = self:lighten(options.Theme.Secondary, 10)
			}
		end)

		UserInputService.InputEnded:Connect(function(key)
			down = false
			if key.UserInputType == Enum.UserInputType.MouseButton1 and selectedTab == homeButton then
				homeButton:tween{
					Style = Enum.EasingStyle.Quint,
					BackgroundColor3 = options.Theme.Secondary,
					BackgroundTransparency = ((hovered or (selectedTab == homeButton)) and 0) or 1
				}
			end
		end)

		homeButton.MouseButton1Click:Connect(function()
			for i, tabInfo in next, tabs do
				local page = tabInfo[1]
				local button = tabInfo[2]
				page.Visible = false
			end

			selectedTab:tween{BackgroundTransparency = 1}
			homePage.Visible = true
			selectedTab = homeButton
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

	local displayName = profile:object("TextLabel", {
		RichText = true,
		Text = "Welcome, <font color='#efe4ff'> <b>" .. LocalPlayer.DisplayName .. "</b> </font>",
		TextScaled = true,
		Position = UDim2.new(0, 105,0, 10),
		TextColor3 = self:lighten(options.Theme.Tertiary, 30),
		Size = UDim2.new(0, 400,0, 40),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left
	})

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

	return setmetatable({
		statusText = status,
		container = content,
		navigation = tabButtons,
		Theme = options.Theme,
		Tabs = tabs
	}, Library)
end

function Library:tab(options)
	local options = self:set_defaults({
		Name = "New Tab",
		Icon = "http://www.roblox.com/asset/?id=8497544895"

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

	local tabButton = self.navigation:object("TextButton", {
		BackgroundTransparency = 1,
		BackgroundColor3 = self.Theme.Secondary,
		Size = UDim2.new(0, 125, 1, 0)
	}):round(5)

	table.insert(self.Tabs, {tab, tabButton})

	do
		local down = false
		local hovered = false
		tabButton.MouseEnter:Connect(function()
			hovered = true
			if not self.SelectedTab == tabButton then
				tabButton:tween{
					Style = Enum.EasingStyle.Quint,
					BackgroundTransparency = 0
				}
			end
		end)

		tabButton.MouseLeave:Connect(function()
			hovered = false
			if not (down or (selectedTab == tabButton)) then
				tabButton:tween{
					Style = Enum.EasingStyle.Quint,
					BackgroundTransparency = 1
				}
			end
		end)

		tabButton.MouseButton1Down:Connect(function()
			down = true
			tabButton:tween{
				Style = Enum.EasingStyle.Quint,
				BackgroundColor3 = self:lighten(self.Theme.Secondary, 10),
				BackgroundTransparency = 0
			}
		end)

		UserInputService.InputEnded:Connect(function(key)
			down = false
			if key.UserInputType == Enum.UserInputType.MouseButton1 and selectedTab == tabButton then
				tabButton:tween{
					Style = Enum.EasingStyle.Quint,
					BackgroundColor3 = self.Theme.Secondary,
					BackgroundTransparency = (hovered and 0) or 1
				}
			end
		end)

		tabButton.MouseButton1Click:Connect(function()
			for _, tabInfo in next, self.Tabs do
				local page = tabInfo[1]
				local button = tabInfo[2]
				page.Visible = false
			end
			selectedTab:tween{BackgroundTransparency = 1}
			tab.Visible = true
			selectedTab = tabButton
			tabButton.BackgroundTransparency = 0
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
		Image = options.Icon
	})

	return setmetatable({
		statusText = self.statusText
	}, Library)
end





return setmetatable(Library, {
	__index = function(_, i)
		return rawget(Library, i:lower())
	end
})
