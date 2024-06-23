-- local variables for API functions. any changes to the line below will be lost on re-generation
local C_AddOns_IsAddOnLoaded, C_Item_DoesItemExist, C_Container_GetContainerNumSlots, C_CVar_GetCVar, C_Timer_After, CreateFrame, LibStub, format, UnitAffectingCombat, C_Item_GetItemCount, PlayerGetTimerunningSeasonID = C_AddOns.IsAddOnLoaded, C_Item.DoesItemExist, C_Container.GetContainerNumSlots, C_CVar.GetCVar, C_Timer.After, CreateFrame, LibStub, format, UnitAffectingCombat, C_Item.GetItemCount, PlayerGetTimerunningSeasonID

local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local itemQueue = {}
local btn

local function IsItemLinkInTable(itemLink)
	for _, link in next, itemQueue do
		if link == itemLink then
			return true
		end
	end
	return false
end

local function GetAllRemixItemsFromInventory()
	for bag = 0, 4 do
		for slot = C_Container_GetContainerNumSlots(bag), 1, -1 do
			local item = Item:CreateFromBagAndSlot(bag, slot)
			if not item:IsItemEmpty() then
				item:ContinueOnItemLoad(function()
					local id = item:GetItemID()
					if LHMP:IsRemixItem(id) then
						local minAmountRequired = LHMP:GetRemixItemMinCount(id)
						local itemCount = C_Item.GetItemCount(id)
						if minAmountRequired <= itemCount then
							local itemLink = item:GetItemLink()
							if not IsItemLinkInTable(itemLink) then
								table.insert(itemQueue, itemLink)
							end
						end
					end
				end)
			end
		end
	end
	return true
end

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

		btn:SetScript(
            "PreClick",
            function(_, _, isDown)
				if not isDown then
					for index, itemLink in next, itemQueue do
						btn:SetAttribute("type", "item")
						btn:SetAttribute("item", itemLink)
						table.remove(itemQueue, index)
						break
					end
				end
            end
        )
		btn:SetScript("OnEnter", function(self)
			addon.Tooltip_OnEnter(self, "Remix: Mists of Pandaria", "\nClick to combine gems and add threads to your Cloak of Infinite Potential.")
		end)
		btn:SetScript("OnLeave", addon.Tooltip_OnLeave)
	end
end

eventHandler:RegisterEvent("BAG_UPDATE")
eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:SetScript(
"OnEvent",
function(self, event, ...)
	if event == "BAG_UPDATE" then
		GetAllRemixItemsFromInventory()
	end
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

