-- ====================== YOU VS HOMER - 3 SKINS MODERATOR GUI ======================
-- Harold Edition | Equipa: 1.TungTungTungSahur 2.CityBoy 3.Kreekcraft
-- Investigado: Nombres exactos de skins moderator/admin vistos en mods
-- Pega en Solara/Executor → GUI arrastra, clickea botones 🔥

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Remote para equip (investigado de scripts/foros)
local equipRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("EquipSkin") or 
                    ReplicatedStorage:FindFirstChild("ChangeSkin", true) or 
                    ReplicatedStorage:FindFirstChild("Equip", true)

local skins = {
    [1] = "TungTungTungSahur",  -- Homer/Bart admin skin (TikToks + foros)
    [2] = "CityBoy",            -- Secret City Boy (moderator visto)
    [3] = "Kreekcraft"          -- Donor/Mod Bart (wiki + scripts confirm)
}

-- ====================== GUI SIMPLE 3 BOTONES ======================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YVH_SkinsHarold"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 220, 0, 180)
Frame.Position = UDim2.new(0.5, -110, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Active = true
local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 12)
FrameCorner.Parent = Frame
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,35)
Title.BackgroundColor3 = Color3.fromRGB(45,45,45)
Title.Text = "🔥 YVH Moderator Skins"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = Frame
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

local Btn1 = Instance.new("TextButton")
Btn1.Size = UDim2.new(0.9,0,0,35)
Btn1.Position = UDim2.new(0.05,0,0.25,0)
Btn1.BackgroundColor3 = Color3.fromRGB(0,170,0)
Btn1.Text = "1. TungTungTungSahur"
Btn1.TextColor3 = Color3.new(1,1,1)
Btn1.Font = Enum.Font.GothamSemibold
Btn1.TextSize = 14
Btn1.Parent = Frame
local Btn1Corner = Instance.new("UICorner")
Btn1Corner.CornerRadius = UDim.new(0, 8)
Btn1Corner.Parent = Btn1

local Btn2 = Instance.new("TextButton")
Btn2.Size = UDim2.new(0.9,0,0,35)
Btn2.Position = UDim2.new(0.05,0,0.52,0)
Btn2.BackgroundColor3 = Color3.fromRGB(0,170,255)
Btn2.Text = "2. CityBoy"
Btn2.TextColor3 = Color3.new(1,1,1)
Btn2.Font = Enum.Font.GothamSemibold
Btn2.TextSize = 14
Btn2.Parent = Frame
local Btn2Corner = Instance.new("UICorner")
Btn2Corner.CornerRadius = UDim.new(0, 8)
Btn2Corner.Parent = Btn2

local Btn3 = Instance.new("TextButton")
Btn3.Size = UDim2.new(0.9,0,0,35)
Btn3.Position = UDim2.new(0.05,0,0.79,0)
Btn3.BackgroundColor3 = Color3.fromRGB(255,170,0)
Btn3.Text = "3. Kreekcraft"
Btn3.TextColor3 = Color3.new(1,1,1)
Btn3.Font = Enum.Font.GothamSemibold
Btn3.TextSize = 14
Btn3.Parent = Frame
local Btn3Corner = Instance.new("UICorner")
Btn3Corner.CornerRadius = UDim.new(0, 8)
Btn3Corner.Parent = Btn3

-- ====================== LOGICA BOTONES ======================
local function equipSkin(name)
    if equipRemote then
        equipRemote:FireServer(name)
        print("✅ Equipando: " .. name)
    else
        print("❌ Remote no encontrado! Revisa ReplicatedStorage.")
    end
end

Btn1.MouseButton1Click:Connect(function() equipSkin(skins[1]) end)
Btn2.MouseButton1Click:Connect(function() equipSkin(skins[2]) end)
Btn3.MouseButton1Click:Connect(function() equipSkin(skins[3]) end)

-- ====================== DRAG GUI ======================
local dragging, dragStart, startPos
Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
    end
end)
Frame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Respawn refresh
player.CharacterAdded:Connect(function()
    wait(1)
    -- Re-equip si quieres, pero manual
end)

print("✅ ¡3 SKINS MODERATOR CARGADAS! Click botones para equipar como los mods 🔥")
print("Nombres exactos investigados: Fandom Wiki + ScriptBlox + TikToks/Foros")
print("Remote: ReplicatedStorage.Remotes.EquipSkin:FireServer('SkinName')")
