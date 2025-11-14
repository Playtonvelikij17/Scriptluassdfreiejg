local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Character:Model = nil
local Humanoid:Humanoid = nil

local Hrp:BasePart = nil

local IsDrag = false
local IsDragMobile = false

local Is_Player_Speed = false

local Delay_Start_Script = 2
local Default_Speed_Player = 16

local Speed_Player = 35

local Current_Device = ""

while task.wait() do
	if LocalPlayer then
		if UserInputService.TouchEnabled then
			Current_Device = "Mobile"
			break
		else 
			Current_Device = "PC"
			break
		end
	end
end


task.wait(Delay_Start_Script)

if not LocalPlayer then
	warn("Player is not loaded!")
	return
else 
	print("Player is loaded!")
end

print("Player device: " .. Current_Device)

Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
Humanoid = Character:WaitForChild("Humanoid")
Hrp = Character:WaitForChild("HumanoidRootPart")


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HackGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer.PlayerGui

local MainTouch = Instance.new("Frame", ScreenGui)

MainTouch.BorderSizePixel = 0

MainTouch.Size = UDim2.new(0.279, 0,0.045, 0)
MainTouch.Position = UDim2.new(0.366, 0,0.284, 0)

MainTouch.BackgroundColor3 = Color3.fromRGB(58, 58, 58)

MainTouch.Parent = ScreenGui

if MainTouch then
	local UIARC_MainTouch = Instance.new("UIAspectRatioConstraint")
	UIARC_MainTouch.AspectRatio = 11.859
	UIARC_MainTouch.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_MainTouch.DominantAxis = Enum.DominantAxis.Width
	UIARC_MainTouch.Parent = MainTouch
end

local MainHack = Instance.new("Frame")

MainHack.BorderSizePixel = 0

MainHack.Size = UDim2.new(1, 0,9.671, 0)
MainHack.Position = UDim2.new(0, 0,0.99, 0)

MainHack.BackgroundColor3 = Color3.fromRGB(48, 48, 48)

MainHack.Parent = MainTouch


if MainHack then
	local UIARC_MainTouch = Instance.new("UIAspectRatioConstraint")
	UIARC_MainTouch.AspectRatio = 1.226
	UIARC_MainTouch.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_MainTouch.DominantAxis = Enum.DominantAxis.Width
	UIARC_MainTouch.Parent = MainTouch
end



local Button_Open_MainHack = Instance.new("TextButton")

Button_Open_MainHack.Size = UDim2.new(0.144, 0,1, 0)
Button_Open_MainHack.Position = UDim2.new(0.856, 0,0, 0)

Button_Open_MainHack.BackgroundColor3 = Color3.fromRGB(111, 111, 111)
Button_Open_MainHack.BorderSizePixel = 0

Button_Open_MainHack.TextColor3 = Color3.fromRGB(255, 255, 255)

Button_Open_MainHack.FontFace.Bold = true
Button_Open_MainHack.TextScaled = true

Button_Open_MainHack.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

Button_Open_MainHack.TextStrokeTransparency = 0
Button_Open_MainHack.Text = ">"

Button_Open_MainHack.Parent = MainTouch

if Button_Open_MainHack then
	local UIARC_MainTouch = Instance.new("UIAspectRatioConstraint")
	UIARC_MainTouch.AspectRatio = 1.712
	UIARC_MainTouch.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_MainTouch.DominantAxis = Enum.DominantAxis.Width
	UIARC_MainTouch.Parent = Button_Open_MainHack
end

local ScrollFrame = Instance.new("ScrollingFrame")

ScrollFrame.Size = UDim2.new(1,0,1,0)
ScrollFrame.Position = UDim2.new(0,0,0,0)

ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0

ScrollFrame.CanvasSize = UDim2.new(0, 0,3, 0)

ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(222, 222, 222)

ScrollFrame.Parent = MainHack

if ScrollFrame then
	local UIARC_ScrollFrame = Instance.new("UIAspectRatioConstraint")
	UIARC_ScrollFrame.AspectRatio = 1.226
	UIARC_ScrollFrame.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_ScrollFrame.DominantAxis = Enum.DominantAxis.Width
	UIARC_ScrollFrame.Parent = ScrollFrame
end


local Main_ButtonSpeed_ScrollFrame = Instance.new("Frame")

Main_ButtonSpeed_ScrollFrame.BorderSizePixel = 0
Main_ButtonSpeed_ScrollFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)

Main_ButtonSpeed_ScrollFrame.Size = UDim2.new(0.8, 0,0.15, 0)
Main_ButtonSpeed_ScrollFrame.Position = UDim2.new(0.099, 0,0.023, 0)

Main_ButtonSpeed_ScrollFrame.Parent = ScrollFrame

local Button_TurnSpeed_Main_ButtonSpeed:TextButton = nil
local TextBox_HowManySpeed_Main_ButtonSpeed:TextBox = nil

if Main_ButtonSpeed_ScrollFrame then -- settings button
	
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local Humanoid:Humanoid = Character:WaitForChild("Humanoid")
	
	local UIARC_Main_ButtonSpeed = Instance.new("UIAspectRatioConstraint")
	UIARC_Main_ButtonSpeed.AspectRatio = 3.27
	UIARC_Main_ButtonSpeed.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_Main_ButtonSpeed.DominantAxis = Enum.DominantAxis.Width
	UIARC_Main_ButtonSpeed.Parent = Main_ButtonSpeed_ScrollFrame
	
	Button_TurnSpeed_Main_ButtonSpeed = Instance.new("TextButton")
	
	Button_TurnSpeed_Main_ButtonSpeed.Size = UDim2.new(0.22, 0,0.7, 0)
	Button_TurnSpeed_Main_ButtonSpeed.Position = UDim2.new(0.035, 0,0.152, 0)

	Button_TurnSpeed_Main_ButtonSpeed.BackgroundColor3 = Color3.fromRGB(144, 144, 144)
	Button_TurnSpeed_Main_ButtonSpeed.BorderSizePixel = 0

	Button_TurnSpeed_Main_ButtonSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)

	Button_TurnSpeed_Main_ButtonSpeed.FontFace.Bold = true
	Button_TurnSpeed_Main_ButtonSpeed.TextScaled = true

	Button_TurnSpeed_Main_ButtonSpeed.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

	Button_TurnSpeed_Main_ButtonSpeed.TextStrokeTransparency = 0
	Button_TurnSpeed_Main_ButtonSpeed.Text = "Speed: " .. tostring(Is_Player_Speed)

	Button_TurnSpeed_Main_ButtonSpeed.Parent = Main_ButtonSpeed_ScrollFrame
	
	Button_TurnSpeed_Main_ButtonSpeed.MouseButton1Click:Connect(function()
		Is_Player_Speed = not Is_Player_Speed
		
	--	print("Is_Player_Speed: " .. tostring(Is_Player_Speed))
		
		if Is_Player_Speed then
			Speed_Player = TextBox_HowManySpeed_Main_ButtonSpeed.Text
			
			TextBox_HowManySpeed_Main_ButtonSpeed.Text = tostring(Speed_Player)
		else
			if not Is_Player_Speed then
				Speed_Player = 16
			--	print("Speed_Player = 16!")
			end
		end
		Button_TurnSpeed_Main_ButtonSpeed.Text = "Speed: " .. tostring(Is_Player_Speed)
	end)
	
	local UIARC_Button_TurnSpeed = Instance.new("UIAspectRatioConstraint")
	UIARC_Button_TurnSpeed.AspectRatio = 1.028
	UIARC_Button_TurnSpeed.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_Button_TurnSpeed.DominantAxis = Enum.DominantAxis.Width
	UIARC_Button_TurnSpeed.Parent = Button_TurnSpeed_Main_ButtonSpeed
	
	TextBox_HowManySpeed_Main_ButtonSpeed = Instance.new("TextBox")
	
	TextBox_HowManySpeed_Main_ButtonSpeed.Size = UDim2.new(0.267, 0,0.548, 0)
	TextBox_HowManySpeed_Main_ButtonSpeed.Position = UDim2.new(0.678, 0,0.228, 0)

	TextBox_HowManySpeed_Main_ButtonSpeed.BackgroundColor3 = Color3.fromRGB(144, 144, 144)
	TextBox_HowManySpeed_Main_ButtonSpeed.BorderSizePixel = 0

	TextBox_HowManySpeed_Main_ButtonSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)

	TextBox_HowManySpeed_Main_ButtonSpeed.FontFace.Bold = true
	TextBox_HowManySpeed_Main_ButtonSpeed.TextScaled = true

	TextBox_HowManySpeed_Main_ButtonSpeed.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

	TextBox_HowManySpeed_Main_ButtonSpeed.TextStrokeTransparency = 0
	TextBox_HowManySpeed_Main_ButtonSpeed.Text = tostring(Humanoid.WalkSpeed)

	TextBox_HowManySpeed_Main_ButtonSpeed.Parent = Main_ButtonSpeed_ScrollFrame
	
	local UIARC_TextBox_HowManySpeed = Instance.new("UIAspectRatioConstraint")
	UIARC_TextBox_HowManySpeed.AspectRatio = 1.59
	UIARC_TextBox_HowManySpeed.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_TextBox_HowManySpeed.DominantAxis = Enum.DominantAxis.Width
	UIARC_TextBox_HowManySpeed.Parent = TextBox_HowManySpeed_Main_ButtonSpeed
	
	
	TextBox_HowManySpeed_Main_ButtonSpeed.FocusLost:Connect(function(EnterPressed)
		if EnterPressed and Is_Player_Speed then
			
			Speed_Player = TextBox_HowManySpeed_Main_ButtonSpeed.Text
			
			Humanoid.WalkSpeed = tonumber(Speed_Player) or 0
			
			TextBox_HowManySpeed_Main_ButtonSpeed.Text = tostring(Speed_Player)
			
		--	print("Speed Hum: " .. Humanoid.WalkSpeed .. " Speed_Player: " .. Speed_Player)
		end
	end)
end




Button_Open_MainHack.MouseButton1Click:Connect(function()
	MainHack.Visible = not MainHack.Visible
	
	if not MainHack.Visible then
		Button_Open_MainHack.Text = "<"
	else 
		Button_Open_MainHack.Text = ">"
	end
end)

MainTouch.InputBegan:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1 then
		IsDrag = true
		print(IsDrag)
	elseif Input.UserInputType == Enum.UserInputType.Touch and Current_Device == "Mobile" then
		IsDragMobile = true
	--	print(IsDragMobile)
	end
end)

MainTouch.InputEnded:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1 then
		IsDrag = false
	--	print(IsDrag)
	end
end)

UserInputService.InputEnded:Connect(function(Input, IsTyping)
	if IsTyping then return end

	if IsDragMobile and Current_Device == "Mobile" then
		IsDragMobile = false
--		print(IsDragMobile)
	end
end)



RunService.RenderStepped:Connect(function()
	Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	Humanoid = Character:WaitForChild("Humanoid")
	Hrp = Character:WaitForChild("HumanoidRootPart")
	
	if Is_Player_Speed then
		Humanoid.WalkSpeed = Speed_Player
	else
		Humanoid.WalkSpeed = Default_Speed_Player
	end
	
	if IsDrag and Current_Device == "PC" then
		local MousePos = UserInputService:GetMouseLocation()
	--	print(MousePos.X .. " " .. MousePos.Y)

		MainTouch.Position = UDim2.new(0, MousePos.X - 150, 0, MousePos.Y - 60)
	else
		if IsDragMobile and Current_Device == "Mobile" then
			local MousePos = UserInputService:GetMouseLocation()
		--	print(MousePos.X .. " " .. MousePos.Y)

			MainTouch.Position = UDim2.new(0, MousePos.X - 25, 0, MousePos.Y - 50)
		end
	end
end)
