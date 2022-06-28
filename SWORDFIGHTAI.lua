-- https://www.roblox.com/games/9672723944/The-best-swordfighting-ai

function fight()
    print("starting fight")
   

    task.wait(4)
    game:GetService("ReplicatedStorage").Remotes.StartChallenge:FireServer()
    task.wait(2)
    local alive = true
    local cancelled = false

    local dummy = game.Workspace.ActivePlayers:WaitForChild("Dummy")
    local hum = dummy.Humanoid
    local hrp = dummy.HumanoidRootPart
    local chr = game.Players.LocalPlayer.Character
    
   coroutine.resume(coroutine.create(function()
    game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
        if input.KeyCode == Enum.KeyCode.P and cancelled == false then
            cancelled = true
            print("cancelled script")
        end
    end)

   end))

   


    while hum.Health > 0 and cancelled == false and chr:WaitForChild("Humanoid").Health > 0 do
       
        --chr:PivotTo(CFrame.new(hrp.Position - (hrp.CFrame.LookVector * 7), hrp.Position))
        chr:PivotTo(CFrame.new(hrp.Position + Vector3.new(0,6,0), hrp.Position))
       -- chr.HumanoidRootPart.Rotation = chr.HumanoidRootPart.Rotation + Vector3.new(0,90,0) 
        mouse1click()
        task.wait()
     end
     print("fight over")
     if cancelled == false then
        fight()
     end
end

fight()
