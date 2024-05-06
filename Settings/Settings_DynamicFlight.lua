local addonName, addon = ...
local LibDD = LibStub:GetLibrary("LibUIDropDownMenu-4.0")

-- DropDowns
local trait1DropDown
local trait2DropDown

local dynamicFlightPanel = CreateFrame("Frame", addonName .. "DynamicFlightSettingsPanel")
dynamicFlightPanel.name = "Dynamic Flight"
dynamicFlightPanel.parent = _G[addonName .. "SettingsPanel"].name
InterfaceOptions_AddCategory(dynamicFlightPanel)

C_Timer.After(5, function()
    trait1DropDown = {
        name = addonName .. "DynamicFlightTrait1DropDown",
        parent = dynamicFlightPanel,
        anchor = "TOPLEFT",
        relativeAnchor = "TOPLEFT",
        oX = -5,
        oY = -25,
        width = 150,
        height = 38,
        title = "Choice 1",
        tooltipHeader = "First Choice Node",
        tooltipText = "Pick your talent.",
        options = {
            {
                ["text"] = (GetSpellInfo(378409)),
                ["tooltipTitle"] = (GetSpellInfo(378409)),
                ["tooltipText"] = GetSpellDescription(378409),
                ["disabled"] = false,
                ["func"] = function()
                    local spellID = 378409
                    local nodeID = 64605
                    local entryID = 82386
                    HelpMePlayDB["DynamicFlightTrait1"].spellID = spellID
                    HelpMePlayDB["DynamicFlightTrait1"].nodeID = nodeID
                    HelpMePlayDB["DynamicFlightTrait1"].entryID = entryID
                    addon.LoadDynamicFlightTalents()
                    LibDD:UIDropDownMenu_SetSelectedValue(trait1DropDown, spellID, spellID)
                    LibDD:UIDropDownMenu_SetText(trait1DropDown, (GetSpellInfo(HelpMePlayDB["DynamicFlightTrait1"].spellID)))
                end,
            },
            {
                ["text"] = (GetSpellInfo(384824)),
                ["tooltipTitle"] = (GetSpellInfo(384824)),
                ["tooltipText"] = GetSpellDescription(384824),
                ["disabled"] = false,
                ["func"] = function()
                    local spellID = 384824
                    local nodeID = 64605
                    local entryID = 82385
                    HelpMePlayDB["DynamicFlightTrait1"].spellID = spellID
                    HelpMePlayDB["DynamicFlightTrait1"].nodeID = nodeID
                    HelpMePlayDB["DynamicFlightTrait1"].entryID = entryID
                    addon.LoadDynamicFlightTalents()
                    LibDD:UIDropDownMenu_SetSelectedValue(trait1DropDown, spellID, spellID)
                    LibDD:UIDropDownMenu_SetText(trait1DropDown, (GetSpellInfo(HelpMePlayDB["DynamicFlightTrait1"].spellID)))
                end,
            },
        },
    }
    setmetatable(trait1DropDown, { __index = HelpMePlay.DropDown })
    trait1DropDown = trait1DropDown:DropDown()
    LibDD:UIDropDownMenu_SetText(trait1DropDown, (GetSpellInfo(HelpMePlayDB["DynamicFlightTrait1"].spellID)))

    trait2DropDown = {
        name = addonName .. "DynamicFlightTrait2DropDown",
        parent = trait1DropDown,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -30,
        width = 150,
        height = 38,
        title = "Choice 2",
        tooltipHeader = "Second Choice Node",
        tooltipText = "Pick your talent.",
        options = {
            {
                ["text"] = (GetSpellInfo(381870)),
                ["tooltipTitle"] = (GetSpellInfo(381870)),
                ["tooltipText"] = GetSpellDescription(381870),
                ["disabled"] = false,
                ["func"] = function()
                    local spellID = 381870
                    local nodeID = 64062
                    local entryID = 82382
                    HelpMePlayDB["DynamicFlightTrait2"].spellID = spellID
                    HelpMePlayDB["DynamicFlightTrait2"].nodeID = nodeID
                    HelpMePlayDB["DynamicFlightTrait2"].entryID = entryID
                    addon.LoadDynamicFlightTalents()
                    LibDD:UIDropDownMenu_SetSelectedValue(trait2DropDown, spellID, spellID)
                    LibDD:UIDropDownMenu_SetText(trait2DropDown, (GetSpellInfo(HelpMePlayDB["DynamicFlightTrait2"].spellID)))
                end,
            },
            {
                ["text"] = (GetSpellInfo(381871)),
                ["tooltipTitle"] = (GetSpellInfo(381871)),
                ["tooltipText"] = GetSpellDescription(381871),
                ["disabled"] = false,
                ["func"] = function()
                    local spellID = 381871
                    local nodeID = 64062
                    local entryID = 82381
                    HelpMePlayDB["DynamicFlightTrait2"].spellID = spellID
                    HelpMePlayDB["DynamicFlightTrait2"].nodeID = nodeID
                    HelpMePlayDB["DynamicFlightTrait2"].entryID = entryID
                    addon.LoadDynamicFlightTalents()
                    LibDD:UIDropDownMenu_SetSelectedValue(trait2DropDown, spellID, spellID)
                    LibDD:UIDropDownMenu_SetText(trait2DropDown, (GetSpellInfo(HelpMePlayDB["DynamicFlightTrait2"].spellID)))
                end,
            },
        },
    }
    setmetatable(trait2DropDown, { __index = HelpMePlay.DropDown })
    trait2DropDown = trait2DropDown:DropDown()
    LibDD:UIDropDownMenu_SetText(trait2DropDown, (GetSpellInfo(HelpMePlayDB["DynamicFlightTrait2"].spellID)))
end)