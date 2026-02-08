-- ====================== GOD + AUTO SAFE + PORTAL EDGES ======================
-- Escape Tsunami For Brainrots - Harold v3 PORTAL
-- ¡Acércate a la PARED FRONTAL → TP siguiente! Trasera → anterior! MEGA RACE!

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local autoSafe = false
local godMode = false
local portalEnabled = false
local safes = {}
local last_tp = 0

-- ====================== GUI PRO ======================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.Name = "TsunamiPortal"

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 220)
Frame.Position = UDim2.new(0.72, 0, 0.25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Active = true
local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 12)
FrameCorner.Parent = Frame
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundColor3 = Color3.fromRGB(45,45,45)
Title.Text = "🚀 Tsunami Brainrot GOD + PORTAL EDGES"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = Frame
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

local ToggleSafe = Instance.new("TextButton")
ToggleSafe.Size = UDim2.new(0.9,0,0,38)
ToggleSafe.Position = UDim2.new(0.05,0,0.22,0)
ToggleSafe.BackgroundColor3 = Color3.fromRGB(170,0,0)
ToggleSafe.Text = "Auto Safe: OFF"
ToggleSafe.TextColor3 = Color3.new(1,1,1)
ToggleSafe.Font = Enum.Font.GothamSemibold
ToggleSafe.TextSize = 15
ToggleSafe.Parent = Frame
local SafeCorner = Instance.new("UICorner")
SafeCorner.CornerRadius = UDim.new(0, 8)
SafeCorner.Parent = ToggleSafe

local ToggleGod = Instance.new("TextButton")
ToggleGod.Size = UDim2.new(0.9,0,0,38)
ToggleGod.Position = UDim2.new(0.05,0,0.48,0)
ToggleGod.BackgroundColor3 = Color3.fromRGB(170,0,0)
ToggleGod.Text = "God Mode: OFF"
ToggleGod.TextColor3 = Color3.new(1,1,1)
ToggleGod.Font = Enum.Font.GothamSemibold
ToggleGod.TextSize = 15
ToggleGod.Parent = Frame
local GodCorner = Instance.new("UICorner")
GodCorner.CornerRadius = UDim.new(0, 8)
GodCorner.Parent = ToggleGod

local TogglePortal = Instance.new("TextButton")
TogglePortal.Size = UDim2.new(0.9,0,0,38)
TogglePortal.Position = UDim2.new(0.05,0,0.74,0)
TogglePortal.BackgroundColor3 = Color3.fromRGB(170,0,0)
TogglePortal.Text = "Portal Edges: OFF"
TogglePortal.TextColor3 = Color3.new(1,1,1)
TogglePortal.Font = Enum.Font.GothamSemibold
TogglePortal.TextSize = 15
TogglePortal.Parent = Frame
local PortalCorner = Instance.new("UICorner")
PortalCorner.CornerRadius = UDim.new(0, 8)
PortalCorner.Parent = TogglePortal

local Info = Instance.new("TextLabel")
Info.Size = UDim2.new(0.9,0,0,35)
Info.Position = UDim2.new(0.05,0,0.92,0)
Info.BackgroundTransparency = 1
Info.Text = "Borde frontal → next | Trasero → prev"
Info.TextColor3 = Color3.fromRGB(150,150,150)
Info.Font = Enum.Font.Gotham
Info.TextSize = 12
Info.TextWrapped = true
Info.Parent = Frame

-- ====================== SAFES DETECT MEJORADO ======================
local function getAllSafes()
    local candidates = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.CanCollide and obj.Anchored and 
           obj.Size.Y > 0.5 and obj.Size.Y < 15 and obj.Size.X < 25 and obj.Size.Z < 25 and
           obj.Transparency < 0.9 and not obj.Name:lower():find("water") and 
           math.abs(obj.Position.X) < 100 and math.abs(obj.Position.Y) < 25 then
            table.insert(candidates, obj)
        end
    end
    table.sort(candidates, function(a, b) return a.Position.Z < b.Position.Z end)
    
    -- Filtra clusters: solo si gap >25 studs
    local filtered = {}
    for _, obj in ipairs(candidates) do
        if #filtered == 0 or (obj.Position.Z - filtered[#filtered].Position.Z) > 25 then
            table.insert(filtered, obj)
        end
    end
    
    print("🔍 Safes detectados (" .. #filtered .. " filtrados por Z):")
    for i, v in ipairs(filtered) do
        print(i .. ": " .. v.Name .. " Z=" .. math.floor(v.Position.Z) .. " (X=" .. math.floor(v.Position.X) .. ")")
    end
    return filtered
end

local function getClosestSafe()
    local closest, dist, idx = nil, math.huge, -1
    for i, obj in ipairs(safes) do
        if obj and obj.Parent then
            local d = (obj.Position - hrp.Position).Magnitude
            if d < dist then
                dist = d
                closest = obj
                idx = i
            end
        end
    end
    return closest, dist, idx
end

local function getHideCFrame(safe)
    -- DEBAJO del safe (bottom center)
    return safe.CFrame * CFrame.new(0, -safe.Size.Y / 2, 0)
end

local function tpTo(target_safe, direction)
    local goal = getHideCFrame(target_safe)
    local tween = TweenService:Create(hrp, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {CFrame = goal})
    tween:Play()
    print("🚀 PORTAL " .. direction .. "! → Safe #" .. (direction=="adelante" and "siguiente" or "anterior"))
end

-- ====================== WAVE DETECT MEJORADO ======================
local function isWaveComing()
    local wave_front_z = math.huge
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and (
            part.Name:lower():find("tsunami") or part.Name:lower():find("wave") or 
            part.Name:lower():find("flood") or part.Name:lower():find("water") or
            part.BrickColor.Name:find("blue") or part.Material == Enum.Material.Water
        ) then
            wave_front_z = math.min(wave_front_z, part.Position.Z + part.Size.Z / 2)
        end
    end
    return wave_front_z < hrp.Position.Z + 120  -- ola desde atrás acercándose
end

-- ====================== PORTAL EDGES LOOP ======================
local portalConnection
local autoConnection

local function startLoops()
    if portalConnection then portalConnection:Disconnect() end
    if autoConnection then autoConnection:Disconnect() end
    
    portalConnection = RunService.Heartbeat:Connect(function()
        if not portalEnabled then return end
        local now = tick()
        if now - last_tp < 0.3 then return end
        
        local safe, dist, idx = getClosestSafe()
        if not safe or dist >= 15 then return end  -- no en safe
        
        local safe_Z = safe.Position.Z
        local player_Z = hrp.Position.Z
        local half_Z = safe.Size.Z / 2
        local wall_dist = 4  -- trigger a 4 studs de la pared
        
        local front_trigger = safe_Z + half_Z - wall_dist
        local back_trigger = safe_Z - half_Z + wall_dist
        
        if player_Z > front_trigger then
            if idx < #safes then
                tpTo(safes[idx + 1], "ADELANTE")
                last_tp = now
            end
        elseif player_Z < back_trigger then
            if idx > 1 then
                tpTo(safes[idx - 1], "ATRÁS")
                last_tp = now
            end
        end
    end)
    
    autoConnection = RunService.Heartbeat:Connect(function()
        if autoSafe and isWaveComing() then
            local safe = getClosestSafe()
            if safe then
                local goal = getHideCFrame(safe)
                local tween = TweenService:Create(hrp, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {CFrame = goal})
                tween:Play()
            end
        end
    end)
end

-- ====================== GOD MODE ======================
local function applyGod()
    local hum = char:FindFirstChild("Humanoid")
    if hum and godMode then
        hum.MaxHealth = math.huge
        hum.Health = math.huge
    end
end

player.CharacterAdded:Connect(function(newChar)
    char = newChar
    hrp = char:WaitForChild("HumanoidRootPart")
    safes = getAllSafes()
    applyGod()
    startLoops()
end)

-- ====================== BOTONES ======================
ToggleSafe.MouseButton1Click:Connect(function()
    autoSafe = not autoSafe
    ToggleSafe.Text = "Auto Safe: " .. (autoSafe and "ON" or "OFF")
    ToggleSafe.BackgroundColor3 = autoSafe and Color3.fromRGB(0,170,0) or Color3.fromRGB(170,0,0)
end)

ToggleGod.MouseButton1Click:Connect(function()
    godMode = not godMode
    ToggleGod.Text = "God Mode: " .. (godMode and "ON" or "OFF")
    ToggleGod.BackgroundColor3 = godMode and Color3.fromRGB(0,170,0) or Color3.fromRGB(170,0,0)
    applyGod()
end)

TogglePortal.MouseButton1Click:Connect(function()
    portalEnabled = not portalEnabled
    TogglePortal.Text = "Portal Edges: " .. (portalEnabled and "ON" or "OFF")
    TogglePortal.BackgroundColor3 = portalEnabled and Color3.fromRGB(0,170,255) or Color3.fromRGB(170,0,0)
end)

-- ====================== INIT ======================
safes = getAllSafes()
startLoops()
applyGod()
print("✅ ¡PORTAL EDGES CARGADO! Entra en safe + Portal ON → acércate FRONTAL/ATRÁS para TP! 🔥")
print("Mira F9 para lista de safes por Z (adelante = +Z)")

-- DRAG GUI
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
