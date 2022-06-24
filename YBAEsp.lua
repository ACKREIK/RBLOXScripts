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


function addnewesp(part)
	if part:IsA("MeshPart") then
		local name = ids[part.MeshId]
		if name then
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
			TextLabel.Text = part.Name
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

			print("added new billboard, ", part, part.Name, #esps)
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