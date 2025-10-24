local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local LocalPlayer = nil
local Character = nil
local Humanoid:Humanoid = nil
local Hrp:BasePart = nil

local SecondTween = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local SecondTweenGold = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local Is_Fly = false
local Is_Auto_Halloween = false
local Is_Auto_Gold = false

local SpeedPlayer = 30
local Delay_Start = 3
local Delay_Tween = 4.01

local PositionHomes = {
	Vector3.new(-255, 26, -291),
	Vector3.new(-313,26,124),
	Vector3.new(-361, 26,81),
	Vector3.new(183,26,825),
	Vector3.new(273,26,794),
	Vector3.new(216,26,483),
	Vector3.new(280,26,453),
	Vector3.new(253,26,142),
	Vector3.new(-237,24,-359),
	Vector3.new(164,26,-290),
	Vector3.new(292,25,-230),
	Vector3.new(-414,26,117),
	Vector3.new(325,26,486),
	Vector3.new(-354,26,473),
	Vector3.new(-326,26,-237),
	Vector3.new(-355,26,472),
	Vector3.new(-359,26,81),
	Vector3.new(283,26,451),
	Vector3.new(193,26,99),
	Vector3.new(350,26,123),
	Vector3.new(-358,26,82),
	Vector3.new(-297,26,439),
	Vector3.new(-313,26,797),
}


local PartFly:BasePart = nil


LocalPlayer = Players.LocalPlayer

task.wait(Delay_Start)

if not LocalPlayer then return end


local ScreenUI = Instance.new("ScreenGui")
ScreenUI.ResetOnSpawn = false
ScreenUI.Name = "BuildABoatScriptUI"
ScreenUI.Parent = LocalPlayer.PlayerGui


local ButtonIsFly = Instance.new("TextButton")
ButtonIsFly.Size = UDim2.new(0.061, 0,0.116, 0)
ButtonIsFly.Position = UDim2.new(0.074, 0,0.505, 0)

ButtonIsFly.BackgroundColor3 = Color3.fromRGB(57, 146, 255)
ButtonIsFly.BorderColor3 = Color3.fromRGB(44, 118, 202)
ButtonIsFly.BorderSizePixel = 3

ButtonIsFly.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonIsFly.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

ButtonIsFly.TextStrokeTransparency = 0

ButtonIsFly.TextScaled = true

ButtonIsFly.Text = "Fly: " .. tostring(Is_Fly)

local UIRatioCButtonIsFly = Instance.new("UIAspectRatioConstraint")
UIRatioCButtonIsFly.AspectRatio = 1.025
UIRatioCButtonIsFly.AspectType = Enum.AspectType.FitWithinMaxSize
UIRatioCButtonIsFly.DominantAxis = Enum.DominantAxis.Width
UIRatioCButtonIsFly.Parent = ButtonIsFly


local ButtonSpeed = Instance.new("TextBox")
ButtonSpeed.Size = UDim2.new(0.061, 0,0.116, 0)
ButtonSpeed.Position = UDim2.new(0.074, 0,0.36, 0)

ButtonSpeed.BackgroundColor3 = Color3.fromRGB(57, 146, 255)
ButtonSpeed.BorderColor3 = Color3.fromRGB(44, 118, 202)
ButtonSpeed.BorderSizePixel = 3

ButtonSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonSpeed.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

ButtonSpeed.TextStrokeTransparency = 0

ButtonSpeed.TextScaled = true

ButtonSpeed.Text = tostring(SpeedPlayer)

local UIRatioCButtonSpeed = Instance.new("UIAspectRatioConstraint")
UIRatioCButtonSpeed.AspectRatio = 1.025
UIRatioCButtonSpeed.AspectType = Enum.AspectType.FitWithinMaxSize
UIRatioCButtonSpeed.DominantAxis = Enum.DominantAxis.Width
UIRatioCButtonSpeed.Parent = ButtonSpeed


local ButtonAutoBuildABoatHalloween = Instance.new("TextButton")
ButtonAutoBuildABoatHalloween.Size = UDim2.new(0.061, 0,0.116, 0)
ButtonAutoBuildABoatHalloween.Position = UDim2.new(0.074, 0,0.217, 0)

ButtonAutoBuildABoatHalloween.BackgroundColor3 = Color3.fromRGB(57, 146, 255)
ButtonAutoBuildABoatHalloween.BorderColor3 = Color3.fromRGB(44, 118, 202)
ButtonAutoBuildABoatHalloween.BorderSizePixel = 3

ButtonAutoBuildABoatHalloween.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonAutoBuildABoatHalloween.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

ButtonAutoBuildABoatHalloween.TextStrokeTransparency = 0

ButtonAutoBuildABoatHalloween.TextScaled = true

ButtonAutoBuildABoatHalloween.Text = "Auto Collect Home: " .. tostring(Is_Auto_Halloween)

local UIRatioCButtonAutoBuildABoatHalloween = Instance.new("UIAspectRatioConstraint")
UIRatioCButtonAutoBuildABoatHalloween.AspectRatio = 1.025
UIRatioCButtonAutoBuildABoatHalloween.AspectType = Enum.AspectType.FitWithinMaxSize
UIRatioCButtonAutoBuildABoatHalloween.DominantAxis = Enum.DominantAxis.Width
UIRatioCButtonAutoBuildABoatHalloween.Parent = ButtonAutoBuildABoatHalloween


local ButtonAutoBuildABoatGold = Instance.new("TextButton")
ButtonAutoBuildABoatGold.Size = UDim2.new(0.061, 0,0.116, 0)
ButtonAutoBuildABoatGold.Position = UDim2.new(0.074, 0,0.08, 0)

ButtonAutoBuildABoatGold.BackgroundColor3 = Color3.fromRGB(57, 146, 255)
ButtonAutoBuildABoatGold.BorderColor3 = Color3.fromRGB(44, 118, 202)
ButtonAutoBuildABoatGold.BorderSizePixel = 3

ButtonAutoBuildABoatGold.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonAutoBuildABoatGold.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

ButtonAutoBuildABoatGold.TextStrokeTransparency = 0

ButtonAutoBuildABoatGold.TextScaled = true

ButtonAutoBuildABoatGold.Text = "Auto Collect Gold: " .. tostring(Is_Auto_Gold)

local UIRatioCButtonAutoBuildABoatGold = Instance.new("UIAspectRatioConstraint")
UIRatioCButtonAutoBuildABoatGold.AspectRatio = 1.025
UIRatioCButtonAutoBuildABoatGold.AspectType = Enum.AspectType.FitWithinMaxSize
UIRatioCButtonAutoBuildABoatGold.DominantAxis = Enum.DominantAxis.Width
UIRatioCButtonAutoBuildABoatGold.Parent = ButtonAutoBuildABoatGold

ButtonIsFly.Parent = ScreenUI
ButtonSpeed.Parent = ScreenUI
ButtonAutoBuildABoatGold.Parent = ScreenUI
ButtonAutoBuildABoatHalloween.Parent = ScreenUI

ButtonIsFly.MouseButton1Click:Connect(function()
	Is_Fly = not Is_Fly
	ButtonIsFly.Text = "Fly: " .. tostring(Is_Fly)
	
	if Is_Fly then
		PartFly = Instance.new("Part")
		PartFly.Size = Vector3.new(5, 0.4, 5)
		PartFly.Parent = workspace
	else 
		if PartFly then
			PartFly:Destroy()
		end
		PartFly = nil
	end
end)

ButtonSpeed.FocusLost:Connect(function(EnterPressed)
	LocalPlayer = Players.LocalPlayer
	Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	Humanoid = Character:WaitForChild("Humanoid")

	if Humanoid and EnterPressed then
		SpeedPlayer = tonumber(ButtonSpeed.Text)
		Humanoid.WalkSpeed = SpeedPlayer or 60
	end
end)

ButtonAutoBuildABoatHalloween.MouseButton1Click:Connect(function()
	Is_Auto_Halloween = not Is_Auto_Halloween
	ButtonAutoBuildABoatHalloween.Text = "Auto Collect Home: " .. tostring(Is_Auto_Halloween)
	
	task.spawn(function()
		while Is_Auto_Halloween do
			if not Is_Auto_Halloween then
				break
			end
			
			Hrp = Character:WaitForChild("HumanoidRootPart")
			
			local RandomIndex = math.random(1, #PositionHomes)
			local Tween = TweenService:Create(Hrp, SecondTween, {CFrame = CFrame.new(PositionHomes[RandomIndex])})
			Tween:Play()
			
			wait(2)
		end
	end)
end)

ButtonAutoBuildABoatGold.MouseButton1Click:Connect(function()
	Is_Auto_Gold = not Is_Auto_Gold
	ButtonAutoBuildABoatGold.Text = "Auto Collect Gold: " .. tostring(Is_Auto_Gold)
	
	task.spawn(function()
		while Is_Auto_Gold do
			if not Is_Auto_Gold then
				break
			end
			
			local TweenGold = TweenService:Create(Hrp, SecondTweenGold, {CFrame = CFrame.new(Vector3.new(-44,15,672))})
			TweenGold:Play()
			
			task.wait(Delay_Tween)
			
			TweenGold = TweenService:Create(Hrp, SecondTweenGold, {CFrame = CFrame.new(Vector3.new(-66,40,7802))})
			TweenGold:Play()
			
			task.wait(Delay_Tween)
			
			TweenGold = TweenService:Create(Hrp, SecondTweenGold, {CFrame = CFrame.new(Vector3.new(-57,41,8658))})
			TweenGold:Play()

			task.wait(Delay_Tween)
			
			TweenGold = TweenService:Create(Hrp, SecondTweenGold, {CFrame = CFrame.new(Vector3.new(-53,361,9490))})
			TweenGold:Play()

			task.wait(13)
		end
	end)
end)


RunService.RenderStepped:Connect(function()
	LocalPlayer = Players.LocalPlayer
	Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	Humanoid = Character:FindFirstChild("Humanoid")
	Hrp = Character:FindFirstChild("HumanoidRootPart")
	
	if Is_Fly and PartFly then
		PartFly.CFrame = Hrp.CFrame * CFrame.new(0,-3,0)
	end
	
	if Humanoid then
		Humanoid.WalkSpeed = SpeedPlayer or 60
	end
end)
