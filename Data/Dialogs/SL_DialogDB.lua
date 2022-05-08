local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_SL = {
	-- Supported Maps: 1409 (Exile's Reach), 1550 (The Shadowlands)
	-- No Map Association
	[169501] = { -- Shadowlands Wormhole
		["g"] = {
			{
				["text"] 		= L_DIALOG["Wormhole: Revendreth, Court of the Venthyr"],
				["condition"] 	= "level_equal",
				["level"] 		= 51,
				["index"]		= 5,
			},
			{
				["text"] 		= L_DIALOG["Wormhole: Ardenweald, Forest of the Night Fae"],
				["condition"] 	= "level_equal",
				["level"] 		= 54,
				["index"]		= 4,
			},
			{
				["text"] 		= L_DIALOG["Wormhole: Maldraxxus, Citadel of the Necrolords"],
				["condition"] 	= "level_equal",
				["level"] 		= 57,
				["index"]		= 3,
			},
			{
				["text"] 		= L_DIALOG["Wormhole: Bastion, Home of the Kyrian"],
				["condition"] 	= "level_equal",
				["level"] 		= 59,
				["index"]		= 2,
			},
		},
	},
	-- Oribos
	[0] = {
		["g"] = {
			{
				["text"] 		= L_DIALOG["Ancient Translocator 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Repository Console 1"],
				["condition"] 	= "none",
			},
		},
	},
	[159478] = { -- Tal-Inara
		["g"] = {
			{
				["text"] 		= L_DIALOG["Tal-Inara 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Tal-Inara 2"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Tal-Inara 3"],
				["condition"] 	= "none",
			},
		},
		["c"] = {
			{
				["text"]		= L_DIALOG["Are you sure?"],
				["condition"]	= "none",
			},
		},
	},
	[164079] = { -- Highlord Bolvar Fordragon
		["g"] = {
			{
				["text"] 		= L_DIALOG["Highlord Bolvar Fordragon 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Highlord Bolvar Fordragon 2"],
				["condition"] 	= "none",
			},
		},
		["c"] = {
			{
				["text"] 		= L_DIALOG["Are you sure?"],
				["condition"] 	= "none",
			},
		},
	},
	[177136] = { -- Polemarch Adrestes
		["g"] = {
			{
				["text"] 		= L_DIALOG["Polemarch Adrestes 1"],
				["condition"] 	= "none",
			},
		},
	},
	[168432] = { -- Ve'rayn
		["g"] = {
			{
				["text"] 		= L_DIALOG["Ve'rayn 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Ve'rayn 2"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Ve'rayn 3"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Ve'rayn 4"],
				["condition"] 	= "none",
			},
		},
	},
	[174871] = { -- Fatescribe Roh-Tahl
		["g"] = {
			{
				["text"] 		= L_DIALOG["Fatescribe Roh-Tahl 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Oribos
	-- Bastion
	[168742] = { -- Polemarch Adrestes
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am."],
				["condition"] 	= "none",
			},
		},
	},
	[168906] = { -- Polemarch Adrestes
		["g"] = {
			{
				["text"] 		= L_DIALOG["I'm ready."],
				["condition"] 	= "none",
			},
		},
	},
	[156327] = { -- Voitha
		["g"] = {
			{
				["text"] 		= L_DIALOG["Voitha 1"],
				["condition"] 	= "none",
			},
		},
	},
	[157696] = { -- Nemea
		["g"] = {
			{
				["text"] 		= L_DIALOG["Nemea 1"],
				["condition"] 	= "none",
			},
		},
		["c"] = {
			{
				["text"] 		= L_DIALOG["Nemea 2"],
				["condition"] 	= "none",
			},
		},
	},
	[158765] = { -- Pelodis
		["g"] = {
			{
				["text"] 		= L_DIALOG["Pelodis 1"],
				["condition"] 	= "none",
			},
		},
	},
	[159277] = { -- Aspirant Leda
		["g"] = {
			{
				["text"] 		= L_DIALOG["Aspirant Leda 1"],
				["condition"] 	= "none",
			},
		},
	},
	[159278] = { -- Aspirant Ikaran
		["g"] = {
			{
				["text"] 		= L_DIALOG["Aspirant Ikaran 1"],
				["condition"] 	= "none",
			},
		},
	},
	[169022] = { -- Helpful Steward
		["g"] = {
			{
				["text"] 		= L_DIALOG["Helpful Steward 1"],
				["condition"] 	= "none",
			},
		},
	},
	[169023] = { -- Helpful Steward
		["g"] = {
			{
				["text"] 		= L_DIALOG["Helpful Steward 1"],
				["condition"] 	= "none",
			},
		},
	},
	[169024] = { -- Helpful Steward
		["g"] = {
			{
				["text"] 		= L_DIALOG["Helpful Steward 1"],
				["condition"] 	= "none",
			},
		},
	},
	[169025] = { -- Helpful Steward
		["g"] = {
			{
				["text"] 		= L_DIALOG["Helpful Steward 1"],
				["condition"] 	= "none",
			},
		},
	},
	[169026] = { -- Helpful Steward
		["g"] = {
			{
				["text"] 		= L_DIALOG["Helpful Steward 1"],
				["condition"] 	= "none",
			},
		},
	},
	[169027] = { -- Helpful Steward
		["g"] = {
			{
				["text"] 		= L_DIALOG["Helpful Steward 1"],
				["condition"] 	= "none",
			},
		},
	},
	[169077] = { -- Helpful Steward
		["g"] = {
			{
				["text"] 		= L_DIALOG["Helpful Steward 2"],
				["condition"] 	= "none",
			},
		},
	},
	[169078] = { -- Helpful Steward
		["g"] = {
			{
				["text"] 		= L_DIALOG["Helpful Steward 2"],
				["condition"] 	= "none",
			},
		},
	},
	[169079] = { -- Helpful Steward
		["g"] = {
			{
				["text"] 		= L_DIALOG["Helpful Steward 2"],
				["condition"] 	= "none",
			},
		},
	},
	[169080] = { -- Helpful Steward
		["g"] = {
			{
				["text"] 		= L_DIALOG["Helpful Steward 2"],
				["condition"] 	= "none",
			},
		},
	},
	[169081] = { -- Helpful Steward
		["g"] = {
			{
				["text"] 		= L_DIALOG["Helpful Steward 2"],
				["condition"] 	= "none",
			},
		},
	},
	[169082] = { -- Helpful Steward
		["g"] = {
			{
				["text"] 		= L_DIALOG["Helpful Steward 2"],
				["condition"] 	= "none",
			},
		},
	},
	[172714] = { -- Trapped Caretaker
		["g"] = {
			{
				["text"] 		= L_DIALOG["Trapped Caretaker 1"],
				["condition"] 	= "none",
			},
		},
	},
	[161279] = { -- Sparring Aspirant
		["g"] = {
			{
				["text"] 		= L_DIALOG["Sparring Aspirant 1"],
				["condition"] 	= "none",
			},
		},
	},
	[159504] = { -- Sparring Aspirant
		["g"] = {
			{
				["text"] 		= L_DIALOG["Sparring Aspirant 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Sparring Aspirant 2"],
				["condition"] 	= "none",
			},
		},
	},
	[159505] = { -- Sparring Aspirant
		["g"] = {
			{
				["text"] 		= L_DIALOG["Sparring Aspirant 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Sparring Aspirant 2"],
				["condition"] 	= "none",
			},
		},
	},
	[171834] = { -- Aspirant Thetes
		["g"] = {
			{
				["text"] 		= L_DIALOG["Aspirant Thetes 1"],
				["condition"] 	= "none",
			},
		},
	},
	[181286] = { -- Sylvanas Windrunner
		["g"] = {
			{
				["text"] 		= L_DIALOG["Sylvanas Windrunner 1"],
				["condition"] 	= "none",
			},
		},
	},
	[160037] = { -- Polemarch Adrestes
		["g"] = {
			{
				["text"] 		= L_DIALOG["I know my way around the Sanctum."],
				["condition"] 	= "none",
			},
		},
		["c"] = {
			{
				["text"] 		= L_DIALOG["Are you sure?"],
				["condition"] 	= "none",
			},
		},
	},
	[165412] = { -- Xandria
		["g"] = {
			{
				["text"] 		= L_DIALOG["I'm ready."],
				["condition"] 	= "none",
			},
		},
	},
	[165794] = { -- Xandria
		["g"] = {
			{
				["text"] 		= L_DIALOG["Xandria 2"],
				["condition"] 	= "none",
			},
		},
	},
	[162542] = { -- Kleia
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["I'm ready."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Kleia 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Kleia 2"],
				["condition"] 	= "none",
			},
		},
	},
	[163650] = { -- Kleia
		["g"] = {
			{
				["text"] 		= L_DIALOG["Let us soulbind."],
				["condition"] 	= "none",
			},
		},
	},
	[167716] = { -- Pelagos
		["g"] = {
			{
				["text"] 		= L_DIALOG["Pelagos 2"],
				["condition"] 	= "none",
			},
		},
	},
	[162556] = { -- Clora
		["g"] = {
			{
				["text"] 		= L_DIALOG["Clora 1"],
				["condition"] 	= "none",
			},
		},
	},
	[162557] = { -- Forgelite Sophone
		["g"] = {
			{
				["text"] 		= L_DIALOG["Forgelite Sophone 1"],
				["condition"] 	= "none",
			},
		},
	},
	[160280] = { -- Mikanikos
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Mikanikos 1"],
				["condition"] 	= "none",
			},
		},
	},
	[173860] = { -- Kalisthene
		["g"] = {
			{
				["text"] 		= L_DIALOG["Kalisthene 1"],
				["condition"] 	= "none",
			},
		},
	},
	[156361] = { -- Kleia
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Kleia 3"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Kleia 4"],
				["condition"] 	= "none",
			},
		},
	},
	[174497] = { -- Polemarch Adrestes
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[162889] = { -- Eridia
		["g"] = {
			{
				["text"] 		= L_DIALOG["Eridia 1"],
				["condition"] 	= "none",
			},
		},
	},
	[162904] = { -- Apolon
		["g"] = {
			{
				["text"] 		= L_DIALOG["Apolon 1"],
				["condition"] 	= "none",
			},
		},
	},
	[162888] = { -- Sika
		["g"] = {
			{
				["text"] 		= L_DIALOG["Sika 1"],
				["condition"] 	= "none",
			},
		},
	},
	[162907] = { -- Arios Riftbearer
		["g"] = {
			{
				["text"] 		= L_DIALOG["Arios Riftbearer 1"],
				["condition"] 	= "none",
			},
		},
	},
	[164473] = { -- Polemarch Adrestes
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am."],
				["condition"] 	= "none",
			},
		},
	},
	[166740] = { -- Mikanikos
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am."],
				["condition"] 	= "none",
			},
		},
	},
	[174503] = { -- Polemarch Adrestes
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[161637] = { -- Theotar
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[171147] = { -- General Draven
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Bastion
	-- Maldraxxus
	[165052] = { -- Vial Master Lurgy
		["g"] = {
			{
				["text"] 		= L_DIALOG["Is there any way I can help?"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["O.K."],
				["condition"] 	= "none",
			},
		},
	},
	[157313] = { -- Foul-Tongue Cyrlix
		["g"] = {
			{
				["text"] 		= L_DIALOG["Is there any way I can help?"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["O.K."],
				["condition"] 	= "none",
			},
		},
	},
	[157945] = { -- Boil Master Yetch
		["g"] = {
			{
				["text"] 		= L_DIALOG["Is there any way I can help?"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["O.K."],
				["condition"] 	= "none",
			},
		},
	},
	[159696] = { -- Rencissa the Dynamo
		["g"] = {
			{
				["text"] 		= L_DIALOG["Rencissa the Dynamo 1"],
				["condition"] 	= "none",
			},
		},
	},
	[159827] = { -- Scrapper Minoire
		["g"] = {
			{
				["text"] 		= L_DIALOG["Scrapper Minoire 1"],
				["condition"] 	= "none",
			},
		},
	},
	[160917] = { -- Grimshadow
		["g"] = {
			{
				["text"] 		= L_DIALOG["Grimshadow 1"],
				["condition"] 	= "none",
			},
		},
	},
	[161710] = { -- Marcel Mullby
		["g"] = {
			{
				["text"] 		= L_DIALOG["Marcel Mullby 1"],
				["condition"] 	= "none",
			},
		},
	},
	[165966] = { -- Khaliiq
		["g"] = {
			{
				["text"] 		= L_DIALOG["Khaliiq 1"],
				["condition"] 	= "none",
			},
		},
	},
	[166129] = { -- Specialist Entra
		["g"] = {
			{
				["text"] 		= L_DIALOG["Specialist Entra 1"],
				["condition"] 	= "none",
			},
		},
	},
	[166657] = { -- Ta'eran
		["g"] = {
			{
				["text"] 		= L_DIALOG["Ta'eran 1"],
				["condition"] 	= "none",
			},
		},
	},
	[171747] = { -- Project Lead Allen
		["g"] = {
			{
				["text"] 		= L_DIALOG["Project Lead Allen 1"],
				["condition"] 	= "none",
			},
		},
	},
	[172871] = { -- Taloned Flayedwing
		["g"] = {
			{
				["text"] 		= L_DIALOG["Taloned Flayedwing 1"],
				["condition"] 	= "none",
			},
		},
	},
	[159824] = { -- Gunn Gorgebone
		["g"] = {
			{
				["text"] 		= L_DIALOG["Is there anything you need?"],
				["condition"] 	= "none",
			},
		},
	},
	[159827] = { -- Scrapper Minoire
		["g"] = {
			{
				["text"] 		= L_DIALOG["Is there anything you need?"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Scrapper Minoire 1"],
				["condition"] 	= "none",
			},
		},
	},
	[159696] = { -- Rencissa the Dynamo
		["g"] = {
			{
				["text"] 		= L_DIALOG["Is there anything you need?"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Rencissa the Dynamo 1"],
				["condition"] 	= "none",
			},
		},
	},
	[163083] = { -- Valuator Malus
		["g"] = {
			{
				["text"] 		= L_DIALOG["Very well. Let us fight."],
				["condition"] 	= "none",
			},
		},
	},
	[163084] = { -- Tester Sahaari
		["g"] = {
			{
				["text"] 		= L_DIALOG["Very well. Let us fight."],
				["condition"] 	= "none",
			},
		},
	},
	[164492] = { -- Arena Spectator
		["g"] = {
			{
				["text"] 		= L_DIALOG["Au'narim claims you owe her anima."],
				["condition"] 	= "none",
			},
		},
	},
	[164507] = { -- Arena Spectator
		["g"] = {
			{
				["text"] 		= L_DIALOG["Au'narim claims you owe her anima."],
				["condition"] 	= "none",
			},
		},
	},
	[164508] = { -- Arena Spectator
		["g"] = {
			{
				["text"] 		= L_DIALOG["Au'narim claims you owe her anima."],
				["condition"] 	= "none",
			},
		},
	},
	[158453] = { -- Baroness Draka
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[165182] = { -- Baroness Draka
		["g"] = {
			{
				["text"] 		= L_DIALOG["I know my way around the Sanctum."],
				["condition"] 	= "none",
			},
		},
		["c"] = {
			{
				["text"] 		= L_DIALOG["Are you sure?"],
				["condition"] 	= "none",
			},
		},
	},
	[161985] = { -- Baroness Vashj
		["g"] = {
			{
				["text"] 		= L_DIALOG["Baroness Vashj 1"],
				["condition"] 	= "none",
			},
		},
	},
	[158604] = { -- Navigator Xennir
		["g"] = {
			{
				["text"] 		= L_DIALOG["Navigator Xennir 1"],
				["condition"] 	= "none",
			},
		},
	},
	[160518] = { -- Whisperer Vyn
		["g"] = {
			{
				["text"] 		= L_DIALOG["Whisperer Vyn 1"],
				["condition"] 	= "none",
			},
		},
	},
	[172566] = { -- Twigin
		["g"] = {
			{
				["text"] 		= L_DIALOG["I'm ready."],
				["condition"] 	= "none",
			},
		},
	},
	[172809] = { -- Twigin
		["g"] = {
			{
				["text"] 		= L_DIALOG["I'm ready."],
				["condition"] 	= "none",
			},
		},
	},
	[172901] = { -- Twigin
		["g"] = {
			{
				["text"] 		= L_DIALOG["I'm ready."],
				["condition"] 	= "none",
			},
		},
	},
	[172574] = { -- Navigator Xennir
		["g"] = {
			{
				["text"] 		= L_DIALOG["Navigator Xennir 2"],
				["condition"] 	= "none",
			},
		},
	},
	[168860] = { -- Kynthia
		["g"] = {
			{
				["text"] 		= L_DIALOG["Kynthia 1"],
				["condition"] 	= "none",
			},
		},
	},
	[166211] = { -- Alexandros Mograine
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[172002] = { -- Xandria
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[172923] = { -- Kel'Thuzad
		["g"] = {
			{
				["text"] 		= L_DIALOG["Kel'Thuzad 1"],
				["condition"] 	= "none",
			},
		},
	},
	[174179] = { -- Baroness Draka
		["g"] = {
			{
				["text"] 		= L_DIALOG["Baroness Draka 1"],
				["condition"] 	= "none",
			},
		},
	},
	[173523] = { -- General Draven
		["g"] = {
			{
				["text"] 		= L_DIALOG["General Draven 1"],
				["condition"] 	= "none",
			},
		},
	},
	[173222] = { -- Xandria
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Maldraxxus
	-- Ardenweald
	[171743] = { -- Dapperdew
		["g"] = {
			{
				["text"] 		= L_DIALOG["Dapperdew 1"],
				["condition"] 	= "none",
			},
		},
	},
	[157710] = { -- Cortinarius
		["g"] = {
			{
				["text"] 		= L_DIALOG["Cortinarius 1"],
				["condition"] 	= "none",
			},
		},
	},
	[160929] = { -- Guardian Molan
		["g"] = {
			{
				["text"] 		= L_DIALOG["The forces of Mueh'zala have invaded Ardenweald."],
				["condition"] 	= "none",
			},
		},
	},
	[158921] = { -- Guardian Kota
		["g"] = {
			{
				["text"] 		= L_DIALOG["The forces of Mueh'zala have invaded Ardenweald."],
				["condition"] 	= "none",
			},
		},
	},
	[158519] = { -- Sorcha
		["g"] = {
			{
				["text"] 		= L_DIALOG["The forces of Mueh'zala have invaded Ardenweald."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["I would like you to have the supplies."],
				["condition"] 	= "none",
			},
		},
	},
	[161785] = { -- Thiernax
		["g"] = {
			{
				["text"] 		= L_DIALOG["Thiernax 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Thiernax 2"],
				["condition"] 	= "none",
			},
		},
	},
	[165382] = { -- Gormsmith Cavina
		["g"] = {
			{
				["text"] 		= L_DIALOG["I would like you to have the supplies."],
				["condition"] 	= "none",
			},
		},
	},
	[165703] = { -- Elder Finnan
		["g"] = {
			{
				["text"] 		= L_DIALOG["I would like you to have the supplies."],
				["condition"] 	= "none",
			},
		},
	},
	[158345] = { -- Lady of the Falls
		["g"] = {
			{
				["text"] 		= L_DIALOG["I would like you to have the supplies."],
				["condition"] 	= "none",
			},
		},
	},
	[165704] = { -- Elder Gwenna
		["g"] = {
			{
				["text"] 		= L_DIALOG["I would like you to have the supplies."],
				["condition"] 	= "none",
			},
		},
	},
	[165705] = { -- Groonoomcrooek
		["g"] = {
			{
				["text"] 		= L_DIALOG["I would like you to have the supplies."],
				["condition"] 	= "none",
			},
		},
	},
	[158543] = { -- Attendant Sparkledew
		["g"] = {
			{
				["text"] 		= L_DIALOG["Attendant Sparkledew 1"],
				["condition"] 	= "none",
			},
		},
	},
	[160121] = { -- Master Sha'lor
		["g"] = {
			{
				["text"] 		= L_DIALOG["Master Sha'lor 1"],
				["condition"] 	= "none",
			},
		},
	},
	[158544] = { -- Lord Herne
		["g"] = {
			{
				["text"] 		= L_DIALOG["Lord Herne 2"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Lord Herne 3"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Lord Herne 4"],
				["condition"] 	= "none",
			},
		},
	},
	[165550] = { -- Attendant Shimmerwing
		["g"] = {
			{
				["text"] 		= L_DIALOG["Attendant Shimmerwing 1"],
				["condition"] 	= "none",
			},
		},
	},
	[169273] = { -- Silkstrider Caretaker
		["g"] = {
			{
				["text"] 		= L_DIALOG["Silkstrider Caretaker 1"],
				["condition"] 	= "none",
			},
		},
	},
	[161509] = { -- Lady Moonberry
		["g"] = {
			{
				["text"] 		= L_DIALOG["Lady Moonberry 3"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["I know my way around the Sanctum."],
				["condition"] 	= "none",
			},
		},
		["c"] = {
			{
				["text"] 		= L_DIALOG["Are you sure?"],
				["condition"] 	= "none",
			},
		},
	},
	[172431] = { -- Lady Moonberry
		["g"] = {
			{
				["text"] 		= L_DIALOG["Lady Moonberry 1"],
				["condition"] 	= "none",
			},
		},
	},
	[170705] = { -- Ara'lon
		["g"] = {
			{
				["text"] 		= L_DIALOG["Ara'lon 1"],
				["condition"] 	= "none",
			},
		},
	},
	[164023] = { -- Vesperbloom
		["g"] = {
			{
				["text"] 		= L_DIALOG["Vesperbloom 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Vesperbloom 2"],
				["condition"] 	= "none",
			},
		},
	},
	[172185] = { -- Zayhad, The Builder
		["g"] = {
			{
				["text"] 		= L_DIALOG["Zayhad, The Builder 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Zayhad, The Builder 2"],
				["condition"] 	= "none",
			},
		},
	},
	[156634] = { -- Winter Queen
		["g"] = {
			{
				["text"] 		= L_DIALOG["Winter Queen 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Winter Queen 2"],
				["condition"] 	= "none",
			},
		},
	},
	[166887] = { -- Winter Queen
		["g"] = {
			{
				["text"] 		= L_DIALOG["Winter Queen 3"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Winter Queen 4"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["I am ready to go."],
				["condition"] 	= "none",
			},
		},
	},
	[171992] = { -- Lady Moonberry
		["g"] = {
			{
				["text"] 		= L_DIALOG["Lady Moonberry 4"],
				["condition"] 	= "none",
			},
		},
	},
	[172091] = { -- Lord Herne
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[172886] = { -- Mask of Bwonsamdi
		["g"] = {
			{
				["text"] 		= L_DIALOG["Mask of Bwonsamdi 1"],
				["condition"] 	= "none",
			},
		},
	},
	[157949] = { -- Heartwood Grove Holdout
		["g"] = {
			{
				["text"] 		= L_DIALOG["Evacuate, now!"],
				["condition"] 	= "none",
			},
		},
	},
	[158006] = { -- Heartwood Grove Holdout
		["g"] = {
			{
				["text"] 		= L_DIALOG["Evacuate, now!"],
				["condition"] 	= "none",
			},
		},
	},
	[161354] = { -- Huln Highmountain
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[159427] = { -- Elder Finnan
		["g"] = {
			{
				["text"] 		= L_DIALOG["The Lady of the Falls wanted to make sure you were safe."],
				["condition"] 	= "none",
			},
		},
	},
	[159428] = { -- Groonoomcrooek
		["g"] = {
			{
				["text"] 		= L_DIALOG["The Lady of the Falls wanted to make sure you were safe."],
				["condition"] 	= "none",
			},
		},
	},
	[159465] = { -- Elder Gwenna
		["g"] = {
			{
				["text"] 		= L_DIALOG["The Lady of the Falls wanted to make sure you were safe."],
				["condition"] 	= "none",
			},
		},
	},
	[160262] = { -- Ysera
		["g"] = {
			{
				["text"] 		= L_DIALOG["Ysera 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["I'm ready."],
				["condition"] 	= "none",
			},
		},
	},
	[172677] = { -- Niya
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[165671] = { -- Pelagos
		["g"] = {
			{
				["text"] 		= L_DIALOG["Pelagos 3"],
				["condition"] 	= "none",
			},
		},
	},
	[165736] = { -- Lady Moonberry's Soap
		["g"] = {
			{
				["text"] 		= L_DIALOG["Lady Moonberry's Soap 1"],
				["condition"] 	= "none",
			},
		},
	},
	[162392] = { -- Willowblossom
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[163328] = { -- Pelagos
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Ardenweald
	-- Revendreth
	[167838] = { -- Globknob
		["g"] = {
			{
				["text"] 		= L_DIALOG["Quest"],
				["condition"] 	= "none",
			},
		},
	},
	[167918] = { -- Bela
		["g"] = {
			{
				["text"] 		= L_DIALOG["Quest"],
				["condition"] 	= "none",
			},
		},
	},
	[164420] = { -- Laurent
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[167849] = { -- Soul of Keltesh
		["g"] = {
			{
				["text"] 		= L_DIALOG["Quest"],
				["condition"] 	= "none",
			},
		},
	},
	[156295] = { -- Courier Rokalai
		["g"] = {
			{
				["text"] 		= L_DIALOG["Quest"],
				["condition"] 	= "none",
			},
		},
	},
	[168237] = { -- Ilka
		["g"] = {
			{
				["text"] 		= L_DIALOG["<Present Lajos's invitation>"],
				["condition"] 	= "none",
			},
		},
	},
	[168238] = { -- Samu
		["g"] = {
			{
				["text"] 		= L_DIALOG["<Present Lajos's invitation>"],
				["condition"] 	= "none",
			},
		},
	},
	[167717] = { -- Darkhaven Villager
		["g"] = {
			{
				["text"] 		= L_DIALOG["<Request tithe>"],
				["condition"] 	= "none",
			},
		},
	},
	[167744] = { -- Darkhaven Villager
		["g"] = {
			{
				["text"] 		= L_DIALOG["<Request tithe>"],
				["condition"] 	= "none",
			},
		},
	},
	[167746] = { -- Darkhaven Villager
		["g"] = {
			{
				["text"] 		= L_DIALOG["<Request tithe>"],
				["condition"] 	= "none",
			},
		},
	},
	[159883] = { -- Chancellor Codrin
		["g"] = {
			{
				["text"] 		= L_DIALOG["Chancellor Codrin 1"],
				["condition"] 	= "none",
			},
		},
	},
	[159946] = { -- The Countess
		["g"] = {
			{
				["text"] 		= L_DIALOG["The Countess 1"],
				["condition"] 	= "none",
			},
		},
	},
	[160941] = { -- The Curator
		["g"] = {
			{
				["text"] 		= L_DIALOG["The Curator 1"],
				["condition"] 	= "none",
			},
		},
	},
	[160163] = { -- The Accuser
		["g"] = {
			{
				["text"] 		= L_DIALOG["The Accuser 1"],
				["condition"] 	= "none",
			},
		},
	},
	[160233] = { -- The Accuser
		["g"] = {
			{
				["text"] 		= L_DIALOG["The Accuser 1"],
				["condition"] 	= "none",
			},
		},
	},
	[161056] = { -- Guard Captain Elizabeta
		["g"] = {
			{
				["text"] 		= L_DIALOG["Guard Captain Elizabeta 1"],
				["condition"] 	= "none",
			},
		},
	},
	[170291] = { -- Alchemist Leticia
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[160011] = { -- Lord Neculai
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[160002] = { -- Lord Vasile
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[160008] = { -- Lady Rodica
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[160006] = { -- Lady Andrada
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159981] = { -- Lady Ivona
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159978] = { -- Lady Ihrin
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159968] = { -- Lady Zina
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[160001] = { -- Duchess Yetta
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159973] = { -- Duke Mitica
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159966] = { -- Duke Grigore
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[160010] = { -- Duke Vlad
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[160004] = { -- Sir Vilhelm
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159967] = { -- Duchess Minodora
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159958] = { -- Madame Viviana
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[160005] = { -- Madame Irini
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[160003] = { -- Duke Omor
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159988] = { -- Madame Elenuta
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159988] = { -- Duke Mihas
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159972] = { -- Lord Ionel
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159982] = { -- Duchess Vanda
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[160000] = { -- Lady Lerae
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159997] = { -- Lord Razvan
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159965] = { -- Lord Sorin
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159977] = { -- Sir Geofri
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159986] = { -- Sir Vali
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159960] = { -- Duke Avram
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159961] = { -- Lord Silviu
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[160009] = { -- Madame Tassa
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159999] = { -- Madame Miriana
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159980] = { -- Madame Lenuta
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[160007] = { -- Duchess Silviana
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159898] = { -- Duchess Lacrima
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[159970] = { -- Duchess Odeta
		["g"] = {
			{
				["text"] 		= L_DIALOG["Are you enjoying yourself?"],
				["condition"] 	= "none",
			},
		},
	},
	[160956] = { -- Watcher Emil
		["g"] = {
			{
				["text"] 		= L_DIALOG["Let's go!"],
				["condition"] 	= "none",
			},
		},
	},
	[165662] = { -- The Countess
		["g"] = {
			{
				["text"] 		= L_DIALOG["<Deliver Prince Renathal's invitation.>"],
				["condition"] 	= "none",
			},
		},
	},
	[165866] = { -- The Stonewright
		["g"] = {
			{
				["text"] 		= L_DIALOG["<Deliver Prince Renathal's invitation.>"],
				["condition"] 	= "none",
			},
		},
	},
	[159650] = { -- Elena
		["g"] = {
			{
				["text"] 		= L_DIALOG["<Present the Offer of Employment.>"],
				["condition"] 	= "none",
			},
		},
	},
	[159651] = { -- Dumitra
		["g"] = {
			{
				["text"] 		= L_DIALOG["<Present the Offer of Employment.>"],
				["condition"] 	= "none",
			},
		},
	},
	[159652] = { -- Florin
		["g"] = {
			{
				["text"] 		= L_DIALOG["<Present the Offer of Employment.>"],
				["condition"] 	= "none",
			},
		},
	},
	[166541] = { -- Cobwobble
		["g"] = {
			{
				["text"] 		= L_DIALOG["Where does the Taskmaster keep the sinstones?"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["What are you all doing?"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Why are the ones with scribbles interesting?"],
				["condition"] 	= "none",
			},
		},
	},
	[166542] = { -- Slobwobble
		["g"] = {
			{
				["text"] 		= L_DIALOG["Where does the Taskmaster keep the sinstones?"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["What are you all doing?"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Why are the ones with scribbles interesting?"],
				["condition"] 	= "none",
			},
		},
	},
	[166543] = { -- Dobwobble
		["g"] = {
			{
				["text"] 		= L_DIALOG["Where does the Taskmaster keep the sinstones?"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["What are you all doing?"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Why are the ones with scribbles interesting?"],
				["condition"] 	= "none",
			},
		},
	},
	[169238] = { -- Courier Araak
		["g"] = {
			{
				["text"] 		= L_DIALOG["Courier Araak 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Courier Araak 2"],
				["condition"] 	= "none",
			},
		},
	},
	[165921] = { -- Courier Araak
		["g"] = {
			{
				["text"] 		= L_DIALOG["Courier Araak 2"],
				["condition"] 	= "none",
			},
		},
	},
	[169917] = { -- Avowed Ritualist
		["g"] = {
			{
				["text"] 		= L_DIALOG["Avowed Ritualist 1"],
				["condition"] 	= "none",
			},
		},
	},
	[169865] = { -- Treasure Guardian
		["g"] = {
			{
				["text"] 		= L_DIALOG["Treasure Guardian 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Treasure Guardian 2"],
				["condition"] 	= "none",
			},
		},
	},
	[165419] = { -- Grand Marshal Mudrag
		["g"] = {
			{
				["text"] 		= L_DIALOG["I'm ready."],
				["condition"] 	= "none",
			},
		},
	},
	[171934] = { -- Prince Renathal
		["g"] = {
			{
				["text"] 		= L_DIALOG["I know my way around the Sanctum."],
				["condition"] 	= "none",
			},
		},
		["c"] = {
			{
				["text"] 		= L_DIALOG["Are you sure?"],
				["condition"] 	= "none",
			},
		},
	},
	[161544] = { -- The Curator
		["g"] = {
			{
				["text"] 		= L_DIALOG["The Curator 2"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Curator 3"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[161553] = { -- Mindscorched Alwin
		["g"] = {
			{
				["text"] 		= L_DIALOG["Let's go."],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Revendreth
	-- The Maw
	[165918] = { -- Highlord Darion Mograine
		["g"] = {
			{
				["text"] 		= L_DIALOG["Highlord Darion Mograine 1"],
				["condition"] 	= "none",
			},
		},
	},
	[166980] = { -- Lady Jaina Proudmoore
		["g"] = {
			{
				["text"] 		= L_DIALOG["Lady Jaina Proudmoore 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Lady Jaina Proudmoore 2"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Lady Jaina Proudmoore 3"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Lady Jaina Proudmoore 4"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[168836] = { -- Shandris Feathermoon
		["g"] = {
			{
				["text"] 		= L_DIALOG["Shandris Feathermoon 1"],
				["condition"] 	= "none",
			},
		},
	},
	[178828] = { -- Lord Herne
		["g"] = {
			{
				["text"] 		= L_DIALOG["Lord Herne 1"],
				["condition"] 	= "none",
			},
		},
	},
	[178943] = { -- Lady Moonberry
		["g"] = {
			{
				["text"] 		= L_DIALOG["Lady Moonberry 2"],
				["condition"] 	= "none",
			},
		},
	},
	[179068] = { -- Orator Kloe
		["g"] = {
			{
				["text"] 		= L_DIALOG["Orator Kloe 1"],
				["condition"] 	= "none",
			},
		},
	},
	[178033] = { -- Gubbins
		["g"] = {
			{
				["text"] 		= L_DIALOG["Gubbins 1"],
				["condition"] 	= "none",
			},
		},
	},
	[177900] = { -- Xandria
		["g"] = {
			{
				["text"] 		= L_DIALOG["Xandria 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[178006] = { -- Prince Renathal
		["g"] = {
			{
				["text"] 		= L_DIALOG["Prince Renathal 1"],
				["condition"] 	= "none",
			},
		},
	},
	[162804] = { -- Ve'nari
		["g"] = {
			{
				["text"] 		= L_DIALOG["Quest"],
				["condition"] 	= "none",
			},
		},
	},
	[166280] = { -- Ashamane
		["g"] = {
			{
				["text"] 		= L_DIALOG["Ashamane 1"],
				["condition"] 	= "none",
			},
		},
	},
	[166315] = { -- Ashamane
		["g"] = {
			{
				["text"] 		= L_DIALOG["Ashamane 2"],
				["condition"] 	= "none",
			},
		},
	},
	[166461] = { -- Spirit of Vol'jin
		["g"] = {
			{
				["text"] 		= L_DIALOG["Spirit of Vol'jin 2"],
				["condition"] 	= "none",
			},
		},
	},
	[169625] = { -- Sinfall Executor
		["g"] = {
			{
				["text"] 		= L_DIALOG["Sinfall Executor 1"],
				["condition"] 	= "none",
			},
		},
	},
	[169627] = { -- Sinfall Executor
		["g"] = {
			{
				["text"] 		= L_DIALOG["Sinfall Executor 1"],
				["condition"] 	= "none",
			},
		},
	},
	[161158] = { -- The Accuser
		["g"] = {
			{
				["text"] 		= L_DIALOG["The Accuser 2"],
				["condition"] 	= "none",
			},
		},
	},
	[161278] = { -- The Accuser
		["g"] = {
			{
				["text"] 		= L_DIALOG["The Accuser 3"],
				["condition"] 	= "none",
			},
		},
	},
	[167689] = { -- Prince Renethal
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	-- End of The Maw
	-- Torghast
	[164937] = { -- Runecarver
		["g"] = {
			{
				["text"] 		= L_DIALOG["Runecarver 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Runecarver 2"],
				["condition"] 	= "none",
			},
		},
	},
	[175127] = { -- Wayfinder
		["g"] = {
			{
				["text"] 		= L_DIALOG["Wayfinder 1"],
				["condition"] 	= "none",
			},
		},
	},
	[175118] = { -- Shandris Feathermoon
		["g"] = {
			{
				["text"] 		= L_DIALOG["Quest"],
				["condition"] 	= "none",
			},
		},
	},
	[164334] = { -- Shandris Feathermoon
		["g"] = {
			{
				["text"] 		= L_DIALOG["Shandris Feathermoon 2"],
				["condition"] 	= "none",
			},
		},
	},
	[168979] = { -- Meatball
		["g"] = {
			{
				["text"] 		= L_DIALOG["Yes, I will help."],
				["condition"] 	= "none",
			},
		},
	},
	[167839] = { -- Partially-Infused Soul Remnant
		["g"] = {
			{
				["text"] 		= L_DIALOG["Partially-Infused Soul Remnant 1"],
				["condition"] 	= "none",
			},
		},
	},
	[166123] = { -- Indigo
		["g"] = {
			{
				["text"] 		= L_DIALOG["Yes, I will help."],
				["condition"] 	= "none",
			},
		},
	},
	[152418] = { -- Gallath
		["g"] = {
			{
				["text"] 		= L_DIALOG["Yes, I will help."],
				["condition"] 	= "none",
			},
		},
	},
	[166151] = { -- Moriaz the Red
		["g"] = {
			{
				["text"] 		= L_DIALOG["Yes, I will help."],
				["condition"] 	= "none",
			},
		},
	},
	[171920] = { -- Ayeleth
		["g"] = {
			{
				["text"] 		= L_DIALOG["Yes, I will help."],
				["condition"] 	= "none",
			},
		},
	},
	[171901] = { -- Kaletar
		["g"] = {
			{
				["text"] 		= L_DIALOG["I will free you."],
				["condition"] 	= "none",
			},
		},
	},
	[172264] = { -- Yira'lya
		["g"] = {
			{
				["text"] 		= L_DIALOG["I will free you."],
				["condition"] 	= "none",
			},
		},
	},
	[172261] = { -- Chalkyth
		["g"] = {
			{
				["text"] 		= L_DIALOG["Yes, I will help."],
				["condition"] 	= "none",
			},
		},
	},
	[157426] = { -- Indri the Treesinger
		["g"] = {
			{
				["text"] 		= L_DIALOG["Yes, I will help."],
				["condition"] 	= "none",
			},
		},
	},
	[178932] = { -- Ve'lor the Messenger
		["g"] = {
			{
				["text"] 		= L_DIALOG["Yes, I will help."],
				["condition"] 	= "none",
			},
		},
	},
	[166147] = { -- Calix
		["g"] = {
			{
				["text"] 		= L_DIALOG["Yes, I will help."],
				["condition"] 	= "none",
			},
		},
	},
	[157406] = { -- Renavyth
		["g"] = {
			{
				["text"] 		= L_DIALOG["I will assist you."],
				["condition"] 	= "none",
			},
		},
	},
	[166148] = { -- Sawn
		["g"] = {
			{
				["text"] 		= L_DIALOG["I will assist you."],
				["condition"] 	= "none",
			},
		},
	},
	[172244] = { -- Blisswing
		["g"] = {
			{
				["text"] 		= L_DIALOG["Yes, I will help."],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Torghast
	-- Zereth Mortis
	[0] = {
		["g"] = {
			{
				["text"] 		= L_DIALOG["Leave the Blooming Foundry."],
				["condition"] 	= "none",
			},
		},
	},
	[177486] = { -- Elder Kreth
		["g"] = {
			{
				["text"] 		= L_DIALOG["Elder Kreth 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Elder Kreth 2"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Elder Kreth 3"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Yes."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We need your assistance."],
				["condition"] 	= "none",
			},
		},
	},
	[185844] = { -- Knight of the Ebon Blade
		["g"] = {
			{
				["text"] 		= L_DIALOG["Bolvar requests your current report."],
				["condition"] 	= "none",
			},
		},
	},
	[185845] = { -- Knight of the Ebon Blade
		["g"] = {
			{
				["text"] 		= L_DIALOG["Bolvar requests your current report."],
				["condition"] 	= "none",
			},
		},
	},
	[185847] = { -- Knight of the Ebon Blade
		["g"] = {
			{
				["text"] 		= L_DIALOG["Bolvar requests your current report."],
				["condition"] 	= "none",
			},
		},
	},
	[180923] = { -- Varoun
		["g"] = {
			{
				["text"] 		= L_DIALOG["Varoun 1"],
				["condition"] 	= "none",
			},
		},
	},
	[180950] = { -- Avna
		["g"] = {
			{
				["text"] 		= L_DIALOG["Avna 1"],
				["condition"] 	= "none",
			},
		},
	},
	[180926] = { -- Custodian Kalir
		["g"] = {
			{
				["text"] 		= L_DIALOG["Custodian Kalir 1"],
				["condition"] 	= "none",
			},
		},
	},
	[183465] = { -- Alonis
		["g"] = {
			{
				["text"] 		= L_DIALOG["Your presence is requested immediately at Provis Terra."],
				["condition"] 	= "none",
			},
		},
	},
	[183455] = { -- Huntress Laikeer
		["g"] = {
			{
				["text"] 		= L_DIALOG["Your presence is requested immediately at Provis Terra."],
				["condition"] 	= "none",
			},
		},
	},
	[183458] = { -- Ava'zer
		["g"] = {
			{
				["text"] 		= L_DIALOG["Your presence is requested immediately at Provis Terra."],
				["condition"] 	= "none",
			},
		},
	},
	[183724] = { -- Lady Jaina Proudmoore
		["g"] = {
			{
				["text"] 		= L_DIALOG["I'm ready."],
				["condition"] 	= "none",
			},
		},
	},
	[182346] = { -- Tamra
		["g"] = {
			{
				["text"] 		= L_DIALOG["Tamra 1"],
				["condition"] 	= "none",
			},
		},
	},
	[177958] = { -- Firim
		["g"] = {
			{
				["text"] 		= L_DIALOG["Firim 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Firim 2"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Firim 3"],
				["condition"] 	= "none",
			},
		},
	},
	[181706] = { -- Pocopoc
		["g"] = {
			{
				["text"] 		= L_DIALOG["Pocopoc 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Pocopoc 2"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Pocopoc 3"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Pocopoc 4"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Pocopoc 5"],
				["condition"] 	= "none",
			},
		},
	},
	[181183] = { -- Highlord Bolvar Fordragon
		["g"] = {
			{
				["text"] 		= L_DIALOG["Highlord Bolvar Fordragon 4"],
				["condition"] 	= "none",
			},
		},
	},
	[183677] = { -- Uther the Lightbringer
		["g"] = {
			{
				["text"] 		= L_DIALOG["Tell me what happened."],
				["condition"] 	= "none",
			},
		},
	},
	[178015] = { -- Elder Zoor
		["g"] = {
			{
				["text"] 		= L_DIALOG["We need your assistance."],
				["condition"] 	= "none",
			},
		},
	},
	[178016] = { -- Elder Ara
		["g"] = {
			{
				["text"] 		= L_DIALOG["We need your assistance."],
				["condition"] 	= "none",
			},
		},
	},
	[181179] = { -- Elder Nirav
		["g"] = {
			{
				["text"] 		= L_DIALOG["I need to restore these remnants."],
				["condition"] 	= "none",
			},
		},
	},
	[183298] = { -- Faruu
		["g"] = {
			{
				["text"] 		= L_DIALOG["I need to restore these remnants."],
				["condition"] 	= "none",
			},
		},
	},
	[181084] = { -- Drim
		["g"] = {
			{
				["text"] 		= L_DIALOG["I need to restore these remnants."],
				["condition"] 	= "none",
			},
		},
	},
	[184442] = { -- Feroz
		["g"] = {
			{
				["text"] 		= L_DIALOG["Feroz 1"],
				["condition"] 	= "none",
			},
		},
	},
	[184153] = { -- Elder Ara
		["g"] = {
			{
				["text"] 		= L_DIALOG["Let's begin."],
				["condition"] 	= "none",
			},
		},
	},
	[177456] = { -- Anduin Wrynn
		["g"] = {
			{
				["text"] 		= L_DIALOG["Tell me what happened."],
				["condition"] 	= "none",
			},
		},
	},
	[181229] = { -- Highlord Bolvar Fordragon
		["g"] = {
			{
				["text"] 		= L_DIALOG["Highlord Bolvar Fordragon 3"],
				["condition"] 	= "none",
			},
		},
	},
	[181229] = { -- Saezurah
		["g"] = {
			{
				["text"] 		= L_DIALOG["Saezurah 1"],
				["condition"] 	= "none",
			},
		},
	},
	[181738] = { -- Nadjia the Mistblade
		["g"] = {
			{
				["text"] 		= L_DIALOG["Nadjia the Mistblade 1"],
				["condition"] 	= "none",
			},
		},
	},
	[181740] = { -- Droman Aliothe
		["g"] = {
			{
				["text"] 		= L_DIALOG["Will you bring your forces to fight with us?"],
				["condition"] 	= "none",
			},
		},
	},
	[181739] = { -- Secutor Mevix
		["g"] = {
			{
				["text"] 		= L_DIALOG["Will you bring your forces to fight with us?"],
				["condition"] 	= "none",
			},
		},
	},
	[180965] = { -- Firim
		["g"] = {
			{
				["text"] 		= L_DIALOG["Firim 4"],
				["condition"] 	= "none",
			},
		},
	},
	[180942] = { -- Saezurah
		["g"] = {
			{
				["text"] 		= L_DIALOG["Saezurah 2"],
				["condition"] 	= "none",
			},
		},
	},
	[181892] = { -- Vessel
		["g"] = {
			{
				["text"] 		= L_DIALOG["Vessel 1"],
				["condition"] 	= "none",
			},
		},
	},
	[183693] = { -- Automa Scryer
		["g"] = {
			{
				["text"] 		= L_DIALOG["Examine the Automa."],
				["condition"] 	= "none",
			},
		},
	},
	[183703] = { -- Automa Scryer
		["g"] = {
			{
				["text"] 		= L_DIALOG["Examine the Automa."],
				["condition"] 	= "none",
			},
		},
	},
	[183692] = { -- Automa Scryer
		["g"] = {
			{
				["text"] 		= L_DIALOG["Examine the Automa."],
				["condition"] 	= "none",
			},
		},
	},
	[183694] = { -- Automa Scryer
		["g"] = {
			{
				["text"] 		= L_DIALOG["Examine the Automa."],
				["condition"] 	= "none",
			},
		},
	},
	[180914] = { -- Pelagos
		["g"] = {
			{
				["text"] 		= L_DIALOG["Pelagos 1"],
				["condition"] 	= "none",
			},
		},
	},
	[181098] = { -- Olea Pau
		["g"] = {
			{
				["text"] 		= L_DIALOG["It is not safe here."],
				["condition"] 	= "none",
			},
		},
	},
	[180919] = { -- Olea Novi
		["g"] = {
			{
				["text"] 		= L_DIALOG["It is not safe here."],
				["condition"] 	= "none",
			},
		},
	},
	[183962] = { -- Olea Manu
		["g"] = {
			{
				["text"] 		= L_DIALOG["It is not safe here."],
				["condition"] 	= "none",
			},
		},
	},
	[184469] = { -- Hanoa the Exile
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[182146] = { -- Olem
		["g"] = {
			{
				["text"] 		= L_DIALOG["Olem 1"],
				["condition"] 	= "none",
			},
		},
	},
	[181990] = { -- Sequence Generator
		["g"] = {
			{
				["text"] 		= L_DIALOG["Sequence Generator 1"],
				["condition"] 	= "none",
			},
		},
	},
	[181948] = { -- Highlord Bolvar Fordragon
		["g"] = {
			{
				["text"] 		= L_DIALOG["Highlord Bolvar Fordragon 5"],
				["condition"] 	= "none",
			},
		},
	},
	[180610] = { -- Kodah
		["g"] = {
			{
				["text"] 		= L_DIALOG["Let's do this!"],
				["condition"] 	= "none",
			},
		},
	},
	[184938] = { -- Saezurah
		["g"] = {
			{
				["text"] 		= L_DIALOG["Saezurah 1"],
				["condition"] 	= "none",
			},
		},
	},
	[180965] = { -- Firim
		["g"] = {
			{
				["text"] 		= L_DIALOG["Firim 4"],
				["condition"] 	= "none",
			},
		},
	},
	[181059] = { -- Vessel
		["g"] = {
			{
				["text"] 		= L_DIALOG["Vessel 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Zereth Mortis
	-- Exile's Reach
	[167179] = { -- Daelya Twilightsbane
		["g"] = {
			{
				["text"] 		= L_DIALOG["Daelya Twilightsbane 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Daelya Twilightsbane 2"],
				["condition"] 	= "none",
			},
		},
	},
	[153211] = { -- Meredy Huntswell
		["g"] = {
			{
				["text"] 		= L_DIALOG["Meredy Huntswell 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["I'll fight the harpies that come."],
				["condition"] 	= "none",
			},
		},
	},
	[156943] = { -- Meredy Huntswell
		["g"] = {
			{
				["text"] 		= L_DIALOG["Meredy Huntswell 1"],
				["condition"] 	= "none",
			},
		},
	},
	[167298] = { -- Herbert Gloomburst
		["g"] = {
			{
				["text"] 		= L_DIALOG["I'll fight the harpies that come."],
				["condition"] 	= "none",
			},
		},
	},
	[167309] = { -- Herbert Gloomburst
		["g"] = {
			{
				["text"] 		= L_DIALOG["Herbert Gloomburst 1"],
				["condition"] 	= "none",
			},
		},
	},
	[161350] = { -- Captain Garrick
		["g"] = {
			{
				["text"] 		= L_DIALOG["Captain Garrick 1"],
				["condition"] 	= "none",
			},
		},
	},
	[167663] = { -- Warlord Breka Grimaxe
		["g"] = {
			{
				["text"] 		= L_DIALOG["Warlord Breka Grimaxe 1"],
				["condition"] 	= "none",
			},
		},
	},
	[162972] = { -- Coulston Nereus
		["g"] = {
			{
				["text"] 		= L_DIALOG["I'm in."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Got it."],
				["condition"] 	= "none",
			},
		},
	},
	[164835] = { -- Kee-La
		["g"] = {
			{
				["text"] 		= L_DIALOG["I'm ready."],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Exile's Reach
	-- De Other Side (Dungeon)
	[166281] = { -- Bwonsamdi
		["g"] = {
			{
				["text"] 		= L_DIALOG["Bwonsamdi 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of De Other Side (Dungeon)
}

addonTable.DIALOG_SL = DIALOG_SL