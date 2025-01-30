local allowedHWID = "CC341C50-CCFC-4E28-864C-425F627D86F2"

local playerHWID = game:GetService("RbxAnalyticsService"):GetClientId()

if playerHWID ~= allowedHWID then
    return
end

Fluent:Notify({
        Title = "special noob",
        Content = "Hello me or someone who cracked this bruh",
        Duration = 5 
    })

local Tabs = {
	Personal = Window:AddTab({ Title = "Personal", Icon = "archive" }),
}

Tabs.Personal:AddButton({
    Title = "0 WinsStreak",
    Description = "Making an all coins account 0 Wins",
    Callback = function()
        Fluent:Notify({
            Title = "Hello",
            Content = "Please wait for 2 players left until you die",
            Duration = 5 
        })

        local hi = game.Workspace.plrsLeft
        local player = game.Players.LocalPlayer

        if not player.Character or not player.Character:FindFirstChild("Humanoid") then
            player.CharacterAdded:Wait()
        end

        local character = player.Character
        local humanoid = character:WaitForChild("Humanoid")

        local playerDead = false
        humanoid.Died:Connect(function()
            playerDead = true
        end)

        while not playerDead do
            if hi.Value == 2 then
                humanoid.Health = 0
            end
            wait(0.1)
        end
    end
})
