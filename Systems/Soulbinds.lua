local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addon, ...)
	if event == "ADDON_LOADED" and addon == "Blizzard_Soulbinds" then
		local soulbindButton = _G.CreateFrame(
			"Button",
			"HMPSoulbindButton",
			SoulbindViewer,
			"UIPanelButtonTemplate"
		)
		
		HMPSoulbindButton:SetSize(80, 22)
		HMPSoulbindButton:SetText(L_GLOBALSTRINGS["Soulbind.UI.Button.Setup.Text"])
		HMPSoulbindButton:SetPoint("TOPLEFT", SoulbindViewer, "TOPLEFT", 60, -200)

		HMPSoulbindButton:SetScript("OnEnter", function(self)
			addonTable.ShowTooltip(self, L_GLOBALSTRINGS["Soulbind.UI.Button.Setup.Desc"])
		end)
		HMPSoulbindButton:SetScript("OnLeave", function(self)
			addonTable.HideTooltip(self)
		end)
		HMPSoulbindButton:SetScript("OnClick", function(self)
			if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
			
			-- First get the player's class and specialization.
			local _, _, classId = UnitClass("player")
			local specIndex = GetSpecialization()
			local specId = GetSpecializationInfo(specIndex)
			
			local soulbind = addonTable.SOULBINDS_BY_SPEC[classId][specId]
			if soulbind == {} then
				-- This spec is currently unsupported.
				print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.SpecUnsupporteForSoulbinds"])
				return
			end
			
			-- Determine if the assigned soulbind is unlocked.
			if C_Soulbinds.GetSoulbindData(soulbind.id).unlocked then
				-- Check if the assigned soulbind can be activated.
				-- Failure here would indicate the assigned soulbind
				-- is already activated.
				if C_Soulbinds.CanActivateSoulbind(soulbind.id) then
					-- Activate the soulbind.
					C_Soulbinds.ActivateSoulbind(soulbind.id)
					
					C_Timer.After(1, function()
						-- Get the current conduit tree for the assigned
						-- soulbind. Let's see if we need to activate any
						-- nodes or change any assigned conduits.
						local tree = C_Soulbinds.GetTree(soulbind.tree)
						for i = 1, #tree.nodes do
							-- Check to see if any nodes are unavailable.
							if tree.nodes[i].state == 0 then
								print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.ConduitsNotUnlocked"])
								return
							end
						end
						
						-- After a short delay, attempt to select the
						-- assigned node.
						for _, node in ipairs(soulbind.conduits) do
							C_Timer.After(0.5, function()
								C_Soulbinds.SelectNode(node.n)
							end)
						end
						
						-- Ensure all the proper conduit nodes are selected.
						C_Timer.After(1, function()
							tree = C_Soulbinds.GetTree(soulbind.tree)
							for i = 1, #tree.nodes do
								for _, node in ipairs(soulbind.conduits) do
									if tree.nodes[i].ID == node.n then
										if tree.nodes[i].state ~= 3 then
											print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.ConduitNodesIncorrect"])
											return
										end
									end
								end
							end
						end)
						
						-- Install the conduits.
						C_Timer.After(1, function()
							for _, node in ipairs(soulbind.conduits) do
								C_Timer.After(0.1, function()
									C_Soulbinds.ModifyNode(node.n, node.c, 0)
									SoulbindViewer.CommitConduitsButton:Click()
								end)
							end
						end)
					end)
				end
			else
				print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.AssignedSoulbindLocked"])
			end
		end)
	end
end)