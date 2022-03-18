local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_SL = {
	-- Supported Maps: 1409 (Exile's Reach), 1550 (The Shadowlands)
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
				["text"] 		= 			L_DIALOG["Aspirant Thetes 1"],
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
			L_DIALOG["Quest"],
		},
	},
	[167918] = { -- Bela
		["g"] = {
			L_DIALOG["Quest"],
		},
	},
	[164420] = { -- Laurent
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[167849] = { -- Soul of Keltesh
		["g"] = {
			L_DIALOG["Quest"],
		},
	},
	[156295] = { -- Courier Rokalai
		["g"] = {
			L_DIALOG["Quest"],
		},
	},
	[168237] = { -- Ilka
		["g"] = {
			L_DIALOG["<Present Lajos's invitation>"],
		},
	},
	[168238] = { -- Samu
		["g"] = {
			L_DIALOG["<Present Lajos's invitation>"],
		},
	},
	[167717] = { -- Darkhaven Villager
		["g"] = {
			L_DIALOG["<Request tithe>"],
		},
	},
	[167744] = { -- Darkhaven Villager
		["g"] = {
			L_DIALOG["<Request tithe>"],
		},
	},
	[167746] = { -- Darkhaven Villager
		["g"] = {
			L_DIALOG["<Request tithe>"],
		},
	},
	[156291] = { -- Shadowrider Neralva
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[156234] = { -- Horrormaster Damnik
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[159883] = { -- Chancellor Codrin
		["g"] = {
			L_DIALOG["Chancellor Codrin 1"],
		},
	},
	[173324] = { -- Eyegor
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[159946] = { -- The Countess
		["g"] = {
			L_DIALOG["The Countess 1"],
		},
	},
	[160941] = { -- The Curator
		["g"] = {
			L_DIALOG["The Curator 1"],
		},
	},
	[160163] = { -- The Accuser
		["g"] = {
			L_DIALOG["The Accuser 1"],
		},
	},
	[160233] = { -- The Accuser
		["g"] = {
			L_DIALOG["The Accuser 1"],
		},
	},
	[161056] = { -- Guard Captain Elizabeta
		["g"] = {
			L_DIALOG["Guard Captain Elizabeta 1"],
		},
	},
	[170291] = { -- Alchemist Leticia
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[160011] = { -- Lord Neculai
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[160002] = { -- Lord Vasile
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[160008] = { -- Lady Rodica
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[160006] = { -- Lady Andrada
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159981] = { -- Lady Ivona
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159978] = { -- Lady Ihrin
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159968] = { -- Lady Zina
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[160001] = { -- Duchess Yetta
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159973] = { -- Duke Mitica
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159966] = { -- Duke Grigore
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[160010] = { -- Duke Vlad
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[160004] = { -- Sir Vilhelm
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159967] = { -- Duchess Minodora
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159958] = { -- Madame Viviana
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[160005] = { -- Madame Irini
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[160003] = { -- Duke Omor
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159988] = { -- Madame Elenuta
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159988] = { -- Duke Mihas
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159972] = { -- Lord Ionel
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159982] = { -- Duchess Vanda
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[160000] = { -- Lady Lerae
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159997] = { -- Lord Razvan
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159965] = { -- Lord Sorin
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159977] = { -- Sir Geofri
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159986] = { -- Sir Vali
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159960] = { -- Duke Avram
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159961] = { -- Lord Silviu
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[160009] = { -- Madame Tassa
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159999] = { -- Madame Miriana
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159980] = { -- Madame Lenuta
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[160007] = { -- Duchess Silviana
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159898] = { -- Duchess Lacrima
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[159970] = { -- Duchess Odeta
		["g"] = {
			L_DIALOG["Are you enjoying yourself?"],
		},
	},
	[160956] = { -- Watcher Emil
		["g"] = {
			L_DIALOG["Let's go!"],
		},
	},
	[165662] = { -- The Countess
		["g"] = {
			L_DIALOG["<Deliver Prince Renathal's invitation.>"],
		},
	},
	[165866] = { -- The Stonewright
		["g"] = {
			L_DIALOG["<Deliver Prince Renathal's invitation.>"],
		},
	},
	[159650] = { -- Elena
		["g"] = {
			L_DIALOG["<Present the Offer of Employment.>"],
		},
	},
	[159651] = { -- Dumitra
		["g"] = {
			L_DIALOG["<Present the Offer of Employment.>"],
		},
	},
	[159652] = { -- Florin
		["g"] = {
			L_DIALOG["<Present the Offer of Employment.>"],
		},
	},
	[166541] = { -- Cobwobble
		["g"] = {
			L_DIALOG["Where does the Taskmaster keep the sinstones?"],
			L_DIALOG["What are you all doing?"],
			L_DIALOG["Why are the ones with scribbles interesting?"],
		},
	},
	[166542] = { -- Slobwobble
		["g"] = {
			L_DIALOG["Where does the Taskmaster keep the sinstones?"],
			L_DIALOG["What are you all doing?"],
			L_DIALOG["Why are the ones with scribbles interesting?"],
		},
	},
	[166543] = { -- Dobwobble
		["g"] = {
			L_DIALOG["Where does the Taskmaster keep the sinstones?"],
			L_DIALOG["What are you all doing?"],
			L_DIALOG["Why are the ones with scribbles interesting?"],
		},
	},
	[169238] = { -- Courier Araak
		["g"] = {
			L_DIALOG["Courier Araak 1"],
			L_DIALOG["Courier Araak 2"],
		},
	},
	[165921] = { -- Courier Araak
		["g"] = {
			L_DIALOG["Courier Araak 2"],
		},
	},
	[169917] = { -- Avowed Ritualist
		["g"] = {
			L_DIALOG["Avowed Ritualist 1"],
		},
	},
	[169865] = { -- Treasure Guardian
		["g"] = {
			L_DIALOG["Treasure Guardian 1"],
			L_DIALOG["Treasure Guardian 2"],
		},
	},
	[165419] = { -- Grand Marshal Mudrag
		["g"] = {
			L_DIALOG["I'm ready."],
		},
	},
	[173331] = { -- Addius the Tormentor
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[163163] = { -- Ogburn
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[166092] = { -- Rasvan
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[171934] = { -- Prince Renathal
		["g"] = {
			L_DIALOG["I know my way around the Sanctum."],
		},
		["c"] = {
			L_DIALOG["Are you sure?"],
		},
	},
	[161544] = { -- The Curator
		["g"] = {
			L_DIALOG["The Curator 2"],
			L_DIALOG["The Curator 3"],
			L_DIALOG["I am ready."],
		},
	},
	[161553] = { -- Mindscorched Alwin
		["g"] = {
			L_DIALOG["Let's go."],
		},
	},
	-- End of Revendreth
	-- The Maw
	[165918] = { -- Highlord Darion Mograine
		["g"] = {
			L_DIALOG["Highlord Darion Mograine 1"],
		},
	},
	[166980] = { -- Lady Jaina Proudmoore
		["g"] = {
			L_DIALOG["I am ready."],
			L_DIALOG["Lady Jaina Proudmoore 1"],
			L_DIALOG["Lady Jaina Proudmoore 2"],
			L_DIALOG["Lady Jaina Proudmoore 3"],
			L_DIALOG["Lady Jaina Proudmoore 4"],
		}
	},
	[168836] = { -- Shandris Feathermoon
		["g"] = {
			L_DIALOG["Shandris Feathermoon 1"],
		}
	},
	[178828] = { -- Lord Herne
		["g"] = {
			L_DIALOG["Lord Herne 1"],
		}
	},
	[178943] = { -- Lady Moonberry
		["g"] = {
			L_DIALOG["Lady Moonberry 2"],
		}
	},
	[179068] = { -- Orator Kloe
		["g"] = {
			L_DIALOG["Orator Kloe 1"],
		}
	},
	[178033] = { -- Gubbins
		["g"] = {
			L_DIALOG["Gubbins 1"],
		}
	},
	[177900] = { -- Xandria
		["g"] = {
			L_DIALOG["I am ready."],
			L_DIALOG["Xandria 1"],
		}
	},
	[178006] = { -- Prince Renathal
		["g"] = {
			L_DIALOG["Prince Renathal 1"],
		}
	},
	[162804] = { -- Ve'nari
		["g"] = {
			L_DIALOG["Quest"],
			L_DIALOG["Ve'nari 1"],
			L_DIALOG["Ve'nari 2"],
			L_DIALOG["Ve'nari 3"],
		}
	},
	[166280] = { -- Ashamane
		["g"] = {
			L_DIALOG["Ashamane 1"],
		}
	},
	[166315] = { -- Ashamane
		["g"] = {
			L_DIALOG["Ashamane 2"],
		}
	},
	[166461] = { -- Spirit of Vol'jin
		["g"] = {
			L_DIALOG["Spirit of Vol'jin 2"],
		}
	},
	[169625] = { -- Sinfall Executor
		["g"] = {
			L_DIALOG["Sinfall Executor 1"],
		}
	},
	[169627] = { -- Sinfall Executor
		["g"] = {
			L_DIALOG["Sinfall Executor 1"],
		}
	},
	[161158] = { -- The Accuser
		["g"] = {
			L_DIALOG["The Accuser 2"],
		}
	},
	[161278] = { -- The Accuser
		["g"] = {
			L_DIALOG["The Accuser 3"],
		}
	},
	[167689] = { -- Prince Renethal
		["g"] = {
			L_DIALOG["I am ready."],
		}
	},
	-- End of The Maw
	-- Torghast
	[164937] = { -- Runecarver
		["g"] = {
			L_DIALOG["Runecarver 1"],
			L_DIALOG["Runecarver 2"],
		},
	},
	[175127] = { -- Wayfinder
		["g"] = {
			L_DIALOG["Wayfinder 1"],
		},
	},
	[175118] = { -- Shandris Feathermoon
		["g"] = {
			L_DIALOG["Quest"],
		},
	},
	[164334] = { -- Shandris Feathermoon
		["g"] = {
			L_DIALOG["Shandris Feathermoon 2"],
		},
	},
	[168979] = { -- Meatball
		["g"] = {
			L_DIALOG["Yes, I will help."],
		},
	},
	[167839] = { -- Partially-Infused Soul Remnant
		["g"] = {
			L_DIALOG["Partially-Infused Soul Remnant 1"],
		},
	},
	[166123] = { -- Indigo
		["g"] = {
			L_DIALOG["Yes, I will help."],
		},
	},
	[152418] = { -- Gallath
		["g"] = {
			L_DIALOG["Yes, I will help."],
		},
	},
	[166151] = { -- Moriaz the Red
		["g"] = {
			L_DIALOG["Yes, I will help."],
		},
	},
	[171920] = { -- Ayeleth
		["g"] = {
			L_DIALOG["Yes, I will help."],
		},
	},
	[171901] = { -- Kaletar
		["g"] = {
			L_DIALOG["I will free you."],
		},
	},
	[172264] = { -- Yira'lya
		["g"] = {
			L_DIALOG["I will free you."],
		},
	},
	[172261] = { -- Chalkyth
		["g"] = {
			L_DIALOG["Yes, I will help."],
		},
	},
	[157426] = { -- Indri the Treesinger
		["g"] = {
			L_DIALOG["Yes, I will help."],
		},
	},
	[178932] = { -- Ve'lor the Messenger
		["g"] = {
			L_DIALOG["Yes, I will help."],
		},
	},
	[166147] = { -- Calix
		["g"] = {
			L_DIALOG["Yes, I will help."],
		},
	},
	[157406] = { -- Renavyth
		["g"] = {
			L_DIALOG["I will assist you."],
		},
	},
	-- End of Torghast
	-- Zereth Mortis
	[0] = {
		["g"] = {
			L_DIALOG["Leave the Blooming Foundry."],
		},
	},
	[180920] = { -- Siloh
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[177486] = { -- Elder Kreth
		["g"] = {
			L_DIALOG["Elder Kreth 1"],
			L_DIALOG["Elder Kreth 2"],
			L_DIALOG["Elder Kreth 3"],
			L_DIALOG["Yes."],
			L_DIALOG["We need your assistance."],
		},
	},
	[185844] = { -- Knight of the Ebon Blade
		["g"] = {
			L_DIALOG["Bolvar requests your current report."],
		},
	},
	[185845] = { -- Knight of the Ebon Blade
		["g"] = {
			L_DIALOG["Bolvar requests your current report."],
		},
	},
	[185847] = { -- Knight of the Ebon Blade
		["g"] = {
			L_DIALOG["Bolvar requests your current report."],
		},
	},
	[180923] = { -- Varoun
		["g"] = {
			L_DIALOG["Varoun 1"],
		},
	},
	[180950] = { -- Avna
		["g"] = {
			L_DIALOG["Avna 1"],
		},
	},
	[180926] = { -- Custodian Kalir
		["g"] = {
			L_DIALOG["Custodian Kalir 1"],
		},
	},
	[183465] = { -- Alonis
		["g"] = {
			L_DIALOG["Your presence is requested immediately at Provis Terra."],
		},
	},
	[183455] = { -- Huntress Laikeer
		["g"] = {
			L_DIALOG["Your presence is requested immediately at Provis Terra."],
		},
	},
	[183458] = { -- Ava'zer
		["g"] = {
			L_DIALOG["Your presence is requested immediately at Provis Terra."],
		},
	},
	[183724] = { -- Lady Jaina Proudmoore
		["g"] = {
			L_DIALOG["I'm ready."],
		},
	},
	[182346] = { -- Tamra
		["g"] = {
			L_DIALOG["Tamra 1"],
		},
	},
	[177958] = { -- Firim
		["g"] = {
			L_DIALOG["Firim 1"],
			L_DIALOG["Firim 2"],
			L_DIALOG["Firim 3"],
		},
	},
	[181706] = { -- Pocopoc
		["g"] = {
			L_DIALOG["Pocopoc 1"],
			L_DIALOG["Pocopoc 2"],
			L_DIALOG["Pocopoc 3"],
			L_DIALOG["Pocopoc 4"],
			L_DIALOG["Pocopoc 5"],
		},
	},
	[181183] = { -- Highlord Bolvar Fordragon
		["g"] = {
			L_DIALOG["Highlord Bolvar Fordragon 4"],
		},
	},
	[183677] = { -- Uther the Lightbringer
		["g"] = {
			L_DIALOG["Tell me what happened."],
		},
	},
	[178015] = { -- Elder Zoor
		["g"] = {
			L_DIALOG["We need your assistance."],
		},
	},
	[178016] = { -- Elder Ara
		["g"] = {
			L_DIALOG["We need your assistance."],
		},
	},
	[181179] = { -- Elder Nirav
		["g"] = {
			L_DIALOG["I need to restore these remnants."],
		},
	},
	[183298] = { -- Faruu
		["g"] = {
			L_DIALOG["I need to restore these remnants."],
		},
	},
	[181084] = { -- Drim
		["g"] = {
			L_DIALOG["I need to restore these remnants."],
		},
	},
	[184442] = { -- Feroz
		["g"] = {
			L_DIALOG["Feroz 1"],
		},
	},
	[184153] = { -- Elder Ara
		["g"] = {
			L_DIALOG["Let's begin."],
		},
	},
	[177456] = { -- Anduin Wrynn
		["g"] = {
			L_DIALOG["Tell me what happened."],
		},
	},
	[181229] = { -- Highlord Bolvar Fordragon
		["g"] = {
			L_DIALOG["Highlord Bolvar Fordragon 3"],
		},
	},
	[181229] = { -- Saezurah
		["g"] = {
			L_DIALOG["Saezurah 1"],
		},
	},
	[181738] = { -- Nadjia the Mistblade
		["g"] = {
			L_DIALOG["Nadjia the Mistblade 1"],
		},
	},
	[181740] = { -- Droman Aliothe
		["g"] = {
			L_DIALOG["Will you bring your forces to fight with us?"],
		},
	},
	[181739] = { -- Secutor Mevix
		["g"] = {
			L_DIALOG["Will you bring your forces to fight with us?"],
		},
	},
	[180965] = { -- Firim
		["g"] = {
			L_DIALOG["Firim 4"],
		},
	},
	[180942] = { -- Saezurah
		["g"] = {
			L_DIALOG["Saezurah 2"],
		},
	},
	[181892] = { -- Vessel
		["g"] = {
			L_DIALOG["Vessel 1"],
		},
	},
	[183693] = { -- Automa Scryer
		["g"] = {
			L_DIALOG["Examine the Automa."],
		},
	},
	[183703] = { -- Automa Scryer
		["g"] = {
			L_DIALOG["Examine the Automa."],
		},
	},
	[183692] = { -- Automa Scryer
		["g"] = {
			L_DIALOG["Examine the Automa."],
		},
	},
	[183694] = { -- Automa Scryer
		["g"] = {
			L_DIALOG["Examine the Automa."],
		},
	},
	[180914] = { -- Pelagos
		["g"] = {
			L_DIALOG["Pelagos 1"],
		},
	},
	[181098] = { -- Olea Pau
		["g"] = {
			L_DIALOG["It is not safe here."],
		},
	},
	[180919] = { -- Olea Novi
		["g"] = {
			L_DIALOG["It is not safe here."],
		},
	},
	[183962] = { -- Olea Manu
		["g"] = {
			L_DIALOG["It is not safe here."],
		},
	},
	[184469] = { -- Hanoa the Exile
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[182146] = { -- Olem
		["g"] = {
			L_DIALOG["Olem 1"],
		},
	},
	[181990] = { -- Sequence Generator
		["g"] = {
			L_DIALOG["Sequence Generator 1"],
		},
	},
	[181948] = { -- Highlord Bolvar Fordragon
		["g"] = {
			L_DIALOG["Highlord Bolvar Fordragon 5"],
		},
	},
	[180610] = { -- Kodah
		["g"] = {
			L_DIALOG["Let's do this!"],
		},
	},
	-- End of Zereth Mortis
	-- Exile's Reach
	[167179] = { -- Daelya Twilightsbane
		["g"] = {
			L_DIALOG["Daelya Twilightsbane 1"],
			L_DIALOG["Daelya Twilightsbane 2"],
		},
	},
	[153211] = { -- Meredy Huntswell
		["g"] = {
			L_DIALOG["I'll fight the harpies that come."],
			L_DIALOG["Meredy Huntswell 1"],
		},
	},
	[156943] = { -- Meredy Huntswell
		["g"] = {
			L_DIALOG["Meredy Huntswell 1"],
		},
	},
	[167298] = { -- Herbert Gloomburst
		["g"] = {
			L_DIALOG["I'll fight the harpies that come."],
		},
	},
	[167309] = { -- Herbert Gloomburst
		["g"] = {
			L_DIALOG["Herbert Gloomburst 1"],
		},
	},
	[161350] = { -- Captain Garrick
		["g"] = {
			L_DIALOG["Let's get out of the citadel and figure out how to get back home."],
		},
	},
	[167663] = { -- Warlord Breka Grimaxe
		["g"] = {
			L_DIALOG["Warlord Breka Grimaxe 1"],
		},
	},
	[162972] = { -- Coulston Nereus
		["g"] = {
			L_DIALOG["I'm in."],
			L_DIALOG["Got it."],
		},
	},
	[164835] = { -- Kee-La
		["g"] = {
			L_DIALOG["I'm ready."],
		},
	},
	-- End of Exile's Reach
	-- De Other Side (Dungeon)
	[166281] = { -- Bwonsamdi
		["g"] = {
			L_DIALOG["Bwonsamdi 1"],
		},
	},
	-- End of De Other Side (Dungeon)
}

addonTable.DIALOG_SL = DIALOG_SL