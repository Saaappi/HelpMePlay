local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("GOSSIP_CONFIRM")
e:RegisterEvent("GOSSIP_CONFIRM_CANCEL")
e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("MODIFIER_STATE_CHANGED")

local creatures = {
	[1] = { -- Gossip options used on two or more NPCs.
		["gossips"] = {
			L["Are you enjoying yourself?"], -- Added from Quest: Mix, Mingle, and Meddle (Revendreth)
			L["Go hunt somewhere else!"], -- Added from Quest: Amateur Hour (Highmountain)
			L["There is no time left. Run!"], -- Added from Quest: Evacuate Snowmane (Highmountain)
			L["Let's go!"], -- Added from Quest: Lead the Way (Revendreth)
			L["I'm ready."], -- Added from Quest: Heroes of the Horde! (Hillsbrad Foothills)
			L["Let's duel."], -- Added from Quest: To Be Prepared (Durotar)
			L["I am ready."], -- Added from Quest: Cenarius, Keeper of the Grove (Val'sharah)
			L["Leave the Darkpens."], -- Added from Quest: Lieutenant of the Tower (Val'sharah)
			L["Take us back to Zuldazar."], -- Added from Quest: Return to Zuldazar (Stormsong Valley)
			L["<Reach inside and pull something out.>"], -- Added from Quest: Krazzlefrazz Outpost (Drustvar)
			L["<Reach inside and pull out something that feels more like a building.>"], -- Added from Quest: Krazzlefrazz Outpost (Drustvar)
			L["Begin pet battle."],
			L["Let's do battle!"],
		}
	},
	[2] = { -- NPCs with Cost
		["gossips"] = {
			L["I'd like to heal and revive my battle pets."],
		},
	},
	-- Exile's Reach
	[167179] = { -- Daelya Twilightsbane
		["gossips"] = {
			L["Daelya Twilightsbane 1"],
			L["Daelya Twilightsbane 2"],
		},
	},
	[167298] = { -- Herbert Gloomburst
		["gossips"] = {
			L["Herbert Gloomburst 1"],
		},
	},
	[167663] = { -- Warlord Breka Grimaxe
		["gossips"] = {
			L["Warlord Breka Grimaxe 1"],
		},
	},
	-- Eastern Kingdoms: Blasted Lands
	[78423] = { -- Archmage Khadgar
		["gossips"] = {
			L["Archmage Khadgar 1"],
		},
	},
	-- Eastern Kingdoms: Hillsbrad Foothills
	[47442] = { -- Johnny Awesome
		["gossips"] = {
			L["Johnny Awesome 1"],
			L["Johnny Awesome 2"],
			L["Johnny Awesome 3"],
		},
	},
	[47443] = { -- Kingslayer Orkus
		["gossips"] = {
			L["Kingslayer Orkus 1"],
			L["Kingslayer Orkus 2"],
			L["Kingslayer Orkus 3"],
		},
	},
	[47444] = { -- Dumass
		["gossips"] = {
			L["Dumass 1"],
			L["Dumass 2"],
		},
	},
	[48218] = { -- Kingslayer Orkus
		["gossips"] = {
			L["Kingslayer Orkus 4"]
		},
	},
	-- Eastern Kingdoms: Silverpine Forest
	[44825] = { -- Bat Handler Maggotbreath
		["gossips"] = {
			L["Bat Handler Maggotbreath 1"],
		},
	},
	[45752] = { -- Ambermill Dimensional Portal
		["gossips"] = {
			L["Ambermill Dimensional Portal 1"],
		},
	},
	-- Eastern Kingdoms: Stormwind City
	[149626] = { -- Vanguard Battlemage (Alliance)
		["gossips"] = {
			L["Vanguard Battlemage 1"],
		},
	},
	-- Eastern Kingdoms: Tirisfal Glades
	[141488] = { -- Zidormi
		["gossips"] = {
			L["Zidormi 1"],
		},
	},
	-- Kalimdor: Durotar
	[4311] = { -- Holgar Stormaxe
		["gossips"] = {
			L["Holgar Stormaxe 1"],
		},
		["confirms"] = {
			L["Holgar Stormaxe 2"],
		},
	},
	-- Kalimdor: Orgrimmar
	[135205] = { -- Nathanos Blightcaller
		["gossips"] = {
			L["Nathanos Blightcaller 1"],
		}
	},
	[167032] = { -- Chromie
		["gossips"] = {
			L["Chromie 1"],
			L["Chromie 2"],
		}
	},
	[168431] = { -- Warlord Breka Grimaxe
		["gossips"] = {
			L["Warlord Breka Grimaxe 2"],
		},
	},
	[171791] = { -- Nazgrim
		["gossips"] = {
			L["Nazgrim 1"],
		}
	},
	-- Draenor: Garrison (Alliance)
	[79243] = { -- Baros Alexston
		["gossips"] = {
			L["Baros Alexston 1"],
		},
	},
	[84455] = { -- Assistant Brightstone
		["gossips"] = {
			L["Assistant Brightstone 1"],
		},
	},
	[81441] = { -- Shelly Hamby
		["gossips"] = {
			L["Shelly Hamby 1"],
		},
	},
	-- Draenor: Garrison (Horde)
	[80225] = { -- Skaggit
		["gossips"] = {
			L["Skaggit 1"],
		},
	},
	[86775] = { -- Senior Peon II
		["gossips"] = {
			L["Senior Peon II 1"],
		},
	},
	[88228] = { -- Sergeant Grimjaw
		["gossips"] = {
			L["Sergeant Grimjaw 1"],
		},
	},
	-- Draenor: Shadowmoon Valley
	[72871] = { -- All-Seeing Eye
		["gossips"] = {
			L["All-Seeing Eye 1"],
		},
	},
	[78556] = { -- Ariok
		["gossips"] = {
			L["Ariok 1"],
		},
	},
	-- Broken Isles: Highmountain
	[98825] = { -- Spiritwalker Ebonhorn
		["gossips"] = {
			L["Spiritwalker Ebonhorn 1"],
			L["Spiritwalker Ebonhorn 2"],
		},
	},
	[99745] = { -- Snazzle Shinyfinder
		["gossips"] = {
			L["Snazzle Shinyfinder 1"],
		},
	},
	[99746] = { -- Trytooth Hardchisel
		["gossips"] = {
			L["Trytooth Hardchisel 1"],
		},
	},
	[99747] = { -- Kindle Candlecrafter
		["gossips"] = {
			L["Kindle Candlecrafter 1"],
		},
	},
	[99748] = { -- Dug Digger
		["gossips"] = {
			L["Dug Digger 1"],
		},
	},
	[99781] = { -- Snazzle Shinyfinder
		["gossips"] = {
			L["Snazzle Shinyfinder 2"],
		},
	},
	[99782] = { -- Trytooth Hardchisel
		["gossips"] = {
			L["Trytooth Hardchisel 2"],
			L["Trytooth Hardchisel 3"],
		},
	},
	[99784] = { -- Kindle Candlecrafter
		["gossips"] = {
			L["Kindle Candlecrafter 2"],
		},
	},
	[95403] = { -- Windmaster Julan
		["gossips"] = {
			L["Windmaster Julan 1"],
		},
	},
	[96286] = { -- Navarrogg
		["gossips"] = {
			L["Navarrogg 1"],
		},
	},
	[98773] = { -- Lasan Skyhorn
		["gossips"] = {
			L["Yes!"],
		},
	},
	[94434] = { -- Addie Fizzlebog
		["gossips"] = {
			L["Addie Fizzlebog 1"],
		},
	},
	-- Broken Isles: Val'sharah
	[92734] = { -- Penelope Heathrow
		["gossips"] = {
			"It's safe now.",
		},
	},
	[94974] = { -- Sirius Ebonwing
		["gossips"] = {
			"Excuse me...",
		},
	},
	[94975] = { -- Asha Ravensong
		["gossips"] = {
			"Arduen sent me. You're free.",
		},
	},
	[94976] = { -- Cassiel Nightthorn
		["gossips"] = {
			"Be at peace.",
		},
	},
	[104739] = { -- Tyrande Whisperwind
		["gossips"] = {
			"By my honor you will come to no harm, priestess.",
		},
	},
	[108642] = { -- Keeper Remulos
		["gossips"] = {
			"Free Remulos from captivity.",
		},
	},
	-- Kul Tiras: Drustvar
	[137613] = { -- Hobart Grapplehammer
		["gossips"] = {
			"Your friends were all tortured and killed by witches.",
			"Sure.",
		},
	},
	-- Kul Tiras: Stormsong Valley
	[138137] = { -- Huelo
		["gossips"] = {
			"Pull the harpoon free.",
		},
	},
	-- Kul Tiras: Tiragarde Sound
	[137675] = { -- Shadow Hunter Ty'jin
		["gossips"] = {
			"I'm ready to parley, Ty'jin.",
		},
	},
	[137798] = { -- Boatswain Taryn
		["gossips"] = {
			"Got some new orders from the captain for you, boatswain.",
		},
	},
	[137800] = { -- Quartermaster Killian
		["gossips"] = {
			"We're saying no to the Ashvane.",
		},
	},
	[137807] = { -- Navigator Swink
		["gossips"] = {
			"Orders from the captain, sir.",
		},
	},
	-- Zandalar: Zuldazar
	[135440] = { -- Princess Talanji
		["gossips"] = {
			"Take me to King Rastakhan.",
		},
	},
	[135690] = { -- Dread-Admiral Tattersail
		["gossips"] = {
			L["Quest"],
		},
	},
	-- Shadowlands: The Maw
	[165918] = { -- Highlord Darion Mograine
		["gossips"] = {
			"Make it talk.",
		},
	},
	[166980] = { -- Lady Jaina Proudmoore
		["gossips"] = {
			"Tell me about this place.",
			"Tell me more of the Jailer.",
			"What about the others who were taken?",
			"<Lie low and observe.>",
		}
	},
	-- Shadowlands: Oribos
	[159478] = { -- Tal-Inara
		["gossips"] = {
			"Show me how I can help the Shadowlands.",
		},
	},
	[164079] = { -- Highlord Bolvar Fordragon
		["gossips"] = {
			"Skip ahead to finish the Torghast chapter and have Torghast, Ve'nari, and the Runecarver unlocked.",
			"Skip ahead to Korthia.",
		},
	},
	[177136] = { -- Polemarch Adrestes
		["gossips"] = {
			"<Ask Adrestes what happened in Elysian Hold.>",
		},
	},
	-- Shadowlands: Bastion
	[156327] = { -- Voitha
		["gossips"] = {
			"I will retrieve the scrolls.",
		},
	},
	[157696] = { -- Nemea
		["gossips"] = {
			"I choose the larion.",
		},
	},
	[158765] = { -- Pelodis
		["gossips"] = {
			"Everything is in place for the repair.",
		},
	},
	[169027] = { -- Helpful Steward (for the fixes)
		["gossips"] = {
			"Can you help with this problem?",
		},
	},
	[169078] = { -- Helpful Steward (to get them to follow you)
		["gossips"] = {
			"Can you help me with something?",
		},
	},
	[172714] = { -- Trapped Caretaker
		["gossips"] = {
			"I've cleared a path for you. You should leave.",
		},
	},
	-- Shadowlands: Maldraxxus
	[159696] = { -- Rencissa the Dynamo
		["gossips"] = {
			"biggest rock",
		},
	},
	[159827] = { -- Scrapper Minoire
		["gossips"] = {
			"Here are the enhancers you wanted.",
		},
	},
	[160917] = { -- Grimshadow
		["gossips"] = {
			"<Ride Grimshadow.>",
		},
	},
	[161710] = { -- Marcel Mullby
		["gossips"] = {
			"I have some bloodtusk skulls for you.",
		},
	},
	[164492] = { -- Arena Spectator
		["gossips"] = {
			"Au'narim claims you owe her anima.",
		},
	},
	[165966] = { -- Khaliiq
		["gossips"] = {
			"Hide me in the shadows, Khaliiq.",
		},
	},
	[166129] = { -- Specialist Entra
		["gossips"] = {
			"What should I do?",
		},
	},
	[166657] = { -- Ta'eran
		["gossips"] = {
			"Tell me about this opportunity.",
		},
	},
	-- Shadowlands: Ardenweald
	[158543] = { -- Attendant Sparkledew
		["gossips"] = {
			"Take me to the Queen's audience chamber, please.",
		},
	},
	[160121] = { -- Master Sha'lor
		["gossips"] = {
			"I need a flute.",
		},
	},
	[165550] = { -- Attendant Shimmerwing
		["gossips"] = {
			"I would like to leave the Queen's audience chamber, please.",
		},
	},
	[169273] = { -- Silkstrider Caretaker
		["gossips"] = {
			"You're safe now.",
		},
	},
	[172431] = { -- Lady Moonberry
		["gossips"] = {
			"Lead on.",
		},
	},
	-- Shadowlands: Revendreth
	[159883] = { -- Chancellor Codrin
		["gossips"] = {
			"You stand accused of conspiring to overthrow The Countess.",
		},
	},
	[159946] = { -- The Countess
		["gossips"] = {
			"House Darkvein",
		},
	},
	[160941] = { -- The Curator
		["gossips"] = {
			"What happened to the Medallion of Avarice?",
		},
	},
	[161056] = { -- Guard Captain Elizabeta
		["gossips"] = {
			"The Curator sent me. I'm looking for Watcher Emil.",
		},
	},
	[165662] = { -- The Countess
		["gossips"] = {
			"<Deliver Prince Renathal's invitation.>",
		},
	},
	[166541] = { -- Cobwobble
		["gossips"] = {
			"What are you all doing?",
		},
	},
	[166542] = { -- Slobwobble
		["gossips"] = {
			"Where does the Taskmaster keep the sinstones?",
		},
	},
	[166543] = { -- Dobwobble
		["gossips"] = {
			"Why are the ones with scribbles interesting?",
		},
	},
	[169238] = { -- Courier Araak
		["gossips"] = {
			"Dimwiddle sent me.",
		},
	},
	[169917] = { -- Avowed Ritualist
		["gossips"] = {
			"I have a soul for you.",
		},
	},
	-- Instance: Mogu'shan Vaults
	[61348] = { -- Lorewalker Cho
		["gossips"] = {
			"What are you waiting for? Let's go investigate!",
			"Go ahead and turn this thing on.",
		},
	},
	-- Instance: Isle of Thunder (Scenario)
	[69565] = { -- Scout Captain Elsia
		["gossips"] = {
			"Here are the explosives, Elsia.",
		},
	},
	[69810] = { -- Taoshi
		["gossips"] = {
			"Alright. Let's go.",
		},
	},
	[70297] = { -- Taoshi
		["gossips"] = {
			"I'm with you. Let's break into that shipyard! [Queue for solo instance.]",
		},
	},
	-- Instance: Horrific Visions
	[152993] = { -- Garona Halforcen (Vision of Orgrimmar)
		["gossips"] = {
			"You have my aid. <Help Garona up>",
		},
	},
	[160998] = { -- Altar of the Daredevil
		["gossips"] = {
			"Put on the Faceless Mask of the Daredevil.",
		},
	},
	[160961] = { -- Altar of the Dark Imagination
		["gossips"] = {
			"Put on the Faceless Mask of the Dark Imagination.",
		},
	},
	[161000] = { -- Altar of the Pained
		["gossips"] = {
			"Put on the Faceless Mask of the Pained.",
		},
	},
	[160967] = { -- Altar of the Burned Bridge
		["gossips"] = {
			"Put on the Faceless Mask of the Burned Bridge.",
		},
	},
	[160999] = { -- Altar of the Long Night
		["gossips"] = {
			"Put on the Faceless Mask of the Long Night.",
		},
	},
}

e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_CONFIRM" then
		local _, message = ...
		if IsModifierKeyDown() then return end
		local index = 1
		local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
		if unitGUID then
			local _, _, _, _, _, npcID = strsplit("-", unitGUID); npcID = tonumber(npcID)
			for id, _ in pairs(creatures) do
				if id == npcID then
					for i = 1, #creatures[id]["confirms"] do
						if string.find(string.lower(message), string.lower(creatures[id]["confirms"][i])) then
							StaticPopup1Button1:Click()
						end
					end
				end
			end
		end
	end
	if event == "GOSSIP_SHOW" then
		if IsModifierKeyDown() then return end
		local numActiveQuests = C_GossipInfo.GetNumActiveQuests()
		if numActiveQuests > 0 then
			local activeQuests = C_GossipInfo.GetActiveQuests()
			for i = 1, numActiveQuests do
				if activeQuests[i].isComplete then
					C_Timer.After(0, function()
						C_Timer.After(0.1, function()
							-- Do nothing here, we just want a slight delay to let active quests be handled first.
						end)
					end)
				end
			end
		end
		local index = 1
		local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
		if unitGUID then
			local _, _, _, _, _, npcID = strsplit("-", unitGUID); npcID = tonumber(npcID)
			local gossipOptions = C_GossipInfo.GetOptions()
			for index, gossipOptionsSubTable in ipairs(gossipOptions) do
				for i = 1, 2 do
					for j = 1, #creatures[i]["gossips"] do
						if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(creatures[i]["gossips"][j])) then
							C_GossipInfo.SelectOption(index)
						end
					end
				end
				for id, _ in pairs(creatures) do
					if id == npcID then -- The target's ID is in the table, so use its configuration.
						for i = 1, #creatures[id]["gossips"] do
							if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(creatures[id]["gossips"][i])) then
								C_GossipInfo.SelectOption(index)
							end
						end
					end
				end
			end
		end
	end
end)