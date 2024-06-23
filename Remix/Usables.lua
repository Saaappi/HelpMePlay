-- local variables for API functions. any changes to the line below will be lost on re-generation
local C_AddOns_IsAddOnLoaded, C_Item_DoesItemExist, C_Container_GetContainerNumSlots, C_CVar_GetCVar, C_Timer_After, CreateFrame, LibStub, format, UnitAffectingCombat, C_Item_GetItemCount, PlayerGetTimerunningSeasonID = C_AddOns.IsAddOnLoaded, C_Item.DoesItemExist, C_Container.GetContainerNumSlots, C_CVar.GetCVar, C_Timer.After, CreateFrame, LibStub, format, UnitAffectingCombat, C_Item.GetItemCount, PlayerGetTimerunningSeasonID

local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local remixItems = {210681, 210714, 210715, 210716, 210717, 210718, 211106, 211107, 211123, 211124, 216639, 216640, 216641, 216643, 216644, 219273, 220367, 220368, 220370, 220371, 220372, 220374, 226142, 226143, 226144, 226145, 210984, 217722, 219282, 219264, 219275, 219276, 219274, 219277, 219280, 210982, 219281, 210983, 219262, 219278, 219258, 219279, 219256, 219269, 219267, 210990, 210985, 219266, 219263, 210989, 219272, 219257, 219259, 219260, 219271, 219268, 210987, 210986, 219265, 219261, 219270}
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

		btn:SetAttribute("type", "macro")
		local macrotext = "/use item:" .. table.concat(remixItems, "\n/use item:")
		btn:SetAttribute("macrotext", macrotext)

		btn:SetScript("OnEnter", function(self)
			addon.Tooltip_OnEnter(self, "Remix: Mists of Pandaria", "\nClick to combine gems and add threads to your Cloak of Infinite Potential.")
		end)
		btn:SetScript("OnLeave", addon.Tooltip_OnLeave)
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
						Baganator_SingleViewBackpackViewFrame:HookScript("OnShow", function()
							MakeButton("TOPRIGHT", Baganator_SingleViewBackpackViewFrame, "TOPLEFT", -5, 0)
						end)
					else
						Baganator_CategoryViewBackpackViewFrame:HookScript("OnShow", function()
							MakeButton("TOPRIGHT", Baganator_CategoryViewBackpackViewFrame, "TOPLEFT", -5, 0)
						end)
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

