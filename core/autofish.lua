local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local remotes = loadstring(game:HttpGet("https://raw.githubusercontent.com/gemluak-oss/slentod/main/core/remotes.lua"))()

local AutoFish = {
    enabled = false,
    normaldelay = 1,
    preRecastDelay = 0.5,
    biteDelay = 1.5
}

local function reelNow(r)
    for i = 1, math.random(3, 5) do
        r.complete:FireServer()
        task.wait(math.random(25, 50) / 1000)
    end
    r.cancelIn:InvokeServer()
end

local function recastBeforeBite(r)
    task.spawn(function()
        pcall(function() r.cancelIn:InvokeServer() end)
        task.wait(0.05)
        local serverTime = Workspace:GetServerTimeNow()
        r.charge:InvokeServer(serverTime)
        task.wait(0.25)
        local x = -1.238 + math.random(-2, 2) / 10000
        local y = 0.969 + math.random(-2, 2) / 10000
        local offset = math.random(-2, 2) / 1000
        r.mini:InvokeServer(x, y, Workspace:GetServerTimeNow() + offset)
    end)
end

function AutoFish.start()
    if AutoFish.enabled then return end
    AutoFish.enabled = true
    local r = remotes.getFishingRemotes()
    if not r then return end

    task.spawn(function()
        while AutoFish.enabled do
            task.wait(AutoFish.preRecastDelay)
            recastBeforeBite(r)
            task.wait(AutoFish.biteDelay)
            reelNow(r)
        end
    end)
end

function AutoFish.stop()
    AutoFish.enabled = false
end

return AutoFish
