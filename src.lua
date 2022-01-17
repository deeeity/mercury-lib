--[[

██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
█░░░░░░██████████░░░░░░█░░░░░░░░░░░░░░█░░░░░░░░░░░░░░░░███░░░░░░░░░░░░░░█░░░░░░██░░░░░░█░░░░░░░░░░░░░░░░███░░░░░░░░██░░░░░░░░█
█░░▄▀░░░░░░░░░░░░░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀▄▀░░███░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░██░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀▄▀░░███░░▄▀▄▀░░██░░▄▀▄▀░░█
█░░▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░░░░░░░░░█░░▄▀░░░░░░░░▄▀░░███░░▄▀░░░░░░░░░░█░░▄▀░░██░░▄▀░░█░░▄▀░░░░░░░░▄▀░░███░░░░▄▀░░██░░▄▀░░░░█
█░░▄▀░░░░░░▄▀░░░░░░▄▀░░█░░▄▀░░█████████░░▄▀░░████░░▄▀░░███░░▄▀░░█████████░░▄▀░░██░░▄▀░░█░░▄▀░░████░░▄▀░░█████░░▄▀▄▀░░▄▀▄▀░░███
█░░▄▀░░██░░▄▀░░██░░▄▀░░█░░▄▀░░░░░░░░░░█░░▄▀░░░░░░░░▄▀░░███░░▄▀░░█████████░░▄▀░░██░░▄▀░░█░░▄▀░░░░░░░░▄▀░░█████░░░░▄▀▄▀▄▀░░░░███
█░░▄▀░░██░░▄▀░░██░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀▄▀░░███░░▄▀░░█████████░░▄▀░░██░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀▄▀░░███████░░░░▄▀░░░░█████
█░░▄▀░░██░░░░░░██░░▄▀░░█░░▄▀░░░░░░░░░░█░░▄▀░░░░░░▄▀░░░░███░░▄▀░░█████████░░▄▀░░██░░▄▀░░█░░▄▀░░░░░░▄▀░░░░█████████░░▄▀░░███████
█░░▄▀░░██████████░░▄▀░░█░░▄▀░░█████████░░▄▀░░██░░▄▀░░█████░░▄▀░░█████████░░▄▀░░██░░▄▀░░█░░▄▀░░██░░▄▀░░███████████░░▄▀░░███████
█░░▄▀░░██████████░░▄▀░░█░░▄▀░░░░░░░░░░█░░▄▀░░██░░▄▀░░░░░░█░░▄▀░░░░░░░░░░█░░▄▀░░░░░░▄▀░░█░░▄▀░░██░░▄▀░░░░░░███████░░▄▀░░███████
█░░▄▀░░██████████░░▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░██░░▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀▄▀▄▀▄▀▄▀░░█░░▄▀░░██░░▄▀▄▀▄▀░░███████░░▄▀░░███████
█░░░░░░██████████░░░░░░█░░░░░░░░░░░░░░█░░░░░░██░░░░░░░░░░█░░░░░░░░░░░░░░█░░░░░░░░░░░░░░█░░░░░░██░░░░░░░░░░███████░░░░░░███████
██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████

edited: 1/17
developers:
v3rm AbstractPoo	discord Abstract#8007
v3rm 0xDEITY		discord Deity#0228

]]

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

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
		Cyan = {
			Main = Color3.fromRGB(30, 30, 35),
			Secondary = Color3.fromRGB(50, 50, 55),
			Tertiary = Color3.fromRGB(70, 130, 180),

			StrongText = Color3.fromHSV(0, 0, 1),		
			WeakText = Color3.fromHSV(0, 0, 172/255)
		},
		Frost = {
			Main = Color3.fromRGB(230, 245, 250),
			Secondary = Color3.fromRGB(210, 225, 230),
			Tertiary = Color3.fromRGB(140, 200, 220),

			StrongText = Color3.fromHSV(0, 20, 0),		
			WeakText = Color3.fromHSV(0, 0, 60/255),
			Light = true
		},
		Vaporwave = {},
		OperaGX = {},
		VisualStudio = {}
	},
	Toggled = true,
	ThemeObjects = {
		Main = {},
		Secondary = {},
		Tertiary = {},

		StrongText = {},
		WeakText = {}
	},
	WelcomeText = nil,
	DisplayName = nil

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

function Library:change_theme(toTheme)
	Library.CurrentTheme = toTheme
	local c = self:lighten(toTheme.Tertiary, 55)
	Library.DisplayName.Text = "Welcome, <font color='rgb(" ..  math.floor(c.R*255) .. "," .. math.floor(c.G*255) .. "," .. math.floor(c.B*255) .. ")'> <b>" .. LocalPlayer.DisplayName .. "</b> </font>"
	for color, objects in next, Library.ThemeObjects do
		local themeColor = Library.CurrentTheme[color]
		for _, obj in next, objects do
			local element, property, theme, colorAlter = obj[1], obj[2], obj[3], obj[4] or 0
			local themeColor = Library.CurrentTheme[theme]
			local modifiedColor = themeColor
			if colorAlter < 0 then
				modifiedColor = Library:darken(themeColor, -1 * colorAlter)
			elseif colorAlter > 0 then
				modifiedColor = Library:lighten(themeColor, colorAlter)
			end
			element:tween{[property] = modifiedColor}
		end
	end
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

	local methods = {}

	methods.AbsoluteObject = localObject

	function methods:tween(options: table, callback)
		local options = Library:set_defaults({
			Length = 0.2,
			Style = Enum.EasingStyle.Linear,
			Direction = Enum.EasingDirection.InOut
		}, options)
		callback = callback or function() return end


		local ti = TweenInfo.new(options.Length, options.Style, options.Direction)
		options.Length = nil
		options.Style = nil 
		options.Direction = nil

		local tween = TweenService:Create(localObject, ti, options); tween:Play()
		tween.Completed:Connect(function()
			callback()
		end)

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

	function methods:crossfade(p2, length)
		length = length or .2
		self:tween({ImageTransparency = 1})
		p2:tween({ImageTransparency = 0})
	end

	function methods:fade(state: boolean, colorOverride: Color3, length: number)
		length = length or 0.2
		if not rawget(self, "fadeFrame") then
			local frame = self:object("Frame", {
				BackgroundColor3 = colorOverride or self.BackgroundColor3,
				BackgroundTransparency = (state and 1) or 0,
				Size = UDim2.fromScale(1, 1),
				Centered = true,
				ZIndex = 999
			}):round(self.AbsoluteObject:FindFirstChildOfClass("UICorner").CornerRadius.Offset or 0)
			rawset(self, "fadeFrame", frame)
		else
			self.fadeFrame.BackgroundColor3 = self.BackgroundColor3
		end

		if state then
			self.fadeFrame.Visible = true
			self.fadeFrame.BackgroundTransparency = 1
			self.fadeFrame:tween{BackgroundTransparency = 0, Length = length}
		else
			self.fadeFrame.BackgroundTransparency = 0
			self.fadeFrame:tween({BackgroundTransparency = 1, Length = length}, function()
				self.fadeFrame.Visible = false
			end)
		end
	end

	function methods:stroke(color: Color3, thickness: number, strokeMode: Enum.ApplyStrokeMode)

		thickness = thickness or 1
		strokeMode = strokeMode or Enum.ApplyStrokeMode.Border
		local stroke = self:object("UIStroke", {
			ApplyStrokeMode = strokeMode,
			Thickness = thickness
		})

		if type(color) == "table" then
			local theme, colorAlter = color[1], color[2] or 0
			local themeColor = Library.CurrentTheme[theme]
			local modifiedColor = themeColor
			if colorAlter < 0 then
				modifiedColor = Library:darken(themeColor, -1 * colorAlter)
			elseif colorAlter > 0 then
				modifiedColor = Library:lighten(themeColor, colorAlter)
			end
			stroke.Color = modifiedColor
			table.insert(Library.ThemeObjects[theme], {stroke, "Color", theme, colorAlter})
		else
			local themeColor = Library.CurrentTheme[color]
			stroke.Color = themeColor
			table.insert(Library.ThemeObjects[color], {stroke, "Color", color, 0})
		end

		return methods
	end

	local customHandlers = {
		Centered = function(value)
			if value then
				localObject.AnchorPoint = Vector2.new(0.5, 0.5)
				localObject.Position = UDim2.fromScale(0.5, 0.5)
			end	
		end,
		Theme = function(value)
			for property, obj in next, value do
				if type(obj) == "table" then
					local theme, colorAlter = obj[1], obj[2] or 0
					local themeColor = Library.CurrentTheme[theme]
					local modifiedColor = themeColor
					if colorAlter < 0 then
						modifiedColor = Library:darken(themeColor, -1 * colorAlter)
					elseif colorAlter > 0 then
						modifiedColor = Library:lighten(themeColor, colorAlter)
					end
					localObject[property] = modifiedColor
					table.insert(self.ThemeObjects[theme], {methods, property, theme, colorAlter})
				else
					local themeColor = Library.CurrentTheme[obj]
					localObject[property] = themeColor
					table.insert(self.ThemeObjects[obj], {methods, property, obj, 0})
				end
			end
		end,
	}

	for property, value in next, properties do
		if customHandlers[property] then
			customHandlers[property](value)
		else
			localObject[property] = value
		end
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

function Library:show(state)
	self.Toggled = state
	self.mainFrame.ClipsDescendants = true
	if state then
		self.mainFrame:tween({Size = self.mainFrame.oldSize, Length = 0.25}, function()
			rawset(self.mainFrame, "oldSize", (state and self.mainFrame.oldSize) or self.mainFrame.Size)
			self.mainFrame.ClipsDescendants = false
		end)
		wait(0.15)
		self.mainFrame:fade(not state, self.mainFrame.BackgroundColor3, 0.15)
	else		
		self.mainFrame:fade(not state, self.mainFrame.BackgroundColor3, 0.15)
		wait(0.1)
		self.mainFrame:tween{Size = UDim2.new(), Length = 0.25}
	end
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
		Link = "https://github.com/deeeity/mercury-lib"
	}, options)

	if options.Theme.Light then
		self.darken, self.lighten = self.lighten, self.darken
	end

	self.CurrentTheme = options.Theme

	local gui = self:object("ScreenGui", {
		Parent = (RunService:IsStudio() and LocalPlayer.PlayerGui) or game:GetService("CoreGui"),
		ZIndexBehavior = Enum.ZIndexBehavior.Global
	})

	local core = gui:object("Frame", {
		Size = options.Size,
		Theme = {BackgroundColor3 = "Main"},
		Centered = true
	}):round(10)

	do
		local S, Event = pcall(function()
			return core.MouseEnter
		end)

		if S then
			core.Active = true;

			Event:connect(function()
				local Input = core.InputBegan:connect(function(Key)
					if Key.UserInputType == Enum.UserInputType.MouseButton1 then
						local ObjectPosition = Vector2.new(Mouse.X - core.AbsolutePosition.X, Mouse.Y - core.AbsolutePosition.Y)
						while RunService.RenderStepped:wait() and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							core:tween{
								Position = UDim2.new(0, Mouse.X - ObjectPosition.X + (core.Size.X.Offset * core.AnchorPoint.X), 0, Mouse.Y - ObjectPosition.Y + (core.Size.Y.Offset * core.AnchorPoint.Y)),
								Direction = Enum.EasingDirection.Out,
								Style = Enum.EasingStyle.Quad,
								Length = 0.06
							}
						end
					end
				end)

				local Leave
				Leave = core.MouseLeave:connect(function()
					Input:disconnect()
					Leave:disconnect()
				end)
			end)
		end
	end

	rawset(core, "oldSize", options.Size)

	self.mainFrame = core

	UserInputService.InputEnded:connect(function(key)
		if key.KeyCode == Enum.KeyCode.Home then
			self.Toggled = not self.Toggled
			Library:show(self.Toggled)
		end
	end)

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
		Theme = {ImageColor3 = "StrongText"},
		Image = "http://www.roblox.com/asset/?id=8497487650",
		AnchorPoint = Vector2.new(1)
	})

	local urlBar = core:object("Frame", {
		Size = UDim2.new(1, -10, 0, 25),
		Position = UDim2.new(0, 5,0, 35),
		Theme = {BackgroundColor3 = "Secondary"}
	}):round(5)

	local searchIcon = urlBar:object("ImageLabel", {
		AnchorPoint = Vector2.new(0, .5),
		Position = UDim2.new(0, 5,0.5, 0);
		Theme = {ImageColor3 = "Tertiary"},
		Size = UDim2.fromOffset(16, 16),
		Image = "http://www.roblox.com/asset/?id=8497489946",
		BackgroundTransparency = 1
	})

	local link = urlBar:object("TextLabel", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 26, 0.5, 0),
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -30, .6, 0),
		Text = options.Link,
		Theme = {TextColor3 = "WeakText"},
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
		Theme = {ImageColor3 = "StrongText"},
		SliceCenter = Rect.new(49, 49, 450, 450),
		Image = "rbxassetid://6014261993"
	})

	local content = core:object("Frame", {
		Theme = {BackgroundColor3 = {"Secondary", -10}},
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
		Theme = {TextColor3 = "Tertiary"},
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left
	})

	local homeButton = tabButtons:object("TextButton", {
		Name = "hehehe siuuuuuuuuu",
		BackgroundTransparency = 0, -- yeah?
		Theme = {BackgroundColor3 = "Secondary"},
		Size = UDim2.new(0, 125, 0, 25)
	}):round(5)

	local homeButtonText = homeButton:object("TextLabel", {
		Theme = {TextColor3 = "StrongText"},
		AnchorPoint = Vector2.new(0, .5),
		BackgroundTransparency = 1,
		TextSize = 14,
		Text = "Mercury",
		Position = UDim2.new(0, 25, 0.5, 0),
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, -45, 0.5, 0),
		Font = Enum.Font.SourceSans,
		TextTruncate = Enum.TextTruncate.AtEnd
	})

	local homeButtonIcon = homeButton:object("ImageLabel", {
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 5, 0.5, 0),
		Size = UDim2.new(0, 15, 0, 15),
		Image = "http://www.roblox.com/asset/?id=8497544895",
		Theme = {ImageColor3 = "StrongText"}
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
		Theme = {BackgroundColor3 = "Secondary"},
		Size = UDim2.new(1, -20, 0, 100)
	}):round(7)

	local profilePictureContainer = profile:object("ImageLabel", {
		Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100),
		Theme = {BackgroundColor3 = {"Secondary", 10}},
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
			Theme = {TextColor3 = {"Tertiary", 30}},
			Size = UDim2.new(0, 400,0, 40),
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left
		})
		Library.DisplayName = displayName
	end

	local profileName = profile:object("TextLabel", {
		Text = "@" .. LocalPlayer.Name,
		TextScaled = true,
		Position = UDim2.new(0, 105,0, 47),
		Theme = {TextColor3 = {"Tertiary", 10}},
		Size = UDim2.new(0, 400,0, 20),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left
	})

	local timeDisplay = profile:object("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 105, 1, -10),
		Size = UDim2.new(0, 400,0, 20),
		AnchorPoint = Vector2.new(0, 1),
		Theme = {TextColor3 = {"WeakText", -20}},
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

	local settingsTabIcon = profile:object("ImageButton", {
		BackgroundTransparency = 1,
		Theme = {ImageColor3 = "WeakText"},
		Size = UDim2.fromOffset(24, 24),
		Position = UDim2.new(1, -10, 1, -10),
		AnchorPoint = Vector2.new(1, 1),
		Image = "http://www.roblox.com/asset/?id=8559790237"
	})

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

	local mt = setmetatable({
		statusText = status,
		container = content,
		navigation = tabButtons,
		Theme = options.Theme,
		Tabs = tabs,
		quickAccess = quickAccess,
		homeButton = homeButton,
		homePage = homePage
	}, Library)

	local settingsTab = Library.tab(mt, {
		Name = "Settings",
		Internal = settingsTabIcon
	})

	settingsTab:_theme_selector()

	return mt
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

	local quickAccessButton
	local quickAccessIcon

	if not options.Internal then
		quickAccessButton = self.quickAccess:object("TextButton", {
			Theme = {BackgroundColor3 = "Secondary"}
		}):round(5)

		quickAccessIcon = quickAccessButton:object("ImageLabel", {
			BackgroundTransparency = 1,
			Theme = {ImageColor3 = "StrongText"},
			Image = options.Icon,
			Size = UDim2.fromScale(0.5, 0.5),
			Centered = true
		})
	else
		quickAccessButton = options.Internal
	end

	tab:object("UIListLayout", {
		Padding = UDim.new(0, 10),
		HorizontalAlignment = Enum.HorizontalAlignment.Center
	})

	tab:object("UIPadding", {
		PaddingTop = UDim.new(0, 10)
	})

	local tabButton = self.navigation:object("TextButton", {
		BackgroundTransparency = 1,
		Theme = {BackgroundColor3 = "Secondary"},
		Size = UDim2.new(0, 125, 0, 25),
		Visible = false
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
			quickAccessButton:tween{BackgroundColor3 = Library.CurrentTheme.Tertiary}
		end)

		quickAccessButton.MouseLeave:connect(function()
			quickAccessButton:tween{BackgroundColor3 = Library.CurrentTheme.Secondary}
		end)

		quickAccessButton.MouseButton1Click:connect(function()
			if not tabButton.Visible then
				tabButton.Size = UDim2.new(0, 50, tabButton.Size.Y.Scale, tabButton.Size.Y.Offset)
				tabButton.Visible = true
				tabButton:fade(false, Library.CurrentTheme.Main, 0.1)
				tabButton:tween({Size = UDim2.new(0, 125, tabButton.Size.Y.Scale, tabButton.Size.Y.Offset), Length = 0.1})
			end
		end)
	end

	local tabButtonText = tabButton:object("TextLabel", {
		Theme = {TextColor3 = "StrongText"},
		AnchorPoint = Vector2.new(0, .5),
		BackgroundTransparency = 1,
		TextSize = 14,
		Text = options.Name,
		Position = UDim2.new(0, 25, 0.5, 0),
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, -45, 0.5, 0),
		Font = Enum.Font.SourceSans,
		TextTruncate = Enum.TextTruncate.AtEnd
	})

	local tabButtonIcon = tabButton:object("ImageLabel", {
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 5, 0.5, 0),
		Size = UDim2.new(0, 15, 0, 15),
		Image = options.Icon,
		Theme = {ImageColor3 = "StrongText"}
	})

	local tabButtonClose = tabButton:object("ImageButton", {
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -5, 0.5, 0),
		Size = UDim2.fromOffset(14, 14),
		Image = "rbxassetid://8497487650",
		Theme = {ImageColor3 = "StrongText"}
	})

	tabButtonClose.MouseButton1Click:connect(function()
		tabButton:fade(true, Library.CurrentTheme.Main, 0.1)
		tabButton:tween({Size = UDim2.new(0, 50, tabButton.Size.Y.Scale, tabButton.Size.Y.Offset), Length = 0.1}, function()
			tabButton.Visible = false
			tab.Visible = false
			wait()
		end)

		local visible = {}
		for _, tab in next, self.Tabs do
			if not tab[2] == selectedTab then tab[1].Visible = false end
			if tab[2].Visible then
				visible[#visible+1] = tab
			end
		end

		local lastTab = visible[#visible]

		if #visible == 2 then
			if not selectedTab == self.homeButton then selectedTab.Visible = false end
			tab.Visible = false
			self.homePage.Visible = true
			self.homeButton:tween{BackgroundTransparency = 0.15}
			selectedTab = self.homeButton
		elseif tabButton == lastTab[2] then
			lastTab = visible[#visible-1]

			tab.Visible = false
			lastTab[2]:tween{BackgroundTransparency = 0.15}
			lastTab[1].Visible = true
			selectedTab = lastTab[2]
		else
			tab.Visible = false
			lastTab[2]:tween{BackgroundTransparency = 0.15}
			lastTab[1].Visible = true
			selectedTab = lastTab[2]
		end
	end)

	return setmetatable({
		statusText = self.statusText,
		container = tab,
		Theme = self.Theme
	}, Library)
end

function Library:toggle(options)
	options = self:set_defaults({
		Name = "Toggle",
		StartingState = false,
		Description = nil,
		Callback = function(state) end
	}, options)

	local toggleContainer = self.container:object("TextButton", {
		Theme = {BackgroundColor3 = "Secondary"},
		Size = UDim2.new(1, -20, 0, 52)
	}):round(7)

	local on = "http://www.roblox.com/asset/?id=8498709213"
	local off = "http://www.roblox.com/asset/?id=8498691125"

	local toggled = options.StartingState

	local onIcon = toggleContainer:object("ImageLabel", {
		AnchorPoint = Vector2.new(1, .5),
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -11,0.5, 0),
		Size = UDim2.new(0, 26,0, 26),
		Image = on,
		Theme = {ImageColor3 = "Tertiary"},
		ImageTransparency = (toggled and 0) or 1
	})

	local offIcon = toggleContainer:object("ImageLabel", {
		AnchorPoint = Vector2.new(1, .5),
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -11,0.5, 0),
		Size = UDim2.new(0, 26,0, 26),
		Image = off,
		Theme = {ImageColor3 = "WeakText"},
		ImageTransparency = (toggled and 1) or 0
	})

	local text = toggleContainer:object("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(10, (options.Description and 5) or 0),
		Size = (options.Description and UDim2.new(0.5, -10, 0, 22)) or UDim2.new(0.5, -10, 1, 0),
		Text = options.Name,
		TextSize = 22,
		Theme = {TextColor3 = "StrongText"},
		TextXAlignment = Enum.TextXAlignment.Left
	})

	if options.Description then
		local description = toggleContainer:object("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(10, 27),
			Size = UDim2.new(0.5, -10, 0, 20),
			Text = options.Description,
			TextSize = 18,
			Theme = {TextColor3 = "WeakText"},
			TextXAlignment = Enum.TextXAlignment.Left
		})
	end

	do
		local hovered = false
		local down = false

		toggleContainer.MouseEnter:connect(function()
			hovered = true
			toggleContainer:tween{BackgroundColor3 = self:lighten(Library.CurrentTheme.Secondary, 10)}
		end)

		toggleContainer.MouseLeave:connect(function()
			hovered = false
			if not down then
				toggleContainer:tween{BackgroundColor3 = Library.CurrentTheme.Secondary}
			end
		end)

		toggleContainer.MouseButton1Down:connect(function()
			toggleContainer:tween{BackgroundColor3 = self:lighten(Library.CurrentTheme.Secondary, 20)}
		end)

		UserInputService.InputEnded:connect(function(key)
			if key.UserInputType == Enum.UserInputType.MouseButton1 then
				toggleContainer:tween{BackgroundColor3 = (hovered and self:lighten(Library.CurrentTheme.Secondary)) or Library.CurrentTheme.Secondary}
			end
		end)

		toggleContainer.MouseButton1Click:connect(function()
			toggled = not toggled
			if toggled then
				offIcon:crossfade(onIcon, 0.1)
			else
				onIcon:crossfade(offIcon, 0.1)
			end
			options.Callback(toggled)
		end)
	end
end

function Library:button(options)
	options = self:set_defaults({
		Name = "Button",
		Description = nil,
		Callback = function() end
	}, options)

	local buttonContainer = self.container:object("TextButton", {
		Theme = {BackgroundColor3 = "Secondary"},
		Size = UDim2.new(1, -20, 0, 52)
	}):round(7)

	local text = buttonContainer:object("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(10, (options.Description and 5) or 0),
		Size = (options.Description and UDim2.new(0.5, -10, 0, 22)) or UDim2.new(0.5, -10, 1, 0),
		Text = options.Name,
		TextSize = 22,
		Theme = {TextColor3 = "StrongText"},
		TextXAlignment = Enum.TextXAlignment.Left
	})

	if options.Description then
		local description = buttonContainer:object("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(10, 27),
			Size = UDim2.new(0.5, -10, 0, 20),
			Text = options.Description,
			TextSize = 18,
			Theme = {TextColor3 = "WeakText"},
			TextXAlignment = Enum.TextXAlignment.Left
		})
	end

	local icon = buttonContainer:object("ImageLabel", {
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -11, 0.5, 0),
		Size = UDim2.fromOffset(26, 26),
		Image = "rbxassetid://8498776661",
		Theme = {ImageColor3 = "Tertiary"}
	})

	do
		local hovered = false
		local down = false

		buttonContainer.MouseEnter:connect(function()
			hovered = true
			buttonContainer:tween{BackgroundColor3 = self:lighten(Library.CurrentTheme.Secondary, 10)}
		end)

		buttonContainer.MouseLeave:connect(function()
			hovered = false
			if not down then
				buttonContainer:tween{BackgroundColor3 = Library.CurrentTheme.Secondary}
			end
		end)

		buttonContainer.MouseButton1Down:connect(function()
			buttonContainer:tween{BackgroundColor3 = self:lighten(Library.CurrentTheme.Secondary, 20)}
		end)

		UserInputService.InputEnded:connect(function(key)
			if key.UserInputType == Enum.UserInputType.MouseButton1 then
				buttonContainer:tween{BackgroundColor3 = (hovered and self:lighten(Library.CurrentTheme.Secondary)) or Library.CurrentTheme.Secondary}
			end
		end)

		buttonContainer.MouseButton1Click:connect(function()
			options.Callback()
		end)
	end
end

function Library:_theme_selector()

	local themeContainer = self.container:object("Frame", {
		Theme = {BackgroundColor3 = "Secondary"},
		Size = UDim2.new(1, -20, 0, 90),
	}):round(7)

	local grid = themeContainer:object("UIGridLayout", {
		CellPadding = UDim2.fromOffset(20, 20),
		CellSize = UDim2.fromOffset(math.clamp((themeContainer.AbsoluteSize.X - 80) / 4, 0, 125), 70),
		VerticalAlignment = Enum.VerticalAlignment.Center
	})
	print((themeContainer.AbsoluteSize.X - 80) / 4)
	
	themeContainer:object("UIPadding", {
		PaddingLeft = UDim.new(0, 10)
	})

	for themeName, themeColors in next, Library.Themes do
		local count = 0
		
		for _, color in next, themeColors do
			if not (type(color) == "boolean") then
				count += 1
			end
		end
		
		if count >= 5 then
			local theme = themeContainer:object("TextButton", {
				BackgroundTransparency = 1
			})
			
			local themeColorsContainer = theme:object("Frame", {
				Size = UDim2.new(1, 0, 1, -20),
				BackgroundTransparency = 1
			}):round(5):stroke("WeakText")
			
			local themeNameLabel = theme:object("TextLabel", {
				BackgroundTransparency = 1,
				Text = themeName,
				TextSize = 16,
				Theme = {TextColor3 = "StrongText"},
				Size = UDim2.new(1, 0, 0, 20),
				Position = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 1)
			})
			
			local index = 0
		
		
			for _, color in next, themeColors do			
				if not (type(color) == "boolean") then
					index += 1
					local colorFrame = themeColorsContainer:object("Frame", {
						Size = UDim2.fromScale(0.2, 1),
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.fromScale((0.2 * index) - 0.2, 0.5),
						BackgroundColor3 = color
					})

					if index == 1 then
						colorFrame:round(5)
						colorFrame:object("Frame", {
							Size = UDim2.fromScale(0.5, 1),
							AnchorPoint = Vector2.new(1, 0.5),
							Position = UDim2.fromScale(1, 0.5),
							BackgroundColor3 = color
						})
					elseif index == 5 then
						colorFrame:round(5)
						colorFrame:object("Frame", {
							Size = UDim2.fromScale(0.5, 1),
							AnchorPoint = Vector2.new(0, 0.5),
							Position = UDim2.fromScale(0, 0.5),
							BackgroundColor3 = color
						})
					end
				end
			end
			theme.MouseButton1Click:connect(function()
				Library:change_theme(Library.Themes[themeName])
			end)
		end
	end
end

function Library:keybind(options)
	options = self:set_defaults({
		Name = "Keybind",
		Keybind = nil,
		Description = nil
	}, options)

	local keybindContainer = self.container:object("TextButton", {
		Theme = {BackgroundColor3 = "Secondary"},
		Size = UDim2.new(1, -20, 0, 52)
	}):round(7)

	local text = keybindContainer:object("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(10, (options.Description and 5) or 0),
		Size = (options.Description and UDim2.new(0.5, -10, 0, 22)) or UDim2.new(0.5, -10, 1, 0),
		Text = options.Name,
		TextSize = 22,
		Theme = {TextColor3 = "StrongText"},
		TextXAlignment = Enum.TextXAlignment.Left
	})

	if options.Description then
		local description = keybindContainer:object("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(10, 27),
			Size = UDim2.new(0.5, -10, 0, 20),
			Text = options.Description,
			TextSize = 18,
			Theme = {TextColor3 = "WeakText"},
			TextXAlignment = Enum.TextXAlignment.Left
		})
	end


	local keybindDisplay = keybindContainer:object("TextLabel", {
		AnchorPoint = Vector2.new(1, 0),
		Theme = {
			BackgroundColor3 = {"Main", 15},
			TextColor3 = "Tertiary"
		},
		Position = UDim2.new(1, -20,0, 16),
		Size = UDim2.new(0, 50,0, 20),
		TextSize = 12,
		Text = (options.Keybind and tostring(options.Keybind.Name):upper()) or "?"
	}):round(5):stroke("Tertiary")

	do
		local hovered = false
		local down = false
		local listening = false

		keybindContainer.MouseEnter:connect(function()
			hovered = true
			keybindContainer:tween{BackgroundColor3 = self:lighten(Library.CurrentTheme.Secondary, 10)}
		end)

		keybindContainer.MouseLeave:connect(function()
			hovered = false
			if not down then
				keybindContainer:tween{BackgroundColor3 = Library.CurrentTheme.Secondary}
			end
		end)

		keybindContainer.MouseButton1Down:connect(function()
			keybindContainer:tween{BackgroundColor3 = self:lighten(Library.CurrentTheme.Secondary, 20)}
		end)

		UserInputService.InputEnded:connect(function(key)
			if key.UserInputType == Enum.UserInputType.MouseButton1 then
				keybindContainer:tween{BackgroundColor3 = (hovered and self:lighten(Library.CurrentTheme.Secondary)) or Library.CurrentTheme.Secondary}
			end
		end)

		UserInputService.InputBegan:Connect(function(key)
			if listening then
				if key.UserInputType == Enum.UserInputType.Keyboard then
					if key.KeyCode ~= Enum.KeyCode.Escape then
						options.Keybind = key.KeyCode
					end
					keybindDisplay.Text = (options.Keybind and tostring(options.Keybind.Name):upper()) or "?"
					listening = false
				end
			end
		end)

		keybindContainer.MouseButton1Click:connect(function()
			if not listening then listening = true; keybindDisplay.Text = "..." end
		end)
	end
end

return setmetatable(Library, {
	__index = function(_, i)
		return rawget(Library, i:lower())
	end
})