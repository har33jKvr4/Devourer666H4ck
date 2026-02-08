-- ====================== YOU VS HOMER HUB RAYFIELD - HAROLD 🔥 ======================
-- FIXED FOR SOLARA (Tabs Visible + ESP Init)
-- Feb 2026

-- Rayfield (versión más estable para Solara)
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- ====================== WINDOW ======================
local Window = Rayfield:CreateWindow({
   Name = "🚀 You VS Homer Hub | Harold Edition",
   LoadingTitle = "Cargando DOMINIO TOTAL...",
   LoadingSubtitle = "por Harold",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "YVHHarold",
      FileName = "HaroldHub"
   },
   KeySystem = false
})

-- ====================== SERVICES ======================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local player = Players.LocalPlayer

local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

-- ====================== ESP INIT (FIX CRÍTICO) ======================
local ESP = {
   Player = {},
   BartBoxes = {},
   HomerBoxes = {}
}

-- ====================== VARIABLES ======================
local infQuidzConn, godConn, flyConn, noclipConn, wallhopConn, infJumpConn
local walkspeed = 16
local jumppower = 50
local flySpeed = 50
local selectedBart = "Bart"
local selectedHomer = "Homer"

local bartSkins = {
   "Beauty","Bart","Nerd","Nelson","Santa Bart","Reverse","Milhouse",
   "Bart Bash","Ralph","Frozen Bart","2D Bart","The Dud","Emo","MLG Bart",
   "Realistic","Lisa","Ghost Bart","Jacko Bart","Spongebob","700k","1M",
   "CPT","Kreekcraft","Bear5","Smarf","Bart Bash 3D","Beart","Witch Bart"
}

local homerSkins = {
   "Homer","Marge","Neddy","Fancy Homer","Grampa","X_RAY","Graggle",
   "2D Homer","Reverse","Ao Oni","Bear","Homero","Apu","Moe","NewYears",
   "Nettspend","Rhonda","Bootleg","Toemer","Uchiha","Zomber","Domer","Peter"
}

-- ====================== REMOTES ======================
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local purchaseRemote =
   ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Purchase")
   or ReplicatedStorage:FindFirstChild("Shop") and ReplicatedStorage.Shop:FindFirstChild("PurchaseSkin")

local equipRemote =
   ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("EquipSkin")
   or ReplicatedStorage:FindFirstChild("ChangeSkin")

-- ====================== MAIN TAB ======================
local MainTab = Window:CreateTab("🏠 Main")
MainTab:CreateSection("God & Farm")

MainTab:CreateToggle({
   Name = "Infinite Quidz 💰",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         infQuidzConn = RunService.Heartbeat:Connect(function()
            local ls = player:FindFirstChild("leaderstats")
            if ls and ls:FindFirstChild("Quidz") then
               ls.Quidz.Value = 1000000
            end
         end)
      else
         if infQuidzConn then infQuidzConn:Disconnect() end
      end
   end
})

MainTab:CreateToggle({
   Name = "God Mode 💖",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         godConn = RunService.Heartbeat:Connect(function()
            humanoid.Health = math.huge
            humanoid.MaxHealth = math.huge
         end)
      else
         if godConn then godConn:Disconnect() end
      end
   end
})

MainTab:CreateSection("Movement")

MainTab:CreateSlider({
   Name = "Walk Speed",
   Range = {16, 300},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(v)
      walkspeed = v
      humanoid.WalkSpeed = v
   end
})

MainTab:CreateSlider({
   Name = "Jump Power",
   Range = {50, 300},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(v)
      jumppower = v
      humanoid.JumpPower = v
   end
})

MainTab:CreateToggle({
   Name = "Infinite Jump ♾️",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         infJumpConn = UIS.JumpRequest:Connect(function()
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
         end)
      else
         if infJumpConn then infJumpConn:Disconnect() end
      end
   end
})

MainTab:CreateToggle({
   Name = "Noclip 👻",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         noclipConn = RunService.Stepped:Connect(function()
            for _, p in pairs(char:GetDescendants()) do
               if p:IsA("BasePart") then p.CanCollide = false end
            end
         end)
      else
         if noclipConn then noclipConn:Disconnect() end
      end
   end
})

-- ====================== ESP TAB ======================
local ESPTab = Window:CreateTab("👁️ ESP")
ESPTab:CreateSection("Player Visuals")

ESPTab:CreateToggle({
   Name = "Player ESP (Names)",
   CurrentValue = false,
   Callback = function(Value)
      if not Value then
         for _, d in pairs(ESP.Player) do
            if d.name then d.name:Remove() end
         end
         ESP.Player = {}
         return
      end

      RunService.RenderStepped:Connect(function()
         for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
               local data = ESP.Player[plr]
               if not data then
                  data = {name = Drawing.new("Text")}
                  data.name.Size = 14
                  data.name.Center = true
                  data.name.Outline = true
                  data.name.Color = Color3.new(1,1,1)
                  ESP.Player[plr] = data
               end

               local pos, onscreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
               data.name.Visible = onscreen
               if onscreen then
                  data.name.Text = plr.Name
                  data.name.Position = Vector2.new(pos.X, pos.Y - 20)
               end
            end
         end
      end)
   end
})

-- ====================== SKINS TAB ======================
local SkinsTab = Window:CreateTab("🎨 Skins")
SkinsTab:CreateSection("Buy All")

SkinsTab:CreateButton({
   Name = "Buy All Bart Skins",
   Callback = function()
      for _, s in ipairs(bartSkins) do
         if purchaseRemote then purchaseRemote:FireServer(s) end
      end
   end
})

SkinsTab:CreateButton({
   Name = "Buy All Homer Skins",
   Callback = function()
      for _, s in ipairs(homerSkins) do
         if purchaseRemote then purchaseRemote:FireServer(s) end
      end
   end
})

SkinsTab:CreateSection("Skin Changer")

SkinsTab:CreateDropdown({
   Name = "Bart Skin",
   Options = bartSkins,
   CurrentOption = "Bart",
   Callback = function(v) selectedBart = v end
})

SkinsTab:CreateButton({
   Name = "Equip Bart",
   Callback = function()
      if equipRemote then equipRemote:FireServer(selectedBart) end
   end
})

SkinsTab:CreateDropdown({
   Name = "Homer Skin",
   Options = homerSkins,
   CurrentOption = "Homer",
   Callback = function(v) selectedHomer = v end
})

SkinsTab:CreateButton({
   Name = "Equip Homer",
   Callback = function()
      if equipRemote then equipRemote:FireServer(selectedHomer) end
   end
})

-- ====================== RESPAWN FIX ======================
player.CharacterAdded:Connect(function(c)
   char = c
   humanoid = c:WaitForChild("Humanoid")
   root = c:WaitForChild("HumanoidRootPart")
   humanoid.WalkSpeed = walkspeed
   humanoid.JumpPower = jumppower
end)

Rayfield:Notify({
   Title = "Harold Hub Loaded",
   Content = "Main / ESP / Skins funcionando en Solara ✅",
   Duration = 5
})
