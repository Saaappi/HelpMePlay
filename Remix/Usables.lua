-- local variables for API functions. any changes to the line below will be lost on re-generation
local C_AddOns_IsAddOnLoaded, C_Container_GetContainerItemInfo, C_Container_GetContainerNumSlots, C_CVar_GetCVar, C_Timer_After, CreateFrame, LibStub, format, UnitAffectingCombat, GetItemCount, PlayerGetTimerunningSeasonID = C_AddOns.IsAddOnLoaded, C_Container.GetContainerItemInfo, C_Container.GetContainerNumSlots, C_CVar.GetCVar, C_Timer.After, CreateFrame, LibStub, format, UnitAffectingCombat, GetItemCount, PlayerGetTimerunningSeasonID

local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local btn

local function MakeButton(anchor, parent, relativeAnchor, xOff, yOff)
	if not btn then
		btn = addon.CreateSecureButton({
			name = format("%s%s", addonName, "RemixUseItemButton"),
			parent = parent,
			anchor = anchor,
			relativeAnchor = relativeAnchor,
			xOff = xOff,
			yOff = yOff,
			icon = 626190
		})

		btn:SetScript("PostClick", function(self, button, isDown)
		if (not isDown) and (not UnitAffectingCombat("player")) then
			for bag = 0, 4 do
				for slot = C_Container_GetContainerNumSlots(bag), 1, -1 do
					local item = C_Container_GetContainerItemInfo(bag, slot)
					if item then
                        if LHMP:IsRemixItem(item.itemID) then
                            btn:SetAttribute("type1", "item")
                            btn:SetAttribute("item", item.hyperlink)
                        end
					end
				end
			end
		end
		end)
		btn:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
		GameTooltip:SetText("Remix: Mists of Pandaria")
		GameTooltip:AddLine("\nClick to combine gems and add threads to your Cloak of Infinite Potential.", nil, nil, nil, true)
		GameTooltip:Show()
		end)
		btn:SetScript("OnLeave", function()
		GameTooltip:Hide()
		end)
	end
end

eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:SetScript(
"OnEvent",
function(self, event, ...)
	if event == "PLAYER_LOGIN" then
		C_Timer_After(
		1,
		function()
			if PlayerGetTimerunningSeasonID() == 1 then
				if C_AddOns_IsAddOnLoaded("Baganator") then -- Baganator
					if BAGANATOR_CONFIG["view_type"] == "single" then
						Baganator_SingleViewBackpackViewFrame:HookScript("OnShow", function() MakeButton("TOPRIGHT", Baganator_SingleViewBackpackViewFrame, "TOPLEFT", -5, 0) end)
					else
						Baganator_CategoryViewBackpackViewFrame:HookScript("OnShow", function() MakeButton("TOPRIGHT", Baganator_CategoryViewBackpackViewFrame, "TOPLEFT", -5, 0) end)
					end
				else -- Base UI
					if C_CVar_GetCVar("combinedBags") == "1" then
						EventRegistry:RegisterCallback("ContainerFrame.OpenAllBags", function() MakeButton("TOPRIGHT", ContainerFrameCombinedBags, "TOPLEFT", -10, 0) end)
					else
						EventRegistry:RegisterCallback("ContainerFrame.OpenAllBags", function() MakeButton("TOPRIGHT", ContainerFrame5, "TOPLEFT", -10, 0) end)
					end
				end
			end

			-- Unregister the event for performance.
			eventHandler:UnregisterEvent("PLAYER_LOGIN")
		end
		)
	end
end
)

