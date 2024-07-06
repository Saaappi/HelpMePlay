local _, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")

eventHandler:RegisterEvent("BAG_UPDATE")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "BAG_UPDATE" then
        if HelpMePlayDB["OpenContainers"] == false then return end

        local autoLootState = C_CVar.GetCVar("autoLootDefault")
        if autoLootState == "1" then
            for bagID = 0, 4 do
                for slotID = 1, C_Container.GetContainerNumSlots(bagID) do
                    local itemLink = C_Container.GetContainerItemLink(bagID, slotID)
                    if itemLink then
                        local itemID = C_Item.GetItemInfoInstant(itemLink)
                        if LHMP:IsItemContainer(itemID) then
                            C_Container.UseContainerItem(bagID, slotID)
                        end
                    end
                end
            end
        end
    end
end)