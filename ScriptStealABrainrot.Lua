local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Duration_Start_Script = 2.5
local Device = nil

while task.wait() do
	if LocalPlayer.Character and UserInputService.TouchEnabled then
		Device = "Mobile"
		break
	else 
		Device = "PC"
		break
	end
end

task.wait(Duration_Start_Script)

--local UI = game:GetService("ReplicatedStorage").ScriptStealABrainrotUI:Clone()
local UI = game:GetObjects("rbxassetid://104514587943170")[1]
UI.Parent = LocalPlayer.PlayerGui

for i,v in pairs(UI:GetChildren()) do
	if v:IsA("Frame") then
		v.Visible = true
	end
end

StarterGui:SetCore("SendNotification", {Title = "Steal a brainrot script", Text = "Player is loaded!", Duration = 4.5})


local Character = LocalPlayer.Character
local Humanoid:Humanoid = Character:WaitForChild("Humanoid")

local IsJumpBoost = false
local IsDrag = false

local Default_JumpBoost = Humanoid.JumpHeight
local Jump_Boost = 18

local BackGround_TurnON = Color3.fromRGB(67, 222, 36)
local BackGround_TurnOFF = Color3.fromRGB(255, 52, 55)

local MainJumpBoost = script.Parent

local function JumpBoost()
	local ButtonTurnJumpBoost = MainJumpBoost:WaitForChild("ButtonTurnJumpBoost")
	local LabelTurn = ButtonTurnJumpBoost:WaitForChild("TextLabel")

	ButtonTurnJumpBoost.MouseButton1Click:Connect(function()
		IsJumpBoost = not IsJumpBoost

		if IsJumpBoost then
			LabelTurn.Text = "ON"
			ButtonTurnJumpBoost.BackgroundColor3 = BackGround_TurnON
		else 
			LabelTurn.Text = "OFF"
			ButtonTurnJumpBoost.BackgroundColor3 = BackGround_TurnOFF
		end
	end)

	MainJumpBoost.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 and Device == "PC" then
			IsDrag = true
			--	print("Drag " .. tostring(IsDrag) .. "!")
		elseif Input.UserInputType == Enum.UserInputType.Touch and Device == "Mobile" then
			IsDrag = true
			--	print("Drag " .. tostring(IsDrag) .. "!")
		end
	end)
end

JumpBoost()

UserInputService.InputEnded:Connect(function(Input, IsTyping)
	if IsTyping then return end

	if Input.UserInputType == Enum.UserInputType.MouseButton1 and IsDrag and Device == "PC" then
		IsDrag = false
		--	print("Drag " .. tostring(IsDrag) .. "!")
	elseif IsDrag and Device == "Mobile" then
		IsDrag = false
		--	print("Drag " .. tostring(IsDrag) .. "!")
	end
end)

RunService.RenderStepped:Connect(function()
	Character = LocalPlayer.Character
	Humanoid = Character:WaitForChild("Humanoid")

	if IsDrag and Device == "PC" then
		MainJumpBoost.Position = UDim2.new(0, Mouse.X - 50, 0, Mouse.Y - 23)
	else 
		if IsDrag and Device == "Mobile" then
			MainJumpBoost.Position = UDim2.new(0, Mouse.X - 25, 0, Mouse.Y - 15)
		end
	end

	if IsJumpBoost then
		Humanoid.JumpHeight = Jump_Boost
	else 
		Humanoid.JumpHeight = Default_JumpBoost
	end
end)

-- credit yoos
