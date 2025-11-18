local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Duration_Start_Script = 1.5 
local Device = nil

--local TableBrainrots = {
--	"La Vacca Saturno Saturnita",
--	"Graipuss Medussi",
----	"Orcalero Orcala",
--	"Guerriro Digitale",
--	"Dul Dul Dul",
--	"Chicleteira Bicicleteira",
--	"To to to Sahur",
--	"Matteo",
--	"67",
--}

local TableBrainrots = {
	"1x1x1x1",
	"67",
	"Matteo",
	"Agarrini La Palini",
	"Aquatic Index",
	"Bicicleteira Family",
	"Bisonte Giuppitere",
	"Blackhole Goat",
	"Boatito Auratito",
	"Burguro and Fryuro",
	"Burrito Bandito",
	"Capitano Moby",
	"Celularcini Viciosini",
	"Chachechi",
	"Chicleteira Bicicleteira",
	"Chicleteirina Bicicleteirina",
	"Chillin Chili",
	"Chimpanzini Spiderini",
	"Chipso and Queso",
	"Combinasions",
	"Cooki and Milki",
	"Dragon Cannelloni",
	"Dul Dul Dul",
	"Duo Brainrots",
	"Esok Sekolah",
	"Eviledon",
	"Extinct Matteo",
	"Extinct Tralalero",
	"Fragola La La La",
	"Fragrama and Chocrama",
	"Frankentteo",
	"Garama and Madundung",
	"Graipuss Medussi",
	"Guest 666",
	"Headless Horseman",
	"Horegini Boom",
	"Jackorilla",
	"Job Job Job Sahur",
	"Karker Sahur",
	"Karkerkar Kurkur",
	"Karkerkur Family",
	"Ketchuru and Musturu",
	"Ketupat Kepat",
	"La Casa Boo",
	"La Cucaracha",
	"La Extinct Grande",
	"La Grande Combinasion",
	"La Karkerkar Combinasion",
	"La Sahur Combinasion",
	"La Secret Combinasion",
	"La Spooky Grande",
	"La Supreme Combinasion",
	"La Taco Combinasion",
	"La Vacca Jacko Linterino",
	"La Vacca Saturno Saturnita",
	"Las Sis",
	"Las Tralaleritas",
	"Las Vaquitas Saturnitas",
	"Los 67",
	"Los Bros",
	"Los Chicleteiras",
	"Los Combinasionas",
	"Los Hotspotsitos",
	"Los Jobcitos",
	"Los Karkeritos",
	"Los Matteos",
	"Los Mobilis",
	"Los Nooo My Hotspotsitos",
	"Los Primos",
	"Los Spaghettis",
	"Los Spooky Combinasionas",
	"Los Spyderinis",
	"Los Tacoritas",
	"Los Tortus",
	"Los Tralaleritos",
	"Mariachi Corazoni",
	"Mieteteira Bicicleteira",
	"Money Money Puggy",
	"Noo my Candy",
	"Noo my examine",
	"Nooo My Hotspot",
	"Nuclearo Dinossauro",
	"Perrito Burrito",
	"Pirulitoita Bicicleteira",
	"Pot Hotspot",
	"Pot Pumpkin",
	"Pumpkini Spyderini",
	"Quesadilla Crocodila",
	"Quesadillo Vampiro",
	"Rang Ring Bus",
	"Sammyni Spyderini",
	"Spaghetti Tualetti",
	"Spooky and Pumpky",
	"Spooky Juggle",
	"Tacorita Bicicleta",
	"Tamaluk un Meass",
	"Tang Tang Keletang",
	"Tictac Sahur",
	"To to to Sahur",
	"Torrtuginni Dragonfrutini",
	"Tralaledon",
	"Trenostruzzo Turbo 4000",
	"Trickolino",
	"Vulturino Skeletono",
	"Yess my examine",
	"Zombie Tralala"
}


while task.wait() do
	if LocalPlayer.Character and UserInputService.TouchEnabled then
		LocalPlayer:Kick("this script only for PC!")
		break
	else 
		break
	end
end

task.wait(Duration_Start_Script)

local function Notifications()
	StarterGui:SetCore("SendNotification", {Title = "Steal a brainrot script"
		, Text = "PC build is activated!", Duration = 2.5})
	task.delay(0.5, function()
		StarterGui:SetCore("SendNotification", {Title = "Steal a brainrot script"
			, Text = "Press to C for activate Jump Boost!", Duration = 3.5})
		task.delay(1.5, function()
			StarterGui:SetCore("SendNotification", {Title = "Steal a brainrot script"
				, Text = "Press to V for activate Esp Players and Show brainrots!", Duration = 3.5})
		end)
	end)
end

Notifications()

local Character = LocalPlayer.Character
local Humanoid:Humanoid = Character:WaitForChild("Humanoid")

local IsJumpBoost = false
local IsEspPlayers = false
local IsShow_Brainrots = false


local Default_JumpPower = Humanoid.JumpPower
local Jump_Power = 80

local BackGround_TurnON = Color3.fromRGB(67, 222, 36)
local BackGround_TurnOFF = Color3.fromRGB(255, 52, 55)

UserInputService.InputBegan:Connect(function(Input, IsTyping)
	if IsTyping then return end
	
	if Input.KeyCode == Enum.KeyCode.C then
		IsJumpBoost = not IsJumpBoost
		
		if IsJumpBoost then
			StarterGui:SetCore("SendNotification", {Title = "Steal a brainrot script", Text = "JumpBoost Turn ON!", Duration = 1})
		else 
			StarterGui:SetCore("SendNotification", {Title = "Steal a brainrot script", Text = "JumpBoost Turn OFF!", Duration = 1})
		end
	elseif Input.KeyCode == Enum.KeyCode.V then
		IsEspPlayers = not IsEspPlayers
		IsShow_Brainrots = not IsShow_Brainrots
		
		if IsEspPlayers and IsShow_Brainrots then
			StarterGui:SetCore("SendNotification", {Title = "Steal a brainrot script", Text = "Esp Players and Show brainrots Turn ON!", Duration = 1})
		else 
			StarterGui:SetCore("SendNotification", {Title = "Steal a brainrot script", Text = "Esp Players and Show brainrots Turn OFF!", Duration = 1})
		end
	end
end)

RunService.RenderStepped:Connect(function()
	Character = LocalPlayer.Character
	Humanoid = Character:WaitForChild("Humanoid")

	if IsJumpBoost then
		Humanoid.UseJumpPower = true
		Humanoid.JumpPower = Jump_Power
	else 
		Humanoid.UseJumpPower = false
		Humanoid.JumpPower = Default_JumpPower
	end

	if IsEspPlayers then
		for i,v in pairs(Players:GetPlayers()) do
			local Character = v.Character
			local Find_HightLight = Character:FindFirstChild("HackHightLight")


			for i,part in pairs(Character:GetChildren()) do
				if part:IsA("BasePart") and v.UserId ~= LocalPlayer.UserId then
					if part.Name == "HumanoidRootPart" or part.Name == "__HITBOX" then
						part.Transparency = 1
					else 
						part.Transparency = 0
					end
				end
			end

			if Character and not Find_HightLight and v.UserId ~= LocalPlayer.UserId then
				local HightLight = Instance.new("Highlight")
				HightLight.Name = "HackHightLight"
				HightLight.FillColor = Color3.fromRGB(255, 0, 4)
				HightLight.OutlineColor = Color3.fromRGB(255, 0, 4)
				HightLight.OutlineTransparency = 0
				HightLight.FillTransparency = 0.7
				HightLight.Parent = Character
			end
		end
	else 
		for i,v in pairs(Players:GetPlayers()) do
			local Character = v.Character
			local Find_HightLight = Character:FindFirstChild("HackHightLight")

			for i,part in pairs(Character:GetChildren()) do
				if part:IsA("BasePart") and v.UserId ~= LocalPlayer.UserId then
					if part.Name == "HumanoidRootPart" or part.Name == "__HITBOX" then
						part.Transparency = 1
					else 
						part.Transparency = 0
					end
				end
			end

			if Character and Find_HightLight then
				Find_HightLight:Destroy()
			end
		end
	end
	
	
	if IsShow_Brainrots then
		local PlotsFolder = workspace:WaitForChild("Plots")
		if PlotsFolder then
			for indexPlot,plot in pairs(PlotsFolder:GetChildren()) do
				for indexBase, brainrot in pairs(plot:GetChildren()) do
					local Find_BillBoardGui = brainrot:FindFirstChild("BillBoardUI")
					if brainrot:IsA("Model") and brainrot.Name ~= "Model" and brainrot.Name ~= "FriendPanel" and not Find_BillBoardGui then
						for indexbrainrot, namebrainrot in ipairs(TableBrainrots) do
							if brainrot.Name == namebrainrot then
								local BillBoardGui = Instance.new("BillboardGui")
								BillBoardGui.Name = "BillBoardUI"
								BillBoardGui.AlwaysOnTop = true
								BillBoardGui.Size = UDim2.new(10, 0,4, 0)
								BillBoardGui.ResetOnSpawn = false
								BillBoardGui.Parent = brainrot

								local TextLabel = Instance.new("TextLabel")
								TextLabel.Size = UDim2.new(1,0,1,0)
								TextLabel.BackgroundTransparency = 1
								TextLabel.TextScaled = true
								TextLabel.TextStrokeTransparency = 0
								TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
								TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
								TextLabel.Text = brainrot.Name
								TextLabel.Parent = BillBoardGui
								print("Found brainrot in table: " .. tostring(namebrainrot))
							end
						end
					end
				end
			end
		end
	else 
		local PlotsFolder = workspace:WaitForChild("Plots")
		if PlotsFolder then
			for indexPlot,plot in pairs(PlotsFolder:GetChildren()) do
				for indexBase, brainrot in pairs(plot:GetChildren()) do
					if brainrot:IsA("Model") and brainrot.Name ~= "Model" and brainrot.Name ~= "FriendPanel" then
						local BillBoardGui = brainrot:FindFirstChild("BillBoardUI")
						if BillBoardGui then
							BillBoardGui:Destroy()
						end
					end
				end
			end
		end
	end
end)
