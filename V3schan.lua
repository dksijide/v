local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Trash(ごみ) " .. "0.0.2",
    SubTitle = "- puuror",
    TabWidth = 80,
    Size = UDim2.fromOffset(450, 350),
    Acrylic = false,
    Theme = "Rose",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local v = {"V3schan", "Woodtoolsc"}
local v2 = false

for _, username in pairs(v) do
    if game.Players.LocalPlayer.Name == username then
        v2 = true
        break
    end
end

if v2 then
	Fluent:Notify({
        Title = "Welcome me",
        Content = "Welcome " .. game.Players.LocalPlayer.DisplayName .. "totally not the owner",
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
					Content = "Please wait for 2 players left until u die",
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
else
    Fluent:Notify({
        Title = "Can't be open",
        Content = "Sorry only the owner can open this...",
        Duration = 5 
    })
end
