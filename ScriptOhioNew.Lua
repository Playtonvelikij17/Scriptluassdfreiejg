local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

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
local Is_Freeze_Player = false
local Is_Noclip_Player = false

local Delay_Start_Script = 2
local Default_Speed_Player = 25
local Speed_Player = 35

local HowMany_TeleportUp = 16
local HowMany_TeleportDirectly = 16


local Bind_Player_Fly = nil
local Bind_Player_Noclip = nil
local Bind_Esp_Player = nil
local Bind_Freeze_Player = nil

local Bind_Player_Speed = nil
local Bind_TeleportUp = nil
local Bind_TeleportDirectly = nil

local Current_Device = ""

local Part_Fly:BasePart = nil

local BackGroundClicked = Color3.fromRGB(109, 109, 109)
local BackGroundUnClicked = Color3.fromRGB(89, 89, 89)

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
	StarterGui:SetCore("SendNotification", {Title = "Ohio script", Text = "Player is loaded!", Duration = 3})
end

print("Player device: " .. Current_Device)

Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
Humanoid = Character:WaitForChild("Humanoid")
Hrp = Character:WaitForChild("HumanoidRootPart")


local ScriptHackUI = game:GetObjects("rbxassetid://100161377617296")[1]
--local ScriptHackUI = StarterGui:WaitForChild("ScriptOhioUI"):Clone()

ScriptHackUI.Parent = LocalPlayer.PlayerGui

local MainTouch = ScriptHackUI:WaitForChild("MainTouch")
local MainHack = MainTouch:WaitForChild("MainHack")

local Button_Open_MainHack = MainTouch:WaitForChild("ButtonOpenHack")

local ScrollMenu = MainHack:WaitForChild("ScrollMenu")
local ScrollSettings = MainHack:WaitForChild("ScrollSettings")

-- ScrollMenu
local MainFlyPlayer = ScrollMenu:WaitForChild("MainFlyPlayer")
local MainNNoclip = ScrollMenu:WaitForChild("MainNoclip")
local MainEspPlayer = ScrollMenu:WaitForChild("MainEspPlayer")
local MainFreezePlayer = ScrollMenu:WaitForChild("MainFreezePlayer")


local MainSpeed = ScrollMenu:WaitForChild("MainSpeed")
local MainTeleportUp = ScrollMenu:WaitForChild("MainTeleportUp")
local MainTeleportDirectly = ScrollMenu:WaitForChild("MainTeleportDirectly")
-- ScrollMenu


-- ScrollSettings
local MainBindFlyPlayer = ScrollSettings:WaitForChild("BindPlayerFly")
local MainBindNoclip = ScrollSettings:WaitForChild("BindNoclip")
local MainBindEspPlayer = ScrollSettings:WaitForChild("BindEspPlayer")
local MainBindFreezePlayer = ScrollSettings:WaitForChild("BindFreezePlayer")

local MainBindSpeed = ScrollSettings:WaitForChild("BindSpeed")
local MainBindTeleportUp = ScrollSettings:WaitForChild("BindTeleportUp")
local MainBindTeleportDirectly = ScrollSettings:WaitForChild("BindTeleportDirectly")

MainTouch.Visible = true

-- ScrollSettings
MainBindFlyPlayer.BoxFly.FocusLost:Connect(function(Enter)
	if Enter then


		if MainBindFlyPlayer.BoxFly.Text == "None" or MainBindFlyPlayer.BoxFly.Text == "" then
			Bind_Player_Fly = "RightControl"
			MainBindFlyPlayer.BoxFly.Text = "None"
			--	print("TextBox is None save bind to: RightControl")
			return
		end

		MainBindFlyPlayer.BoxFly.Text = string.upper(MainBindFlyPlayer.BoxFly.Text)

		Bind_Player_Fly = string.upper(MainBindFlyPlayer.BoxFly.Text)
	end

	if not Enter then
		if MainBindFlyPlayer.BoxFly.Text == "None" or MainBindFlyPlayer.BoxFly.Text == "" then
			Bind_Player_Fly = "RightControl"
			MainBindFlyPlayer.BoxFly.Text = "None"
			--		print("TextBox is None save bind to: RightControl")
		end
	end
end)


MainBindNoclip.BoxNoclip.FocusLost:Connect(function(Enter)
	if Enter then


		if MainBindNoclip.BoxNoclip.Text == "None" or MainBindNoclip.BoxNoclip.Text == "" then
			Bind_Player_Noclip = "RightControl"
			MainBindNoclip.BoxNoclip.Text = "None"
			--	print("TextBox is None save bind to: RightControl")
			return
		end

		MainBindNoclip.BoxNoclip.Text = string.upper(MainBindNoclip.BoxNoclip.Text)

		Bind_Player_Noclip = string.upper(MainBindNoclip.BoxNoclip.Text)
	end

	if not Enter then
		if MainBindNoclip.BoxNoclip.Text == "None" or MainBindNoclip.BoxNoclip.Text == "" then
			Bind_Player_Noclip = "RightControl"
			MainBindNoclip.BoxNoclip.Text = "None"
			--		print("TextBox is None save bind to: RightControl")
		end
	end
end)


MainBindEspPlayer.BoxEspPlayer.FocusLost:Connect(function(Enter)
	if Enter then


		if MainBindEspPlayer.BoxEspPlayer.Text == "None" or MainBindEspPlayer.BoxEspPlayer.Text == "" then
			Bind_Esp_Player = "RightControl"
			MainBindEspPlayer.BoxEspPlayer.Text = "None"
			--	print("TextBox is None save bind to: RightControl")
			return
		end

		MainBindEspPlayer.BoxEspPlayer.Text = string.upper(MainBindEspPlayer.BoxEspPlayer.Text)

		Bind_Esp_Player = string.upper(MainBindEspPlayer.BoxEspPlayer.Text)
	end

	if MainBindEspPlayer.BoxEspPlayer.Text == "None" or MainBindEspPlayer.BoxEspPlayer.Text == "" then
		Bind_Esp_Player = "RightControl"
		MainBindEspPlayer.BoxEspPlayer.Text = "None"
		--	print("TextBox is None save bind to: RightControl")
		return
	end
end)

MainBindFreezePlayer.BoxFreezePlayer.FocusLost:Connect(function(Enter)
	if Enter then


		if MainBindFreezePlayer.BoxFreezePlayer.Text == "None" or MainBindFreezePlayer.BoxFreezePlayer.Text == "" then
			Bind_Freeze_Player = "RightControl"
			MainBindFreezePlayer.BoxFreezePlayer.Text = "None"
			--	print("TextBox is None save bind to: RightControl")
			return
		end

		MainBindFreezePlayer.BoxFreezePlayer.Text = string.upper(MainBindFreezePlayer.BoxFreezePlayer.Text)

		Bind_Freeze_Player = string.upper(MainBindFreezePlayer.BoxFreezePlayer.Text)
	end

	if MainBindFreezePlayer.BoxFreezePlayer.Text == "None" or MainBindFreezePlayer.BoxFreezePlayer.Text == "" then
		Bind_Freeze_Player = "RightControl"
		MainBindEspPlayer.BoxEspPlayer.Text = "None"
		--	print("TextBox is None save bind to: RightControl")
		return
	end
end)
	

MainBindSpeed.BoxSpeed.FocusLost:Connect(function(Enter)
	if Enter then

		if MainBindSpeed.BoxSpeed.Text == "None" or MainBindSpeed.BoxSpeed.Text == "" then
			Bind_Player_Speed = "RightControl"
			MainBindSpeed.BoxSpeed.Text = "None"
			--	print("TextBox is None save bind to: RightControl")
			return
		end

		MainBindSpeed.BoxSpeed.Text = string.upper(MainBindSpeed.BoxSpeed.Text)

		Bind_Player_Speed = string.upper(MainBindSpeed.BoxSpeed.Text)
	end

	if not Enter then
		if MainBindSpeed.BoxSpeed.Text == "None" or MainBindSpeed.BoxSpeed.Text == "" then
			Bind_Player_Speed = "RightControl"
			MainBindSpeed.BoxSpeed.Text = "None"
			--		print("TextBox is None save bind to: RightControl")
		end
	end
end)


MainBindTeleportUp.BoxTeleportUp.FocusLost:Connect(function(Enter)
	if Enter then


		if MainBindTeleportUp.BoxTeleportUp.Text == "None" or MainBindTeleportUp.BoxTeleportUp.Text == "" then
			Bind_TeleportUp = "RightControl"
			MainBindTeleportUp.BoxTeleportUp.Text = "None"
			--	print("TextBox is None save bind to: RightControl")
			return
		end

		MainBindTeleportUp.BoxTeleportUp.Text = string.upper(MainBindTeleportUp.BoxTeleportUp.Text)

		Bind_TeleportUp = string.upper(MainBindTeleportUp.BoxTeleportUp.Text)
	end

	if not Enter then
		if MainBindTeleportUp.BoxTeleportUp.Text == "None" or MainBindTeleportUp.BoxTeleportUp.Text == "" then
			Bind_TeleportUp = "RightControl"
			MainBindTeleportUp.BoxTeleportUp.Text = "None"
			--		print("TextBox is None save bind to: RightControl")
		end
	end
end)


MainBindTeleportDirectly.BoxTeleportDirectly.FocusLost:Connect(function(Enter)
	if Enter then

		if MainBindTeleportDirectly.BoxTeleportDirectly.Text == "None" or MainBindTeleportDirectly.BoxTeleportDirectly.Text == "" then
			Bind_TeleportDirectly = "RightControl"
			MainBindTeleportDirectly.BoxTeleportDirectly.Text = "None"
			--		print("TextBox is None save bind to: RightControl")
			return
		end
		MainBindTeleportDirectly.BoxTeleportDirectly.Text = string.upper(MainBindTeleportDirectly.BoxTeleportDirectly.Text)

		Bind_TeleportDirectly = string.upper(MainBindTeleportDirectly.BoxTeleportDirectly.Text)
	end

	if not Enter then
		if MainBindTeleportDirectly.BoxTeleportDirectly.Text == "None" or MainBindTeleportDirectly.BoxTeleportDirectly.Text == "" then
			Bind_TeleportDirectly = "RightControl"
			MainBindTeleportDirectly.BoxTeleportDirectly.Text = "None"
			--		print("TextBox is None save bind to: RightControl")
		end
	end
end)





MainHack.ButtonSettings.MouseButton1Click:Connect(function()
	ScrollSettings.Visible = true
	ScrollMenu.Visible = false

	MainHack.ButtonSettings.BackgroundColor3 = BackGroundClicked
	MainHack.ButtonMenu.BackgroundColor3 = BackGroundUnClicked
end)

MainHack.ButtonMenu.MouseButton1Click:Connect(function()
	ScrollSettings.Visible = false
	ScrollMenu.Visible = true

	MainHack.ButtonSettings.BackgroundColor3 = BackGroundUnClicked
	MainHack.ButtonMenu.BackgroundColor3 = BackGroundClicked
end)


local function SystemButtons()
	MainFlyPlayer.ButtonFly.MouseButton1Click:Connect(function()
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
		MainFlyPlayer.ButtonFly.Text = "Player Fly: " .. tostring(Is_Player_Fly)
	end)
	
	
	
	MainNNoclip.ButtonNoclip.MouseButton1Click:Connect(function()
		Is_Noclip_Player = not Is_Noclip_Player

		--	print("Is_Player_Speed: " .. tostring(Is_Player_Speed))

		MainNNoclip.ButtonNoclip.Text = "Player Noclip: " .. tostring(Is_Noclip_Player)
	end)
	
	
	MainEspPlayer.ButtonEspPlayer.MouseButton1Click:Connect(function()
		Is_Esp_Player = not Is_Esp_Player

		MainEspPlayer.ButtonEspPlayer.Text = "Esp Player: " .. tostring(Is_Esp_Player)

	--	print(Is_Esp_Player)
	end)
	
	MainFreezePlayer.ButtonEspPlayer.MouseButton1Click:Connect(function()
		Is_Freeze_Player = not Is_Freeze_Player
		
		MainFreezePlayer.ButtonEspPlayer.Text = "Freeze Player: " .. tostring(Is_Freeze_Player)
	end)
	
	
	MainSpeed.ButtonSpeed.MouseButton1Click:Connect(function()
		Is_Player_Speed = not Is_Player_Speed

		--	print("Is_Player_Speed: " .. tostring(Is_Player_Speed))

		if Is_Player_Speed then
			Speed_Player = MainSpeed.BoxSpeed.Text

			MainSpeed.BoxSpeed.Text = tostring(Speed_Player)
		else
			if not Is_Player_Speed then
				Speed_Player = 16
				--	print("Speed_Player = 16!")
			end
		end
		MainSpeed.ButtonSpeed.Text = "Speed: " .. tostring(Is_Player_Speed)
	end)
	
	MainSpeed.BoxSpeed.FocusLost:Connect(function(EnterPressed)
		if EnterPressed and Is_Player_Speed then

			Speed_Player = MainSpeed.BoxSpeed.Text

			Humanoid.WalkSpeed = tonumber(Speed_Player) or 0

			MainSpeed.BoxSpeed.Text = tostring(Speed_Player)

			--	print("Speed Hum: " .. Humanoid.WalkSpeed .. " Speed_Player: " .. Speed_Player)
		end
	end)
	
	
	MainTeleportUp.ButtonTeleportUp.MouseButton1Click:Connect(function()
		Hrp.CFrame = Hrp.CFrame * CFrame.new(0,HowMany_TeleportUp,0)
	end)
	
	MainTeleportUp.BoxTeleportUp.FocusLost:Connect(function(EnterPressed)
		if EnterPressed then
			HowMany_TeleportUp = tonumber(MainTeleportUp.BoxTeleportUp.Text) or 0

			MainTeleportUp.BoxTeleportUp.Text = tostring(HowMany_TeleportUp)

			--	print(HowMany_TeleportUp)
		end
	end)
	
	
	MainTeleportDirectly.ButtonTeleportDirectly.MouseButton1Click:Connect(function()
		Hrp.CFrame = Hrp.CFrame * CFrame.new(0,0,-HowMany_TeleportDirectly)
	end)
	
	MainTeleportDirectly.BoxTeleportDirectly.FocusLost:Connect(function(EnterPressed)
		if EnterPressed then
			HowMany_TeleportDirectly = tonumber(MainTeleportDirectly.BoxTeleportDirectly.Text) or 0

			MainTeleportDirectly.BoxTeleportDirectly.Text = tostring(HowMany_TeleportDirectly)

			--	print(HowMany_TeleportDirectly)
		end
	end)
end


SystemButtons()


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


UserInputService.InputBegan:Connect(function(Input, IsTyping)
	if IsTyping then return end
	
	if Bind_Player_Fly and Input.KeyCode == Enum.KeyCode[Bind_Player_Fly] then
		Is_Player_Fly = not Is_Player_Fly
		
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
		
		MainFlyPlayer.ButtonFly.Text = "Player Fly: " .. tostring(Is_Player_Fly)
	elseif Bind_Player_Noclip and Input.KeyCode == Enum.KeyCode[Bind_Player_Noclip] then
		Is_Noclip_Player = not Is_Noclip_Player
		
		MainNNoclip.ButtonNoclip.Text = "Noclip Player: " .. tostring(Is_Noclip_Player)
	elseif Bind_Esp_Player and Input.KeyCode == Enum.KeyCode[Bind_Esp_Player] then
		Is_Esp_Player = not Is_Esp_Player
		
		MainEspPlayer.ButtonEspPlayer.Text = "Esp Player: " .. tostring(Is_Esp_Player)
	elseif Bind_Player_Speed and Input.KeyCode == Enum.KeyCode[Bind_Player_Speed] then
		Is_Player_Speed = not Is_Player_Speed
		
		MainSpeed.ButtonSpeed.Text = "Speed: " .. tostring(Is_Player_Speed)
	elseif Bind_Freeze_Player and Input.KeyCode == Enum.KeyCode[Bind_Freeze_Player] then
		Is_Freeze_Player = not Is_Freeze_Player
		MainFreezePlayer.ButtonEspPlayer.Text = "Freeze Player: " .. tostring(Is_Freeze_Player)
	
	elseif Bind_TeleportUp and Input.KeyCode == Enum.KeyCode[Bind_TeleportUp] then
		Hrp.CFrame = Hrp.CFrame * CFrame.new(0,HowMany_TeleportUp,0)
	elseif Bind_TeleportDirectly and Input.KeyCode == Enum.KeyCode[Bind_TeleportDirectly] then
		Hrp.CFrame = Hrp.CFrame * CFrame.new(0,0,-HowMany_TeleportDirectly)
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
	
	if Is_Freeze_Player then
		Hrp.Anchored = true
	else 
		Hrp.Anchored = false
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
