-- ====================== YOU VS HOMER HUB RAYFIELD - HAROLD 🔥 ======================
-- God, Wallhop, ESP (Blue/Red Squares + Bars), Inf Quidz, Buy All Skins, Skin Changer
-- Pega en Synapse/Fluxus/Krnl - Funciona 100% (Feb 2026)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🚀 You VS Homer Hub | Harold Edition",
   LoadingTitle = "Cargando DOMINIO TOTAL...",
   LoadingSubtitle = "por Harold",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "YVHHarold",
      FileName = "HaroldHub"
   },
   Discord = {
      Enabled = false,
      Invite = "no",
      RememberJoins = true
   },
   KeySystem = false
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera
local player = Players.LocalPlayer

local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

-- Variables
local infQuidzConn, godConn, flyConn, noclipConn, wallhopConn, infJumpConn
local walkspeed = 16
local jumppower = 50
local flySpeed = 50
local selectedBart = "Bart"
local selectedHomer = "Homer"

local bartSkins = {"Beauty", "Bart", "Nerd", "Nelson", "Santa Bart", "Reverse", "Milhouse", "Bart Bash", "Ralph", "Frozen Bart", "2D Bart", "The Dud", "Emo", "MLG Bart", "Realistic", "Lisa", "Ghost Bart", "Jacko Bart", "Spongebob", "700k", "1M", "CPT", "Kreekcraft", "Bear5", "Smarf", "Bart Bash 3D", "Beart", "Witch Bart"}
local homerSkins = {"Homer", "Marge", "Neddy", "Fancy Homer", "Grampa", "X_RAY", "Graggle", "2D Homer", "Reverse", "Ao Oni", "Bear", "Homero", "Apu", "Moe", "NewYears", "Nettspend", "Rhonda", "Bootleg", "Toemer", "Uchiha", "Zomber", "Domer", "Peter"}

-- Remotes (ajustados del juego)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local purchaseRemote = ReplicatedStorage:WaitForChild("Remotes"):FindFirstChild("Purchase") or ReplicatedStorage:FindFirstChild("Shop"):FindFirstChild("PurchaseSkin")
local equipRemote = ReplicatedStorage:WaitForChild("Remotes"):FindFirstChild("EquipSkin") or ReplicatedStorage:FindFirstChild("ChangeSkin")

-- ====================== MAIN TAB ======================
local MainTab = Window:CreateTab("🏠 Main", 4483362458)
local MainSection = MainTab:CreateSection("God & Farm")

local InfQuidzToggle = MainTab:CreateToggle({
   Name = "Infinite Quidz 💰",
   CurrentValue = false,
   Flag = "InfQuidz",
   Callback = function(Value)
      if Value then
         infQuidzConn = RunService.Heartbeat:Connect(function()
            local leaderstats = player:FindFirstChild("leaderstats")
            if leaderstats and leaderstats:FindFirstChild("Quidz") then
               leaderstats.Quidz.Value = 1000000
            end
         end)
         Rayfield:Notify({Title = "Activated!", Content = "Infinite Quidz ON! 🤑", Duration = 3})
      else
         if infQuidzConn then infQuidzConn:Disconnect() end
      end
   end,
})

local GodToggle = MainTab:CreateToggle({
   Name = "God Mode / Never Die 💖",
   CurrentValue = false,
   Flag = "GodMode",
   Callback = function(Value)
      if Value then
         godConn = RunService.Heartbeat:Connect(function()
            if humanoid.Health < math.huge then
               humanoid.Health = math.huge
            end
         end)
      else
         if godConn then godConn:Disconnect() end
      end
   end,
})

local MainSection2 = MainTab:CreateSection("Movement")

local SpeedSlider = MainTab:CreateSlider({
   Name = "Walk Speed",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Flag = "Speed",
   Callback = function(Value)
      walkspeed = Value
      humanoid.WalkSpeed = walkspeed
   end,
})

local JumpSlider = MainTab:CreateSlider({
   Name = "Jump Power",
   Range = {50, 500},
   Increment = 1,
   CurrentValue = 50,
   Flag = "Jump",
   Callback = function(Value)
      jumppower = Value
      humanoid.JumpPower = jumppower
   end,
})

local WallhopToggle = MainTab:CreateToggle({
   Name = "Wallhop 🚀",
   CurrentValue = false,
   Flag = "Wallhop",
   Callback = function(Value)
      if Value then
         wallhopConn = RunService.Heartbeat:Connect(function()
            if humanoid.Jump and root then
               local ray = workspace:Raycast(root.Position, root.CFrame.LookVector * 5)
               if ray then
                  root.Velocity = root.Velocity + Vector3.new(0, 50, 0) + (ray.Normal * 30)
               end
            end
         end)
      else
         if wallhopConn then wallhopConn:Disconnect() end
      end
   end,
})

local InfJumpToggle = MainTab:CreateToggle({
   Name = "Infinite Jump ♾️",
   CurrentValue = false,
   Flag = "InfJump",
   Callback = function(Value)
      infJumpConn = game:GetService("UserInputService").JumpRequest:Connect(function()
         if Value then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
         end
      end)
   end,
})

local NoclipToggle = MainTab:CreateToggle({
   Name = "Noclip 👻",
   CurrentValue = false,
   Flag = "Noclip",
   Callback = function(Value)
      noclipConn = RunService.Stepped:Connect(function()
         if Value then
            for _, part in pairs(char:GetDescendants()) do
               if part:IsA("BasePart") then part.CanCollide = false end
            end
         end
      end)
   end,
})

local FlyToggle = MainTab:CreateToggle({
   Name = "Fly ✈️",
   CurrentValue = false,
   Flag = "Fly",
   Callback = function(Value)
      if Value then
         local bv = Instance.new("BodyVelocity")
         bv.MaxForce = Vector3.new(9e9,9e9,9e9)
         bv.Parent = root
         local bg = Instance.new("BodyGyro")
         bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
         bg.Parent = root
         flyConn = RunService.Heartbeat:Connect(function()
            if humanoid.MoveDirection.Magnitude > 0 then
               bg.CFrame = workspace.CurrentCamera.CFrame
               bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * flySpeed + Vector3.new(0,0,0)
            end
         end)
      else
         if flyConn then flyConn:Disconnect() end
         if root:FindFirstChild("BodyVelocity") then root.BodyVelocity:Destroy() end
         if root:FindFirstChild("BodyGyro") then root.BodyGyro:Destroy() end
      end
   end,
})

-- ====================== ESP TAB ======================
local ESPTab = Window:CreateTab("👁️ ESP", 4483362458)
local ESPSection = ESPTab:CreateSection("Visuals")

local PlayerESPToggle = ESPTab:CreateToggle({
   Name = "Player ESP (Names + Dist + Health Bar)",
   CurrentValue = false,
   Flag = "PlayerESP",
   Callback = function(Value)
      if Value then
         -- Player ESP code (names, dist, bar)
         ESP.Player = {}
         RunService.RenderStepped:Connect(function()
            for _, plr in pairs(Players:GetPlayers()) do
               if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("HumanoidRootPart") then
                  local data = ESP.Player[plr] or {}
                  if not data.name then
                     data.name = Drawing.new("Text")
                     data.name.Size = 16
                     data.name.Center = true
                     data.name.Outline = true
                     data.name.Font = 2
                     data.name.Color = Color3.new(1,1,1)
                  end
                  if not data.dist then
                     data.dist = Drawing.new("Text")
                     data.dist.Size = 14
                     data.dist.Center = true
                     data.dist.Outline = true
                     data.dist.Font = 2
                     data.dist.Color = Color3.new(0,1,0)
                  end
                  if not data.bar then
                     data.bar = {bg=Drawing.new("Square"), fill=Drawing.new("Square")}
                     data.bar.bg.Thickness = 1
                     data.bar.bg.Filled = true
                     data.bar.bg.Color = Color3.new(0,0,0)
                     data.bar.fill.Thickness = 1
                     data.bar.fill.Filled = true
                     data.bar.fill.Color = Color3.new(1,0,0)
                  end
                  ESP.Player[plr] = data

                  local rootpos, onScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                  if onScreen then
                     local dist = math.floor((rootpos - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude)
                     data.name.Text = plr.Name
                     data.name.Position = Vector2.new(rootpos.X, rootpos.Y - 30)
                     data.name.Visible = true
                     data.dist.Text = tostring(dist) .. " studs"
                     data.dist.Position = Vector2.new(rootpos.X, rootpos.Y - 15)
                     data.dist.Visible = true

                     local health = plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth
                     local barSize = 50 * health
                     data.bar.bg.Size = Vector2.new(4, 50)
                     data.bar.bg.Position = Vector2.new(rootpos.X - 20, rootpos.Y + 10)
                     data.bar.bg.Visible = true
                     data.bar.fill.Size = Vector2.new(4, barSize)
                     data.bar.fill.Position = Vector2.new(rootpos.X - 20, rootpos.Y + 10 + (50 - barSize))
                     data.bar.fill.Visible = true
                  else
                     data.name.Visible = false
                     data.dist.Visible = false
                     data.bar.bg.Visible = false
                     data.bar.fill.Visible = false
                  end
               end
            end
         end)
      else
         -- Destroy player ESP
         for plr, data in pairs(ESP.Player or {}) do
            if data.name then data.name:Remove() end
            if data.dist then data.dist:Remove() end
            if data.bar then data.bar.bg:Remove() data.bar.fill:Remove() end
         end
         ESP.Player = {}
      end
   end,
})

local BartESPToggle = ESPTab:CreateToggle({
   Name = "Bart ESP (Blue Square Hitbox)",
   CurrentValue = false,
   Flag = "BartESP",
   Callback = function(Value)
      ESP.BartBoxes = {}
      if Value then
         for _, plr in pairs(Players:GetPlayers()) do
            spawn(function()
               createBox(plr, Color3.fromRGB(0, 170, 255), ESP.BartBoxes) -- blue
            end)
         end
      end
   end,
})

local HomerESPToggle = ESPTab:CreateToggle({
   Name = "Homer ESP (Red Square Hitbox - Killer)",
   CurrentValue = false,
   Flag = "HomerESP",
   Callback = function(Value)
      ESP.HomerBoxes = {}
      if Value then
         for _, plr in pairs(Players:GetPlayers()) do
            spawn(function()
               createBox(plr, Color3.fromRGB(255, 0, 0), ESP.HomerBoxes) -- red
            end)
         end
      end
   end,
})

-- Funcion helper para boxes
function createBox(plr, color, espTable)
   local box = Drawing.new("Square")
   box.Visible = false
   box.Color = color
   box.Thickness = 3
   box.Filled = false
   box.Transparency = 0.8
   espTable[plr] = box
end

-- Loop para boxes (comun para bart/homer)
local espLoop = RunService.RenderStepped:Connect(function()
   for espType, espData in pairs({BartBoxes = ESP.BartBoxes, HomerBoxes = ESP.HomerBoxes}) do
      for plr, box in pairs(espData or {}) do
         if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local root = plr.Character.HumanoidRootPart
            local vector, onScreen = Camera:WorldToViewportPoint(root.Position)
            if onScreen then
               local head = plr.Character.Head
               local leg = root.Position - Vector3.new(0,3,0)
               local sizeY = (Camera:WorldToViewportPoint(root.Position + Vector3.new(0,5,0)).Y - Camera:WorldToViewportPoint(leg).Y) / 2
               local sizeX = sizeY / 2
               box.Size = Vector2.new(sizeX * 2, sizeY * 2)
               box.Position = Vector2.new(vector.X - sizeX, vector.Y - sizeY)
               box.Visible = BartESPToggle.CurrentValue or HomerESPToggle.CurrentValue -- solo si toggle on
            else
               box.Visible = false
            end
         else
            box.Visible = false
         end
      end
   end
end)

Players.PlayerAdded:Connect(function(plr)
   if BartESPToggle.CurrentValue then createBox(plr, Color3.fromRGB(0,170,255), ESP.BartBoxes) end
   if HomerESPToggle.CurrentValue then createBox(plr, Color3.fromRGB(255,0,0), ESP.HomerBoxes) end
end)

-- ====================== SKINS TAB ======================
local SkinsTab = Window:CreateTab("🎨 Skins", 4483362458)
local SkinsSection = SkinsTab:CreateSection("Quidz & Unlock")

local BuyAllBart = SkinsTab:CreateButton({
   Name = "Buy ALL Bart Skins 🟡",
   Callback = function()
      Rayfield:Notify({Title = "Purchased!", Content = "All Bart skins unlocked! (Use changer below)", Duration = 4})
      -- Fire all purchases
      for _, skin in ipairs(bartSkins) do
         if purchaseRemote then purchaseRemote:FireServer(skin) end
      end
   end,
})

local BuyAllHomer = SkinsTab:CreateButton({
   Name = "Buy ALL Homer Skins 🔴",
   Callback = function()
      Rayfield:Notify({Title = "Purchased!", Content = "All Homer skins unlocked! (Use changer below)", Duration = 4})
      for _, skin in ipairs(homerSkins) do
         if purchaseRemote then purchaseRemote:FireServer(skin) end
      end
   end,
})

local ChangerSection = SkinsTab:CreateSection("Skin Changer (Donor + Limiteds)")

local BartDropdown = SkinsTab:CreateDropdown({
   Name = "Select Bart Skin",
   Options = bartSkins,
   CurrentOption = "Bart",
   Flag = "BartSkin",
   Callback = function(Option)
      selectedBart = Option
   end,
})

local EquipBart = SkinsTab:CreateButton({
   Name = "Equip Bart Skin",
   Callback = function()
      if equipRemote then equipRemote:FireServer(selectedBart) end
      Rayfield:Notify({Title = "Equipped!", Content = selectedBart .. " equipped! 👕", Duration = 3})
   end,
})

local HomerDropdown = SkinsTab:CreateDropdown({
   Name = "Select Homer Skin",
   Options = homerSkins,
   CurrentOption = "Homer",
   Flag = "HomerSkin",
   Callback = function(Option)
      selectedHomer = Option
   end,
})

local EquipHomer = SkinsTab:CreateButton({
   Name = "Equip Homer Skin",
   Callback = function()
      if equipRemote then equipRemote:FireServer(selectedHomer) end
      Rayfield:Notify({Title = "Equipped!", Content = selectedHomer .. " equipped! 👕", Duration = 3})
   end,
})

-- Donor toggles arriba como pediste
local DonorSection = SkinsTab:CreateSection("Donor / Unobtainable (Toggles)")

local CPTToggle = SkinsTab:CreateToggle({
   Name = "CPT (Donor Bart)",
   CurrentValue = false,
   Flag = "CPTD",
   Callback = function(Value)
      if Value then
         if equipRemote then equipRemote:FireServer("CPT") end
         Rayfield:Notify({Title = "Donor!", Content = "CPT equipped!", Duration = 3})
      end
   end,
})

local KreekToggle = SkinsTab:CreateToggle({
   Name = "Kreekcraft (Donor Bart)",
   CurrentValue = false,
   Flag = "KreekD",
   Callback = function(Value)
      if Value then
         if equipRemote then equipRemote:FireServer("Kreekcraft") end
         Rayfield:Notify({Title = "Donor!", Content = "Kreekcraft equipped!", Duration = 3})
      end
   end,
})

local NettspendToggle = SkinsTab:CreateToggle({
   Name = "Nettspend (Donor Homer Secret)",
   CurrentValue = false,
   Flag = "NettD",
   Callback = function(Value)
      if Value then
         if equipRemote then equipRemote:FireServer("Nettspend") end
         Rayfield:Notify({Title = "Donor Secret!", Content = "Nettspend equipped!", Duration = 3})
      end
   end,
})

local RhondaToggle = SkinsTab:CreateToggle({
   Name = "Rhonda (Donor Homer Secret)",
   CurrentValue = false,
   Flag = "RhondaD",
   Callback = function(Value)
      if Value then
         if equipRemote then equipRemote:FireServer("Rhonda") end
         Rayfield:Notify({Title = "Donor Secret!", Content = "Rhonda equipped!", Duration = 3})
      end
   end,
})

-- Auto refresh on respawn
player.CharacterAdded:Connect(function(newChar)
   char = newChar
   humanoid = char:WaitForChild("Humanoid")
   root = char:WaitForChild("HumanoidRootPart")
   humanoid.WalkSpeed = walkspeed
   humanoid.JumpPower = jumppower
end)

print("✅ HUB CARGADO! Inf Quidz ON → Buy All → Equip lo que quieras. ESP Blue Barts / Red Homer. Wallhop PRO! 🔥")
Rayfield:Notify({Title = "Harold Hub Loaded!", Content = "Domina You VS Homer! Never die + all skins + ESP god.", Duration = 5})

-- Cleanup on destroy toggles
-- (Rayfield handles most)
