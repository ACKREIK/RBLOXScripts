local removescript = false

local plr = game.Players.LocalPlayer





if plr.Character then
    plr.Character:WaitForChild("Humanoid").Health = 0
end

function init()
    if removescript then return end
    local chr = plr.Character
    local mouse = plr:GetMouse()

    local hrp = chr:WaitForChild("HumanoidRootPart")
    local hum = chr:WaitForChild("Humanoid")
    local stand = chr:WaitForChild("Stand")
    --stand:WaitForChild(""):Destroy()

    local animfolder = stand:WaitForChild("StandHumanoidRootPart")


    game.ReplicatedStorage.Block:FireServer(true)
    
    local function shadow()
        game.ReplicatedStorage["VampireDash"]:FireServer(BrickColor.random()) 
    end

    if chr:FindFirstChild("ShadowTheWorld") then
        chr:WaitForChild("ShadowTheWorld"):Destroy()
    else
        removescript = true
        print("nostw")
        return
    end
   
    
    local anim = hum:WaitForChild("Animator")
    
   
    local ripper = anim:LoadAnimation(animfolder:WaitForChild("SpaceRipperFire"))
    local attackpose = anim:LoadAnimation(animfolder:WaitForChild("AttackPose"))
    local iceshatter = anim:LoadAnimation(animfolder:WaitForChild("IceShatter"))

    
    
    
    local plrfunctions = {
        Knifes = function()
            local knifecount = 0
            repeat
                shadow()
                game:GetService("ReplicatedStorage").STWKnife:FireServer()
                wait(0.05)
                knifecount += 1
            until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.T) == false or knifecount == 20
            game:GetService("ReplicatedStorage").ChargedRipper:FireServer()
            ripper:Play()
        end,
        SuperShadowEffect = function()
            repeat
                task.wait()
                shadow()
            until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.G) == false
        end,
        Suck = function()
            local hitplr = nil
            local hitchr = nil
            local target = mouse.Target
            if target.Parent and target.Parent:FindFirstChild("Humanoid") then
                hitchr = target.Parent
            elseif target.Parent and target.Parent.Parent:FindFirstChild("Humanoid") then
                hitchr = target.Parent
            else
                hitchr = nil
            end
    
            if game.Players:GetPlayerFromCharacter(hitchr) then
                hitplr = game.Players:GetPlayerFromCharacter(hitchr)
            end
    
            if hitchr then
                repeat
                    if not hitchr:FindFirstChild("Humanoid") then break end
                    game:GetService("ReplicatedStorage").VampireDamage:FireServer(hitchr.Humanoid, 40, .25, Vector3.new(0, -0, 0) )
                    if game.Players:GetPlayerFromCharacter(hitchr) then
                        hitplr = game.Players:GetPlayerFromCharacter(hitchr)
                    else
                        hitplr = nil
                    end
                    if hitplr then
                        game:GetService("ReplicatedStorage").Knock:FireServer(hitplr)
                    end
                    task.wait(.2)
                until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Y) == false
            end
        end,
        SuckYourself = function()
            local hitplr = nil
            local hitchr = nil
           
            local currentmag = math.huge
            local parts = game.Workspace.Entities:GetDescendants()

            for i,v in pairs(parts) do
                if v.Name == "HumanoidRootPart" then
                    if v:IsA("BasePart") then
                        if v.Parent ~= chr then
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
                    shadow()
                    game:GetService("ReplicatedStorage").VampireDamage:FireServer(hitchr.Humanoid, 40, .25, Vector3.new(0, -0, 0) )
                    if game.Players:GetPlayerFromCharacter(hitchr) then
                        hitplr = game.Players:GetPlayerFromCharacter(hitchr)
                    else
                        hitplr = nil
                    end
                    if hitplr then
                        game:GetService("ReplicatedStorage").Knock:FireServer(hitplr)
                    end
                    task.wait(.1)
                until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.J) == false
            end
        end,
        SuckNearest = function()
            local hitplr = nil
            local hitchr = nil
           
            local currentmag = math.huge
            local parts = game.Workspace.Entities:GetDescendants()

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
                    shadow()
                    game:GetService("ReplicatedStorage").VampireDamage:FireServer(hitchr.Humanoid, 40, .25, Vector3.new(0, -0, 0) )
                    if game.Players:GetPlayerFromCharacter(hitchr) then
                        hitplr = game.Players:GetPlayerFromCharacter(hitchr)
                    else
                        hitplr = nil
                    end
                    if hitplr then
                        game:GetService("ReplicatedStorage").Knock:FireServer(hitplr)
                    end
                    task.wait(.1)
                until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.H) == false
            end
        end,
        Ripper = function()
            attackpose:Play()
            for i=1, 10 do
                shadow()
                game:GetService("ReplicatedStorage").ChargedRipper:FireServer()
                task.wait()
            end
            task.wait(1)
            attackpose:Stop()
        end,
        SuperRipper = function()
            attackpose:Play()
            for i=1, 30 do
                shadow()
                game:GetService("ReplicatedStorage").ChargedRipper:FireServer()
                task.wait()
            end
            task.wait(1)
            attackpose:Stop()
        end,
        Taunt = function()
            game.ReplicatedStorage.Taunt:FireServer(game.Players.LocalPlayer.Character.Head, "Shhh... (Creepy Whispers)", "rbxassetid://5590365532", 10, 5, 0)
        end,
        Movement = function()
            game.ReplicatedStorage.Jump:FireServer(BrickColor.new("Bright red"))
            local Bod = Instance.new("BodyPosition", hrp)
            Bod.maxForce = Vector3.new(100000, 100000, 100000)
            Bod.Position = hrp.CFrame*CFrame.new(0, 50, -75).p
            game.Debris:AddItem(Bod, .3)
        end,
        Movementnofx = function()
            local Bod = Instance.new("BodyPosition", hrp)
            Bod.maxForce = Vector3.new(100000, 100000, 100000)
            Bod.Position = hrp.CFrame*CFrame.new(0, 50, -75).p
            game.Debris:AddItem(Bod, .1)
        end,
        Timestop = function()
            if game.Lighting.TS.Value == true then
                iceshatter:Play()
                shadow()
                game.ReplicatedStorage.Untimestop:FireServer()
            else
                attackpose:Play()
                shadow()
                game.ReplicatedStorage.Timestop:FireServer(3.3,"ShadowDio")
                task.wait(1)
                attackpose:Stop()
            end   
        end,
        Crash = function()
            for i=1, 3000 do
                shadow()
                game:GetService("ReplicatedStorage").ChargedRipper:FireServer()
                task.wait()
            end
        end,
    }

    
    
    game:GetService("UserInputService").InputBegan:connect(function(input, ret)
        if ret then return end
        if input.KeyCode == Enum.KeyCode.T then
            plrfunctions.Knifes()
        end 
        if input.KeyCode == Enum.KeyCode.Y then
            plrfunctions.Suck()
        end
        if input.KeyCode == Enum.KeyCode.G then
            plrfunctions.SuperShadowEffect()
        end
        
        if input.KeyCode == Enum.KeyCode.V then
            plrfunctions.Ripper()
        end
        if input.KeyCode == Enum.KeyCode.B then
            plrfunctions.SuperRipper()
        end
        if input.KeyCode == Enum.KeyCode.X then
            plrfunctions.Movementnofx()
        end
        if input.KeyCode == Enum.KeyCode.Z then
            plrfunctions.Movement()
        end
        if input.KeyCode == Enum.KeyCode.N then
            plrfunctions.Taunt()
        end
        if input.KeyCode == Enum.KeyCode.F then
            plrfunctions.Timestop()
        end
        if input.KeyCode == Enum.KeyCode.P then
            plrfunctions.Crash()
        end
        if input.KeyCode == Enum.KeyCode.H then
            plrfunctions.SuckNearest()
        end
        if input.KeyCode == Enum.KeyCode.J then
            plrfunctions.SuckYourself()
        end
    end)
    
    local standparts = stand:GetDescendants() 
    
    
    
    print("Loaded!")    
end

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if removescript then return end
    init()
end)



plr.Chatted:Connect(function(msg)
    if removescript then return end
    if msg == "/e remove" then
        removescript = true
        plr.Character:WaitForChild("Humanoid").Health = 0
        script:Destroy()
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if removescript then return end
    if game.Lighting.TS.Value == true then
        for i,v in pairs(plr.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Anchored = false
            end
        end
    end
end)