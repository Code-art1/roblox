--[[
    Ultimate Roblox Hub - Loader
    Professional script loader with error handling and security
--]]

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

-- Configuration
local REPO_URL = "https://raw.githubusercontent.com/ultimate-team/roblox-hub/main/"
local VERSION = "3.0.1"
local BUILD = "2024.12.15"

-- Security check
local function securityCheck()
    -- Check if already loaded
    if getgenv and getgenv().UltimateHubLoaded then
        StarterGui:SetCore("SendNotification", {
            Title = "⚠️ Ultimate Hub";
            Text = "Script is already loaded!";
            Duration = 3;
        })
        return false
    end
    
    -- Check executor compatibility
    local requiredFunctions = {
        "game", "workspace", "getgenv", "loadstring"
    }
    
    for _, func in pairs(requiredFunctions) do
        if not _G[func] and not getfenv()[func] then
            StarterGui:SetCore("SendNotification", {
                Title = "❌ Ultimate Hub";
                Text = "Incompatible executor detected!";
                Duration = 5;
            })
            return false
        end
    end
    
    return true
end

-- Loading notification
local function showLoadingNotification()
    StarterGui:SetCore("SendNotification", {
        Title = "🎯 Ultimate Hub";
        Text = "Loading v" .. VERSION .. "...";
        Duration = 3;
    })
end

-- Error handling
local function handleError(error)
    warn("Ultimate Hub Error: " .. tostring(error))
    StarterGui:SetCore("SendNotification", {
        Title = "❌ Ultimate Hub";
        Text = "Failed to load: " .. tostring(error);
        Duration = 5;
    })
end

-- File loader with fallback
local function loadFile(path, fallback)
    local success, result = pcall(function()
        return game:HttpGet(REPO_URL .. path)
    end)
    
    if success then
        return result
    elseif fallback then
        warn("Failed to load " .. path .. ", using fallback")
        return fallback
    else
        error("Failed to load " .. path .. " and no fallback provided")
    end
end

-- Main loader function
local function loadUltimateHub()
    -- Security check
    if not securityCheck() then
        return
    end
    
    -- Show loading notification
    showLoadingNotification()
    
    -- Mark as loaded
    if getgenv then
        getgenv().UltimateHubLoaded = true
        getgenv().UltimateHubVersion = VERSION
    end
    
    -- Load main script
    local success, error = pcall(function()
        -- Load core files
        local mainScript = loadFile("roblox_ultimate_script.lua")
        
        -- Execute main script
        local loadSuccess, loadError = pcall(function()
            loadstring(mainScript)()
        end)
        
        if not loadSuccess then
            error("Failed to execute main script: " .. tostring(loadError))
        end
        
        -- Success notification
        StarterGui:SetCore("SendNotification", {
            Title = "✅ Ultimate Hub";
            Text = "Successfully loaded v" .. VERSION;
            Duration = 5;
        })
        
        print("🎯 Ultimate Roblox Hub v" .. VERSION .. " loaded successfully!")
        print("📅 Build: " .. BUILD)
        print("👤 User: " .. Players.LocalPlayer.Name)
        print("🎮 Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
        
    end)
    
    if not success then
        handleError(error)
    end
end

-- Auto-update check
local function checkForUpdates()
    local success, latestVersion = pcall(function()
        return game:HttpGet(REPO_URL .. "version.txt")
    end)
    
    if success and latestVersion ~= VERSION then
        StarterGui:SetCore("SendNotification", {
            Title = "🔄 Ultimate Hub";
            Text = "Update available: v" .. latestVersion;
            Duration = 5;
        })
    end
end

-- Initialize
spawn(function()
    checkForUpdates()
    wait(1)
    loadUltimateHub()
end)
