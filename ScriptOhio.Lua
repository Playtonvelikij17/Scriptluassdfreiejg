local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local IsFly = false
local PartFly:BasePart = nil

local PositionButtonFly = UDim2.new(0.136, 0,0.21, 0)
local PositionButtonTeleport = UDim2.new(0.136, 0,0.389, 0)
local PositionButtonSpeed = UDim2.new(0.136, 0,0.043, 0)
local PositionButtonTeleportDirectly = UDim2.new(0.136, 0,0.556, 0)

local TeleportUpNumber = 100
local TeleportDirectlyNumber = -20
local SpeedPlayer = 25

local Second_To_CreateUI = 3

local Player = nil
local Character = nil
local Humanoid:Humanoid = nil
local Hrp:BasePart = nil

local function Speed()
	local Player = Players.LocalPlayer
	local Character = Player.Character or Player.CharacterAdded:Wait()
	local Humanoid = Character:WaitForChild("Humanoid")
end

RunService.RenderStepped:Connect(function()
	Speed()
	
	Player = Players.LocalPlayer
	Character = Player.Character or Player.CharacterAdded:Wait()
	Humanoid = Character:FindFirstChild("Humanoid")
	Hrp = Character:FindFirstChild("HumanoidRootPart")
	
	Humanoid.WalkSpeed = SpeedPlayer
end)

local function AddedUI()
	if Player  then
		local PlayerGui = Player:FindFirstChild("PlayerGui")

		local ScreenGui = Instance.new("ScreenGui")
		ScreenGui.ResetOnSpawn = false
		ScreenGui.Parent = PlayerGui

		ScreenGui.Name = "SpeedHackGui"

		local ButtonFly = Instance.new("TextButton")
		ButtonFly.Size = UDim2.new(0.072, 0,0.133, 0)
		ButtonFly.BackgroundColor3 = Color3.fromRGB(84, 84, 84)

		ButtonFly.Position = PositionButtonFly
		ButtonFly.BorderSizePixel = 3

		ButtonFly.TextStrokeTransparency = 0
		ButtonFly.TextColor3 = Color3.fromRGB(255, 255, 255)
		ButtonFly.TextScaled = true

		ButtonFly.Text = "Fly: " .. tostring(IsFly)

		local ButtonTeleport = Instance.new("TextButton")
		ButtonTeleport.Size = UDim2.new(0.072, 0,0.133, 0)
		ButtonTeleport.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
		ButtonTeleport.Position = PositionButtonTeleport

		ButtonTeleport.TextStrokeTransparency = 0
		ButtonTeleport.TextColor3 = Color3.fromRGB(255, 255, 255)
		ButtonTeleport.TextScaled = true
		ButtonTeleport.BorderSizePixel = 3

		ButtonTeleport.Text = "Teleport Up"

		local TextBoxSpeed = Instance.new("TextBox")
		TextBoxSpeed.Size = UDim2.new(0.072, 0,0.133, 0)
		TextBoxSpeed.Position = PositionButtonSpeed
		TextBoxSpeed.BackgroundColor3 = Color3.fromRGB(84, 84, 84)

		TextBoxSpeed.TextStrokeTransparency = 0
		TextBoxSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBoxSpeed.TextScaled = true
		TextBoxSpeed.BorderSizePixel = 3

		TextBoxSpeed.Text = "Speed"

		local ButtonTeleportdirectly = Instance.new("TextButton")
		ButtonTeleportdirectly.Size = UDim2.new(0.072, 0,0.133, 0)
		ButtonTeleportdirectly.Position = PositionButtonTeleportDirectly
		ButtonTeleportdirectly.BackgroundColor3 = Color3.fromRGB(84, 84, 84)

		ButtonTeleportdirectly.TextStrokeTransparency = 0
		ButtonTeleportdirectly.TextColor3 = Color3.fromRGB(255, 255, 255)
		ButtonTeleportdirectly.TextScaled = true
		ButtonTeleportdirectly.BorderSizePixel = 3

		ButtonTeleportdirectly.Text = "Teleport directly"

		local UIAspectRatioConstraint1 = Instance.new("UIAspectRatioConstraint")

		UIAspectRatioConstraint1.AspectType = Enum.AspectType.FitWithinMaxSize
		UIAspectRatioConstraint1.DominantAxis = Enum.DominantAxis.Width
		UIAspectRatioConstraint1.AspectRatio = 1.073

		UIAspectRatioConstraint1.Parent = ButtonFly


		local UIAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")

		UIAspectRatioConstraint2.AspectType = Enum.AspectType.FitWithinMaxSize
		UIAspectRatioConstraint2.DominantAxis = Enum.DominantAxis.Width
		UIAspectRatioConstraint2.AspectRatio = 1.073

		UIAspectRatioConstraint2.Parent = ButtonTeleport

		local UIAspectRatioConstraint3 = Instance.new("UIAspectRatioConstraint")

		UIAspectRatioConstraint3.AspectType = Enum.AspectType.FitWithinMaxSize
		UIAspectRatioConstraint3.DominantAxis = Enum.DominantAxis.Width
		UIAspectRatioConstraint3.AspectRatio = 1.073

		UIAspectRatioConstraint3.Parent = TextBoxSpeed

		local UIAspectRatioConstraint4 = Instance.new("UIAspectRatioConstraint")

		UIAspectRatioConstraint4.AspectType = Enum.AspectType.FitWithinMaxSize
		UIAspectRatioConstraint4.DominantAxis = Enum.DominantAxis.Width
		UIAspectRatioConstraint4.AspectRatio = 1.073

		UIAspectRatioConstraint4.Parent = ButtonTeleportdirectly

		ButtonFly.MouseButton1Click:Connect(function()
			if not IsFly then
				IsFly = true
				ButtonFly.Text = "Fly: " .. tostring(IsFly)

				PartFly = Instance.new("Part")
				PartFly.Size = Vector3.new(6,0.5,6)
				PartFly.CFrame = Hrp.CFrame * CFrame.new(0,5,0)
				PartFly.Parent = workspace
			elseif IsFly then
				IsFly = false
				ButtonFly.Text = "Fly: " .. tostring(IsFly)

				if PartFly then
					PartFly:Destroy()
					PartFly = nil
				end
			end
		end)

		ButtonTeleport.MouseButton1Click:Connect(function()
			Hrp = Character:FindFirstChild("HumanoidRootPart")

			if Hrp then
				Hrp.CFrame = Hrp.CFrame * CFrame.new(0,TeleportUpNumber, 0)
			end
		end)

		TextBoxSpeed.FocusLost:Connect(function(EnterPressed)
			Humanoid = Character:FindFirstChild("Humanoid")

			if TextBoxSpeed.Text == "" then
				TextBoxSpeed.Text = "Speed"
			end

			if Humanoid and EnterPressed and TextBoxSpeed.Text ~= "" then
				SpeedPlayer = tonumber(TextBoxSpeed.Text)
				TextBoxSpeed.Text = "Speed: " .. tostring(TextBoxSpeed.Text)
			end
		end)

		ButtonTeleportdirectly.MouseButton1Click:Connect(function()
			Hrp = Character:FindFirstChild("HumanoidRootPart")

			if Hrp then
				Hrp.CFrame = Hrp.CFrame * CFrame.new(0,0,TeleportDirectlyNumber)
			end
		end)


		ButtonFly.Parent = ScreenGui
		ButtonTeleport.Parent = ScreenGui
		TextBoxSpeed.Parent = ScreenGui
		ButtonTeleportdirectly.Parent = ScreenGui
	else 
		warn("Player is not in the game")
	end
end

local function StartScript()
	task.wait(4)
	AddedUI()
end

StartScript()

RunService.RenderStepped:Connect(function()
	if IsFly and PartFly then
		local Player = Players.LocalPlayer
		local Character = Player.Character or Player.CharacterAdded:Wait()
		local Humanoid:Humanoid = Character:FindFirstChild("Humanoid")

		local Hrp:BasePart = Character:FindFirstChild("HumanoidRootPart")
		
		PartFly.CFrame = Hrp.CFrame * CFrame.new(0,-3,0)
	end
end)
