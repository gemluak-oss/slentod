local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes = {}

function Remotes.getNetFolder()
    local packages = ReplicatedStorage:FindFirstChild("Packages")
    if packages and packages:FindFirstChild("_Index") then
        for _, child in ipairs(packages._Index:GetChildren()) do
            if child.Name:find("^sleitnick_net@") then
                return child:FindFirstChild("net")
            end
        end
    end
    return ReplicatedStorage:FindFirstChild("net") or ReplicatedStorage:FindFirstChild("Net")
end

function Remotes.getFishingRemotes()
    local net = Remotes.getNetFolder()
    if not net then return nil end
    return {
        charge = net:FindFirstChild("RF/ChargeFishingRod"),
        mini = net:FindFirstChild("RF/RequestFishingMinigameStarted"),
        cancelIn = net:FindFirstChild("RF/CancelFishingInputs"),
        equip = net:FindFirstChild("RE/EquipToolFromHotbar"),
        complete = net:FindFirstChild("RE/FishingCompleted"),
    }
end

return Remotes
