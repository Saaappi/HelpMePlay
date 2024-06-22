-- local variables for API functions. any changes to the line below will be lost on re-generation
local C_AddOns_IsAddOnLoaded, C_CVar_GetCVar, C_Timer_After, CreateFrame, HelpMePlay_Print, LibStub, table_insert, table_remove, UnitAffectingCombat, PlayerGetTimerunningSeasonID = C_AddOns.IsAddOnLoaded, C_CVar.GetCVar, C_Timer.After, CreateFrame, HelpMePlay.Print, LibStub, table.insert, table.remove, UnitAffectingCombat, PlayerGetTimerunningSeasonID

local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local btn
local btnBaseTexture = 4549269
local itemQueue = {}

local function MakeButton(anchor, parent, relativeAnchor, xOff, yOff)
	if not btn then
		btn = CreateFrame("Button", addonName .. "RemixCombineSecureButton", parent, "SecureActionButtonTemplate, ActionButtonTemplate")
		btn:SetPoint(anchor, parent, relativeAnchor, xOff, yOff)

		btn.icon:SetTexture(btnBaseTexture)

		btn:RegisterForClicks("AnyUp", "AnyDown")
		btn:SetMouseClickEnabled(true)

		btn:SetScript("PreClick", function(self, button, isDown)
		if not isDown and not UnitAffectingCombat("player") then
			if C_AddOns_IsAddOnLoaded("Syndicator") then
				local character = Syndicator.API.GetByCharacterFullName(addon.playerFullName)
				for _, bag in next, character.bags do
					for _, item in next, bag do
						if item and item.itemLink then
							local minCount = LHMP:GetRemixMinItemCount(item.itemID)
							if LHMP:IsRemixItem(item.itemID) and (item.itemCount >= minCount) and minCount > 0 then
								table_insert(itemQueue, item.itemLink)
							end
						end
					end
				end
			else
				HelpMePlay_Print("Syndicator is not installed or loaded.")
			end
		end
		end)
		btn:SetScript("PostClick", function(self, button, isDown)
		if not isDown and not UnitAffectingCombat("player") then
			for index = #itemQueue, 1, -1 do
				btn:SetAttribute("type1", "item")
				btn:SetAttribute("item", itemQueue[index])
				table_remove(itemQueue, index)
			end
		end
		end)
		btn:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
		GameTooltip:SetText("Remix: Mists of Pandaria")
		GameTooltip:AddLine("Click to combine gems and add threads to your Cloak of Infinite Potential.", 1, 1, 1, true)
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

