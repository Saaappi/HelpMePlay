local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

addon.LoadDynamicFlightTalents = function()
    addon.DynamicFlightTalents = {
        { ["nodeID"] = 64066, ["entryID"] = 82387 }, 	-- Take to the Skies
        { ["nodeID"] = 81466, ["entryID"] = 102427 }, 	-- Redirection
        { ["nodeID"] = 64069, ["entryID"] = 82390 }, 	-- Dynamic Stretching
        { ["nodeID"] = 64068, ["entryID"] = 82389 }, 	-- Thrill Chaser
        { ["nodeID"] = 94579, ["entryID"] = 117167 }, 	-- Second Wind
        { ["nodeID"] = 64067, ["entryID"] = 82388 }, 	-- Ohn'ahra's Gusts
        -- The seventh talent is chosen by the player.
        { ["nodeID"] = 92672, ["entryID"] = 114806 }, 	-- Aerial Halt
        { ["nodeID"] = 64064, ["entryID"] = 82384 }, 	-- Restorative Travels
        { ["nodeID"] = 92679, ["entryID"] = 114815 }, 	-- Ground Skimming
        { ["nodeID"] = 92671, ["entryID"] = 114805 }, 	-- Airborne Recovery
        { ["nodeID"] = 64063, ["entryID"] = 82383 }, 	-- Airborne Tumbling
        { ["nodeID"] = 92678, ["entryID"] = 114814 }, 	-- Land's Blessing
        { ["nodeID"] = 94578, ["entryID"] = 117165 }, 	-- Wind's Respite
        { ["nodeID"] = 64061, ["entryID"] = 82380 }, 	-- Dragonriding Learner
        { ["nodeID"] = 94577, ["entryID"] = 117164 }, 	-- Swift Skimming
        -- The seventeenth talent is chosen by the player.
        { ["nodeID"] = 64059, ["entryID"] = 82378 }, 	-- Beyond Infinity
        { ["nodeID"] = 64060, ["entryID"] = 82379 }, 	-- Yearning for the Sky
        { ["nodeID"] = 64058, ["entryID"] = 82377 }, 	-- At Home Aloft
        
        
        
        
        
    }
    table.insert(addon.DynamicFlightTalents, 7, { ["nodeID"] = HelpMePlayDB["DynamicFlightTrait1"].nodeID, ["entryID"] = HelpMePlayDB["DynamicFlightTrait1"].entryID })
    table.insert(addon.DynamicFlightTalents, 17, { ["nodeID"] = HelpMePlayDB["DynamicFlightTrait2"].nodeID, ["entryID"] = HelpMePlayDB["DynamicFlightTrait2"].entryID })
end

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            addon.LoadDynamicFlightTalents()

            -- Unregister the event for performance.
            eventHandler:UnregisterEvent("ADDON_LOADED")
        end
    end
end)