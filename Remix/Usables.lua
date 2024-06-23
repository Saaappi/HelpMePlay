-- local variables for API functions. any changes to the line below will be lost on re-generation
local C_AddOns_IsAddOnLoaded, C_Item_DoesItemExist, C_Container_GetContainerNumSlots, C_CVar_GetCVar, C_Timer_After, CreateFrame, LibStub, format, UnitAffectingCombat, C_Item_GetItemCount, PlayerGetTimerunningSeasonID = C_AddOns.IsAddOnLoaded, C_Item.DoesItemExist, C_Container.GetContainerNumSlots, C_CVar.GetCVar, C_Timer.After, CreateFrame, LibStub, format, UnitAffectingCombat, C_Item.GetItemCount, PlayerGetTimerunningSeasonID

local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local remixItems = {210681, 210714, 210715, 210716, 210717, 210718, 211106, 211107, 211123, 211124, 216639, 216640, 216641, 216643, 216644, 219273, 220367, 220368, 220370, 220371, 220372, 220374, 226142, 226143, 226144, 226145, 210984, 217722, 219282, 219264, 219275, 219276, 219274, 219277, 219280, 210982, 219281, 210983, 219262, 219278, 219258, 219279, 219256, 219269, 219267, 210990, 210985, 219266, 219263, 210989, 219272, 219257, 219259, 219260, 219271, 219268, 210987, 210986, 219265, 219261, 219270}
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

		btn:SetAttribute("type", "macro")
		local macrotext = "/use item:" .. table.concat(remixItems, "\n/use item:")
		btn:SetAttribute("macrotext", macrotext)
		--[[	"/use item:210681\n" ..
			"/use item:210714\n" ..
			"/use item:210715\n" ..
			"/use item:210716\n" ..
			"/use item:210717\n" ..
			"/use item:210718\n" ..
			"/use item:210982\n" ..
			"/use item:210984\n" ..
			"/use item:211106\n" ..
			"/use item:211107\n" ..
			"/use item:211123\n" ..
			"/use item:211124\n" ..
			"/use item:216639\n" ..
			"/use item:216640\n" ..
			"/use item:216641\n" ..
			"/use item:216643\n" ..
			"/use item:216644\n" ..
			"/use item:217722\n" ..
			"/use item:219264\n" ..
			"/use item:219273\n" ..
			"/use item:219274\n" ..
			"/use item:219275\n" ..
			"/use item:219276\n" ..
			"/use item:219277\n" ..
			"/use item:219280\n" ..
			"/use item:219281\n" ..
			"/use item:219282\n" ..
			"/use item:220367\n" ..
			"/use item:220368\n" ..
			"/use item:220370\n" ..
			"/use item:220371\n" ..
			"/use item:220372\n" ..
			"/use item:220374\n" ..
			"/use item:226142\n" ..
			"/use item:226143\n" ..
			"/use item:226144\n" ..
			"/use item:226145\n"
		)]]

		--[[btn:SetScript(
            "PreClick",
            function(_, _, isDown)
				if not isDown then
					btn:SetAttribute("item", itemQueue[1])
					table.remove(itemQueue, 1)
				end
            end
        )]]
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
							--GetAllRemixItemsFromInventory()
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

