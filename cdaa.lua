
		local Tabs = {
				Personal = Window:AddTab({ Title = "Personal", Icon = "archive" }),
			}

		Tabs.Personal:AddButton({
        Title = "0 WinsStreak",
        Description = "Making an all coins account 0 Wins",
        Callback = function()

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

