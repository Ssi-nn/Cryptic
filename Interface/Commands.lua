--> For the most part, this script is not touched at all, at worry something will break, like everything in version 1.1 and ealier :)
--> The only thing I did not make in this GUI was the drag script, mainly because I was wayy too lazy to actually do it.
--> Anyway, that's it, the only cool thing about this GUI though is that it automatically updates, which is nice.

local Converted = {
	["_Commands"] = Instance.new("ScreenGui");
	["_Base"] = Instance.new("Frame");
	["_DropShadowHolder"] = Instance.new("Frame");
	["_DropShadow"] = Instance.new("ImageLabel");
	["_Drag"] = Instance.new("LocalScript");
	["_UIAspectRatioConstraint"] = Instance.new("UIAspectRatioConstraint");
	["_ScrollingFrame"] = Instance.new("ScrollingFrame");
	["_UIListLayout"] = Instance.new("UIListLayout");
	["_LocalScript"] = Instance.new("LocalScript");
}
Converted["_Commands"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_Commands"].Name = "Commands"
Converted["_Commands"].Parent = game:GetService("CoreGui")
Converted["_Base"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Base"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
Converted["_Base"].BackgroundTransparency = 0.25
Converted["_Base"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Base"].Size = UDim2.new(0.25999999, 0, 0.25, 0)
Converted["_Base"].Name = "Base"
Converted["_Base"].Parent = Converted["_Commands"]
Converted["_DropShadowHolder"].BackgroundTransparency = 1
Converted["_DropShadowHolder"].BorderSizePixel = 0
Converted["_DropShadowHolder"].Size = UDim2.new(1, 0, 1, 0)
Converted["_DropShadowHolder"].ZIndex = 0
Converted["_DropShadowHolder"].Name = "DropShadowHolder"
Converted["_DropShadowHolder"].Parent = Converted["_Base"]
Converted["_DropShadow"].Image = "rbxassetid://6015897843"
Converted["_DropShadow"].ImageColor3 = Color3.fromRGB(0, 0, 0)
Converted["_DropShadow"].ImageTransparency = 0.5
Converted["_DropShadow"].ScaleType = Enum.ScaleType.Slice
Converted["_DropShadow"].SliceCenter = Rect.new(49, 49, 450, 450)
Converted["_DropShadow"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_DropShadow"].BackgroundTransparency = 1
Converted["_DropShadow"].BorderSizePixel = 0
Converted["_DropShadow"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_DropShadow"].Size = UDim2.new(1, 47, 1, 47)
Converted["_DropShadow"].ZIndex = 0
Converted["_DropShadow"].Name = "DropShadow"
Converted["_DropShadow"].Parent = Converted["_DropShadowHolder"]
Converted["_UIAspectRatioConstraint"].AspectRatio = 1.969499945640564
Converted["_UIAspectRatioConstraint"].Parent = Converted["_Base"]
Converted["_ScrollingFrame"].AutomaticCanvasSize = Enum.AutomaticSize.Y
Converted["_ScrollingFrame"].CanvasSize = UDim2.new(0, 0, 0, 0)
Converted["_ScrollingFrame"].ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ScrollingFrame"].ScrollBarImageTransparency = 1
Converted["_ScrollingFrame"].ScrollBarThickness = 0
Converted["_ScrollingFrame"].Active = true
Converted["_ScrollingFrame"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_ScrollingFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ScrollingFrame"].BackgroundTransparency = 1
Converted["_ScrollingFrame"].BorderSizePixel = 0
Converted["_ScrollingFrame"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_ScrollingFrame"].Size = UDim2.new(0.897461176, 0, 0.800000012, 0)
Converted["_ScrollingFrame"].Parent = Converted["_Base"]
Converted["_UIListLayout"].Padding = UDim.new(0, 7)
Converted["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout"].Parent = Converted["_ScrollingFrame"]
local fake_module_scripts = {}
local function GXZICI_fake_script()
    local script = Instance.new("LocalScript")
    script.Name = "Drag"
    script.Parent = Converted["_Base"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (25);
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(Update)
end
local function ISMT_fake_script()
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_ScrollingFrame"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	loadstring(game:HttpGet('https://raw.githubusercontent.com/Ssi-nn/Cryptic/main/Documents/Supported.lua', true))()
end

coroutine.wrap(GXZICI_fake_script)()
coroutine.wrap(ISMT_fake_script)()