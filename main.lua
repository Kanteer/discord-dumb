--config
local part1 = game.Workspace.CameraCollection.cameraLL
local part2 = game.Workspace.CameraCollection.cameraL
local part3 = game.Workspace.CameraCollection.cameraR
local part4 = game.Workspace.CameraCollection.cameraRR

local parts = {part1, part2, part3, part4}
local currentPartIndex = 1

--gui
local gui = game.Players.LocalPlayer.PlayerGui.ScreenGui
local buttonL = gui.buttonL
local buttonR = gui.buttonR

--lock cam to part
local function lockCameraToPart()
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	workspace.CurrentCamera.CameraSubject = parts[currentPartIndex]
	workspace.CurrentCamera.CFrame = CFrame.new(parts[currentPartIndex].Position) * CFrame.new(0,0,0.5)
end

--swap parts
local function swapPart()
	currentPartIndex = currentPartIndex + 1
	if currentPartIndex > #parts then
		currentPartIndex = 1
	else if
		currentPartIndex = #parts
	end
	lockCameraToPart()
		end --(remove me)
	end --(remove me)
end

--event listener
buttonL.MouseButtonClick:Connect(function()
	currentPartIndex = currentPartIndex - 1
	if currentPartIndex < 1 then
		currentParrtIndex = #parts
		end
	lockCameraToPart()
end)

buttonR.MouseButtonClick:Connect(function()
	currentPartIndex = currentPartIndex + 1
	if currentPartIndex > #parts then
		currentParrtIndex = 1
		end
	lockCameraToPart()
end)

--arrow keys
game:GetService("UserInputService").InputBegan:Connect(funtion(input, gameProcessedEvent)
	if gameProcessedEvent then
		return
	end
	if input.KeyCode == Enum.KeyCode.Left then
		currentPartIndex = currentPartIndex -1
		if currentPartIndex < 1 then
			currentPartIndex = #parts
		end
	lockCameraToPart()
	elseif input.KeyCode == Enum.KeyCode.Right then
	currentPartIndex = currentPartIndex + 1
	if currentPartIndex > #parts then
		currentPartIndex = 1
		end
	lockCameraToPart()
	end
end)

--safety lock
lockCameraToPart()
