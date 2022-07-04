local mouse = game.Players.LocalPlayer:GetMouse()
function kill(humanoid)

	local args = {
		[1] = humanoid,
		[2] = humanoid.Parent.HumanoidRootPart.CFrame,
		[3] = 40,
		[4] = 0.1,
		[5] = Vector3.new(0,900),
		[6] = "rbxassetid://241837157",
		[7] = 1,
		[8] = Color3.new(0,50,0),
		[9] = "rbxassetid://260430079",
		[10] = .5,
		[11] = 10
	}

	game:GetService("ReplicatedStorage").Damage:FireServer(unpack(args))


end


local plr = game.Players.LocalPlayer
local chr = plr.Character
local hrp = chr.HumanoidRootPart
function SuckNearest()
	local hitplr = nil
	local hitchr = nil

	local currentmag = math.huge
	local parts = game.Workspace:GetDescendants()

	for i,v in pairs(parts) do
		if v.Name == "HumanoidRootPart" then
			if v:IsA("BasePart") then
				if v.Parent == chr then
				else
					if (hrp.Position - v.Position).Magnitude < currentmag then
						if v.Parent:FindFirstChild("Humanoid") then
							hitchr = v.Parent
							currentmag = (hrp.Position - v.Position).Magnitude
						end
					end
				end
			end
		end
	end

	if game.Players:GetPlayerFromCharacter(hitchr) then
		hitplr = game.Players:GetPlayerFromCharacter(hitchr)
	end

	if hitchr then
		repeat
			if not hitchr:FindFirstChild("Humanoid") then break end

			kill(hitchr.Humanoid)
			if game.Players:GetPlayerFromCharacter(hitchr) then
				hitplr = game.Players:GetPlayerFromCharacter(hitchr)
			else
				hitplr = nil
			end
			if hitplr then
				game:GetService("ReplicatedStorage").Knock:FireServer(hitplr)
			end

		until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.H) == false
	end
end

game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
	if game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
		SuckNearest()
	end
end) 



game.Lighting.TS.Changed:Connect(function()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    
        if v:IsA("BasePart") then
           game:GetService("ReplicatedStorage").Anchor:FireServer(v, false)
         
        end
        end
end)
    
