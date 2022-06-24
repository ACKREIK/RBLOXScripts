function notify(title, text, duration)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = title,
		Text = text,
		Duration = duration,
	})
end


local ids = {
	["rbxassetid://7124126253"] = "Coin",
	["rbxassetid://7218405255"] = "Roka Fruit",
	["rbxassetid://60791940"] = "Scroll (i hate pluck users)",
	["rbxassetid://875644059"] = "Diamond",
	["rbxassetid://7106060114"] = "Mys Arrow",
	["rbxassetid://5675321032"] = "DIO's Diary",
	["rbxassetid://7138936196"] = "Gloves",
	["rbxassetid://5249254947"] = "Ribcage",
	["rbxassetid://36780032"] = "Left Arm", -- RARE ITEMS AFTER THIS LINE
}
esps = {

}
local sounds = {

}

print("Sounds are: ", _G.ESPSoundsEnabled)

function initsounds()

	local UiSounds = Instance.new("Folder")
	UiSounds.Name = "UiSounds"

	local NotificationSounds = Instance.new("Folder")
	NotificationSounds.Name = "NotificationSounds"
	NotificationSounds.Parent = UiSounds

	local Sonarping = Instance.new("Sound")
	Sonarping.Name = "Sonar ping"
	Sonarping.SoundId = "rbxassetid://6011559008"
	Sonarping.Parent = NotificationSounds

	local FluorescentStarterPingLongerV2 = Instance.new("Sound")
	FluorescentStarterPingLongerV2.Name = "Fluorescent Starter Ping (Longer V2)"
	FluorescentStarterPingLongerV2.SoundId = "rbxassetid://5535652615"
	FluorescentStarterPingLongerV2.Parent = NotificationSounds

	local victorywav = Instance.new("Sound")
	victorywav.Name = "victory.wav"
	victorywav.SoundId = "rbxassetid://12222253"
	victorywav.Parent = NotificationSounds

	local Notificationsound2 = Instance.new("Sound")
	Notificationsound2.Name = "Notification sound #2"
	Notificationsound2.SoundId = "rbxassetid://8747340426"
	Notificationsound2.Parent = NotificationSounds

	local SlimeRancherUINotificationPopUp = Instance.new("Sound")
	SlimeRancherUINotificationPopUp.Name = "Slime Rancher - UI Notification Pop-Up"
	SlimeRancherUINotificationPopUp.SoundId = "rbxassetid://8486683243"
	SlimeRancherUINotificationPopUp.Parent = NotificationSounds

	local NewRobloxItemNotificationSound = Instance.new("Sound")
	NewRobloxItemNotificationSound.Name = "New Roblox+ Item Notification Sound"
	NewRobloxItemNotificationSound.SoundId = "rbxassetid://232127604"
	NewRobloxItemNotificationSound.Parent = NotificationSounds

	local FallGuysFallGuySoundWooo = Instance.new("Sound")
	FallGuysFallGuySoundWooo.Name = "Fall Guys | Fall Guy Sound - Wooo"
	FallGuysFallGuySoundWooo.SoundId = "rbxassetid://5864343876"
	FallGuysFallGuySoundWooo.Parent = NotificationSounds

	local vineboomsfx = Instance.new("Sound")
	vineboomsfx.Name = "vine boom sfx"
	vineboomsfx.SoundId = "rbxassetid://6823153536"
	vineboomsfx.Parent = NotificationSounds

	local Gogogo = Instance.new("Sound")
	Gogogo.Name = "Gogogo"
	Gogogo.SoundId = "rbxassetid://714072374"
	Gogogo.Parent = NotificationSounds

	local GoofyYell = Instance.new("Sound")
	GoofyYell.Name = "Goofy Yell"
	GoofyYell.SoundId = "rbxassetid://202427593"
	GoofyYell.Parent = NotificationSounds

	local StarPlatinumYELL = Instance.new("Sound")
	StarPlatinumYELL.Name = "Star Platinum YELL"
	StarPlatinumYELL.SoundId = "rbxassetid://5133740808"
	StarPlatinumYELL.Parent = NotificationSounds

	local mouseinbakedbeans = Instance.new("Sound")
	mouseinbakedbeans.Name = "mouse in baked beans"
	mouseinbakedbeans.SoundId = "rbxassetid://7225991789"
	mouseinbakedbeans.Parent = NotificationSounds

	local Sonic06ShadowNooooo = Instance.new("Sound")
	Sonic06ShadowNooooo.Name = "Sonic '06 - Shadow - Nooooo!"
	Sonic06ShadowNooooo.SoundId = "rbxassetid://341220097"
	Sonic06ShadowNooooo.Parent = NotificationSounds

	local UndertaleShadowPendant = Instance.new("Sound")
	UndertaleShadowPendant.Name = "Undertale - Shadow Pendant"
	UndertaleShadowPendant.SoundId = "rbxassetid://6464007319"
	UndertaleShadowPendant.Parent = NotificationSounds

	local FNAFARShadowBonnieJumpscare = Instance.new("Sound")
	FNAFARShadowBonnieJumpscare.Name = "FNAF AR Shadow Bonnie Jumpscare"
	FNAFARShadowBonnieJumpscare.SoundId = "rbxassetid://7463166106"
	FNAFARShadowBonnieJumpscare.Parent = NotificationSounds

	local YeeHaw15 = Instance.new("Sound")
	YeeHaw15.Name = "Yee Haw - 15"
	YeeHaw15.SoundId = "rbxassetid://1848296272"
	YeeHaw15.Parent = UiSounds
	
	YeeHaw15:Play()
	
	UiSounds.Parent = workspace
	
	for i,v in pairs(game.Workspace.UiSounds.NotificationSounds:GetChildren()) do
		table.insert(sounds, i)
	end
	
	return UiSounds
end

initsounds()



function sound()
	if _G.ESPSoundsEnabled == true then
		sounds[math.random(1, #sounds)]:Play()
	end
end

function addnewesp(part)
	if part:IsA("MeshPart") then
		local name = ids[part.MeshId]
		if name and part.Transparency ~= 1 then
			local BillboardGui = Instance.new("BillboardGui")
			BillboardGui.Active = true
			BillboardGui.LightInfluence = 1
			BillboardGui.AlwaysOnTop = true
			BillboardGui.Size = UDim2.new(0, 200, 0, 50)
			BillboardGui.ClipsDescendants = true

			local Frame = Instance.new("Frame")
			Frame.Size = UDim2.new(1, 0, 1, 0)
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.Parent = BillboardGui

			local TextLabel = Instance.new("TextLabel")
			TextLabel.Size = UDim2.new(0, 200, 0, 50)
			TextLabel.BackgroundTransparency = 1
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.FontSize = Enum.FontSize.Size14
			TextLabel.TextSize = 14
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.Text = name
			TextLabel.TextWrapped = true
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.TextWrap = true
			TextLabel.TextScaled = true
			TextLabel.Parent = Frame

			local UIGradient = Instance.new("UIGradient")
			UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(24, 255, 186)), ColorSequenceKeypoint.new(0.5024958, Color3.fromRGB(166, 255, 245)), ColorSequenceKeypoint.new(1, Color3.fromRGB(247, 0, 255))})
			UIGradient.Parent = TextLabel

			local UIGradient1 = Instance.new("UIGradient")
			UIGradient1.Color = ColorSequence.new(Color3.fromRGB(247, 0, 255), Color3.fromRGB(24, 255, 186))
			UIGradient1.Parent = Frame

			BillboardGui.Parent = part

			table.insert(esps, BillboardGui)

			print("added new billboard, ", part, name, " Current ESPS: ", #esps)
			notify("Item Spawned", name, 2)
			sound()
			return BillboardGui
		end
	end




end

function removeallesps()
	for i,v in pairs(esps) do
		if v then
			--v:Destroy()
		end
		table.remove(esps, i)
	end
end

function getallitems()
	print("fetch all items")
	for i,v in pairs(game.Workspace.Item_Spawns.Items:GetDescendants()) do
		if v.Name == "MeshPart" and v:IsA("BasePart") then
			addnewesp(v)
		end
	end
end

function start()
	getallitems()


	game.Workspace.Item_Spawns.Items.DescendantAdded:Connect(function(v)
		if v.Name == "MeshPart" then
			print("item removed", v)
			addnewesp(v)
		end
	end)
	game.Workspace.Item_Spawns.Items.DescendantRemoving:Connect(function(v)
		if v.Name == "MeshPart" then
			print("item removed", v)
			removeallesps()
		end
	end)
end

start()

print("Loaded Script")