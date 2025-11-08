--========================================================
-- 🎣 Slentod - Executor Ready Loader
--========================================================

local base = "https://raw.githubusercontent.com/gemluak-oss/slentod/main/"

local function import(path)
    local ok, result = pcall(function()
        return loadstring(game:HttpGet(base .. path))()
    end)
    if ok then
        print("[✅] Loaded:", path)
        return result
    else
        warn("[❌] Failed to load:", path, result)
        return nil
    end
end

--========================================================
-- 📦 Load Modules
--========================================================
local remotes = import("core/remotes.lua")
local autofish = import("core/autofish.lua")
local theme = import("ui/theme.lua")
local window = import("ui/window.lua")

--========================================================
-- 🧩 Init WindUI
--========================================================
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

theme(WindUI)

local Window = WindUI:CreateWindow({
    Title = "Slentod",
    Author = "gemluak-oss",
    Folder = "SlentodFishit",
    Theme = "ijo",
    Icon = "rbxassetid://130713775131220"
})

window(WindUI, Window, autofish)

WindUI:Notify({
    Title = "Slentod Loaded",
    Content = "AutoFish siap digunakan!"
})
