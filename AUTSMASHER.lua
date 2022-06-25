local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
OrionLib:MakeNotification({
	Name = "Thank You!",
	Content = "Thank you for using AUT Smasher V3",
	Time = 5
})

-- loading system

local HttpService = game:GetService("HttpService")
local SettingsTable = {
	PrintToggle = false
}
local EnabledTable = {
	Test = false
}



function Save(settable, entable)
	local data = HttpService:JSONEncode(settable)
	writefile("autsmasher3/Settings.json", data)
    local data2 = HttpService:JSONEncode(entable)
	writefile("autsmasher3/LoadedModules.json", data2)
end
function Initialize()
	if not isfolder("autsmasher3") then
		makefolder("autsmasher3")
		writefile("autsmasher3/Settings.json", "")
        writefile("autsmasher3/LoadedModules.json", "")
        OrionLib:MakeNotification({
            Name = "Created Save Data!",
            Content = "Created Save Data",
            Time = 5
        })
        Save(SettingsTable, EnabledTable)
	end
end
Initialize()
function Load()
	SettingsTable = HttpService:JSONDecode(readfile("autsmasher3/Settings.json"))
end



task.wait(0.1)
if HttpService:JSONDecode(readfile("autsmasher3/Settings.json")) and HttpService:JSONDecode(readfile("autsmasher3/LoadedModules.json")) then
	Load()
else
	Save(SettingsTable, EnabledTable)
end

-- main


local Window = OrionLib:MakeWindow({Name = "AUT Smasher V3"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tabtp = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tabpremium = Window:MakeTab({
	Name = "Premium",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = true
})
local Tabsettings = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tabcredits = Window:MakeTab({
	Name = "Credits + Extra",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


-- Main Tab
Tab:AddButton({
	Name = "testbutton",
	Callback = function()
      		print("button pressed")
  	end    
})

Tab:AddSlider({
	Name = "Walkspeed",
	Min = 0,
	Max = 500,
	Default = 16,
	Increment = 1,
	ValueName = "walkspeed",
	Callback = function(Value)
        game.Players.LocalPlayer.Character.Values.Speed.Default.Value = Value
	end    
})
Tab:AddButton({
	Name = "die",
	Callback = function()
        local plr = game.Players.LocalPlayer
        plr.Character.Humanoid.Health = 0
  	end    
})

local antistun = false
local nocd = false
local antiactive = false
local mashm1s = false


Tab:AddToggle({
	Name = "Anti-Stun (UNTESTED)",
	Default = false,
	Callback = function(Value)
		antistun = Value
	end    
})
Tab:AddToggle({
	Name = "Remove Cooldowns (UNTESTED)",
	Default = false,
	Callback = function(Value)
		nocd = Value
	end    
})
Tab:AddToggle({
	Name = "Anti-Active (UNTESTED)",
	Default = false,
	Callback = function(Value)
		antiactive = Value
	end    
})
Tab:AddToggle({
	Name = "We use M1s like i beat my cock",
	Default = false,
	Callback = function(Value)
		mashm1s = Value
	end    
})

Tab:AddSlider({
	Name = "Force Stand ID (Funny)",
	Min = 0,
	Max = 999,
	Default = game.Players.LocalPlayer.Data.Ability.Value,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "AbilityValue",
	Callback = function(Value)
		game.Players.LocalPlayer.Data.Ability.Value = Value
	end    
})


--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]

-- Teleports Tab

Tabtp:AddButton({
	Name = "tp to pucci!",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.NPCS["Enrico Pucci"].HumanoidRootPart.CFrame
  	end    
})
Tabtp:AddButton({
	Name = "tp to sakuya!",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.NPCS.Sakuya.HumanoidRootPart.CFrame
  	end    
})
Tabtp:AddButton({
    Name = "tp to killua!",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.NPCS.Killua.HumanoidRootPart.CFrame
  	end    
})
Tabtp:AddButton({
    Name = "tp to storage!",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.NPCS.EpicFlow203.HumanoidRootPart.CFrame
  	end    
})
Tabtp:AddButton({
	Name = "tp to dio boss!",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Living.Dio.HumanoidRootPart.CFrame
  	end    
})
Tabtp:AddButton({
	Name = "to to nearest chest!",
	Callback = function()
        for i,v in pairs(game.Workspace.ItemSpawns.Chests:GetDescendants()) do
            if v.Parent.Name == "Chest" and v:IsA("BasePart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            end
        end
  	end    
})
Tabtp:AddButton({
	Name = "tp to nearest item!",
	Callback = function()
        for i,v in pairs(game.Workspace.ItemSpawns.StandardItems:GetDescendants()) do
            if v.Name ~= "SpawnLocation" and v:IsA("BasePart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            end
        end
  	end    
})
Tabtp:AddButton({
	Name = "Tp to sand debr!",
	Callback = function()
        for i,v in pairs(game.Workspace.ItemSpawns["Sand Debris"]:GetDescendants()) do
            if v.Name ~= "SpawnLocation" and v:IsA("BasePart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0,3,0)
            end
        end
  	end    
})



-- Main Tab
Tabcredits:AddButton({
	Name = "Close",
	Callback = function()
        OrionLib:Destroy()
  	end    
})





function lmbmash()
	local args = {
		[1] = "LMB"
	}
	
	game:GetService("ReplicatedStorage").Remotes.InputFunc:InvokeServer(unpack(args))	
end

game:GetService("RunService").RenderStepped:Connect(function()
	if antistun then
		game.Players.LocalPlayer.Values.Stunned.Value = false
	end
	if antiactive then
		game.Players.LocalPlayer.Character.Values.Active.Value = ""
	end
	if nocd then
		game.Players.LocalPlayer.Character.Cooldowns:ClearAllChildren()
    	game.Players.LocalPlayer.Cooldowns:ClearAllChildren()
	end
    if mashm1s then
		lmbmash()
	end
end)


OrionLib:Init()