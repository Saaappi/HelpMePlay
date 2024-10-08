local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local userGossipButton
local gossipButton
local questsButton
local objectivesButton
local expandButton
local collapseButton
local isExpanded = false
local positions = {
	ImmersionFrame = {
		anchor = "BOTTOMRIGHT",
		relativeAnchor = "TOPRIGHT",
		x = -70,
		y = 10
	},
	GossipFrame = {
		anchor = "BOTTOMLEFT",
		relativeAnchor = "TOPLEFT",
		x = 50,
		y = 10
	}
}

local function UseGossip()
	if not IsShiftKeyDown() then
		local options = C_GossipInfo.GetOptions()
		if options then
			local GUID = UnitGUID("npc")
			if GUID then
				local id = LHMP:SplitString(GUID, "-", 6)
				if id then
					if LHMP:IsGossipSupportedForId(id) then
						local gossips = LHMP:GetGossipsById(id)
						for _, gossip in ipairs(gossips) do
							local isAllowed = HelpMePlay.EvaluateConditions(gossip.Conditions)
							if isAllowed then
								C_GossipInfo.SelectOption(gossip.ID)
								if gossip.CanConfirm then
									StaticPopup1Button1:Click("LeftButton")
								end
							end
						end
					end
					if HelpMePlayDB.PlayerGossips[id] then
						for _, gossipOptionID in ipairs(HelpMePlayDB.PlayerGossips[id]) do
							for _, option in ipairs(options) do
								if option.gossipOptionID == gossipOptionID then
									C_GossipInfo.SelectOption(option.gossipOptionID)
									break
								end
							end
						end
					end
				end
			end
		end
	else
		C_Timer.After(1, UseGossip)
	end
end

eventHandler:RegisterEvent("GOSSIP_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_SHOW" then
		if HelpMePlayDB["AcceptGossip"] == false then return end

		-- If the gossip from is visible, then add a button that can be used to
		-- quickly retrieve the NPC's ID, as well as the listed options.
		if (GossipFrame and GossipFrame:IsVisible()) and C_BattleNet.GetAccountInfoByGUID(HelpMePlay.playerGUID).battleTag == HelpMePlay.Constants["AUTHOR_BATTLETAG"] then
			if not gossipButton then
				gossipButton = HelpMePlay.CreateWidget("IconButton", {
					name = string.format("%sGossipInfoButton", addonName),
					width = 32,
					height = 32,
					parent = GossipFrame,
					texture = 2056011,
					useFontString = false,
					fontStringText = ""
				})

				gossipButton:ClearAllPoints()
				gossipButton:SetPoint("TOPLEFT", GossipFrame, "TOPRIGHT", 10, 0)

				gossipButton:SetScript("OnClick", function()
					-- NPC ID
					local GUID = UnitGUID("npc")
					if GUID then
						local id = LHMP:SplitString(GUID, "-", 6)
						print(string.format("%d - %s - %s", id, LHMP:ColorText("GOLD", GossipFrameTitleText:GetText()), HelpMePlay.playerMapName or "UNK"))
					end

					-- Gossips
					local options = C_GossipInfo.GetOptions()
					if options then
						for _, option in ipairs(options) do
							print(string.format("%s: %s", LHMP:ColorText("UNCOMMON", option.gossipOptionID), option.name))
						end
					end
				end)
				gossipButton:SetScript("OnEnter", function(self)
					HelpMePlay.Tooltip_OnEnter(self, "Gossip", "Get gossip options for the current NPC.")
				end)
				gossipButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
			end
			if not questsButton then
				questsButton = HelpMePlay.CreateWidget("IconButton", {
					name = string.format("%sActiveQuestsInfoButton", addonName),
					width = 32,
					height = 32,
					parent = gossipButton,
					texture = 236668,
					useFontString = false,
					fontStringText = ""
				})

				questsButton:ClearAllPoints()
				questsButton:SetPoint("TOP", gossipButton, "BOTTOM", 0, -5)

				questsButton:SetScript("OnClick", function()
					local numWatchedQuests = C_QuestLog.GetNumQuestWatches()
					if numWatchedQuests > 0 then
						for index = 1, numWatchedQuests do
							local questId = C_QuestLog.GetQuestIDForQuestWatchIndex(index)
							if not C_QuestLog.IsComplete(questId) then
								local logIndex = C_QuestLog.GetLogIndexForQuestID(questId)
								local info = C_QuestLog.GetInfo(logIndex)
								if info then
									local formattedQuestId = LHMP:ColorText("GOLD", questId)
									print(string.format("%s: %s", formattedQuestId, info.title))
								end
							end
						end
					end
				end)
				questsButton:SetScript("OnEnter", function(self)
					HelpMePlay.Tooltip_OnEnter(self, "Quests", "Get a list of your active quests in the current zone.")
				end)
				questsButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
			end
			if not objectivesButton then
				objectivesButton = HelpMePlay.CreateWidget("IconButton", {
					name = string.format("%sObjectiveInfoButton", addonName),
					width = 32,
					height = 32,
					parent = questsButton,
					texture = 134331,
					useFontString = false,
					fontStringText = ""
				})

				objectivesButton:ClearAllPoints()
				objectivesButton:SetPoint("TOP", questsButton, "BOTTOM", 0, -5)

				objectivesButton:SetScript("OnClick", function()
					StaticPopupDialogs["HMP_QUEST_OBJECTIVE_POPUP"] = {
						text = "Please enter a quest ID.",
						button1 = SUBMIT,
						button2 = CANCEL,
						explicitAcknowledge = true,
						hasEditBox = true,
						OnShow = function(self)
							local function HidePopup(self) self:GetParent():Hide() end
							self.editBox:SetScript("OnKeyUp", function(self, key)
								if key == "ENTER" then
									local input = self:GetText()
									if tonumber(input) then
										local objectives = C_QuestLog.GetQuestObjectives(input)
										if objectives then
											for index, objective in ipairs(objectives) do
												print(string.format("|cff1EFF00{%s}:|r %s, %s", index, objective.text, tostring(objective.finished)))
											end
										end
									else
										HelpMePlay.Print(HelpMePlay.ErrorMessages["INVALID_INPUT"])
									end
									HidePopup(self)
								end
							end)
						end,
						OnCancel = function()
						end,
						preferredIndex = 3
					}
					StaticPopup_Show("HMP_QUEST_OBJECTIVE_POPUP")
				end)
				objectivesButton:SetScript("OnEnter", function(self)
					HelpMePlay.Tooltip_OnEnter(self, "Quest Objectives", "Click to get a quest's objective(s).")
				end)
				objectivesButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
			end
		end

		UseGossip()
	end
end)

-- I had to implement a solution for compatibility with the Immersion addon.
C_Timer.After(3, function()
	local parent = ImmersionFrame or GossipFrame
	local parentName = parent:GetName()
	if parentName == "ImmersionFrame" then
		parent = ImmersionFrame.TalkBox.MainFrame
	end
	parent:HookScript("OnShow", function(self)
		if not expandButton then
			expandButton = CreateFrame("Button", nil, parent)
			expandButton:SetSize(20, 20)
			expandButton:SetPoint(positions[parentName].anchor, parent, positions[parentName].relativeAnchor, positions[parentName].x, positions[parentName].y)
			expandButton.texture = expandButton:CreateTexture()
			expandButton.texture:SetAtlas("common-icon-forwardarrow")
			expandButton:SetNormalTexture(expandButton.texture)
			expandButton:SetHighlightAtlas("common-icon-forwardarrow", "ADD")

			expandButton:SetScript("OnClick", function(self)
				PlaySound(SOUNDKIT.IG_QUEST_LOG_OPEN)
				collapseButton:Show()
				userGossipButton:Show()
				self:Hide()
				isExpanded = true
			end)
			expandButton:SetScript("OnEnter", function(self) HelpMePlay.Tooltip_OnEnter(self, "Click to show the NPC utilities.", "") end)
			expandButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
		end

		if not collapseButton then
			collapseButton = CreateFrame("Button", nil, parent)
			collapseButton:SetSize(20, 20)
			collapseButton:SetPoint(positions[parentName].anchor, parent, positions[parentName].relativeAnchor, positions[parentName].x, positions[parentName].y)
			collapseButton.texture = collapseButton:CreateTexture()
			collapseButton.texture:SetAtlas("common-icon-backarrow")
			collapseButton:SetNormalTexture(collapseButton.texture)
			collapseButton:SetHighlightAtlas("common-icon-backarrow", "ADD")

			collapseButton:SetScript("OnClick", function(self)
				PlaySound(SOUNDKIT.IG_QUEST_LOG_CLOSE)
				expandButton:Show()
				userGossipButton:Hide()
				self:Hide()
				isExpanded = false
			end)
			collapseButton:SetScript("OnEnter", function(self) HelpMePlay.Tooltip_OnEnter(self, "Click to hide the NPC utilities.", "") end)
			collapseButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
		end

		if not userGossipButton then
			userGossipButton = HelpMePlay.CreateWidget("ActionButton", {
				name = string.format("%sUserGossipButton", addonName),
				parent = collapseButton,
			})
			userGossipButton:SetScale(0.75)

			userGossipButton:ClearAllPoints()
			userGossipButton:SetPoint("LEFT", collapseButton, "RIGHT", 10, 0)

			userGossipButton.icon:SetTexture(135975)

			userGossipButton:SetScript("OnClick", function()
				StaticPopupDialogs["HMP_CUSTOM_GOSSIP_OPTION"] = {
					text = "Please enter the index of the option you would like to add.\n\n" ..
					LHMP:ColorText("RED", "Please keep in mind, the addon has priority in the Gossip subsystem."),
					button1 = YES,
					button2 = NO,
					explicitAcknowledge = true,
					hasEditBox = true,
					OnAccept = function(self)
						local input = self.editBox:GetText()
						if tonumber(input) then
							input = tonumber(input)
							local GUID = UnitGUID("npc")
							if GUID then
								local npcID = LHMP:SplitString(GUID, "-", 6)
								if npcID then
									local options = C_GossipInfo.GetOptions()
									if options then
										if not HelpMePlayDB.PlayerGossips[npcID] then
											HelpMePlayDB.PlayerGossips[npcID] = {}
										end
										for index, gossipOptionID in ipairs(HelpMePlayDB.PlayerGossips[npcID]) do
											if gossipOptionID == options[input].gossipOptionID then
												table.remove(HelpMePlayDB.PlayerGossips[npcID], index)
												return
											end
										end
										table.insert(HelpMePlayDB.PlayerGossips[npcID], options[input].gossipOptionID)
									end
								end
							end
						end
					end,
					OnCancel = function()
					end,
					preferredIndex = 3
				}
				StaticPopup_Show("HMP_CUSTOM_GOSSIP_OPTION")
			end)
			userGossipButton:SetScript("OnEnter", function(self)
				if UnitExists("npc") and (not UnitIsPlayer("npc")) then
					HelpMePlay.Tooltip_OnEnter(self, "Gossip", string.format("Click to add or remove a custom gossip option for %s.", LHMP:ColorText("UNCOMMON", UnitName("npc"))))
				end
			end)
			userGossipButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
		end

		if isExpanded then
			collapseButton:Show()
			userGossipButton:Show()
			expandButton:Hide()
		else
			expandButton:Show()
			collapseButton:Hide()
			userGossipButton:Hide()
		end
	end)

	parent:HookScript("OnHide", function()
		if expandButton then
			expandButton:Hide()
		end
		if collapseButton then
			collapseButton:Hide()
		end
		if userGossipButton then
			userGossipButton:Hide()
		end
	end)
end)