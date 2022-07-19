local current = tostring(game.Players.LocalPlayer.leaderstats.Stage.Value)
for i = tonumber(current), _G.ObbyStages do
   game.Players.LocalPlayer.Character:PivotTo(game.Workspace.Checkpoints:FindFirstChild(current).CFrame + Vector3.new(0,2,0))
   firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game.Workspace.Checkpoints:FindFirstChild(current), 1)
   repeat
       local hrppos = game.Players.LocalPlayer.Character.PrimaryPart.Position
       local partpos = game.Workspace.Checkpoints:FindFirstChild(current).Position
       local mag = (hrppos - partpos).Magnitude
       
       if mag > 7 then
          game.Players.LocalPlayer.Character:PivotTo(game.Workspace.Checkpoints:FindFirstChild(current).CFrame + Vector3.new(0,2,0))
       end
       
       keypress(0x41)
       keyrelease(0x44)
       game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Workspace.Checkpoints:FindFirstChild(current).Position + Vector3.new(0,0,2))
       task.wait(.05)
       keypress(0x44)
       keyrelease(0x41)
   until game.Players.LocalPlayer.leaderstats.Stage.Value == tonumber(current)
   local newcurrent = tonumber(current) + 1
   current = tostring(newcurrent)
end