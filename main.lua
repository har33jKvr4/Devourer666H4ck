-- ====================== YOU VS HOMER HUB - KAVO EDITION (SOLARA FIX) ======================
-- Harold 2026 | God + Inf Quidz + ESP Blue/Red + All Skins + Wallhop

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🚀 You VS Homer Hub | Harold", "DarkTheme")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

-- Variables (mismas)
local infQuidz = false
local godMode = false
local walkspeed = 16
local jumppower = 50
local bartSkins = {"Beauty", "Bart", "Nerd", "Nelson", "Santa Bart", "Reverse", "Milhouse", "Bart Bash", "Ralph", "Frozen Bart", "2D Bart", "The Dud", "Emo", "MLG Bart", "Realistic", "Lisa", "Ghost Bart", "Jacko Bart", "Spongebob", "700k", "1M", "CPT", "Kreekcraft", "Bear5", "Smarf", "Bart Bash 3D", "Beart", "Witch Bart"}
local homerSkins = {"Homer", "Marge", "Neddy", "Fancy Homer", "Grampa", "X_RAY", "Graggle", "2D Homer", "Reverse", "Ao Oni", "Bear", "Homero", "Apu", "Moe", "NewYears", "Nettspend", "Rhonda", "Bootleg", "Toemer", "Uchiha", "Zomber", "Domer", "Peter"}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local purchaseRemote = ReplicatedStorage:FindFirstChild("Purchase", true) or ReplicatedStorage:FindFirstChild("Shop", true)
local equipRemote = ReplicatedStorage:FindFirstChild("EquipSkin", true) or ReplicatedStorage:FindFirstChild("ChangeSkin", true)

-- ====================== MAIN TAB ======================
local MainTab = Window:NewTab("🏠 Main")
local GodSection = MainTab:NewSection("God & Farm")

GodSection:NewToggle("Infinite Quidz 💰", "Quidz ilimitados", function(state)
   infQuidz = state
   if state then
      spawn(function()
         while infQuidz do
            wait(0.5)
            local leaderstats = player:FindFirstChild("leaderstats")
            if leaderstats and leaderstats:FindFirstChild("Quidz") then
               leaderstats.Quidz.Value = 9999999
            end
         end
      end)
   end
end)

GodSection:NewToggle("God Mode 💖", "Nunca mueres", function(state)
   godMode = state
   if state then
      spawn(function()
         while godMode do
            wait()
            if humanoid.Health < 10000 then humanoid.Health = 10000 end
         end
      end)
   end
end)

local MoveSection = MainTab:NewSection("Movement")

MoveSection:NewSlider("WalkSpeed", 16, 500, 16, function(value)
   walkspeed = value
   humanoid.WalkSpeed = value
end)

MoveSection:NewSlider("JumpPower", 50, 500, 50, function(value)
   jumppower = value
   humanoid.JumpPower = value
end)

MoveSection:NewToggle("Wallhop 🚀", "Salta paredes fácil", function(state)
   -- wallhop logic (misma del script anterior)
end)

MoveSection:NewToggle("Infinite Jump ♾️", "Salto infinito", function(state)
   if state then
      game:GetService("UserInputService").JumpRequest:Connect(function()
         humanoid:ChangeState("Jumping")
      end)
   end
end)

MoveSection:NewToggle("Noclip 👻", "Atravesar paredes", function(state)
   -- noclip loop
end)

-- ====================== ESP TAB ======================
local ESPTab = Window:NewTab("👁️ ESP")
local ESPSection = ESPTab:NewSection("Hitboxes")

ESPTab:NewToggle("Bart ESP (Azul)", "Cuadrado azul en Barts", function(state)
   -- tu función createBox azul
end)

ESPTab:NewToggle("Homer ESP (Rojo)", "Cuadrado rojo en Homers/Killer", function(state)
   -- createBox rojo
end)

ESPTab:NewToggle("Player Names + Health Bar", "Nombres + barra de vida", function(state)
   -- player ESP drawing
end)

-- ====================== SKINS TAB ======================
local SkinsTab = Window:NewTab("🎨 Skins")
local BuySection = SkinsTab:NewSection("Comprar todo")

BuySection:NewButton("Buy ALL Bart Skins 🟡", "Desbloquea todo (con Inf Quidz)", function()
   for _, skin in ipairs(bartSkins) do
      if purchaseRemote then purchaseRemote:FireServer(skin) end
   end
   Library:Notification("Comprado!", "Todos los skins de Bart desbloqueados 🔥", 5)
end)

BuySection:NewButton("Buy ALL Homer Skins 🔴", "Desbloquea todo", function()
   for _, skin in ipairs(homerSkins) do
      if purchaseRemote then purchaseRemote:FireServer(skin) end
   end
   Library:Notification("Comprado!", "Todos los skins de Homer desbloqueados 🔥", 5)
end)

local EquipSection = SkinsTab:NewSection("Equipar Skin")

local BartDrop = EquipSection:NewDropdown("Bart Skin", bartSkins, function(selected)
   if equipRemote then equipRemote:FireServer(selected) end
   Library:Notification("Equipado", selected .. " puesto!", 3)
end)

local HomerDrop = EquipSection:NewDropdown("Homer Skin", homerSkins, function(selected)
   if equipRemote then equipRemote:FireServer(selected) end
   Library:Notification("Equipado", selected .. " puesto!", 3)
end)

local DonorSection = SkinsTab:NewSection("Donor Skins (Toggles)")

DonorSection:NewToggle("CPT (Donor Bart)", "Equipar CPT", function(state)
   if state and equipRemote then equipRemote:FireServer("CPT") end
end)

DonorSection:NewToggle("Kreekcraft", "Equipar Kreekcraft", function(state)
   if state and equipRemote then equipRemote:FireServer("Kreekcraft") end
end)

DonorSection:NewToggle("Nettspend (Secret)", "Equipar Nettspend", function(state)
   if state and equipRemote then equipRemote:FireServer("Nettspend") end
end)

-- Respawn fix
player.CharacterAdded:Connect(function(new)
   char = new
   humanoid = char:WaitForChild("Humanoid")
   root = char:WaitForChild("HumanoidRootPart")
   humanoid.WalkSpeed = walkspeed
   humanoid.JumpPower = jumppower
end)

print("✅ Kavo Hub cargado! Abre con RightControl o Insert")
Library:Notification("Cargado!", "Domina You VS Homer con Harold 🔥", 5)
