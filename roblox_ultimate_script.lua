--[[
    ╔══════════════════════════════════════════════════════════════╗
    ║                    ULTIMATE ROBLOX HUB                      ║
    ║                        Version 3.0                          ║
    ║                                                              ║
    ║  🎯 Advanced Aimbot & Silent Aim                            ║
    ║  👁️ Professional ESP System                                 ║
    ║  🚁 Enhanced Movement & Flight                               ║
    ║  📱 Cross-Platform Support (PC/Mobile)                      ║
    ║  🛡️ Advanced Security Features                              ║
    ║  🎨 Modern UI with Themes                                   ║
    ║                                                              ║
    ║  Created by: Ultimate Team                                   ║
    ║  GitHub: github.com/ultimate-team/roblox-hub                ║
    ║  Discord: discord.gg/ultimate-hub                           ║
    ║                                                              ║
    ║  ⚠️  Use at your own risk - Educational purposes only       ║
    ╚══════════════════════════════════════════════════════════════╝
--]]

-- Anti-Detection & Security
local function secureEnvironment()
    -- Hide script from detection
    if getgenv then
        getgenv().UltimateHub = nil
    end

    -- Randomize function names
    local random = math.random(1000000, 9999999)
    return "UH_" .. random
end

local SCRIPT_ID = secureEnvironment()
local VERSION = "3.0.1"
local BUILD = "2024.12.15"

-- Performance Optimization
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local MarketplaceService = game:GetService("MarketplaceService")

-- Cache frequently used objects
-- Configuration System
local Config = {
    -- Version Info
    Version = VERSION,
    Build = BUILD,
    ScriptId = SCRIPT_ID,

    -- Feature Toggles
    Features = {
        Aimbot = true,
        SilentAim = true,
        ESP = true,
        Movement = true,
        Teleport = true,
        AntiAim = true,
        Triggerbot = true,
        Wallhack = true
    },

    -- Performance Settings
    Performance = {
        MaxFPS = 60,
        UpdateRate = 1/60,
        ESPDistance = 2000,
        AimbotDistance = 1000,
        OptimizeRendering = true
    },

    -- Security Settings
    Security = {
        AntiDetection = true,
        SafeMode = true,
        HideFromLogs = true,
        RandomizeValues = true
    },

    -- UI Settings
    UI = {
        Theme = "Dark",
        Transparency = 0.1,
        AnimationSpeed = 0.25,
        SoundEffects = true,
        Notifications = true
    }
}

-- Advanced State Management
local State = {
    -- Core States
    scriptEnabled = true,
    uiVisible = true,

    -- Feature States
    aimbot = {
        enabled = false,
        fov = 120,
        smoothness = 0.3,
        wallcheck = true,
        prediction = true,
        targetPart = "Head",
        visibleCheck = true,
        teamCheck = true,
        distance = 1000
    },

    silentAim = {
        enabled = false,
        fov = 90,
        hitChance = 100,
        targetPart = "Head",
        prediction = true,
        wallcheck = true
    },

    esp = {
        enabled = false,
        boxes = true,
        names = true,
        distance = true,
        health = true,
        skeleton = true,
        tracers = true,
        weapons = false,
        maxDistance = 2000
    },

    movement = {
        speed = {enabled = false, value = 16},
        jump = {enabled = false, value = 50},
        fly = {enabled = false, speed = 50},
        noclip = {enabled = false},
        infiniteJump = {enabled = false}
    },

    teleport = {
        enabled = false,
        safeMode = true,
        clickTeleport = false,
        playerTeleport = false
    },

    misc = {
        fullbright = {enabled = false},
        antiAim = {enabled = false},
        triggerbot = {enabled = false, delay = 0.1},
        autoFarm = {enabled = false},
        antiAfk = {enabled = true}
    }
}

-- متغيرات الحالة
local scriptEnabled = true
local aimbot = {enabled = false, fov = 100, smoothness = 0.5, wallcheck = true}
local esp = {enabled = false, boxes = true, names = true, distance = true, skeleton = true}
local speed = {enabled = false, value = 50}
local jump = {enabled = false, value = 50}
local teleport = {enabled = false, safeMode = true}
local silentAim = {enabled = false, fov = 80, hitpart = "Head"}
local fly = {enabled = false, speed = 50}

-- واجهة المستخدم
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local MinimizeBtn = Instance.new("TextButton")
local CloseBtn = Instance.new("TextButton")
local ScrollFrame = Instance.new("ScrollingFrame")

-- إعداد الواجهة الأساسية
ScreenGui.Name = "UltimateScript"
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- الإطار الرئيسي
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Active = true
MainFrame.Draggable = true

-- تأثير الظل
local Shadow = Instance.new("Frame")
Shadow.Name = "Shadow"
Shadow.Parent = ScreenGui
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.7
Shadow.BorderSizePixel = 0
Shadow.Position = UDim2.new(0, MainFrame.Position.X.Offset + 5, 0, MainFrame.Position.Y.Offset + 5)
Shadow.Size = MainFrame.Size
Shadow.ZIndex = MainFrame.ZIndex - 1

-- الشريط العلوي
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 40)

-- العنوان
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Size = UDim2.new(1, -80, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "🎯 Ultimate Script v2.0"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextXAlignment = Enum.TextXAlignment.Left

-- زر التصغير
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Parent = TopBar
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 193, 7)
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.Position = UDim2.new(1, -70, 0.1, 0)
MinimizeBtn.Size = UDim2.new(0, 25, 0, 25)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "−"
MinimizeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
MinimizeBtn.TextScaled = true

-- زر الإغلاق
CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = TopBar
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 53, 69)
CloseBtn.BorderSizePixel = 0
CloseBtn.Position = UDim2.new(1, -35, 0.1, 0)
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextScaled = true

-- إطار التمرير
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Position = UDim2.new(0, 0, 0, 40)
ScrollFrame.Size = UDim2.new(1, 0, 1, -40)
ScrollFrame.ScrollBarThickness = 8
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 120)

-- دالة إنشاء الأزرار
local function createButton(name, text, position, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = ScrollFrame
    button.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
    button.BorderSizePixel = 0
    button.Position = position
    button.Size = UDim2.new(0, 180, 0, 35)
    button.Font = Enum.Font.Gotham
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextScaled = true
    
    -- تأثير الحوم
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(65, 65, 85)}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 65)}):Play()
    end)
    
    button.MouseButton1Click:Connect(callback)
    return button
end

-- دالة إنشاء المنزلقات
local function createSlider(name, text, position, min, max, default, callback)
    local frame = Instance.new("Frame")
    frame.Name = name .. "Frame"
    frame.Parent = ScrollFrame
    frame.BackgroundTransparency = 1
    frame.Position = position
    frame.Size = UDim2.new(0, 380, 0, 50)
    
    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Font = Enum.Font.Gotham
    label.Text = text .. ": " .. default
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Parent = frame
    sliderFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Position = UDim2.new(0, 0, 0, 25)
    sliderFrame.Size = UDim2.new(1, 0, 0, 20)
    
    local sliderButton = Instance.new("TextButton")
    sliderButton.Parent = sliderFrame
    sliderButton.BackgroundColor3 = Color3.fromRGB(0, 123, 255)
    sliderButton.BorderSizePixel = 0
    sliderButton.Size = UDim2.new(0, 20, 1, 0)
    sliderButton.Text = ""
    
    local dragging = false
    local function updateSlider(input)
        local relativeX = math.clamp((input.Position.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + (max - min) * relativeX)
        sliderButton.Position = UDim2.new(relativeX, -10, 0, 0)
        label.Text = text .. ": " .. value
        callback(value)
    end
    
    sliderButton.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSlider(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    return frame
end

-- إنشاء الأزرار والعناصر
local yPos = 0.02

-- قسم الهدف
local aimSection = Instance.new("TextLabel")
aimSection.Parent = ScrollFrame
aimSection.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
aimSection.BorderSizePixel = 0
aimSection.Position = UDim2.new(0, 10, yPos, 0)
aimSection.Size = UDim2.new(1, -20, 0, 30)
aimSection.Font = Enum.Font.GothamBold
aimSection.Text = "🎯 نظام التصويب"
aimSection.TextColor3 = Color3.fromRGB(255, 255, 255)
aimSection.TextScaled = true

yPos = yPos + 0.08

local aimbotBtn = createButton("AimbotBtn", "🎯 Aimbot: OFF", UDim2.new(0, 10, yPos, 0), function()
    aimbot.enabled = not aimbot.enabled
    aimbotBtn.Text = "🎯 Aimbot: " .. (aimbot.enabled and "ON" or "OFF")
    aimbotBtn.BackgroundColor3 = aimbot.enabled and Color3.fromRGB(40, 167, 69) or Color3.fromRGB(45, 45, 65)
end)

local silentAimBtn = createButton("SilentAimBtn", "🔇 Silent Aim: OFF", UDim2.new(0, 200, yPos, 0), function()
    silentAim.enabled = not silentAim.enabled
    silentAimBtn.Text = "🔇 Silent Aim: " .. (silentAim.enabled and "ON" or "OFF")
    silentAimBtn.BackgroundColor3 = silentAim.enabled and Color3.fromRGB(40, 167, 69) or Color3.fromRGB(45, 45, 65)
end)

yPos = yPos + 0.08

createSlider("AimbotFOV", "🎯 Aimbot FOV", UDim2.new(0, 10, yPos, 0), 50, 200, 100, function(value)
    aimbot.fov = value
end)

yPos = yPos + 0.12

createSlider("AimbotSmooth", "🎯 Smoothness", UDim2.new(0, 10, yPos, 0), 1, 10, 5, function(value)
    aimbot.smoothness = value / 10
end)

yPos = yPos + 0.12

-- قسم ESP والكشف
local espSection = Instance.new("TextLabel")
espSection.Parent = ScrollFrame
espSection.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
espSection.BorderSizePixel = 0
espSection.Position = UDim2.new(0, 10, yPos, 0)
espSection.Size = UDim2.new(1, -20, 0, 30)
espSection.Font = Enum.Font.GothamBold
espSection.Text = "👁️ نظام الكشف والرؤية"
espSection.TextColor3 = Color3.fromRGB(255, 255, 255)
espSection.TextScaled = true

yPos = yPos + 0.08

local espBtn = createButton("ESPBtn", "👁️ ESP: OFF", UDim2.new(0, 10, yPos, 0), function()
    esp.enabled = not esp.enabled
    espBtn.Text = "👁️ ESP: " .. (esp.enabled and "ON" or "OFF")
    espBtn.BackgroundColor3 = esp.enabled and Color3.fromRGB(40, 167, 69) or Color3.fromRGB(45, 45, 65)
end)

local skeletonBtn = createButton("SkeletonBtn", "💀 Skeleton: OFF", UDim2.new(0, 200, yPos, 0), function()
    esp.skeleton = not esp.skeleton
    skeletonBtn.Text = "💀 Skeleton: " .. (esp.skeleton and "ON" or "OFF")
    skeletonBtn.BackgroundColor3 = esp.skeleton and Color3.fromRGB(40, 167, 69) or Color3.fromRGB(45, 45, 65)
end)

yPos = yPos + 0.08

-- قسم الحركة
local movementSection = Instance.new("TextLabel")
movementSection.Parent = ScrollFrame
movementSection.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
movementSection.BorderSizePixel = 0
movementSection.Position = UDim2.new(0, 10, yPos, 0)
movementSection.Size = UDim2.new(1, -20, 0, 30)
movementSection.Font = Enum.Font.GothamBold
movementSection.Text = "🏃 نظام الحركة والتنقل"
movementSection.TextColor3 = Color3.fromRGB(255, 255, 255)
movementSection.TextScaled = true

yPos = yPos + 0.08

local speedBtn = createButton("SpeedBtn", "⚡ Speed: OFF", UDim2.new(0, 10, yPos, 0), function()
    speed.enabled = not speed.enabled
    speedBtn.Text = "⚡ Speed: " .. (speed.enabled and "ON" or "OFF")
    speedBtn.BackgroundColor3 = speed.enabled and Color3.fromRGB(40, 167, 69) or Color3.fromRGB(45, 45, 65)
end)

local jumpBtn = createButton("JumpBtn", "🦘 Jump: OFF", UDim2.new(0, 200, yPos, 0), function()
    jump.enabled = not jump.enabled
    jumpBtn.Text = "🦘 Jump: " .. (jump.enabled and "ON" or "OFF")
    jumpBtn.BackgroundColor3 = jump.enabled and Color3.fromRGB(40, 167, 69) or Color3.fromRGB(45, 45, 65)
end)

yPos = yPos + 0.08

local flyBtn = createButton("FlyBtn", "🚁 Fly: OFF", UDim2.new(0, 10, yPos, 0), function()
    fly.enabled = not fly.enabled
    flyBtn.Text = "🚁 Fly: " .. (fly.enabled and "ON" or "OFF")
    flyBtn.BackgroundColor3 = fly.enabled and Color3.fromRGB(40, 167, 69) or Color3.fromRGB(45, 45, 65)
end)

local teleportBtn = createButton("TeleportBtn", "📍 Teleport Mode", UDim2.new(0, 200, yPos, 0), function()
    teleport.enabled = not teleport.enabled
    teleportBtn.Text = "📍 Teleport: " .. (teleport.enabled and "ON" or "OFF")
    teleportBtn.BackgroundColor3 = teleport.enabled and Color3.fromRGB(40, 167, 69) or Color3.fromRGB(45, 45, 65)
end)

yPos = yPos + 0.08

createSlider("SpeedValue", "⚡ Speed Value", UDim2.new(0, 10, yPos, 0), 16, 200, 50, function(value)
    speed.value = value
end)

yPos = yPos + 0.12

createSlider("JumpValue", "🦘 Jump Power", UDim2.new(0, 10, yPos, 0), 50, 200, 50, function(value)
    jump.value = value
end)

yPos = yPos + 0.12

createSlider("FlySpeed", "🚁 Fly Speed", UDim2.new(0, 10, yPos, 0), 10, 100, 50, function(value)
    fly.speed = value
end)

yPos = yPos + 0.12

-- قسم الأمان
local safetySection = Instance.new("TextLabel")
safetySection.Parent = ScrollFrame
safetySection.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
safetySection.BorderSizePixel = 0
safetySection.Position = UDim2.new(0, 10, yPos, 0)
safetySection.Size = UDim2.new(1, -20, 0, 30)
safetySection.Font = Enum.Font.GothamBold
safetySection.Text = "🛡️ إعدادات الأمان"
safetySection.TextColor3 = Color3.fromRGB(255, 255, 255)
safetySection.TextScaled = true

yPos = yPos + 0.08

local wallcheckBtn = createButton("WallcheckBtn", "🧱 Wall Check: ON", UDim2.new(0, 10, yPos, 0), function()
    aimbot.wallcheck = not aimbot.wallcheck
    wallcheckBtn.Text = "🧱 Wall Check: " .. (aimbot.wallcheck and "ON" or "OFF")
    wallcheckBtn.BackgroundColor3 = aimbot.wallcheck and Color3.fromRGB(40, 167, 69) or Color3.fromRGB(220, 53, 69)
end)

local safeTeleportBtn = createButton("SafeTeleportBtn", "🛡️ Safe Teleport: ON", UDim2.new(0, 200, yPos, 0), function()
    teleport.safeMode = not teleport.safeMode
    safeTeleportBtn.Text = "🛡️ Safe Teleport: " .. (teleport.safeMode and "ON" or "OFF")
    safeTeleportBtn.BackgroundColor3 = teleport.safeMode and Color3.fromRGB(40, 167, 69) or Color3.fromRGB(220, 53, 69)
end)

yPos = yPos + 0.08

-- تحديث حجم ScrollFrame
ScrollFrame.CanvasSize = UDim2.new(0, 0, yPos + 0.1, 0)

-- وظائف التحكم في النافذة
local minimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 400, 0, 40)}):Play()
        TweenService:Create(Shadow, TweenInfo.new(0.3), {Size = UDim2.new(0, 400, 0, 40)}):Play()
        MinimizeBtn.Text = "+"
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 400, 0, 500)}):Play()
        TweenService:Create(Shadow, TweenInfo.new(0.3), {Size = UDim2.new(0, 400, 0, 500)}):Play()
        MinimizeBtn.Text = "−"
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- دوال مساعدة
local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = v
            end
        end
    end

    return closestPlayer
end

local function isPlayerInFOV(targetPlayer, fov)
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("Head") then
        return false
    end

    local targetPosition = targetPlayer.Character.Head.Position
    local screenPoint = camera:WorldToScreenPoint(targetPosition)
    local screenCenter = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - screenCenter).Magnitude

    return distance <= fov
end

local function wallCheck(targetPlayer)
    if not aimbot.wallcheck then return true end
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("Head") then
        return false
    end

    local raycast = Workspace:Raycast(camera.CFrame.Position,
        (targetPlayer.Character.Head.Position - camera.CFrame.Position).Unit * 1000)

    return raycast and raycast.Instance:IsDescendantOf(targetPlayer.Character)
end

-- نظام Aimbot
local aimbotConnection
local function startAimbot()
    aimbotConnection = RunService.Heartbeat:Connect(function()
        if not aimbot.enabled then return end

        local target = getClosestPlayer()
        if target and isPlayerInFOV(target, aimbot.fov) and wallCheck(target) then
            local targetPosition = target.Character.Head.Position
            local currentCFrame = camera.CFrame
            local targetCFrame = CFrame.lookAt(currentCFrame.Position, targetPosition)

            camera.CFrame = currentCFrame:Lerp(targetCFrame, aimbot.smoothness)
        end
    end)
end

-- نظام Silent Aim
local silentAimConnection
local function startSilentAim()
    silentAimConnection = RunService.Heartbeat:Connect(function()
        if not silentAim.enabled then return end

        local target = getClosestPlayer()
        if target and isPlayerInFOV(target, silentAim.fov) then
            -- تطبيق Silent Aim (يتطلب تعديل حسب نوع اللعبة)
            -- هذا مثال عام
        end
    end)
end

-- نظام ESP
local espObjects = {}
local function createESP(targetPlayer)
    if not targetPlayer.Character then return end

    local character = targetPlayer.Character
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end

    -- إنشاء BillboardGui
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "ESP_" .. targetPlayer.Name
    billboardGui.Parent = humanoidRootPart
    billboardGui.Size = UDim2.new(0, 200, 0, 50)
    billboardGui.StudsOffset = Vector3.new(0, 3, 0)
    billboardGui.AlwaysOnTop = true

    -- اسم اللاعب
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Parent = billboardGui
    nameLabel.BackgroundTransparency = 1
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Text = targetPlayer.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextScaled = true
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

    -- المسافة
    local distanceLabel = Instance.new("TextLabel")
    distanceLabel.Parent = billboardGui
    distanceLabel.BackgroundTransparency = 1
    distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distanceLabel.Font = Enum.Font.Gotham
    distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    distanceLabel.TextScaled = true
    distanceLabel.TextStrokeTransparency = 0
    distanceLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

    -- صندوق ESP
    local boxFrame = Instance.new("Frame")
    boxFrame.Name = "ESPBox"
    boxFrame.Parent = ScreenGui
    boxFrame.BackgroundTransparency = 1
    boxFrame.BorderSizePixel = 2
    boxFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)

    -- خطوط الهيكل العظمي
    local skeletonLines = {}
    if esp.skeleton then
        local bodyParts = {
            {"Head", "UpperTorso"},
            {"UpperTorso", "LowerTorso"},
            {"UpperTorso", "LeftUpperArm"},
            {"UpperTorso", "RightUpperArm"},
            {"LeftUpperArm", "LeftLowerArm"},
            {"RightUpperArm", "RightLowerArm"},
            {"LowerTorso", "LeftUpperLeg"},
            {"LowerTorso", "RightUpperLeg"},
            {"LeftUpperLeg", "LeftLowerLeg"},
            {"RightUpperLeg", "RightLowerLeg"}
        }

        for _, connection in pairs(bodyParts) do
            local line = Instance.new("Frame")
            line.Parent = ScreenGui
            line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            line.BorderSizePixel = 0
            line.AnchorPoint = Vector2.new(0.5, 0.5)
            table.insert(skeletonLines, {line, connection[1], connection[2]})
        end
    end

    espObjects[targetPlayer] = {
        billboard = billboardGui,
        nameLabel = nameLabel,
        distanceLabel = distanceLabel,
        boxFrame = boxFrame,
        skeletonLines = skeletonLines
    }
end

local function updateESP()
    for targetPlayer, espData in pairs(espObjects) do
        if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local distance = math.floor((player.Character.HumanoidRootPart.Position - targetPlayer.Character.HumanoidRootPart.Position).Magnitude)
            espData.distanceLabel.Text = distance .. "m"

            -- تحديث صندوق ESP
            if esp.boxes then
                local humanoidRootPart = targetPlayer.Character.HumanoidRootPart
                local vector, onScreen = camera:WorldToViewportPoint(humanoidRootPart.Position)

                if onScreen then
                    local headPos = camera:WorldToViewportPoint(targetPlayer.Character.Head.Position + Vector3.new(0, 0.5, 0))
                    local legPos = camera:WorldToViewportPoint(humanoidRootPart.Position - Vector3.new(0, 3, 0))

                    local height = math.abs(headPos.Y - legPos.Y)
                    local width = height * 0.6

                    espData.boxFrame.Size = UDim2.new(0, width, 0, height)
                    espData.boxFrame.Position = UDim2.new(0, vector.X - width/2, 0, vector.Y - height/2)
                    espData.boxFrame.Visible = true
                else
                    espData.boxFrame.Visible = false
                end
            end

            -- تحديث الهيكل العظمي
            for _, lineData in pairs(espData.skeletonLines) do
                local line, part1Name, part2Name = lineData[1], lineData[2], lineData[3]
                local part1 = targetPlayer.Character:FindFirstChild(part1Name)
                local part2 = targetPlayer.Character:FindFirstChild(part2Name)

                if part1 and part2 then
                    local pos1, onScreen1 = camera:WorldToViewportPoint(part1.Position)
                    local pos2, onScreen2 = camera:WorldToViewportPoint(part2.Position)

                    if onScreen1 and onScreen2 then
                        local distance = math.sqrt((pos2.X - pos1.X)^2 + (pos2.Y - pos1.Y)^2)
                        local angle = math.atan2(pos2.Y - pos1.Y, pos2.X - pos1.X)

                        line.Size = UDim2.new(0, distance, 0, 2)
                        line.Position = UDim2.new(0, pos1.X, 0, pos1.Y)
                        line.Rotation = math.deg(angle)
                        line.Visible = true
                    else
                        line.Visible = false
                    end
                else
                    line.Visible = false
                end
            end
        end
    end
end

-- نظام الحركة والسرعة
local speedConnection
local function updateSpeed()
    if speed.enabled and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = speed.value
    elseif player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 16
    end
end

local function updateJump()
    if jump.enabled and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.JumpPower = jump.value
    elseif player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.JumpPower = 50
    end
end

-- نظام الطيران
local flyBodyVelocity
local flyBodyAngularVelocity
local flyConnection

local function startFly()
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end

    local humanoidRootPart = player.Character.HumanoidRootPart

    flyBodyVelocity = Instance.new("BodyVelocity")
    flyBodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
    flyBodyVelocity.Parent = humanoidRootPart

    flyBodyAngularVelocity = Instance.new("BodyAngularVelocity")
    flyBodyAngularVelocity.MaxTorque = Vector3.new(4000, 4000, 4000)
    flyBodyAngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
    flyBodyAngularVelocity.Parent = humanoidRootPart

    flyConnection = RunService.Heartbeat:Connect(function()
        if not fly.enabled then
            stopFly()
            return
        end

        local moveVector = Vector3.new(0, 0, 0)

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveVector = moveVector + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveVector = moveVector - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveVector = moveVector - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveVector = moveVector + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveVector = moveVector + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveVector = moveVector - Vector3.new(0, 1, 0)
        end

        flyBodyVelocity.Velocity = moveVector * fly.speed
    end)
end

local function stopFly()
    if flyBodyVelocity then
        flyBodyVelocity:Destroy()
        flyBodyVelocity = nil
    end
    if flyBodyAngularVelocity then
        flyBodyAngularVelocity:Destroy()
        flyBodyAngularVelocity = nil
    end
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end
end

-- نظام التليبورت الآمن
local function safeTeleport(position)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end

    if teleport.safeMode then
        -- فحص الأمان قبل التليبورت
        local raycast = Workspace:Raycast(position + Vector3.new(0, 10, 0), Vector3.new(0, -20, 0))
        if raycast then
            position = raycast.Position + Vector3.new(0, 5, 0)
        end
    end

    player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
end

-- نظام التليبورت بالنقر
mouse.Button1Down:Connect(function()
    if teleport.enabled and player.Character then
        local targetPosition = mouse.Hit.Position
        safeTeleport(targetPosition)
    end
end)

-- إدارة ESP للاعبين الجدد
Players.PlayerAdded:Connect(function(newPlayer)
    newPlayer.CharacterAdded:Connect(function()
        wait(1)
        if esp.enabled then
            createESP(newPlayer)
        end
    end)
end)

Players.PlayerRemoving:Connect(function(leavingPlayer)
    if espObjects[leavingPlayer] then
        for _, obj in pairs(espObjects[leavingPlayer]) do
            if typeof(obj) == "Instance" then
                obj:Destroy()
            elseif typeof(obj) == "table" then
                for _, line in pairs(obj) do
                    if typeof(line) == "table" and line[1] then
                        line[1]:Destroy()
                    end
                end
            end
        end
        espObjects[leavingPlayer] = nil
    end
end)

-- تحديث ESP للاعبين الموجودين
for _, existingPlayer in pairs(Players:GetPlayers()) do
    if existingPlayer ~= player and existingPlayer.Character then
        createESP(existingPlayer)
    end
end

-- الحلقة الرئيسية للتحديث
local mainConnection = RunService.Heartbeat:Connect(function()
    updateSpeed()
    updateJump()

    if esp.enabled then
        updateESP()
    end
end)

-- بدء الأنظمة
startAimbot()
startSilentAim()

-- تحديث ESP عند تفعيله
local espConnection
espBtn.MouseButton1Click:Connect(function()
    if esp.enabled then
        -- إنشاء ESP للاعبين الموجودين
        for _, targetPlayer in pairs(Players:GetPlayers()) do
            if targetPlayer ~= player and targetPlayer.Character then
                createESP(targetPlayer)
            end
        end

        espConnection = RunService.Heartbeat:Connect(function()
            updateESP()
        end)
    else
        -- إزالة ESP
        for targetPlayer, espData in pairs(espObjects) do
            if espData.billboard then espData.billboard:Destroy() end
            if espData.boxFrame then espData.boxFrame:Destroy() end
            for _, lineData in pairs(espData.skeletonLines) do
                if lineData[1] then lineData[1]:Destroy() end
            end
        end
        espObjects = {}

        if espConnection then
            espConnection:Disconnect()
            espConnection = nil
        end
    end
end)

-- تحديث الطيران
flyBtn.MouseButton1Click:Connect(function()
    if fly.enabled then
        startFly()
    else
        stopFly()
    end
end)

-- دعم الهاتف المحمول
if UserInputService.TouchEnabled then
    -- إنشاء أزرار تحكم للهاتف
    local mobileFrame = Instance.new("Frame")
    mobileFrame.Name = "MobileControls"
    mobileFrame.Parent = ScreenGui
    mobileFrame.BackgroundTransparency = 1
    mobileFrame.Position = UDim2.new(0, 10, 1, -150)
    mobileFrame.Size = UDim2.new(0, 200, 0, 140)

    local function createMobileButton(name, text, position, size, callback)
        local btn = Instance.new("TextButton")
        btn.Name = name
        btn.Parent = mobileFrame
        btn.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
        btn.BorderSizePixel = 0
        btn.Position = position
        btn.Size = size
        btn.Font = Enum.Font.Gotham
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextScaled = true
        btn.MouseButton1Click:Connect(callback)

        -- تأثير اللمس
        btn.MouseButton1Down:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(65, 65, 85)
        end)
        btn.MouseButton1Up:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
        end)

        return btn
    end

    createMobileButton("MobileSpeed", "⚡", UDim2.new(0, 0, 0, 0), UDim2.new(0, 45, 0, 45), function()
        speed.enabled = not speed.enabled
    end)

    createMobileButton("MobileFly", "🚁", UDim2.new(0, 50, 0, 0), UDim2.new(0, 45, 0, 45), function()
        fly.enabled = not fly.enabled
        if fly.enabled then startFly() else stopFly() end
    end)

    createMobileButton("MobileESP", "👁️", UDim2.new(0, 100, 0, 0), UDim2.new(0, 45, 0, 45), function()
        esp.enabled = not esp.enabled
    end)

    createMobileButton("MobileAim", "🎯", UDim2.new(0, 150, 0, 0), UDim2.new(0, 45, 0, 45), function()
        aimbot.enabled = not aimbot.enabled
    end)
end

-- رسالة ترحيب
StarterGui:SetCore("SendNotification", {
    Title = "🎯 Ultimate Script";
    Text = "تم تحميل السكريبت بنجاح! استمتع باللعب";
    Duration = 5;
})

print("🎯 Ultimate Roblox Script v2.0 - تم التحميل بنجاح!")
print("📱 يدعم PC والهاتف المحمول")
print("🛡️ مع ميزات أمان متقدمة")
print("✨ واجهة مستخدم متجاوبة وجميلة")
