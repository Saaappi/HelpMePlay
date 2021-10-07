local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("GOSSIP_CONFIRM")
e:RegisterEvent("GOSSIP_CONFIRM_CANCEL")
e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("MODIFIER_STATE_CHANGED")

local creatures = {
	[1] = { -- Gossip and confirm options used on two or more NPCs.
		["g"] = {
			L["Are you enjoying yourself?"], -- Added from Quest: Mix, Mingle, and Meddle (Revendreth)
			L["Go hunt somewhere else!"], -- Added from Quest: Amateur Hour (Highmountain)
			L["There is no time left. Run!"], -- Added from Quest: Evacuate Snowmane (Highmountain)
			L["Let's go!"], -- Added from Quest: Lead the Way (Revendreth)
			L["I'm ready."], -- Added from Quest: Heroes of the Horde! (Hillsbrad Foothills)
			L["Let's duel."], -- Added from Quest: To Be Prepared (Durotar)
			L["I am ready."], -- Added from Quest: Cenarius, Keeper of the Grove (Val'sharah)
			L["Leave the Darkpens."], -- Added from Quest: Lieutenant of the Tower (Val'sharah)
			L["Take us back to Zuldazar."], -- Added from Quest: Return to Zuldazar (Stormsong Valley)
			L["Take us back to Boralus."], -- Added from Quest: Return to Boralus (Zuldazar)
			L["<Reach inside and pull something out.>"], -- Added from Quest: Krazzlefrazz Outpost (Drustvar)
			L["<Reach inside and pull out something that feels more like a building.>"], -- Added from Quest: Krazzlefrazz Outpost (Drustvar)
			L["D'kaan is coming with help."], -- Added from Quest: Rescue Rangari (Gorgrond)
			L["I've heard this tale before..."], -- Added from Quest: ??? (Stormwind City/Orgrimmar)
			L["Is there any way I can help?"], -- Added from Quest: A Plague On Your House (Maldraxxus)
			L["Is there anything you need?"], -- Added from Quest: ...Even The Most Ridiculous Request! (Maldraxxus)
			L["Very well. Let us fight."], -- Added from Quest: Test Your Mettle (Maldraxxus)
			L["Au'narim claims you owe her anima."], -- Added from Quest: Leave Me a Loan (Maldraxxus)
			L["The Lady of the Falls wanted to make sure you were safe."], -- Added from Quest: Ages-Echoing Wisdom (Ardenweald)
			L["<Request tithe>"], -- Added from Quest: Bring Out Your Tithe (Revendreth)
			L["I know my way around the Sanctum."], -- Added from Quest: Show. Don't Tell (Ardenweald), but applies to all Covenants.
			L["What can you tell me about Cartel So?"], -- Added from Quest: Insider Trading (Oribos)
			L["Let's ride."], -- Added from Quest: My Way or the Hyphae (Ardenweald)
			L["Begin pet battle."],
			L["Let's do battle!"],
		},
		["c"] = {
			L["Are you sure? This action cannot be undone."], -- Added from Quest: Show. Don't Tell (Ardenweald), but applies to all Covenants.
		},
	},
	[2] = { -- NPCs with Cost
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Exile's Reach
	[167179] = { -- Daelya Twilightsbane
		["g"] = {
			L["Daelya Twilightsbane 1"],
			L["Daelya Twilightsbane 2"],
		},
	},
	[167298] = { -- Herbert Gloomburst
		["g"] = {
			L["Herbert Gloomburst 1"],
		},
	},
	[167309] = { -- Herbert Gloomburst
		["g"] = {
			L["Herbert Gloomburst 2"],
		},
	},
	[167663] = { -- Warlord Breka Grimaxe
		["g"] = {
			L["Warlord Breka Grimaxe 1"],
		},
	},
	-- Eastern Kingdoms: Blasted Lands
	[78423] = { -- Archmage Khadgar
		["g"] = {
			L["Archmage Khadgar 1"],
		},
		["c"] = {
			L["Archmage Khadgar 2"],
		},
	},
	-- Eastern Kingdoms: Elwynn Forest
	[240] = { -- Marshal Dughan
		["g"] = {
			L["Marshal Dughan 1"],
		},
	},
	-- Eastern Kingdoms: Hillsbrad Foothills
	[47442] = { -- Johnny Awesome
		["g"] = {
			L["Johnny Awesome 1"],
			L["Johnny Awesome 2"],
			L["Johnny Awesome 3"],
		},
	},
	[47443] = { -- Kingslayer Orkus
		["g"] = {
			L["Kingslayer Orkus 1"],
			L["Kingslayer Orkus 2"],
			L["Kingslayer Orkus 3"],
		},
	},
	[47444] = { -- Dumass
		["g"] = {
			L["Dumass 1"],
			L["Dumass 2"],
		},
	},
	[48218] = { -- Kingslayer Orkus
		["g"] = {
			L["Kingslayer Orkus 4"]
		},
	},
	-- Eastern Kingdoms: Silverpine Forest
	[44825] = { -- Bat Handler Maggotbreath
		["g"] = {
			L["Bat Handler Maggotbreath 1"],
		},
	},
	[45752] = { -- Ambermill Dimensional Portal
		["g"] = {
			L["Ambermill Dimensional Portal 1"],
		},
	},
	-- Eastern Kingdoms: Stormwind City
	[107934] = { -- Recruiter Lee
		["g"] = {
			L["I've heard this tale before..."],
		},
		["c"] = {
			L["Are you sure you want to skip the Broken Shore introduction?"],
		},
	},
	[149626] = { -- Vanguard Battlemage (Alliance)
		["g"] = {
			L["Vanguard Battlemage 1"],
		},
	},
	[171789] = { -- High Inquisitor Whitemane
		["g"] = {
			L["High Inquisitor Whitemane 1"],
		},
	},
	-- Eastern Kingdoms: Tirisfal Glades
	[141488] = { -- Zidormi
		["g"] = {
			L["Zidormi 1"],
		},
	},
	-- Kalimdor: Durotar
	[4311] = { -- Holgar Stormaxe
		["g"] = {
			L["I've heard this tale before..."],
		},
		["c"] = {
			L["Are you sure you want to skip the Broken Shore introduction?"],
		},
	},
	-- Kalimdor: Orgrimmar
	[135205] = { -- Nathanos Blightcaller
		["g"] = {
			L["Nathanos Blightcaller 1"],
		}
	},
	[167032] = { -- Chromie
		["g"] = {
			L["Chromie 1"],
			L["Chromie 2"],
		}
	},
	[168431] = { -- Warlord Breka Grimaxe
		["g"] = {
			L["Warlord Breka Grimaxe 2"],
		},
	},
	[171791] = { -- Nazgrim
		["g"] = {
			L["Nazgrim 1"],
		}
	},
	-- Draenor: Garrison (Alliance)
	[79243] = { -- Baros Alexston
		["g"] = {
			L["Baros Alexston 1"],
		},
	},
	[84455] = { -- Assistant Brightstone
		["g"] = {
			L["Assistant Brightstone 1"],
		},
	},
	[81441] = { -- Shelly Hamby
		["g"] = {
			L["Shelly Hamby 1"],
		},
	},
	[81103] = { -- Dungar Longdrink
		["g"] = {
			L["Dungar Longdrink 1"],
		},
	},
	-- Draenor: Tanaan Jungle
	[78568] = { -- Thaelin Darkanvil
		["g"] = {
			L["Thaelin Darkanvil 1"],
		},
	},
	-- Draenor: Garrison (Horde)
	[80225] = { -- Skaggit
		["g"] = {
			L["Skaggit 1"],
		},
	},
	[86775] = { -- Senior Peon II
		["g"] = {
			L["Senior Peon II 1"],
		},
	},
	[88228] = { -- Sergeant Grimjaw
		["g"] = {
			L["Sergeant Grimjaw 1"],
		},
	},
	-- Draenor: Shadowmoon Valley
	[72871] = { -- All-Seeing Eye
		["g"] = {
			L["All-Seeing Eye 1"],
		},
	},
	[78556] = { -- Ariok
		["g"] = {
			L["Ariok 1"],
		},
	},
	-- Broken Isles: Highmountain
	[98825] = { -- Spiritwalker Ebonhorn
		["g"] = {
			L["Spiritwalker Ebonhorn 1"],
			L["Spiritwalker Ebonhorn 2"],
		},
	},
	[99745] = { -- Snazzle Shinyfinder
		["g"] = {
			L["Snazzle Shinyfinder 1"],
		},
	},
	[99746] = { -- Trytooth Hardchisel
		["g"] = {
			L["Trytooth Hardchisel 1"],
		},
	},
	[99747] = { -- Kindle Candlecrafter
		["g"] = {
			L["Kindle Candlecrafter 1"],
		},
	},
	[99748] = { -- Dug Digger
		["g"] = {
			L["Dug Digger 1"],
		},
	},
	[99781] = { -- Snazzle Shinyfinder
		["g"] = {
			L["Snazzle Shinyfinder 2"],
		},
	},
	[99782] = { -- Trytooth Hardchisel
		["g"] = {
			L["Trytooth Hardchisel 2"],
			L["Trytooth Hardchisel 3"],
		},
	},
	[99784] = { -- Kindle Candlecrafter
		["g"] = {
			L["Kindle Candlecrafter 2"],
		},
	},
	[95403] = { -- Windmaster Julan
		["g"] = {
			L["Windmaster Julan 1"],
		},
	},
	[96286] = { -- Navarrogg
		["g"] = {
			L["Navarrogg 1"],
		},
	},
	[98773] = { -- Lasan Skyhorn
		["g"] = {
			L["Yes!"],
		},
	},
	[94434] = { -- Addie Fizzlebog
		["g"] = {
			L["Addie Fizzlebog 1"],
		},
	},
	-- Broken Isles: Val'sharah
	[92734] = { -- Penelope Heathrow
		["g"] = {
			L["Penelope Heathrow 1"],
		},
	},
	[94974] = { -- Sirius Ebonwing
		["g"] = {
			L["Sirius Ebonwing 1"],
		},
	},
	[94975] = { -- Asha Ravensong
		["g"] = {
			L["Asha Ravensong 1"],
		},
	},
	[94976] = { -- Cassiel Nightthorn
		["g"] = {
			L["Cassiel Nightthorn 1"],
		},
	},
	[104739] = { -- Tyrande Whisperwind
		["g"] = {
			L["Tyrande Whisperwind 1"],
			L["Tyrande Whisperwind 2"],
		},
	},
	-- Argus
	[121263] = { -- Grand Artificer Romuul
		["g"] = {
			L["Grand Artificer Romuul 1"],
		},
	},
	[108642] = { -- Keeper Remulos
		["g"] = {
			L["Keeper Remulos 1"],
		},
	},
	-- Kul Tiras: Drustvar
	[137613] = { -- Hobart Grapplehammer
		["g"] = {
			L["Hobart Grapplehammer 1"],
			L["Hobart Grapplehammer 2"],
		},
	},
	-- Kul Tiras: Stormsong Valley
	[138137] = { -- Huelo
		["g"] = {
			L["Huelo 1"],
		},
	},
	-- Kul Tiras: Tiragarde Sound
	[137675] = { -- Shadow Hunter Ty'jin
		["g"] = {
			L["Shadow Hunter Ty'jin 1"],
		},
	},
	[137798] = { -- Boatswain Taryn
		["g"] = {
			L["Boatswain Taryn 1"],
		},
	},
	[137800] = { -- Quartermaster Killian
		["g"] = {
			L["Quartermaster Killian 1"],
		},
	},
	[137807] = { -- Navigator Swink
		["g"] = {
			L["Navigator Swink 1"],
		},
	},
	-- Zandalar: Zuldazar
	[135440] = { -- Princess Talanji
		["g"] = {
			L["Princess Talanji 1"],
		},
	},
	[135690] = { -- Dread-Admiral Tattersail
		["g"] = {
			L["Quest"],
		},
	},
	[143690] = { -- Captured Zandalari Troll
		["g"] = {
			L["Captured Zandalari Troll 1"],
		},
	},
	-- Zandalar: Vol'dun
	[137559] = { -- Private James
		["g"] = {
			L["Private James 1"],
		},
	},
	-- Kul Tiras: Boralus
	[122370] = { -- Cyrus Crestfall
		["g"] = {
			L["Cyrus Crestfall 1"],
		},
	},
	[137066] = { -- 7th Legion Magus
		["g"] = {
			L["7th Legion Magus 1"],
		},
	},
	[135612] = { -- Halford Wyrmbane
		["g"] = {
			L["Halford Wyrmbane 1"],
		},
	},
	[135681] = { -- Grand Admiral Jes-Tereth
		["g"] = {
			L["Quest"],
		},
	},
	-- Shadowlands: The Maw
	[165918] = { -- Highlord Darion Mograine
		["g"] = {
			L["Highlord Darion Mograine 1"],
		},
	},
	[166980] = { -- Lady Jaina Proudmoore
		["g"] = {
			L["Lady Jaina Proudmoore 1"],
			L["Lady Jaina Proudmoore 2"],
			L["Lady Jaina Proudmoore 3"],
			L["Lady Jaina Proudmoore 4"],
		}
	},
	[168836] = { -- Shandris Feathermoon
		["g"] = {
			L["Shandris Feathermoon 1"],
		}
	},
	[178828] = { -- Lord Herne
		["g"] = {
			L["Lord Herne 1"],
		}
	},
	[178943] = { -- Lady Moonberry
		["g"] = {
			L["Lady Moonberry 2"],
		}
	},
	[179068] = { -- Orator Kloe
		["g"] = {
			L["Orator Kloe 1"],
		}
	},
	[178033] = { -- Gubbins
		["g"] = {
			L["Gubbins 1"],
		}
	},
	[177900] = { -- Xandria
		["g"] = {
			L["Xandria 1"],
		}
	},
	[178006] = { -- Prince Renathal
		["g"] = {
			L["Prince Renathal 1"],
		}
	},
	-- Shadowlands: Torghast
	[175118] = { -- Shandris Feathermoon
		["g"] = {
			L["Quest"],
		},
	},
	[164334] = { -- Shandris Feathermoon
		["g"] = {
			L["Shandris Feathermoon 2"],
		},
	},
	[152418] = { -- Gallath
		["g"] = {
			L["Gallath 1"],
		},
	},
	[172264] = { -- Yira'lya
		["g"] = {
			L["Yira'lya 1"],
		},
	},
	[172261] = { -- Chalkyth
		["g"] = {
			L["Chalkyth 1"],
		},
	},
	[157426] = { -- Indri the Treesinger
		["g"] = {
			L["Indri the Treesinger 1"],
		},
	},
	[178932] = { -- Ve'lor the Messenger
		["g"] = {
			L["Ve'lor the Messenger 1"],
		},
	},
	[166147] = { -- Calix
		["g"] = {
			L["Calix 1"],
		},
	},
	[157406] = { -- Renavyth
		["g"] = {
			L["Renavyth 1"],
		},
	},
	-- Shadowlands: Oribos
	[159478] = { -- Tal-Inara
		["g"] = {
			L["Tal-Inara 1"],
		},
	},
	[164079] = { -- Highlord Bolvar Fordragon
		["g"] = {
			L["Highlord Bolvar Fordragon 1"],
			L["Highlord Bolvar Fordragon 2"],
		},
	},
	[177136] = { -- Polemarch Adrestes
		["g"] = {
			L["Polemarch Adrestes 1"],
		},
	},
	[168432] = { -- Ve'rayn
		["g"] = {
			L["Ve'rayn 1"],
			L["Ve'rayn 2"],
			L["Ve'rayn 3"],
			L["Ve'rayn 4"],
		},
	},
	-- Shadowlands: Bastion
	[156327] = { -- Voitha
		["g"] = {
			L["Voitha 1"],
		},
	},
	[157696] = { -- Nemea
		["g"] = {
			L["Nemea 1"],
		},
		["c"] = {
			L["Nemea 2"],
		},
	},
	[158765] = { -- Pelodis
		["g"] = {
			L["Pelodis 1"],
		},
	},
	[159277] = { -- Aspirant Leda
		["g"] = {
			L["Aspirant Leda 1"],
		},
	},
	[159278] = { -- Aspirant Ikaran
		["g"] = {
			L["Aspirant Ikaran 1"],
		},
	},
	[169022] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 1"],
		},
	},
	[169023] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 1"],
		},
	},
	[169024] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 1"],
		},
	},
	[169025] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 1"],
		},
	},
	[169026] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 1"],
		},
	},
	[169027] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 1"],
		},
	},
	[169077] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 2"],
		},
	},
	[169078] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 2"],
		},
	},
	[169079] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 2"],
		},
	},
	[169080] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 2"],
		},
	},
	[169081] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 2"],
		},
	},
	[169082] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 2"],
		},
	},
	[172714] = { -- Trapped Caretaker
		["g"] = {
			L["Trapped Caretaker 1"],
		},
	},
	[161279] = { -- Sparring Aspirant
		["g"] = {
			-- When there is only one Sparring Aspirant.
			L["Sparring Aspirant 1"],
		},
	},
	[159504] = { -- Sparring Aspirant
		["g"] = {
			L["Sparring Aspirant 1"],
			L["Sparring Aspirant 2"],
		},
	},
	[159505] = { -- Sparring Aspirant
		["g"] = {
			-- When there are Sparring Aspirants... sparring.
			L["Sparring Aspirant 2"],
		},
	},
	[171834] = { -- Aspirant Thetes
		["g"] = {
			L["Aspirant Thetes 1"],
		},
	},
	
	-- Shadowlands: Maldraxxus
	[165052] = { -- Vial Master Lurgy
		["g"] = {
			L["O.K."],
		},
	},
	[157313] = { -- Foul-Tongue Cyrlix
		["g"] = {
			L["O.K."],
		},
	},
	[157945] = { -- Boil Master Yetch
		["g"] = {
			L["O.K."],
		},
	},
	[159696] = { -- Rencissa the Dynamo
		["g"] = {
			L["Rencissa the Dynamo 1"],
		},
	},
	[159827] = { -- Scrapper Minoire
		["g"] = {
			L["Scrapper Minoire 1"],
		},
	},
	[160917] = { -- Grimshadow
		["g"] = {
			L["Grimshadow 1"],
		},
	},
	[161710] = { -- Marcel Mullby
		["g"] = {
			L["Marcel Mullby 1"],
		},
	},
	[164492] = { -- Arena Spectator
		["g"] = {
			L["Arena Spectator 1"],
		},
	},
	[165966] = { -- Khaliiq
		["g"] = {
			L["Khaliiq 1"],
		},
	},
	[157130] = { -- Recruitable Animate
		["g"] = {
			L["Recruitable Animate 1"],
		},
	},
	[157168] = { -- Stubborn Animate
		["g"] = {
			L["Stubborn Animate 1"],
		},
	},
	[166129] = { -- Specialist Entra
		["g"] = {
			L["Specialist Entra 1"],
		},
	},
	[166657] = { -- Ta'eran
		["g"] = {
			L["Ta'eran 1"],
		},
	},
	[171747] = { -- Project Lead Allen
		["g"] = {
			L["Project Lead Allen 1"],
		},
	},
	[172871] = { -- Taloned Flayedwing
		["g"] = {
			L["Taloned Flayedwing 1"],
		},
	},
	-- Shadowlands: Ardenweald
	[171743] = { -- Dapperdew
		["g"] = {
			L["Dapperdew 1"],
		},
	},
	[157710] = { -- Cortinarius
		["g"] = {
			L["Cortinarius 1"],
		},
	},
	[160929] = { -- Guardian Molan
		["g"] = {
			L["The forces of Mueh'zala have invaded Ardenweald."],
		},
	},
	[158921] = { -- Guardian Kota
		["g"] = {
			L["The forces of Mueh'zala have invaded Ardenweald."],
		},
	},
	[158519] = { -- Sorcha
		["g"] = {
			L["The forces of Mueh'zala have invaded Ardenweald."],
			L["I would like you to have the supplies."],
		},
	},
	[165382] = { -- Gormsmith Cavina
		["g"] = {
			L["I would like you to have the supplies."],
		},
	},
	[165703] = { -- Elder Finnan
		["g"] = {
			L["I would like you to have the supplies."],
		},
	},
	[158345] = { -- Lady of the Falls
		["g"] = {
			L["I would like you to have the supplies."],
		},
	},
	[165704] = { -- Elder Gwenna
		["g"] = {
			L["I would like you to have the supplies."],
		},
	},
	[165705] = { -- Groonoomcrooek
		["g"] = {
			L["I would like you to have the supplies."],
		},
	},
	[158543] = { -- Attendant Sparkledew
		["g"] = {
			L["Attendant Sparkledew 1"],
		},
	},
	[160121] = { -- Master Sha'lor
		["g"] = {
			L["Master Sha'lor 1"],
		},
	},
	[165550] = { -- Attendant Shimmerwing
		["g"] = {
			L["Attendant Shimmerwing 1"],
		},
	},
	[169273] = { -- Silkstrider Caretaker
		["g"] = {
			L["Silkstrider Caretaker 1"],
		},
	},
	[172431] = { -- Lady Moonberry
		["g"] = {
			L["Lady Moonberry 1"],
		},
	},
	[172185] = { -- Zayhad, The Builder
		["g"] = {
			L["Zayhad, The Builder 1"],
			L["Zayhad, The Builder 2"],
		},
	},
	-- Shadowlands: Revendreth
	[167838] = { -- Globknob
		["g"] = {
			L["Quest"],
		},
	},
	[167918] = { -- Bela
		["g"] = {
			L["Quest"],
		},
	},
	[167849] = { -- Soul of Keltesh
		["g"] = {
			L["Quest"],
		},
	},
	[156295] = { -- Courier Rokalai
		["g"] = {
			L["Quest"],
		},
	},
	[168237] = { -- Ilka
		["g"] = {
			L["<Present Lajos's invitation>"],
		},
	},
	[168238] = { -- Samu
		["g"] = {
			L["<Present Lajos's invitation>"],
		},
	},
	[159883] = { -- Chancellor Codrin
		["g"] = {
			L["Chancellor Codrin 1"],
		},
	},
	[159946] = { -- The Countess
		["g"] = {
			L["The Countess 1"],
		},
	},
	[160941] = { -- The Curator
		["g"] = {
			L["The Curator 1"],
		},
	},
	[161056] = { -- Guard Captain Elizabeta
		["g"] = {
			L["Guard Captain Elizabeta 1"],
		},
	},
	[165662] = { -- The Countess
		["g"] = {
			L["The Countess 2"],
		},
	},
	[166541] = { -- Cobwobble
		["g"] = {
			L["Cobwobble 1"],
			L["Cobwobble 2"],
		},
	},
	[166542] = { -- Slobwobble
		["g"] = {
			L["Slobwobble 1"],
			L["Slobwobble 2"],
		},
	},
	[166543] = { -- Dobwobble
		["g"] = {
			L["Dobwobble 1"],
			L["Dobwobble 2"],
		},
	},
	[169238] = { -- Courier Araak
		["g"] = {
			L["Courier Araak 1"],
			L["Courier Araak 2"],
		},
	},
	[165921] = { -- Courier Araak
		["g"] = {
			L["Courier Araak 2"],
		},
	},
	[169917] = { -- Avowed Ritualist
		["g"] = {
			L["Avowed Ritualist 1"],
		},
	},
	[169865] = { -- Treasure Guardian
		["g"] = {
			L["Treasure Guardian 1"],
			L["Treasure Guardian 2"],
		},
	},
	-- Shadowlands: Korthia
	[178257] = { -- Archivist Roh-Suir
		["g"] = {
			L["Archivist Roh-Suir 1"],
		},
	},
	-- Shadowlands: Heart of the Forest (Covenant Sanctum)
	[156634] = { -- Winter Queen
		["g"] = {
			L["Winter Queen 1"],
		},
	},
	[172886] = { -- Mask of Bwonsamdi
		["g"] = {
			L["Mask of Bwonsamdi 1"],
		},
	},
	-- Instance: De Other Side
	[166281] = { -- Bwonsamdi
		["g"] = {
			L["Bwonsamdi 1"],
		},
	},
	-- Instance: Mogu'shan Vaults
	[61348] = { -- Lorewalker Cho
		["g"] = {
			L["Lorewalker Cho 1"],
			L["Lorewalker Cho 2"],
		},
	},
	-- Instance: Isle of Thunder (Scenario)
	[69565] = { -- Scout Captain Elsia
		["g"] = {
			L["Scout Captain Elsia 1"],
		},
	},
	[69810] = { -- Taoshi
		["g"] = {
			L["Taoshi 1"],
		},
	},
	[70297] = { -- Taoshi
		["g"] = {
			L["Taoshi 2"],
		},
	},
	-- Instance: Horrific Visions
	[152993] = { -- Garona Halforcen (Vision of Orgrimmar)
		["g"] = {
			L["Garona Halforcen 1"],
		},
	},
	[160998] = { -- Altar of the Daredevil
		["g"] = {
			L["Altar of the Daredevil 1"],
		},
	},
	[160961] = { -- Altar of the Dark Imagination
		["g"] = {
			L["Altar of the Dark Imagination 1"],
		},
	},
	[161000] = { -- Altar of the Pained
		["g"] = {
			L["Altar of the Pained 1"],
		},
	},
	[160967] = { -- Altar of the Burned Bridge
		["g"] = {
			L["Altar of the Burned Bridge 1"],
		},
	},
	[160999] = { -- Altar of the Long Night
		["g"] = {
			L["Altar of the Long Night 1"],
		},
	},
}

e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_CONFIRM" then
		local _, message = ...
		if HelpMePlayOptionsDB.Dialog == false then return end
		local index = 1
		local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
		if unitGUID then
			local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
			for id, _ in pairs(creatures) do
				-- First check to see if the General NPC options contain the
				-- confirmation message before scanning the specific NPC.
				for i = 1, 2 do
					for j = 1, #creatures[i]["c"] do
						-- First try to find the substring using string.find.
						-- If that doesn't work, then try a literal match.
						if string.find(string.lower(message), string.lower(creatures[i]["c"][j])) then
							StaticPopup1Button1:Click()
							return
						end
						if string.lower(message) == string.lower(creatures[i]["c"][j]) then
							StaticPopup1Button1:Click()
							return
						end
					end
				end
				if id == npcId then
					for i = 1, #creatures[id]["c"] do
						if string.find(string.lower(message), string.lower(creatures[id]["c"][i])) then
							StaticPopup1Button1:Click()
							return
						end
					end
				end
			end
		end
	end
	if event == "GOSSIP_SHOW" then
		if HelpMePlayOptionsDB.Dialog == false then return end
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
		local gossipOptions = C_GossipInfo.GetOptions()
		if unitGUID then
			local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
			for index, gossipOptionsSubTable in ipairs(gossipOptions) do
				-- These are player submitted dialogs using the Dialog command.
				for id, gossip in ipairs(HelpMePlayPlayerDialogDB) do
					if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(gossip)) then
						C_GossipInfo.SelectOption(index)
						return
					end
				end
				-- These are general NPC dialogs. These are not directly associated
				-- with a specific NPC.
				for i = 1, 2 do
					for j = 1, #creatures[i]["g"] do
						if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(creatures[i]["g"][j])) then
							C_GossipInfo.SelectOption(index)
							return
						end
					end
				end
				for id, _ in pairs(creatures) do
					if id == npcId then -- The target's ID is in the table, so use its configuration.
						for i = 1, #creatures[id]["g"] do
							if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(creatures[id]["g"][i])) then
								C_GossipInfo.SelectOption(index)
								return
							end
						end
					end
				end
			end
		else
			for index, gossipOptionsSubTable in ipairs(gossipOptions) do
				for i = 1, 2 do
					for j = 1, #creatures[i]["g"] do
						if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(creatures[i]["g"][j])) then
							C_GossipInfo.SelectOption(index)
						end
					end
				end
			end
		end
	end
end)