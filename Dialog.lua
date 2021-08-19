local addonName, addonTable = ...
local e = CreateFrame("Frame")

e:RegisterEvent("GOSSIP_CONFIRM")
e:RegisterEvent("GOSSIP_CONFIRM_CANCEL")
e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("MODIFIER_STATE_CHANGED")

local creatures = {
	[1] = { -- Gossip options used on two or more NPCs.
		["gossips"] = {
			"Are you enjoying yourself?", -- Added from Quest: Mix, Mingle, and Meddle (Revendreth)
			"Go hunt somewhere else!", -- Added from Quest: Amateur Hour (Highmountain)
			"There is no time left. Run!", -- Added from Quest: Evacuate Snowmane (Highmountain)
			"Let's go!", -- Added from Quest: Lead the Way (Revendreth)
			"I'm ready.", -- Added from Quest: Heroes of the Horde! (Hillsbrad Foothills)
			"Let's duel.", -- Added from Quest: To Be Prepared (Durotar)
			"I am ready.", -- Added from Quest: Cenarius, Keeper of the Grove (Val'sharah)
			"Leave the Darkpens.", -- Added from Quest: Lieutenant of the Tower (Val'sharah)
			"Take us back to Zuldazar.", -- Added from Quest: Return to Zuldazar (Stormsong Valley)
			"Begin pet battle.",
			"Let's do battle!",
		}
	},
	[2] = { -- NPCs with Cost
		["gossips"] = {
			"I'd like to heal and revive my battle pets.",
		},
		["cost"] = 10000
	},
	-- Exile's Reach
	[167179] = { -- Daelya Twilightsbane
		["gossips"] = {
			"What does the Light wish of me?",
			"I will do my best to serve the Light. I swear to it.",
		},
	},
	[167298] = { -- Herbert Gloomburst
		["gossips"] = {
			"I'll fight the harpies that come.",
		},
	},
	[167663] = { -- Warlord Breka Grimaxe
		["gossips"] = {
			"Let's get out of the citadel and figure out how to get back home.",
		},
	},
	-- Eastern Kingdoms: Blasted Lands
	[78423] = { -- Archmage Khadgar
		["gossips"] = {
			"FOR AZEROTH!",
		},
	},
	-- Eastern Kingdoms: Hillsbrad Foothills
	[47442] = { -- Johnny Awesome
		["gossips"] = {
			"Well, we are having some problems at the Sludge Fields, located northeast of here. Warden Stillwater could use your help.",
			"That's all.",
			"THAT'S ALL, JOHNNY AWESOME. TAKE IT OR LEAVE IT!",
		},
	},
	[47443] = { -- Kingslayer Orkus
		["gossips"] = {
			"Um... Apparently there is some trouble at Southshore. Something about worgen insurgents. Maybe you could help with them?",
			"None.",
			"Right, thanks. Just go ahead and head southeast. More south than east. Probably off the coast.",
		},
	},
	[47444] = { -- Dumass
		["gossips"] = {
			"Maybe you should go take a nap or something.",
			"Wait a minute. It looks like something just came up.",
		},
	},
	[48218] = { -- Kingslayer Orkus
		["gossips"] = {
			"Your feet are touching the ground, Orkus.",
		},
	},
	-- Eastern Kingdoms: Silverpine Forest
	[44825] = { -- Bat Handler Maggotbreath
		["gossips"] = {
			"I need to take a bat to the Dawning Isles.",
		},
	},
	[45752] = { -- Ambermill Dimensional Portal
		["gossips"] = {
			"<Use the Ambermill Dimensional Portal.>",
		},
	},
	-- Eastern Kingdoms: Stormwind City
	[149626] = { -- Vanguard Battlemage (Alliance)
		["gossips"] = {
			"I must help Khadgar. Send me to the Blasted Lands!",
		},
	},
	-- Eastern Kingdoms: Tirisfal Glades
	[141488] = { -- Zidormi
		["gossips"] = {
			"Can you show me what Tirisfal Glades was like before the Battle for Lordaeron?",
		},
	},
	-- Kalimdor: Durotar
	[4311] = {
		["gossips"] = {
			"I've heard this tale before...",
		},
		["confirms"] = {
			"Are you sure you want to skip the Broken Shore introduction?",
		},
	},
	[39380] = { -- Shin Stonepillar
		["gossips"] = {
			"Can you tell me your fable, Shin?",
		},
	},
	-- Kalimdor: Orgrimmar
	[135205] = { -- Nathanos Blightcaller
		["gossips"] = {
			"I have heard this story before.",
		}
	},
	[167032] = { -- Chromie
		["gossips"] = {
			"Select a timeline.",
			"Select a different timeline.",
		}
	},
	[168431] = { -- Warlord Breka Grimaxe
		["gossips"] = {
			"I know my way around Orgrimmar.",
		},
	},
	[171791] = { -- Nazgrim
		["gossips"] = {
			"Tell me what happened.",
		}
	},
	-- Draenor: Tanaan Jungle (Invasion)
	[78568] = { -- Thaelin Darkanvil
		["gossips"] = {
			"Yes. I need you to help me operate that enormous tank.",
		},
	},
	-- Draenor: Garrison (Alliance)
	[79243] = { -- Baros Alexston
		["gossips"] = {
			"We have everything we need. It's time to build the garrison.",
		},
	},
	[84455] = { -- Assistant Brightstone
		["gossips"] = {
			"Time to get back to work.",
		},
	},
	[81441] = { -- Shelly Hamby
		["gossips"] = {
			"Gather Shelly's report.",
		},
	},
	-- Draenor: Garrison (Horde)
	[80225] = { -- Skaggit
		["gossips"] = {
			"Get the peons back to work.",
		},
	},
	[86775] = { -- Senior Peon II
		["gossips"] = {
			"Gazlowe needs you.",
		},
	},
	[88228] = { -- Sergeant Grimjaw
		["gossips"] = {
			"Prepare to battle the Gorens.",
		},
	},
	-- Draenor: Shadowmoon Valley
	[72871] = { -- All-Seeing Eye
		["gossips"] = {
			"Begin the compulsion of the All-Seeing Eye.",
		},
	},
	[78556] = { -- Ariok
		["gossips"] = {
			"Khadgar has asked us to go distract the Eye of Kilrogg.",
		},
	},
	-- Broken Isles: Highmountain
	[98825] = { -- Spiritwalker Ebonhorn
		["gossips"] = {
			"Tell me the Story of Huln.",
		},
	},
	[99745] = { -- Snazzle Shinyfinder
		["gossips"] = {
			"Go find shiny!",
		},
	},
	[99746] = { -- Trytooth Hardchisel
		["gossips"] = {
			"You kill basilisk!",
		},
	},
	[99747] = { -- Kindle Candlecrafter
		["gossips"] = {
			"Make big candle! Lots of wax!",
		},
	},
	[99748] = { -- Dug Digger
		["gossips"] = {
			"Dig rocks, find pretties!",
		},
	},
	[99781] = { -- Snazzle Shinyfinder
		["gossips"] = {
			"You keep one. I keep rest.",
		},
	},
	[99782] = { -- Trytooth Hardchisel
		["gossips"] = {
			"Best kill job me seen!",
			"Give Trytooth the boot.",
		},
	},
	[99784] = { -- Kindle Candlecrafter
		["gossips"] = {
			"Me think me have just the right touch...",
		},
	},
	[95403] = { -- Windmaster Julan
		["gossips"] = {
			"Take the Windmaster's Totem.",
		},
	},
	[96286] = { -- Navarrogg
		["gossips"] = {
			"Let's get out of here!",
		},
	},
	[98773] = { -- Lasan Skyhorn
		["gossips"] = {
			"Yes!",
		},
	},
	[98825] = { -- Spiritwalker Ebonhorn
		["gossips"] = {
			"Tell me more of Huln Highmountain."
		},
	},
	[94434] = { -- Addie Fizzlebog
		["gossips"] = {
			"Let's go hunting!",
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
	[137397] = { -- Wormhole
		["gossips"] = {
			"<Reach inside and pull something out.>",
			"<Reach inside and pull out something that feels more like a building.>",
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
			"Quest",
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
			C_Timer.After(0, function()
				C_Timer.After(0.5, function()
					
				end)
			end)
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