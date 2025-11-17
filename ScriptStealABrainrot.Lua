local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local Enabled_Mains = 3.5

while task.wait() do
	if LocalPlayer.Character then
		break
	end
end

--local UI = game:GetService("ReplicatedStorage").ScriptStealABrainrotUI:Clone()
local UI = game:GetObjects("rbxassetid://104514587943170")[1]
UI.Parent = LocalPlayer.PlayerGui

task.wait(Enabled_Mains)

for i,v in pairs(UI:GetChildren()) do
	if v:IsA("Frame") then
		v.Visible = true
	end
end

-- credit delovoi_chelovek007
