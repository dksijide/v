wait()

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local backpack = player:WaitForChild("Backpack")
local maxDistance = 10
local toolEquipped = false
local tool = nil

local function getTool()
	return character:FindFirstChild("Block") or backpack:FindFirstChild("Block")
end

local function getRemoteFunction()
	local currentTool = getTool()
	return currentTool and currentTool:FindFirstChild("RemoteFunction")
end

player.Character.ChildAdded:Connect(function(child)
	if child:IsA("Tool") and child.Name == "Block" then
		toolEquipped = true
		tool = child
	end
end)

player.Character.ChildRemoved:Connect(function(child)
	if child:IsA("Tool") and child.Name == "Block" then
		toolEquipped = false
		tool = nil
	end
end)

local function getHighestBlockPosition(startPos)
	local maxChecks = 10
	local highestPosition = startPos
	local checkPos = startPos

	for i = 1, maxChecks do
		local ray = Ray.new(checkPos + Vector3.new(0, 1, 0), Vector3.new(0, -2, 0))
		local hit, position = workspace:FindPartOnRay(ray)

		if hit and hit.Name == "Block" then
			highestPosition = position + Vector3.new(0, hit.Size.Y, 0)
			checkPos = highestPosition
		else
			break
		end
	end

	return highestPosition
end

local function onTouched(part)
	if toolEquipped then return end 

	if part.Name == "Block" then
		local numberOfStacks = 3
		local basePosition = getHighestBlockPosition(part.Position)

		for i = 0, numberOfStacks - 1 do
			local newPosition = basePosition + Vector3.new(0, part.Size.Y * i, 0)

			local distance = (newPosition - humanoidRootPart.Position).Magnitude
			if distance > maxDistance then
				break
			end

			local remoteFunction = getRemoteFunction()
			if remoteFunction then
				local args = {
					[1] = newPosition,  
					[2] = Enum.NormalId.Top,
					[4] = BrickColor.new(345),
					[5] = true
				}
				remoteFunction:InvokeServer(unpack(args))
			end

			wait(0.1)
		end
	end
end

local Partz = Instance.new("Part")
Partz.Parent = workspace
Partz.Transparency = 1
Partz.CanCollide = false
Partz.Massless = true
Partz.Position = humanoidRootPart.Position + Vector3.new(0, 51, 0)
Partz.Size = Vector3.new(5, 27, 0.5)
Partz.CFrame = humanoidRootPart.CFrame + humanoidRootPart.CFrame.lookVector * 3.5

local light = Instance.new("SelectionBox")
light.Adornee = Partz
light.LineThickness = 0.05
light.Color3 = Color3.fromRGB(85, 255, 255)
light.Parent = Partz
light.Name = "SelectBox"

local bruh = Partz.Touched:Connect(onTouched)
wait()
bruh:Disconnect()
Partz:Destroy()
