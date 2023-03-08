-- cams
local part = game.Workspace.CameraCollection.cameraLL
local cameras = {
	[1] = game.Workspace.CameraCollection.cameraLL,
	[2] = game.Workspace.CameraCollection.cameraL,
	[3] = game.Workspace.CameraCollection.cameraR,
	[4] = game.Workspace.CameraCollection.cameraRR,
}
local currentCameraIndex = 1

-- gui stuffs
local gui = game.Players.LocalPlayer.PlayerGui.ScreenGui
local buttonL = gui.buttonL
local buttonR = gui.buttonR

-- Function to swap cameras
local function swapCamera()
	currentCameraIndex = currentCameraIndex + 1
	if currentCameraIndex > #cameras then
		currentCameraIndex = 1
	end
	workspace.CurrentCamera.CameraSubject = cameras[currentCameraIndex]
end

-- event listeners
buttonL.MouseButton1Click:Connect(function()
	currentCameraIndex = currentCameraIndex - 1
	if currentCameraIndex < 1 then
		currentCameraIndex = 4
	end
	workspace.CurrentCamera.CameraSubject = cameras[currentCameraIndex]
end)

buttonR.MouseButton1Click:Connect(function()
	currentCameraIndex = currentCameraIndex + 1
	if currentCameraIndex > 4 then
		currentCameraIndex = 1
	end
	workspace.CurrentCamera.CameraSubject = cameras[currentCameraIndex]
end)

-- more event listeners
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then
		return
	end
	if input.KeyCode == Enum.KeyCode.Left then
		currentCameraIndex = currentCameraIndex - 1
		if currentCameraIndex < 1 then
			currentCameraIndex = 4
		end
		workspace.CurrentCamera.CameraSubject = cameras[currentCameraIndex]
	elseif input.KeyCode == Enum.KeyCode.Right then
		currentCameraIndex = currentCameraIndex + 1
		if currentCameraIndex > 4 then
			currentCameraIndex = 1
		end
		workspace.CurrentCamera.CameraSubject = cameras[currentCameraIndex]
	end
end)

-- camera lock
workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
workspace.CurrentCamera.CFrame = CFrame.new(part.Position) * CFrame.new(0, 0, -5)
