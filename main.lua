-- Crear ScreenGui
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "DevourerGUI"
gui.Parent = player:WaitForChild("PlayerGui")

-- Frame principal
local frame = Instance.new("Frame")
frame.Parent = gui
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.35
frame.Size = UDim2.new(0, 260, 0, 165) -- un poquito más alto
frame.Position = UDim2.new(0.5, -130, 0.5, -82)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Bordes redondeados
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Título
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundTransparency = 1
title.Text = "Devourer juniors"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextStrokeTransparency = 0.2

-- Botón Devorar
local button = Instance.new("TextButton")
button.Parent = frame
button.Size = UDim2.new(0.85, 0, 0, 45)
button.Position = UDim2.new(0.075, 0, 0, 75)
button.Text = "Devorar"
button.Font = Enum.Font.GothamBold
button.TextSize = 18
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
button.BorderSizePixel = 0

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = button

-- Texto Discord
local discordLabel = Instance.new("TextLabel")
discordLabel.Parent = frame
discordLabel.Size = UDim2.new(0.25, 0, 0, 18)
discordLabel.Position = UDim2.new(0.075, 0, 0, 128)
discordLabel.BackgroundTransparency = 1
discordLabel.Text = "discord:"
discordLabel.Font = Enum.Font.Gotham
discordLabel.TextSize = 12
discordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
discordLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Link Discord
local discordLink = Instance.new("TextButton")
discordLink.Parent = frame
discordLink.Size = UDim2.new(0.6, 0, 0, 18)
discordLink.Position = UDim2.new(0.32, 0, 0, 128)
discordLink.BackgroundTransparency = 1
discordLink.Text = "https://discord.gg/666h4ck"
discordLink.Font = Enum.Font.Gotham
discordLink.TextSize = 12
discordLink.TextColor3 = Color3.fromRGB(0, 170, 255)
discordLink.TextXAlignment = Enum.TextXAlignment.Left

-- Copiar link al hacer click
discordLink.MouseButton1Click:Connect(function()
	setclipboard("https://discord.gg/666h4ck")
end)

-- Hover botón
button.MouseEnter:Connect(function()
	button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
end)

button.MouseLeave:Connect(function()
	button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
end)

button.MouseButton1Click:Connect(function()
	print("Devorar activado")
end)
