local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.4, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 20)
uicorner.Parent = mainFrame

local dragging = false
local dragStart = nil
local startPos = nil

mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
	end
end)

mainFrame.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

mainFrame.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = mainFrame
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Text = "Walkspeed Gui"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 20
titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.Font = Enum.Font.SourceSans

local textBox = Instance.new("TextBox")
textBox.Parent = mainFrame
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Position = UDim2.new(0.5, -100, 0.3, 0)
textBox.PlaceholderText = "Enter WalkSpeed"
textBox.Text = ""
textBox.ClearTextOnFocus = true
textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 18

local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0, 20)  
textBoxCorner.Parent = textBox

local submitButton = Instance.new("TextButton")
submitButton.Parent = mainFrame
submitButton.Size = UDim2.new(0, 200, 0, 50)
submitButton.Position = UDim2.new(0.5, -100, 0.4, 60)
submitButton.Text = "Set WalkSpeed"
submitButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.Font = Enum.Font.SourceSans
submitButton.TextSize = 20

local submitButtonCorner = Instance.new("UICorner")
submitButtonCorner.CornerRadius = UDim.new(0, 20)  
submitButtonCorner.Parent = submitButton

local messageLabel = Instance.new("TextLabel")
messageLabel.Parent = mainFrame
messageLabel.Size = UDim2.new(0, 400, 0, 50)
messageLabel.Position = UDim2.new(0.5, -200, 0.7, 0)
messageLabel.Text = ""
messageLabel.BackgroundTransparency = 1
messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
messageLabel.Font = Enum.Font.SourceSans
messageLabel.TextSize = 18

local toggleButton = Instance.new("TextButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0.5, -50, 0.2, 0)
toggleButton.Text = "Toggle GUI"
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSans
toggleButton.TextSize = 20

local toggleButtonCorner = Instance.new("UICorner")
toggleButtonCorner.CornerRadius = UDim.new(0, 20)  
toggleButtonCorner.Parent = toggleButton

local draggingToggleButton = false
local toggleButtonStart = nil
local toggleButtonStartPos = nil

toggleButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		draggingToggleButton = true
		toggleButtonStart = input.Position
		toggleButtonStartPos = toggleButton.Position
	end
end)

toggleButton.InputChanged:Connect(function(input)
	if draggingToggleButton and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - toggleButtonStart
		toggleButton.Position = UDim2.new(toggleButtonStartPos.X.Scale, toggleButtonStartPos.X.Offset + delta.X, toggleButtonStartPos.Y.Scale, toggleButtonStartPos.Y.Offset + delta.Y)
	end
end)

toggleButton.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		draggingToggleButton = false
	end
end)

local isVisible = true
toggleButton.MouseButton1Click:Connect(function()
	isVisible = not isVisible
	mainFrame.Visible = isVisible
end)

local emergencyBrakeButton = Instance.new("TextButton")
emergencyBrakeButton.Parent = screenGui
emergencyBrakeButton.Size = UDim2.new(0, 200, 0, 50)
emergencyBrakeButton.Position = UDim2.new(0.5, -100, 0.8, 0)
emergencyBrakeButton.Text = "Emergency Brake"
emergencyBrakeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
emergencyBrakeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
emergencyBrakeButton.Font = Enum.Font.SourceSans
emergencyBrakeButton.TextSize = 20

local emergencyBrakeButtonCorner = Instance.new("UICorner")
emergencyBrakeButtonCorner.CornerRadius = UDim.new(0, 20)  
emergencyBrakeButtonCorner.Parent = emergencyBrakeButton

local function activateEmergencyBrake()
	player.Character.Humanoid.WalkSpeed = 0
	messageLabel.Position = UDim2.new(0.1, 0, -0.1, 0)
	messageLabel.Text = "EMERGENCY BRAKE"
	print(player.Name .. " has activated Emergency Brake! ")
end

local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed then
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.M then
			activateEmergencyBrake()
		end
	end
end)

emergencyBrakeButton.MouseButton1Click:Connect(function()
	activateEmergencyBrake()
end)

submitButton.MouseButton1Click:Connect(function()
	local input = textBox.Text
	local speed = tonumber(input)

	if speed then
		player.Character.Humanoid.WalkSpeed = speed
		messageLabel.Position = UDim2.new(0.1, 0, -0.1, 0)
		messageLabel.Text = "Walkspeed set to: " .. speed
		print(player.Name .. " Has set they're speed to " .. speed)
	else
		messageLabel.Text = "Invalid input. Please enter a valid number."
	end
end)
