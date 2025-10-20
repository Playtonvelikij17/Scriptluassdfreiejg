local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local PositionButtonFly = UDim2.new(0.136, 0,0.311, 0)
local PositionButtonTeleport = UDim2.new(0.136, 0,0.43, 0)
local PositionButtonSpeed = UDim2.new(0.136, 0,0.198, 0)
local PositionButtonTeleportDirectly = UDim2.new(0.136, 0,0.546, 0)
local PositionButtonMoreOptions = UDim2.new(0.136, 0,0.084, 0)


local SizeButton = UDim2.new(0.051, 0,0.121, 0)

local TeleportUpNumber = 100
local TeleportDirectlyNumber = -20
local SpeedPlayer = 25

local Second_To_CreateUI = 3


local IsFly = false
local IsEspPlayer = false


local Player = nil
local Character = nil
local Humanoid:Humanoid = nil
local Hrp:BasePart = nil
local PartFly:BasePart = nil

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
		ButtonFly.Size = SizeButton
		ButtonFly.BackgroundColor3 = Color3.fromRGB(84, 84, 84)

		ButtonFly.Position = PositionButtonFly
		ButtonFly.BorderSizePixel = 3

		ButtonFly.TextStrokeTransparency = 0
		ButtonFly.TextColor3 = Color3.fromRGB(255, 255, 255)
		ButtonFly.TextScaled = true

		ButtonFly.Text = "Fly: " .. tostring(IsFly)

		local ButtonTeleport = Instance.new("TextButton")
		ButtonTeleport.Size = SizeButton
		ButtonTeleport.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
		ButtonTeleport.Position = PositionButtonTeleport

		ButtonTeleport.TextStrokeTransparency = 0
		ButtonTeleport.TextColor3 = Color3.fromRGB(255, 255, 255)
		ButtonTeleport.TextScaled = true
		ButtonTeleport.BorderSizePixel = 3

		ButtonTeleport.Text = "Teleport Up"

		local TextBoxSpeed = Instance.new("TextBox")
		TextBoxSpeed.Size = SizeButton
		TextBoxSpeed.Position = PositionButtonSpeed
		TextBoxSpeed.BackgroundColor3 = Color3.fromRGB(84, 84, 84)

		TextBoxSpeed.TextStrokeTransparency = 0
		TextBoxSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBoxSpeed.TextScaled = true
		TextBoxSpeed.BorderSizePixel = 3

		TextBoxSpeed.Text = "Speed"

		local ButtonTeleportdirectly = Instance.new("TextButton")
		ButtonTeleportdirectly.Size = SizeButton
		ButtonTeleportdirectly.Position = PositionButtonTeleportDirectly
		ButtonTeleportdirectly.BackgroundColor3 = Color3.fromRGB(84, 84, 84)

		ButtonTeleportdirectly.TextStrokeTransparency = 0
		ButtonTeleportdirectly.TextColor3 = Color3.fromRGB(255, 255, 255)
		ButtonTeleportdirectly.TextScaled = true
		ButtonTeleportdirectly.BorderSizePixel = 3

		ButtonTeleportdirectly.Text = "Teleport directly"
		
		
		local ButtonMoreOptions = Instance.new("TextButton")
		ButtonMoreOptions.Size = SizeButton
		ButtonMoreOptions.Position = PositionButtonMoreOptions
		ButtonMoreOptions.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
		
		ButtonMoreOptions.TextStrokeTransparency = 0
		ButtonMoreOptions.TextColor3 = Color3.fromRGB(255, 255, 255)
		ButtonMoreOptions.TextScaled = true
		ButtonMoreOptions.BorderSizePixel = 3
		
		ButtonMoreOptions.Text = "More Options"
		
		
		
		
		
		local MainOptions = Instance.new("Frame")
		
		MainOptions.Size = UDim2.new(0.358, 0,0.578, 0)
		MainOptions.Position = UDim2.new(0.321, 0,0.211, 0)
		MainOptions.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
		MainOptions.BorderSizePixel = 3
		MainOptions.Visible = false
		
		MainOptions.Parent = ScreenGui
		
		
		local ButtonEspPlayer = Instance.new("TextButton")
		ButtonEspPlayer.Size = UDim2.new(0.16, 0,0.198, 0)
		ButtonEspPlayer.Position = UDim2.new(0.023, 0,0.228, 0)
		ButtonEspPlayer.BackgroundColor3 = Color3.fromRGB(103,103,103)
		ButtonEspPlayer.TextStrokeTransparency = 0
		ButtonEspPlayer.TextColor3 = Color3.fromRGB(255, 255, 255)
		ButtonEspPlayer.TextScaled = true
		ButtonEspPlayer.BorderSizePixel = 3
		
		ButtonEspPlayer.Text = "Esp Player: " .. tostring(IsEspPlayer)
		
		
		
		
		local ButtonHidePlayer = Instance.new("TextButton")
		ButtonHidePlayer.Size = UDim2.new(0.16, 0,0.198, 0)
		ButtonHidePlayer.Position = UDim2.new(0.23, 0,0.228, 0)
		ButtonHidePlayer.BackgroundColor3 = Color3.fromRGB(103,103,103)
		ButtonHidePlayer.TextStrokeTransparency = 0
		ButtonHidePlayer.TextColor3 = Color3.fromRGB(255, 255, 255)
		ButtonHidePlayer.TextScaled = true
		ButtonHidePlayer.BorderSizePixel = 3

		ButtonHidePlayer.Text = "More info Coming Soon!"
		
		
		
		local TextLabelOptionsUp = Instance.new("TextLabel")
		TextLabelOptionsUp.Size = UDim2.new(1, 0,0.2, 0)
		TextLabelOptionsUp.Position = UDim2.new(0, 0,0, 0)
		TextLabelOptionsUp.BorderSizePixel = 0
		TextLabelOptionsUp.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
		TextLabelOptionsUp.TextStrokeTransparency = 0
		TextLabelOptionsUp.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabelOptionsUp.TextScaled = true
		TextLabelOptionsUp.Text = "Main Options (TEST)"


		TextLabelOptionsUp.Parent = MainOptions
		
		

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
		
		local UIAspectRatioConstraint5 = Instance.new("UIAspectRatioConstraint")

		UIAspectRatioConstraint5.AspectType = Enum.AspectType.FitWithinMaxSize
		UIAspectRatioConstraint5.DominantAxis = Enum.DominantAxis.Width
		UIAspectRatioConstraint5.AspectRatio = 1.073

		UIAspectRatioConstraint5.Parent = ButtonMoreOptions
		
		
		
		
		local UIARCMainOptionsTextLabel1 = Instance.new("UIAspectRatioConstraint")

		UIARCMainOptionsTextLabel1.AspectType = Enum.AspectType.FitWithinMaxSize
		UIARCMainOptionsTextLabel1.DominantAxis = Enum.DominantAxis.Width
		UIARCMainOptionsTextLabel1.AspectRatio = 6.085

		UIARCMainOptionsTextLabel1.Parent = TextLabelOptionsUp
		
		
		
		
		local UIAspectRatioConstraintMainOptions = Instance.new("UIAspectRatioConstraint")

		UIAspectRatioConstraintMainOptions.AspectType = Enum.AspectType.FitWithinMaxSize
		UIAspectRatioConstraintMainOptions.DominantAxis = Enum.DominantAxis.Width
		UIAspectRatioConstraintMainOptions.AspectRatio = 1.227

		UIAspectRatioConstraintMainOptions.Parent = MainOptions
		
		
		
		local UIARCMainOptionsButtonHideNick = Instance.new("UIAspectRatioConstraint")

		UIARCMainOptionsButtonHideNick.AspectType = Enum.AspectType.FitWithinMaxSize
		UIARCMainOptionsButtonHideNick.DominantAxis = Enum.DominantAxis.Width
		UIARCMainOptionsButtonHideNick.AspectRatio = 0.986

		UIARCMainOptionsButtonHideNick.Parent = ButtonEspPlayer
		
		
		
		local UIARCMainOptionsButtonHidePlayer = Instance.new("UIAspectRatioConstraint")

		UIARCMainOptionsButtonHidePlayer.AspectType = Enum.AspectType.FitWithinMaxSize
		UIARCMainOptionsButtonHidePlayer.DominantAxis = Enum.DominantAxis.Width
		UIARCMainOptionsButtonHidePlayer.AspectRatio = 0.986

		UIARCMainOptionsButtonHidePlayer.Parent = ButtonHidePlayer
		
		

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
		
		ButtonMoreOptions.MouseButton1Click:Connect(function()
			MainOptions.Visible = not MainOptions.Visible
		end)
		
		
		ButtonEspPlayer.MouseButton1Click:Connect(function()
			if not IsEspPlayer then
				IsEspPlayer = true
				ButtonEspPlayer.Text = "ESP Player: " .. tostring(IsEspPlayer)
				
				for i,player in pairs(Players:GetPlayers()) do
					local OtherChar = player.Character
					local OtherHrp:BasePart = OtherChar:FindFirstChild("HumanoidRootPart")
					
					if OtherChar.Name ~= Player.Character.Name then
						local HightLight = Instance.new("Highlight")
						HightLight.Name = "EspHightLight"
						HightLight.OutlineColor = Color3.fromRGB(255, 0, 4)
						HightLight.FillTransparency = 0.5
						HightLight.FillColor = Color3.fromRGB(255, 0, 4)

						HightLight.Parent = OtherChar
					end
				end
			elseif IsEspPlayer then
				IsEspPlayer = false
				ButtonEspPlayer.Text = "ESP Player: " .. tostring(IsEspPlayer)
				
				for i,player in pairs(Players:GetPlayers()) do
					local OtherChar = player.Character
					local OtherHrp:BasePart = OtherChar:FindFirstChild("HumanoidRootPart")
					local HightLight = OtherChar:FindFirstChild("EspHightLight")
					
					if HightLight then
						HightLight:Destroy()
					end
				end
			end
		end)
		


		ButtonFly.Parent = ScreenGui
		ButtonTeleport.Parent = ScreenGui
		TextBoxSpeed.Parent = ScreenGui
		ButtonTeleportdirectly.Parent = ScreenGui
		ButtonMoreOptions.Parent = ScreenGui
		
		ButtonEspPlayer.Parent = MainOptions
		ButtonHidePlayer.Parent = MainOptions
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
