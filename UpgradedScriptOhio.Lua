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
local Is_Player_Fly = false
local Is_Esp_Player = false
local Is_Noclip_Player = false

local Delay_Start_Script = 2
local Default_Speed_Player = 25
local Speed_Player = 35

local HowMany_TeleportUp = 16
local HowMany_TeleportDirectly = 16

local Current_Device = ""

local Part_Fly:BasePart = nil

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
Main_ButtonSpeed_ScrollFrame.Position = UDim2.new(0.099, 0,0.405, 0)

Main_ButtonSpeed_ScrollFrame.Parent = ScrollFrame

local Button_TurnSpeed_Main_ButtonSpeed:TextButton = nil
local TextBox_HowManySpeed_Main_ButtonSpeed:TextBox = nil

if Main_ButtonSpeed_ScrollFrame then -- settings button
	
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




local Main_ButtonFly_ScrollFrame = Instance.new("Frame")

Main_ButtonFly_ScrollFrame.BorderSizePixel = 0
Main_ButtonFly_ScrollFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)

Main_ButtonFly_ScrollFrame.Size = UDim2.new(0.8, 0,0.15, 0)
Main_ButtonFly_ScrollFrame.Position = UDim2.new(0.099, 0,0.023, 0)

Main_ButtonFly_ScrollFrame.Parent = ScrollFrame

local Button_Fly_Main_ButtonFly:TextButton = nil

if Main_ButtonFly_ScrollFrame then -- settings button

	local UIARC_Main_ButtonFly = Instance.new("UIAspectRatioConstraint")
	UIARC_Main_ButtonFly.AspectRatio = 3.27
	UIARC_Main_ButtonFly.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_Main_ButtonFly.DominantAxis = Enum.DominantAxis.Width
	UIARC_Main_ButtonFly.Parent = Main_ButtonFly_ScrollFrame

	Button_Fly_Main_ButtonFly = Instance.new("TextButton")

	Button_Fly_Main_ButtonFly.Size = UDim2.new(0.453, 0,0.7, 0)
	Button_Fly_Main_ButtonFly.Position = UDim2.new(0.271, 0,0.139, 0)

	Button_Fly_Main_ButtonFly.BackgroundColor3 = Color3.fromRGB(144, 144, 144)
	Button_Fly_Main_ButtonFly.BorderSizePixel = 0

	Button_Fly_Main_ButtonFly.TextColor3 = Color3.fromRGB(255, 255, 255)

	Button_Fly_Main_ButtonFly.FontFace.Bold = true
	Button_Fly_Main_ButtonFly.TextScaled = true

	Button_Fly_Main_ButtonFly.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

	Button_Fly_Main_ButtonFly.TextStrokeTransparency = 0
	Button_Fly_Main_ButtonFly.Text = "Player Fly: " .. tostring(Is_Player_Fly)

	Button_Fly_Main_ButtonFly.Parent = Main_ButtonFly_ScrollFrame

	Button_Fly_Main_ButtonFly.MouseButton1Click:Connect(function()
		Is_Player_Fly = not Is_Player_Fly

		--	print("Is_Player_Speed: " .. tostring(Is_Player_Speed))

		if Is_Player_Fly then
			Part_Fly = Instance.new("Part")
			Part_Fly.Size = Vector3.new(5, 0.6, 5)
			Part_Fly.CFrame = Hrp.CFrame * CFrame.new(0,-3.2,0)
			Part_Fly.Transparency = 0.2
			Part_Fly.Parent = workspace
		else 
			if Part_Fly then
				Part_Fly:Destroy()
				Part_Fly = nil
			end
		end
		Button_Fly_Main_ButtonFly.Text = "Player Fly: " .. tostring(Is_Player_Fly)
	end)
	
	local UIARC_Main_ButtonFly = Instance.new("UIAspectRatioConstraint")
	UIARC_Main_ButtonFly.AspectRatio = 2.114
	UIARC_Main_ButtonFly.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_Main_ButtonFly.DominantAxis = Enum.DominantAxis.Width
	UIARC_Main_ButtonFly.Parent = Button_Fly_Main_ButtonFly
end




local Main_ButtonNoclip_ScrollFrame = Instance.new("Frame")

Main_ButtonNoclip_ScrollFrame.BorderSizePixel = 0
Main_ButtonNoclip_ScrollFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)

Main_ButtonNoclip_ScrollFrame.Size = UDim2.new(0.8, 0,0.15, 0)
Main_ButtonNoclip_ScrollFrame.Position = UDim2.new(0.099, 0,0.15, 0)

Main_ButtonNoclip_ScrollFrame.Parent = ScrollFrame

local Button_Noclip_Main_ButtonNoclip:TextButton = nil

if Main_ButtonNoclip_ScrollFrame then -- settings button

	local UIARC_Main_ButtonNoclip = Instance.new("UIAspectRatioConstraint")
	UIARC_Main_ButtonNoclip.AspectRatio = 3.27
	UIARC_Main_ButtonNoclip.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_Main_ButtonNoclip.DominantAxis = Enum.DominantAxis.Width
	UIARC_Main_ButtonNoclip.Parent = Main_ButtonNoclip_ScrollFrame

	Button_Noclip_Main_ButtonNoclip = Instance.new("TextButton")

	Button_Noclip_Main_ButtonNoclip.Size = UDim2.new(0.453, 0,0.7, 0)
	Button_Noclip_Main_ButtonNoclip.Position = UDim2.new(0.271, 0,0.139, 0)

	Button_Noclip_Main_ButtonNoclip.BackgroundColor3 = Color3.fromRGB(144, 144, 144)
	Button_Noclip_Main_ButtonNoclip.BorderSizePixel = 0

	Button_Noclip_Main_ButtonNoclip.TextColor3 = Color3.fromRGB(255, 255, 255)

	Button_Noclip_Main_ButtonNoclip.FontFace.Bold = true
	Button_Noclip_Main_ButtonNoclip.TextScaled = true

	Button_Noclip_Main_ButtonNoclip.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

	Button_Noclip_Main_ButtonNoclip.TextStrokeTransparency = 0
	Button_Noclip_Main_ButtonNoclip.Text = "Player Noclip: " .. tostring(Is_Noclip_Player)

	Button_Noclip_Main_ButtonNoclip.Parent = Main_ButtonNoclip_ScrollFrame

	Button_Noclip_Main_ButtonNoclip.MouseButton1Click:Connect(function()
		Is_Noclip_Player = not Is_Noclip_Player

		--	print("Is_Player_Speed: " .. tostring(Is_Player_Speed))
		
		Button_Noclip_Main_ButtonNoclip.Text = "Player Noclip: " .. tostring(Is_Noclip_Player)
	end)

	local UIARC_Main_ButtonNoclip = Instance.new("UIAspectRatioConstraint")
	UIARC_Main_ButtonNoclip.AspectRatio = 2.114
	UIARC_Main_ButtonNoclip.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_Main_ButtonNoclip.DominantAxis = Enum.DominantAxis.Width
	UIARC_Main_ButtonNoclip.Parent = Button_Noclip_Main_ButtonNoclip
end






local Main_ButtonEspPlayer_ScrollFrame = Instance.new("Frame")

Main_ButtonEspPlayer_ScrollFrame.BorderSizePixel = 0
Main_ButtonEspPlayer_ScrollFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)

Main_ButtonEspPlayer_ScrollFrame.Size = UDim2.new(0.8, 0,0.15, 0)
Main_ButtonEspPlayer_ScrollFrame.Position = UDim2.new(0.099, 0,0.28, 0)

Main_ButtonEspPlayer_ScrollFrame.Parent = ScrollFrame

local Button_EspPlayer_Main_ButtonEspPlayer:TextButton = nil

if Main_ButtonEspPlayer_ScrollFrame then -- settings button

	local UIARC_Main_ButtonEspPlayer = Instance.new("UIAspectRatioConstraint")
	UIARC_Main_ButtonEspPlayer.AspectRatio = 3.27
	UIARC_Main_ButtonEspPlayer.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_Main_ButtonEspPlayer.DominantAxis = Enum.DominantAxis.Width
	UIARC_Main_ButtonEspPlayer.Parent = Main_ButtonEspPlayer_ScrollFrame

	Button_EspPlayer_Main_ButtonEspPlayer = Instance.new("TextButton")

	Button_EspPlayer_Main_ButtonEspPlayer.Size = UDim2.new(0.453, 0,0.7, 0)
	Button_EspPlayer_Main_ButtonEspPlayer.Position = UDim2.new(0.271, 0,0.139, 0)

	Button_EspPlayer_Main_ButtonEspPlayer.BackgroundColor3 = Color3.fromRGB(144, 144, 144)
	Button_EspPlayer_Main_ButtonEspPlayer.BorderSizePixel = 0

	Button_EspPlayer_Main_ButtonEspPlayer.TextColor3 = Color3.fromRGB(255, 255, 255)

	Button_EspPlayer_Main_ButtonEspPlayer.FontFace.Bold = true
	Button_EspPlayer_Main_ButtonEspPlayer.TextScaled = true

	Button_EspPlayer_Main_ButtonEspPlayer.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

	Button_EspPlayer_Main_ButtonEspPlayer.TextStrokeTransparency = 0
	Button_EspPlayer_Main_ButtonEspPlayer.Text = "Esp Player: " .. tostring(Is_Esp_Player)

	Button_EspPlayer_Main_ButtonEspPlayer.Parent = Main_ButtonEspPlayer_ScrollFrame

	Button_EspPlayer_Main_ButtonEspPlayer.MouseButton1Click:Connect(function()
		Is_Esp_Player = not Is_Esp_Player

		--	print("Is_Player_Speed: " .. tostring(Is_Player_Speed))
		
		Button_EspPlayer_Main_ButtonEspPlayer.Text = "Esp Player: " .. tostring(Is_Esp_Player)
		
		print(Is_Esp_Player)
	end)

	local UIARC_Main_ButtonFly = Instance.new("UIAspectRatioConstraint")
	UIARC_Main_ButtonFly.AspectRatio = 2.114
	UIARC_Main_ButtonFly.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_Main_ButtonFly.DominantAxis = Enum.DominantAxis.Width
	UIARC_Main_ButtonFly.Parent = Button_Fly_Main_ButtonFly
end






local Main_ButtonTeleportUp_ScrollFrame = Instance.new("Frame")

Main_ButtonTeleportUp_ScrollFrame.BorderSizePixel = 0
Main_ButtonTeleportUp_ScrollFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)

Main_ButtonTeleportUp_ScrollFrame.Size = UDim2.new(0.8, 0,0.15, 0)
Main_ButtonTeleportUp_ScrollFrame.Position = UDim2.new(0.099, 0,0.535, 0)

Main_ButtonTeleportUp_ScrollFrame.Parent = ScrollFrame

local Button_TeleportUp_Main_ButtonTeleportUp:TextButton = nil
local TextBox_HowManyTeleportUp_Main_ButtonTeleportUp:TextBox = nil

if Main_ButtonTeleportUp_ScrollFrame then -- settings button

	local UIARC_Main_ButtonTeleportUp = Instance.new("UIAspectRatioConstraint")
	UIARC_Main_ButtonTeleportUp.AspectRatio = 3.27
	UIARC_Main_ButtonTeleportUp.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_Main_ButtonTeleportUp.DominantAxis = Enum.DominantAxis.Width
	UIARC_Main_ButtonTeleportUp.Parent = Main_ButtonTeleportUp_ScrollFrame

	Button_TeleportUp_Main_ButtonTeleportUp = Instance.new("TextButton")

	Button_TeleportUp_Main_ButtonTeleportUp.Size = UDim2.new(0.22, 0,0.7, 0)
	Button_TeleportUp_Main_ButtonTeleportUp.Position = UDim2.new(0.035, 0,0.152, 0)

	Button_TeleportUp_Main_ButtonTeleportUp.BackgroundColor3 = Color3.fromRGB(144, 144, 144)
	Button_TeleportUp_Main_ButtonTeleportUp.BorderSizePixel = 0

	Button_TeleportUp_Main_ButtonTeleportUp.TextColor3 = Color3.fromRGB(255, 255, 255)

	Button_TeleportUp_Main_ButtonTeleportUp.FontFace.Bold = true
	Button_TeleportUp_Main_ButtonTeleportUp.TextScaled = true

	Button_TeleportUp_Main_ButtonTeleportUp.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

	Button_TeleportUp_Main_ButtonTeleportUp.TextStrokeTransparency = 0
	Button_TeleportUp_Main_ButtonTeleportUp.Text = "Teleport Up"

	Button_TeleportUp_Main_ButtonTeleportUp.Parent = Main_ButtonTeleportUp_ScrollFrame

	Button_TeleportUp_Main_ButtonTeleportUp.MouseButton1Click:Connect(function()
		Hrp.CFrame = Hrp.CFrame * CFrame.new(0,HowMany_TeleportUp,0)
	end)
	

	local UIARC_Main_ButtonTeleportUp = Instance.new("UIAspectRatioConstraint")
	UIARC_Main_ButtonTeleportUp.AspectRatio = 1.028
	UIARC_Main_ButtonTeleportUp.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_Main_ButtonTeleportUp.DominantAxis = Enum.DominantAxis.Width
	UIARC_Main_ButtonTeleportUp.Parent = Button_TeleportUp_Main_ButtonTeleportUp
	
	TextBox_HowManyTeleportUp_Main_ButtonTeleportUp = Instance.new("TextBox")

	TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.Size = UDim2.new(0.267, 0,0.548, 0)
	TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.Position = UDim2.new(0.678, 0,0.228, 0)

	TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.BackgroundColor3 = Color3.fromRGB(144, 144, 144)
	TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.BorderSizePixel = 0

	TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.TextColor3 = Color3.fromRGB(255, 255, 255)

	TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.FontFace.Bold = true
	TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.TextScaled = true

	TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

	TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.TextStrokeTransparency = 0
	TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.Text = tostring(Humanoid.WalkSpeed)

	TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.Parent = Main_ButtonTeleportUp_ScrollFrame

	local UIARC_TextBox_HowManyTeleportUp = Instance.new("UIAspectRatioConstraint")
	UIARC_TextBox_HowManyTeleportUp.AspectRatio = 1.59
	UIARC_TextBox_HowManyTeleportUp.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_TextBox_HowManyTeleportUp.DominantAxis = Enum.DominantAxis.Width
	UIARC_TextBox_HowManyTeleportUp.Parent = TextBox_HowManyTeleportUp_Main_ButtonTeleportUp


	TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.FocusLost:Connect(function(EnterPressed)
		if EnterPressed then
			HowMany_TeleportUp = tonumber(TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.Text) or 0
			
			TextBox_HowManyTeleportUp_Main_ButtonTeleportUp.Text = tostring(HowMany_TeleportUp)
			
			print(HowMany_TeleportUp)
		end
	end)
end





local Main_ButtonTeleportDirectly_ScrollFrame = Instance.new("Frame")

Main_ButtonTeleportDirectly_ScrollFrame.BorderSizePixel = 0
Main_ButtonTeleportDirectly_ScrollFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)

Main_ButtonTeleportDirectly_ScrollFrame.Size = UDim2.new(0.8, 0,0.15, 0)
Main_ButtonTeleportDirectly_ScrollFrame.Position = UDim2.new(0.099, 0,0.665, 0)

Main_ButtonTeleportDirectly_ScrollFrame.Parent = ScrollFrame

local Button_TeleportDirectly_Main_ButtonDirectly:TextButton = nil
local TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly:TextBox = nil

if Main_ButtonTeleportDirectly_ScrollFrame then -- settings button

	local UIARC_Main_ButtonTeleportDirectly = Instance.new("UIAspectRatioConstraint")
	UIARC_Main_ButtonTeleportDirectly.AspectRatio = 3.27
	UIARC_Main_ButtonTeleportDirectly.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_Main_ButtonTeleportDirectly.DominantAxis = Enum.DominantAxis.Width
	UIARC_Main_ButtonTeleportDirectly.Parent = Main_ButtonTeleportDirectly_ScrollFrame

	Button_TeleportDirectly_Main_ButtonDirectly = Instance.new("TextButton")

	Button_TeleportDirectly_Main_ButtonDirectly.Size = UDim2.new(0.22, 0,0.7, 0)
	Button_TeleportDirectly_Main_ButtonDirectly.Position = UDim2.new(0.035, 0,0.152, 0)

	Button_TeleportDirectly_Main_ButtonDirectly.BackgroundColor3 = Color3.fromRGB(144, 144, 144)
	Button_TeleportDirectly_Main_ButtonDirectly.BorderSizePixel = 0

	Button_TeleportDirectly_Main_ButtonDirectly.TextColor3 = Color3.fromRGB(255, 255, 255)

	Button_TeleportDirectly_Main_ButtonDirectly.FontFace.Bold = true
	Button_TeleportDirectly_Main_ButtonDirectly.TextScaled = true

	Button_TeleportDirectly_Main_ButtonDirectly.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

	Button_TeleportDirectly_Main_ButtonDirectly.TextStrokeTransparency = 0
	Button_TeleportDirectly_Main_ButtonDirectly.Text = "Teleport Directly"

	Button_TeleportDirectly_Main_ButtonDirectly.Parent = Main_ButtonTeleportDirectly_ScrollFrame

	Button_TeleportDirectly_Main_ButtonDirectly.MouseButton1Click:Connect(function()
		Hrp.CFrame = Hrp.CFrame * CFrame.new(0,0,-HowMany_TeleportDirectly)
	end)


	local UIARC_Main_ButtonTeleportDirectly = Instance.new("UIAspectRatioConstraint")
	UIARC_Main_ButtonTeleportDirectly.AspectRatio = 1.028
	UIARC_Main_ButtonTeleportDirectly.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_Main_ButtonTeleportDirectly.DominantAxis = Enum.DominantAxis.Width
	UIARC_Main_ButtonTeleportDirectly.Parent = Button_TeleportDirectly_Main_ButtonDirectly

	TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly = Instance.new("TextBox")

	TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.Size = UDim2.new(0.267, 0,0.548, 0)
	TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.Position = UDim2.new(0.678, 0,0.228, 0)

	TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.BackgroundColor3 = Color3.fromRGB(144, 144, 144)
	TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.BorderSizePixel = 0

	TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.TextColor3 = Color3.fromRGB(255, 255, 255)

	TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.FontFace.Bold = true
	TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.TextScaled = true

	TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

	TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.TextStrokeTransparency = 0
	TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.Text = tostring(Humanoid.WalkSpeed)

	TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.Parent = Main_ButtonTeleportDirectly_ScrollFrame

	local UIARC_TextBox_HowManyTeleportDirectly = Instance.new("UIAspectRatioConstraint")
	UIARC_TextBox_HowManyTeleportDirectly.AspectRatio = 1.59
	UIARC_TextBox_HowManyTeleportDirectly.AspectType = Enum.AspectType.FitWithinMaxSize
	UIARC_TextBox_HowManyTeleportDirectly.DominantAxis = Enum.DominantAxis.Width
	UIARC_TextBox_HowManyTeleportDirectly.Parent = TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly


	TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.FocusLost:Connect(function(EnterPressed)
		if EnterPressed then
			HowMany_TeleportDirectly = tonumber(TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.Text) or 0

			TextBox_HowManyTeleportDirectly_Main_ButtonTeleportDirectly.Text = tostring(HowMany_TeleportDirectly)

		--	print(HowMany_TeleportDirectly)
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
	--	print(IsDrag)
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
	
	
	
	if not Hrp or not Humanoid or not Character then return end
	
	if Is_Player_Speed then
		Humanoid.WalkSpeed = Speed_Player
	else
		Humanoid.WalkSpeed = Default_Speed_Player
	end
	
	if Is_Noclip_Player then
		for i,v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	else 
		for i,v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
				v.CanCollide = false
			else
				if v:IsA("BasePart") and v.Name == "HumanoidRootPart" then
					v.CanCollide = true
				end
			end
		end
	end
	
	if Is_Esp_Player then
		for i,v in pairs(Players:GetPlayers()) do
			if v ~= LocalPlayer then
				local CharOther = v.Character or v.CharacterAdded:Wait()
				
				if not CharOther then return end
				
				local Find_HightLight = CharOther:FindFirstChild("HightLightHacks")
				
				if CharOther and not Find_HightLight then
					local HightLight = Instance.new("Highlight")
					HightLight.Name = "HightLightHacks"
					HightLight.FillTransparency = 0
					HightLight.Enabled = true
					HightLight.FillColor = Color3.fromRGB(255, 0, 4)
					HightLight.OutlineTransparency = 0
					HightLight.FillTransparency = 0.56
					HightLight.OutlineColor = Color3.fromRGB(255, 0, 4)
					HightLight.Parent = CharOther
			--		print("Added to: " .. v.Name)
				end
			end
		end
	else 
		if not Is_Esp_Player then
			for i,v in ipairs(Players:GetPlayers()) do
				if v ~= LocalPlayer then
					local CharOther = v.Character or v.CharacterAdded:Wait()
					
					if not CharOther then return end
					
					local Find_HightLight = CharOther:FindFirstChild("HightLightHacks")

					if CharOther and Find_HightLight then
						Find_HightLight:Destroy()
				--		print("Deleted to: " .. v.Name)
					end
				end
			end
		end
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


task.spawn(function()
	while task.wait() do
		if Is_Player_Fly then
			Part_Fly.CFrame = Hrp.CFrame * CFrame.new(0,-3.2,0)
		end
	end
end)

-- credit delovoi_chelovek007 11
