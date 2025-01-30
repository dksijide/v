			local Tabs = {
				Personal = Window:AddTab({ Title = "Personal", Icon = "archive" })
				}

 Tabs.Personal:AddButton({
        Title = "Dex Explorer",
        Description = "Only for me to navigate some properties XD",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
        end
    })
