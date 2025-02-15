-- Teleport to specific Roblox Games
-- Makes sure to check first if you can actually join the experience.
local TeleportService = game:GetService("TeleportService")
local placeId = 105999690555565

local function teleportPlayer()
    local player = game.Players.LocalPlayer

    local success, errorMessage = pcall(function()
        TeleportService:Teleport(placeId, player)
    end)

    if success then
        print("Successfully triggered teleport to the place!")
    else
        -- Log the error message
        print("Teleportation failed: " .. errorMessage)

        -- Check for specific error messages that may indicate an invalid place ID or restricted access
        if string.find(errorMessage, "Invalid place ID") then
            print("The provided place ID is invalid or cannot be accessed.")
        elseif string.find(errorMessage, "access") then
            print("The place is private or you do not have permission to access it.")
        else
            print("An unknown error occurred during teleportation.")
        end
    end
end

teleportPlayer()
