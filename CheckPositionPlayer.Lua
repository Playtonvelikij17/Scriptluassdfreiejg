-- Check position player.lua

local Players = game:GetService("Players")
local Debris = game:GetService("Debris")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")

local LocalPlayer:Player = nil
local Character = nil
local Humanoid:Humanoid = nil
local Hrp:BasePart = nil


local IsDelay = false

local Delay_Start = 5


local function AddedUI()
	if LocalPlayer then
		local CheckPositionUI = Instance.new("ScreenGui")
		CheckPositionUI.ResetOnSpawn = false
		CheckPositionUI.Name = "CheckPositionUI"
		CheckPositionUI.Parent = LocalPlayer.PlayerGui
		
		local ButtonCheckPositionPlayer = Instance.new("TextButton")
		ButtonCheckPositionPlayer.Size = UDim2.new(0.06, 0,0.114, 0)
		ButtonCheckPositionPlayer.Position = UDim2.new(0.088, 0,0.3, 0)

		ButtonCheckPositionPlayer.BackgroundColor3 = Color3.fromRGB(57, 146, 255)
		ButtonCheckPositionPlayer.BorderColor3 = Color3.fromRGB(44, 118, 202)
		ButtonCheckPositionPlayer.BorderSizePixel = 3

		ButtonCheckPositionPlayer.TextColor3 = Color3.fromRGB(255, 255, 255)
		ButtonCheckPositionPlayer.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		
		ButtonCheckPositionPlayer.TextStrokeTransparency = 0

		ButtonCheckPositionPlayer.TextScaled = true
		
		ButtonCheckPositionPlayer.Text = "Start check position player"

		local UIARC = Instance.new("UIAspectRatioConstraint")
		UIARC.AspectRatio = 1.037
		UIARC.AspectType = Enum.AspectType.FitWithinMaxSize
		UIARC.DominantAxis = Enum.DominantAxis.Width

		UIARC.Parent = ButtonCheckPositionPlayer

		ButtonCheckPositionPlayer.Parent = CheckPositionUI
		
		ButtonCheckPositionPlayer.MouseButton1Click:Connect(function()
			if not IsDelay then
				IsDelay = true
				
				local SoundClick = Instance.new("Sound")
				SoundClick.Volume = 2
				SoundClick.SoundId = "rbxassetid://1673280232"
				SoundClick.Parent = SoundService

				SoundClick:Play()

				Debris:AddItem(SoundClick, 0.6)
				
				local PositionX = Hrp.Position.X
				local PositionY = Hrp.Position.Y
				local PositionZ = Hrp.Position.Z
				
				local FloorPositions = math.floor(PositionX) .. " " .. math.floor(PositionY) .. " " .. math.floor(PositionZ)

				local PositionTextBox = Instance.new("TextBox")
				PositionTextBox.ClearTextOnFocus = false
				PositionTextBox.Position = UDim2.new(0.12, 0,0.249, 0)
				PositionTextBox.Size = UDim2.new(0.9, 0,0.5, 0)
				PositionTextBox.BackgroundTransparency = 1
				PositionTextBox.TextStrokeTransparency = 0
				PositionTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				PositionTextBox.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				PositionTextBox.TextScaled = true
				PositionTextBox.Text = "Current player position: " .. tostring(FloorPositions)

				local UIARC1 = Instance.new("UIAspectRatioConstraint")
				UIARC1.AspectRatio = 3.522
				UIARC1.AspectType = Enum.AspectType.FitWithinMaxSize
				UIARC1.DominantAxis = Enum.DominantAxis.Width

				UIARC1.Parent = PositionTextBox
				PositionTextBox.Parent = CheckPositionUI
				
				Debris:AddItem(PositionTextBox, 5)
				
				task.delay(5.1, function()
					IsDelay = false
				end)
			end
		end)
	end
end

task.delay(Delay_Start, function()
	AddedUI()
end)


RunService.RenderStepped:Connect(function()
	LocalPlayer = Players.LocalPlayer
	Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	Humanoid = Character:FindFirstChild("Humanoid")
	Hrp = Character:FindFirstChild("HumanoidRootPart")
end)
