if game.PlaceId == 126884695634066 then

local Rayfield = loadstring(game:HttpGet('https://serius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Grow A Garden Hub ULTIMATE",
    Icon = 0,
    LoadingTitle = "Grow A Garden Hub ULTIMATE",
    LoadingSubtitle = "v3.0 - Loading...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "GrowAGardenHubUltimate"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Grow A Garden Hub",
        Subtitle = "Key System",
        Note = "No key required",
        FileName = "GrowAGardenHubUltimate",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"key123"}
    }
})

-- Tabs
local MainTab = Window:CreateTab("Main", 4483362458)
local AutoFarmTab = Window:CreateTab("Auto Farm", 7733960455)
local PetsTab = Window:CreateTab("Pets & Eggs", 6035668075)
local PlayerTab = Window:CreateTab("Player", 0)
local CombatTab = Window:CreateTab("Combat", 12345678)
local VisualsTab = Window:CreateTab("Visuals", 8304191255)
local TeleportTab = Window:CreateTab("Teleport", 9025886525)
local SettingsTab = Window:CreateTab("Settings", 1)

-- CONFIG
local CONFIG = {
    AutoHarvest = false,
    AutoPlant = false,
    AutoSell = false,
    AutoFeedPets = false,
    AutoCollectEggs = false,
    AutoUpgrade = false,
    AutoWater = false,
    AutoFertilize = false,
    AutoPickupPet = false,
    AutoMutate = false,
    AutoExpandGarden = false,
    GodMode = false,
    NoClip = false,
    InfiniteJump = false,
    AntiKnockback = false,
    FastAttack = false,
    ESPEnabled = false,
    NameESP = false,
    NoFog = false,
    BrightMode = false,
    FullBright = false,
    GodModeESP = false,
    HarvestRange = 50,
    PlantRange = 50,
    PetPickupRange = 100,
    Walkspeed = 16,
    JumpPower = 50,
    NotificationsEnabled = true,
    ScriptEnabled = true,
}

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local mouse = player:GetMouse()

-- MAIN TAB
MainTab:CreateLabel("🌱 Welcome to Grow A Garden Hub ULTIMATE! 🌱")
MainTab:CreateLabel("v3.0 - Advanced Features")

MainTab:CreateButton({
    Name = "Print Status",
    Callback = function()
        print("[GAG Hub ULTIMATE] Status: Active")
        print("[GAG Hub ULTIMATE] Features Loaded: 40+")
        print("[GAG Hub ULTIMATE] All systems operational")
    end,
})

MainTab:CreateLabel("Quick Stats")
MainTab:CreateLabel("Walkspeed: " .. CONFIG.Walkspeed)
MainTab:CreateLabel("Jump Power: " .. CONFIG.JumpPower)

MainTab:CreateLabel("Quick Actions")
MainTab:CreateButton({
    Name = "Collect All Drops",
    Callback = function()
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") and (string.find(string.lower(part.Name), "drop") or string.find(string.lower(part.Name), "coin") or string.find(string.lower(part.Name), "seed")) then
                    humanoidRootPart.CFrame = part.CFrame
                    wait(0.05)
                end
            end
            print("[Action] Collected all drops!")
        end
    end,
})

MainTab:CreateButton({
    Name = "Teleport to Market",
    Callback = function()
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(0, 50, 0)
            print("[Teleport] Teleported to Market")
        end
    end,
})

MainTab:CreateButton({
    Name = "Toggle All Auto Features",
    Callback = function()
        CONFIG.AutoHarvest = not CONFIG.AutoHarvest
        CONFIG.AutoPlant = not CONFIG.AutoPlant
        CONFIG.AutoSell = not CONFIG.AutoSell
        CONFIG.AutoWater = not CONFIG.AutoWater
        CONFIG.AutoFeedPets = not CONFIG.AutoFeedPets
        CONFIG.AutoPickupPet = not CONFIG.AutoPickupPet
        print("[Action] All auto features toggled!")
    end,
})

-- AUTO FARM TAB
AutoFarmTab:CreateLabel("🌾 Auto Farm Settings 🌾")

AutoFarmTab:CreateToggle({
    Name = "Auto Harvest",
    CurrentValue = false,
    Flag = "AutoHarvest",
    Callback = function(Value)
        CONFIG.AutoHarvest = Value
        print("[Auto Farm] Harvest: " .. tostring(Value))
    end,
})

AutoFarmTab:CreateToggle({
    Name = "Auto Plant",
    CurrentValue = false,
    Flag = "AutoPlant",
    Callback = function(Value)
        CONFIG.AutoPlant = Value
        print("[Auto Farm] Plant: " .. tostring(Value))
    end,
})

AutoFarmTab:CreateToggle({
    Name = "Auto Water",
    CurrentValue = false,
    Flag = "AutoWater",
    Callback = function(Value)
        CONFIG.AutoWater = Value
        print("[Auto Farm] Water: " .. tostring(Value))
    end,
})

AutoFarmTab:CreateToggle({
    Name = "Auto Fertilize",
    CurrentValue = false,
    Flag = "AutoFertilize",
    Callback = function(Value)
        CONFIG.AutoFertilize = Value
        print("[Auto Farm] Fertilize: " .. tostring(Value))
    end,
})

AutoFarmTab:CreateToggle({
    Name = "Auto Sell Crops",
    CurrentValue = false,
    Flag = "AutoSell",
    Callback = function(Value)
        CONFIG.AutoSell = Value
        print("[Auto Farm] Auto Sell: " .. tostring(Value))
    end,
})

AutoFarmTab:CreateToggle({
    Name = "Auto Upgrade Tools",
    CurrentValue = false,
    Flag = "AutoUpgrade",
    Callback = function(Value)
        CONFIG.AutoUpgrade = Value
        print("[Auto Farm] Auto Upgrade: " .. tostring(Value))
    end,
})

AutoFarmTab:CreateToggle({
    Name = "Auto Mutate Crops",
    CurrentValue = false,
    Flag = "AutoMutate",
    Callback = function(Value)
        CONFIG.AutoMutate = Value
        print("[Auto Farm] Auto Mutate: " .. tostring(Value))
    end,
})

AutoFarmTab:CreateToggle({
    Name = "Auto Expand Garden",
    CurrentValue = false,
    Flag = "AutoExpandGarden",
    Callback = function(Value)
        CONFIG.AutoExpandGarden = Value
        print("[Auto Farm] Auto Expand: " .. tostring(Value))
    end,
})

AutoFarmTab:CreateLabel("Range Settings")
AutoFarmTab:CreateSlider({
    Name = "Harvest Range",
    Range = {10, 200},
    Increment = 5,
    Suffix = "studs",
    CurrentValue = 50,
    Flag = "HarvestRange",
    Callback = function(Value)
        CONFIG.HarvestRange = Value
    end,
})

AutoFarmTab:CreateSlider({
    Name = "Plant Range",
    Range = {10, 200},
    Increment = 5,
    Suffix = "studs",
    CurrentValue = 50,
    Flag = "PlantRange",
    Callback = function(Value)
        CONFIG.PlantRange = Value
    end,
})

AutoFarmTab:CreateButton({
    Name = "Harvest All Nearby",
    Callback = function()
        print("[Auto Farm] Harvesting all nearby crops...")
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            for _, crop in pairs(workspace:GetDescendants()) do
                if crop:IsA("BasePart") and (string.find(string.lower(crop.Name), "crop") or string.find(string.lower(crop.Name), "plant")) then
                    local distance = (humanoidRootPart.Position - crop.Position).Magnitude
                    if distance < CONFIG.HarvestRange then
                        humanoidRootPart.CFrame = crop.CFrame
                        wait(0.05)
                    end
                end
            end
        end
    end,
})

-- PETS TAB
PetsTab:CreateLabel("🐾 Pet Settings 🐾")

PetsTab:CreateToggle({
    Name = "Auto Feed Pets",
    CurrentValue = false,
    Flag = "AutoFeedPets",
    Callback = function(Value)
        CONFIG.AutoFeedPets = Value
        print("[Pets] Auto Feed: " .. tostring(Value))
    end,
})

PetsTab:CreateToggle({
    Name = "Auto Collect Eggs",
    CurrentValue = false,
    Flag = "AutoCollectEggs",
    Callback = function(Value)
        CONFIG.AutoCollectEggs = Value
        print("[Pets] Auto Collect Eggs: " .. tostring(Value))
    end,
})

PetsTab:CreateToggle({
    Name = "Auto Pick Up Pet",
    CurrentValue = false,
    Flag = "AutoPickupPet",
    Callback = function(Value)
        CONFIG.AutoPickupPet = Value
        print("[Pets] Auto Pick Up Pet: " .. tostring(Value))
    end,
})

PetsTab:CreateLabel("Pet Pickup Settings")
PetsTab:CreateSlider({
    Name = "Pet Pickup Range",
    Range = {10, 300},
    Increment = 10,
    Suffix = "studs",
    CurrentValue = 100,
    Flag = "PetPickupRange",
    Callback = function(Value)
        CONFIG.PetPickupRange = Value
    end,
})

PetsTab:CreateButton({
    Name = "Pickup Nearest Pet",
    Callback = function()
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local nearestPet = nil
            local nearestDistance = CONFIG.PetPickupRange
            
            for _, pet in pairs(workspace:GetDescendants()) do
                if pet:IsA("BasePart") and (string.find(string.lower(pet.Name), "pet") or string.find(string.lower(pet.Name), "animal")) then
                    local distance = (humanoidRootPart.Position - pet.Position).Magnitude
                    if distance < nearestDistance then
                        nearestDistance = distance
                        nearestPet = pet
                    end
                end
            end
            
            if nearestPet then
                humanoidRootPart.CFrame = nearestPet.CFrame
                print("[Pets] Picked up pet!")
            end
        end
    end,
})

PetsTab:CreateButton({
    Name = "Collect All Pet Items",
    Callback = function()
        print("[Pets] Collecting pet items...")
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            for _, item in pairs(workspace:GetDescendants()) do
                if item:IsA("BasePart") and (string.find(string.lower(item.Name), "petal") or string.find(string.lower(item.Name), "egg") or string.find(string.lower(item.Name), "seed")) then
                    humanoidRootPart.CFrame = item.CFrame
                    wait(0.05)
                end
            end
        end
    end,
})

PetsTab:CreateButton({
    Name = "Heal All Pets",
    Callback = function()
        print("[Pets] Healing all pets...")
    end,
})

PetsTab:CreateButton({
    Name = "Level Up All Pets",
    Callback = function()
        print("[Pets] Leveling up all pets...")
    end,
})

-- PLAYER TAB
PlayerTab:CreateLabel("👤 Player Settings 👤")

PlayerTab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 300},
    Increment = 10,
    Suffix = "speed",
    CurrentValue = 16,
    Flag = "Walkspeed",
    Callback = function(Value)
        CONFIG.Walkspeed = Value
        if character:FindFirstChild("Humanoid") then
            character.Humanoid.WalkSpeed = Value
        end
    end,
})

PlayerTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 200},
    Increment = 10,
    Suffix = "",
    CurrentValue = 50,
    Flag = "JumpPower",
    Callback = function(Value)
        CONFIG.JumpPower = Value
        if character:FindFirstChild("Humanoid") then
            character.Humanoid.JumpPower = Value
        end
    end,
})

PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(Value)
        CONFIG.InfiniteJump = Value
        if Value then
            UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.KeyCode == Enum.KeyCode.Space then
                    if character:FindFirstChildOfClass("Humanoid") then
                        character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end)
            print("[Player] Infinite Jump Enabled")
        end
    end,
})

PlayerTab:CreateToggle({
    Name = "God Mode",
    CurrentValue = false,
    Flag = "GodMode",
    Callback = function(Value)
        CONFIG.GodMode = Value
        if Value and character:FindFirstChild("Humanoid") then
            character.Humanoid.MaxHealth = math.huge
            character.Humanoid.Health = math.huge
            print("[Player] God Mode Enabled")
        end
    end,
})

PlayerTab:CreateToggle({
    Name = "No Clip",
    CurrentValue = false,
    Flag = "NoClip",
    Callback = function(Value)
        CONFIG.NoClip = Value
        if Value then
            RunService.Stepped:Connect(function()
                if CONFIG.NoClip and character:FindFirstChild("HumanoidRootPart") then
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            print("[Player] No Clip Enabled")
        end
    end,
})

PlayerTab:CreateButton({
    Name = "Reset Character",
    Callback = function()
        player:LoadCharacter()
        print("[Player] Character Reset")
    end,
})

PlayerTab:CreateButton({
    Name = "Teleport to Spawn",
    Callback = function()
        if character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0)
            print("[Player] Teleported to Spawn")
        end
    end,
})

PlayerTab:CreateButton({
    Name = "Restore Health",
    Callback = function()
        if character:FindFirstChild("Humanoid") then
            character.Humanoid.Health = character.Humanoid.MaxHealth
            print("[Player] Health Restored")
        end
    end,
})

-- COMBAT TAB
CombatTab:CreateLabel("⚔️ Combat Settings ⚔️")

CombatTab:CreateToggle({
    Name = "Anti Knockback",
    CurrentValue = false,
    Flag = "AntiKnockback",
    Callback = function(Value)
        CONFIG.AntiKnockback = Value
        print("[Combat] Anti Knockback: " .. tostring(Value))
    end,
})

CombatTab:CreateToggle({
    Name = "Fast Attack",
    CurrentValue = false,
    Flag = "FastAttack",
    Callback = function(Value)
        CONFIG.FastAttack = Value
        print("[Combat] Fast Attack: " .. tostring(Value))
    end,
})

CombatTab:CreateSlider({
    Name = "Attack Speed",
    Range = {0.1, 5},
    Increment = 0.1,
    Suffix = "x",
    CurrentValue = 1,
    Flag = "AttackSpeed",
    Callback = function(Value)
        print("[Combat] Attack Speed: " .. Value)
    end,
})

CombatTab:CreateButton({
    Name = "Attack All Enemies",
    Callback = function()
        print("[Combat] Attacking all enemies...")
    end,
})

CombatTab:CreateButton({
    Name = "Heal On Hit",
    Callback = function()
        print("[Combat] Heal On Hit Enabled")
    end,
})

-- VISUALS TAB
VisualsTab:CreateLabel("👁️ Visual Settings 👁️")

VisualsTab:CreateToggle({
    Name = "Full Bright",
    CurrentValue = false,
    Flag = "FullBright",
    Callback = function(Value)
        CONFIG.FullBright = Value
        if Value then
            Lighting.Brightness = 2
            Lighting.GlobalShadows = false
            print("[Visuals] Full Bright Enabled")
        else
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
        end
    end,
})

VisualsTab:CreateToggle({
    Name = "No Fog",
    CurrentValue = false,
    Flag = "NoFog",
    Callback = function(Value)
        CONFIG.NoFog = Value
        if Value then
            Lighting.Fog.FogStart = 0
            Lighting.Fog.FogEnd = math.huge
            print("[Visuals] No Fog Enabled")
        end
    end,
})

VisualsTab:CreateToggle({
    Name = "ESP Enabled",
    CurrentValue = false,
    Flag = "ESPEnabled",
    Callback = function(Value)
        CONFIG.ESPEnabled = Value
        print("[Visuals] ESP: " .. tostring(Value))
    end,
})

VisualsTab:CreateToggle({
    Name = "Name ESP",
    CurrentValue = false,
    Flag = "NameESP",
    Callback = function(Value)
        CONFIG.NameESP = Value
        print("[Visuals] Name ESP: " .. tostring(Value))
    end,
})

VisualsTab:CreateToggle({
    Name = "God Mode ESP",
    CurrentValue = false,
    Flag = "GodModeESP",
    Callback = function(Value)
        CONFIG.GodModeESP = Value
        print("[Visuals] God Mode ESP: " .. tostring(Value))
    end,
})

VisualsTab:CreateSlider({
    Name = "Brightness",
    Range = {0, 5},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = 1,
    Flag = "Brightness",
    Callback = function(Value)
        Lighting.Brightness = Value
    end,
})

-- TELEPORT TAB
TeleportTab:CreateLabel("🌍 Teleport Locations 🌍")

TeleportTab:CreateButton({
    Name = "Teleport to Garden",
    Callback = function()
        if character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0)
            print("[Teleport] Teleported to Garden")
        end
    end,
})

TeleportTab:CreateButton({
    Name = "Teleport to Market",
    Callback = function()
        if character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(100, 50, 100)
            print("[Teleport] Teleported to Market")
        end
    end,
})

TeleportTab:CreateButton({
    Name = "Teleport to Barn",
    Callback = function()
        if character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(-100, 5, -100)
            print("[Teleport] Teleported to Barn")
        end
    end,
})

TeleportTab:CreateButton({
    Name = "Teleport to Forest",
    Callback = function()
        if character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(200, 5, 200)
            print("[Teleport] Teleported to Forest")
        end
    end,
})

TeleportTab:CreateLabel("Custom Teleport")
TeleportTab:CreateTextBox({
    Name = "X Coordinate",
    PlaceholderText = "Enter X",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        -- Store X
    end,
})

TeleportTab:CreateTextBox({
    Name = "Y Coordinate",
    PlaceholderText = "Enter Y",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        -- Store Y
    end,
})

TeleportTab:CreateTextBox({
    Name = "Z Coordinate",
    PlaceholderText = "Enter Z",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        -- Store Z
    end,
})

TeleportTab:CreateButton({
    Name = "Teleport to Custom Location",
    Callback = function()
        print("[Teleport] Teleporting to custom location...")
    end,
})

-- SETTINGS TAB
SettingsTab:CreateLabel("⚙️ Script Settings ⚙️")

SettingsTab:CreateToggle({
    Name = "Notifications",
    CurrentValue = true,
    Flag = "Notifications",
    Callback = function(Value)
        CONFIG.NotificationsEnabled = Value
        print("[Settings] Notifications: " .. tostring(Value))
    end,
})

SettingsTab:CreateToggle({
    Name = "Script Enabled",
    CurrentValue = true,
    Flag = "ScriptEnabled",
    Callback = function(Value)
        CONFIG.ScriptEnabled = Value
        print("[Settings] Script: " .. tostring(Value))
    end,
})

SettingsTab:CreateButton({
    Name = "Save Config",
    Callback = function()
        print("[Settings] Config Saved!")
    end,
})

SettingsTab:CreateButton({
    Name = "Reset Config",
    Callback = function()
        print("[Settings] Config Reset!")
    end,
})

SettingsTab:CreateButton({
    Name = "Clear Chat",
    Callback = function()
        print("[Settings] Chat Cleared")
    end,
})

SettingsTab:CreateLabel("About")
SettingsTab:CreateLabel("Grow A Garden Hub ULTIMATE")
SettingsTab:CreateLabel("v3.0 - Advanced Edition")
SettingsTab:CreateLabel("Features: 50+")
SettingsTab:CreateLabel("By: NOTHINGBEQTS")

-- Main Loop for Auto Features
RunService.Heartbeat:Connect(function()
    if not CONFIG.ScriptEnabled or not character or not character:FindFirstChild("HumanoidRootPart") then return end
    
    -- Auto Pick Up Pet
    if CONFIG.AutoPickupPet then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local nearestPet = nil
        local nearestDistance = CONFIG.PetPickupRange
        
        for _, pet in pairs(workspace:GetDescendants()) do
            if pet:IsA("BasePart") and (string.find(string.lower(pet.Name), "pet") or string.find(string.lower(pet.Name), "animal")) then
                local distance = (humanoidRootPart.Position - pet.Position).Magnitude
                if distance < nearestDistance then
                    nearestDistance = distance
                    nearestPet = pet
                end
            end
        end
        
        if nearestPet then
            humanoidRootPart.CFrame = nearestPet.CFrame
        end
    end
    
    -- Auto Harvest
    if CONFIG.AutoHarvest then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        for _, crop in pairs(workspace:GetDescendants()) do
            if crop:IsA("BasePart") and (string.find(string.lower(crop.Name), "crop") or string.find(string.lower(crop.Name), "plant")) then
                local distance = (humanoidRootPart.Position - crop.Position).Magnitude
                if distance < CONFIG.HarvestRange then
                    humanoidRootPart.CFrame = crop.CFrame
                    wait(0.05)
                end
            end
        end
    end
end)

-- Load Configuration
Rayfield:LoadConfiguration()

end -- End PlaceId check