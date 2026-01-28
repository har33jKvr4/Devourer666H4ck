--[[ 
====================================================
 Lonche-Haldozki | Devourer#1
 FPS DEVOURER HUB
 LocalScript
====================================================
]]

-------------------------------------------------
-- SERVICIOS
-------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-------------------------------------------------
-- LOADING SCREEN (SIN CAMBIOS)
-------------------------------------------------
local LoadingGui = Instance.new("ScreenGui")
LoadingGui.Name = "TsunamiLoading"
LoadingGui.ResetOnSpawn = false
LoadingGui.IgnoreGuiInset = true
LoadingGui.Parent = PlayerGui

local Background = Instance.new("Frame")
Background.Parent = LoadingGui
Background.Size = UDim2.new(1,0,1,0)
Background.BackgroundColor3 = Color3.fromRGB(0,0,0)
Background.BackgroundTransparency = 1

local TitleLoad = Instance.new("TextLabel")
TitleLoad.Parent = Background
TitleLoad.Size = UDim2.new(1,0,0,60)
TitleLoad.Position = UDim2.new(0,0,0.4,0)
TitleLoad.BackgroundTransparency = 1
TitleLoad.Text = "Loading Devourer..."
TitleLoad.TextColor3 = Color3.fromRGB(255,255,255)
TitleLoad.Font = Enum.Font.GothamBold
TitleLoad.TextSize = 32
TitleLoad.TextTransparency = 1

local BarBack = Instance.new("Frame")
BarBack.Parent = Background
BarBack.Size = UDim2.new(0.4,0,0,18)
BarBack.Position = UDim2.new(0.3,0,0.52,0)
BarBack.BackgroundColor3 = Color3.fromRGB(40,40,40)
BarBack.BackgroundTransparency = 1
BarBack.BorderSizePixel = 0
Instance.new("UICorner", BarBack).CornerRadius = UDim.new(0,10)

local Bar = Instance.new("Frame")
Bar.Parent = BarBack
Bar.Size = UDim2.new(0,0,1,0)
Bar.BackgroundColor3 = Color3.fromRGB(0,255,0)
Bar.BorderSizePixel = 0
Instance.new("UICorner", Bar).CornerRadius = UDim.new(0,10)

TweenService:Create(Background,TweenInfo.new(.6),{BackgroundTransparency=0}):Play()
TweenService:Create(TitleLoad,TweenInfo.new(.6),{TextTransparency=0}):Play()
TweenService:Create(BarBack,TweenInfo.new(.6),{BackgroundTransparency=0}):Play()

task.wait(.6)
TweenService:Create(Bar,TweenInfo.new(1.2),{Size=UDim2.new(1,0,1,0)}):Play()
task.wait(1.5)
LoadingGui:Destroy()

-------------------------------------------------
-- UI HUB
-------------------------------------------------
local ScreenGui = Instance.new("ScreenGui",PlayerGui)
local MainFrame = Instance.new("Frame",ScreenGui)

MainFrame.Size = UDim2.new(0,260,0,150)
MainFrame.Position = UDim2.new(.5,-130,.5,-75)
MainFrame.BackgroundColor3 = Color3.fromRGB(255,140,0)
MainFrame.BackgroundTransparency = .25
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner",MainFrame).CornerRadius = UDim.new(0,12)

local CreatorLabel = Instance.new("TextLabel",MainFrame)
CreatorLabel.Size = UDim2.new(1,0,0,25)
CreatorLabel.Position = UDim2.new(0,0,0,5)
CreatorLabel.BackgroundTransparency = 1
CreatorLabel.Text = "Lonche-Haldozki | Devourer#1"
CreatorLabel.Font = Enum.Font.GothamBold
CreatorLabel.TextSize = 14

local FPSButton = Instance.new("TextButton",MainFrame)
FPSButton.Size = UDim2.new(.9,0,0,45)
FPSButton.Position = UDim2.new(.05,0,0,60)
FPSButton.Text = "FPS DEVOURER"
FPSButton.Font = Enum.Font.GothamBold
FPSButton.TextSize = 18
FPSButton.BorderSizePixel = 0
Instance.new("UICorner",FPSButton).CornerRadius = UDim.new(0,10)

local DiscordLabel = Instance.new("TextLabel",MainFrame)
DiscordLabel.Size = UDim2.new(0,55,0,15)
DiscordLabel.Position = UDim2.new(.05,0,0,115)
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Text = "discord:"
DiscordLabel.Font = Enum.Font.Gotham
DiscordLabel.TextSize = 11

local DiscordLink = Instance.new("TextButton",MainFrame)
DiscordLink.Size = UDim2.new(0,170,0,15)
DiscordLink.Position = UDim2.new(.27,0,0,115)
DiscordLink.BackgroundTransparency = 1
DiscordLink.Text = "https://discord.gg/WvmRU6RYn"
DiscordLink.TextColor3 = Color3.fromRGB(120,170,255)
DiscordLink.Font = Enum.Font.Gotham
DiscordLink.TextSize = 11
DiscordLink.AutoButtonColor = false

DiscordLink.MouseButton1Click:Connect(function()
	GuiService:OpenBrowserWindow("https://discord.gg/WvmRU6RYn")
end)

-------------------------------------------------
-- RAINBOW
-------------------------------------------------
local hue=0
RunService.RenderStepped:Connect(function()
	hue+=.002
	if hue>1 then hue=0 end
	local c=Color3.fromHSV(hue,1,1)

	CreatorLabel.TextColor3=c
	FPSButton.TextColor3=c
	DiscordLabel.TextColor3=c
	FPSButton.BackgroundColor3=c
end)

-------------------------------------------------
-- FPS DEVOURER SOURCE
-------------------------------------------------
FPSButton.MouseButton1Click:Connect(function()

loadstring([[
local Players=game:GetService("Players")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local RunService=game:GetService("RunService")
local Debris=game:GetService("Debris")
local player=Players.LocalPlayer
local character=player.Character or player.CharacterAdded:Wait()
local humanoid=character:WaitForChild("Humanoid")

local function findTool(n)
	for _,t in pairs(player.Backpack:GetChildren())do if t.Name==n then return t end end
	for _,t in pairs(character:GetChildren())do if t.Name==n then return t end end
	for _,o in pairs(ReplicatedStorage:GetDescendants())do if o.Name==n and o:IsA("Tool") then return o:Clone() end end
end

local clone=character:Clone()
clone.Name="SingleClonerLag"
clone.Parent=workspace
clone.HumanoidRootPart.CFrame=character.HumanoidRootPart.CFrame+Vector3.new(8,0,0)

local tool=findTool("Quantum Cloner")
if tool then tool.Parent=player.Backpack humanoid:EquipTool(tool) task.wait(.5) pcall(function() tool.Activated:FireServer() end) end

local h=RunService.RenderStepped:Connect(function()
	for _,o in pairs(workspace:GetChildren())do
		if o.Name=="SingleClonerLag" then
			for _,p in pairs(o:GetDescendants())do
				if p:IsA("BasePart") then p.LocalTransparencyModifier=1 end
			end
		end
	end
end)

Debris:AddItem(clone,120)
task.delay(120,function()h:Disconnect()end)
]])()

end)
