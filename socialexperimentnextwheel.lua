if _G.SENDER_CONNECTIONS then
    for _, Connection in pairs(_G.SENDER_CONNECTIONS) do
        Connection:Disconnect()
    end
end
_G.SENDER_CONNECTIONS = {}

local TestGui = Instance.new("ScreenGui")
TestGui.Name = "TestGui"
TestGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local NextChallenge = Instance.new("TextLabel")
NextChallenge.Name = "NextChallenge"
NextChallenge.Size = UDim2.new(0, 188, 0, 243)
NextChallenge.Position = UDim2.new(0.8576836, 0, 0, 0)
NextChallenge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NextChallenge.FontSize = Enum.FontSize.Size14
NextChallenge.TextSize = 14
NextChallenge.TextColor3 = Color3.fromRGB(0, 0, 0)
NextChallenge.TextWrapped = true
NextChallenge.Font = Enum.Font.SourceSans
NextChallenge.TextWrap = true
NextChallenge.TextScaled = true
NextChallenge.Parent = TestGui

TestGui.Parent = game.CoreGui

local function GetSpinFromName(Name)
    local Spin
    for _,v in pairs(workspace:WaitForChild('Spinner'):WaitForChild('Spin'):WaitForChild('Model2'):GetChildren()) do
        if tonumber(v.Name) == Name then
            Spin = v.SurfaceGui.TextLabel.Text
        end
    end

    return Spin
end

local ScreenSpin = game.ReplicatedStorage.Remotes.ScreenSpin
table.insert(_G.SENDER_CONNECTIONS, ScreenSpin.Event:Connect(function(Type, Name, Timeout)
    local Spin = GetSpinFromName(Name)
    if Spin then
        local Starter = "Next: ".. Spin

        NextChallenge.Text = Starter
    end
end))