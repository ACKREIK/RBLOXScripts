-- hum, partcfr, dmg, debtime, bodyfdire, id, size, color, soundid, pitch, vol
-- 7185218924

local plr = game.Players.LocalPlayer
local chr = plr.Character
local hrp = chr:WaitForChild("HumanoidRootPart")

local anim = Instance.new("Animation", chr)
anim.AnimationId = "rbxassetid://7185218924"

local hum = chr:WaitForChild("Humanoid")
local anm = hum:WaitForChild("Animator")

local died = false

local anim = anm:LoadAnimation(anim)
anim.Priority = Enum.AnimationPriority.Action4

local canhit = false

chr["Left Leg"].Touched:Connect(function(part)
    if died then return end
    if part.Parent and canhit then
        if part.Parent:FindFirstChild("Humanoid") and  part.Parent:FindFirstChild("HumanoidRootPart") then
            local hrp2 = part.Parent.HumanoidRootPart
            local hum2 = part.Parent.Humanoid

            local args = {
                hum2, 
                hrp2.CFrame,
                10, 
                1,
                hrp.CFrame.LookVector * 90,
                "rbxassetid://876171817",
                2,
                Color3.new(0,1,0),
                "rbxassetid://173818824",
                1,
                2
            }

            game.ReplicatedStorage.Damage:FireServer(unpack(args))
        end
    end
end)

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if died then return end
    if input.KeyCode == Enum.KeyCode.Z then
        canhit = true
        anim:Play()
        anim.Stopped:wait()
        canhit = false
    end
end)


hum.Died:Connect(function()
    died = true
end)