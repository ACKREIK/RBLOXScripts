local point = _G.currentobbypoint
local moneyupg = _G.currentmoneyupg
if point then 

else
    point = "Point1"
end

if moneyupg then 

else
    moneyupg = "UpgradeMoney1"
end
for i=1, 100 do
    coroutine.resume(coroutine.create(function()
        for i=1, 10 do
            wait()
            local args = {
    [1] = moneyupg
}

game:GetService("ReplicatedStorage").Remotes.GetUpgradeCost:InvokeServer(unpack(args))

            local args = {
    [1] = moneyupg
}

game:GetService("ReplicatedStorage").Remotes.BuyUpgrade:FireServer(unpack(args))

    game.Players.LocalPlayer.Character:PivotTo(game:GetService("Workspace").ActiveSection.Area1.MoneyPoints:FindFirstChild(point).CFrame)
    game:GetService("ReplicatedStorage").Remotes.CashIn:FireServer()
    local args = {
    [1] = "Area1",
    [2] = point
    }

    game:GetService("ReplicatedStorage").Remotes.MoneyPoint:FireServer(unpack(args))
    game:GetService("ReplicatedStorage").Remotes.GetCashInValue:InvokeServer()

        end
    end))
    wait()
end
game.Players.LocalPlayer.Character:PivotTo(game:GetService("Workspace").ActiveSection.Area1.RoundFloor.CFrame)