local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local parentMapId = 0
local t = {}
local Cosmic = {
	-- Supported Maps
		-- 946: Cosmic
		-- 947: Azeroth
	--
	-- Darkmoon Faire
	[67370] = { -- Jeremy Feasel
		["g"] = {
			L_DIALOG["I challenge you to a pet battle!"],
		},
	},
	[85519] = { -- Christoph VonFeasel
		["g"] = {
			L_DIALOG["I challenge you to a pet battle!"],
		},
	},
	-- End of Darkmoon Faire
	-- Nazjatar
	[155941] = { -- Tamer Orami
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[150101] = { -- Lady Jaina Proudmoore
		["g"] = {
			L_DIALOG["Lady Jaina Proudmoore 5"],
		},
	},
	-- End of Nazjatar
}

local Shadowlands = {
	-- Supported Maps
		-- 1409: Exile's Reach
		-- 1550: The Shadowlands
	--
	-- Oribos
	[0] = {
		["g"] = {
			L_DIALOG["Ancient Translocator 1"],
			L_DIALOG["Repository Console 1"],
		},
	},
	[156791] = { -- Keeper Ta'saran
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[159478] = { -- Tal-Inara
		["g"] = {
			L_DIALOG["Tal-Inara 1"],
			L_DIALOG["Tal-Inara 2"],
			L_DIALOG["Tal-Inara 3"],
		},
	},
	[164079] = { -- Highlord Bolvar Fordragon
		["g"] = {
			L_DIALOG["Highlord Bolvar Fordragon 1"],
			L_DIALOG["Highlord Bolvar Fordragon 2"],
		},
		["c"] = {
			L_DIALOG["Are you sure?"],
		},
	},
	[177136] = { -- Polemarch Adrestes
		["g"] = {
			L_DIALOG["Polemarch Adrestes 1"],
		},
	},
	[168432] = { -- Ve'rayn
		["g"] = {
			L_DIALOG["Ve'rayn 1"],
			L_DIALOG["Ve'rayn 2"],
			L_DIALOG["Ve'rayn 3"],
			L_DIALOG["Ve'rayn 4"],
		},
	},
	[174871] = { -- Fatescribe Roh-Tahl
		["g"] = {
			L_DIALOG["Fatescribe Roh-Tahl 1"],
		},
	},
	-- Bastion
	[173130] = { -- Zolla
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[160595] = { -- Pelagos
		["g"] = {
			L_DIALOG["Let us soulbind."],
		},
	},
	[175444] = { -- Beastkeeper Ismene
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[160178] = { -- Eumelia
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[168742] = { -- Polemarch Adrestes
		["g"] = {
			L_DIALOG["I am."],
		},
	},
	[168906] = { -- Polemarch Adrestes
		["g"] = {
			L_DIALOG["I'm ready."],
		},
	},
	[156327] = { -- Voitha
		["g"] = {
			L_DIALOG["Voitha 1"],
		},
	},
	[157696] = { -- Nemea
		["g"] = {
			L_DIALOG["Nemea 1"],
		},
		["c"] = {
			L_DIALOG["Nemea 2"],
		},
	},
	[173129] = { -- Thenia
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[158765] = { -- Pelodis
		["g"] = {
			L_DIALOG["Pelodis 1"],
		},
	},
	[159277] = { -- Aspirant Leda
		["g"] = {
			L_DIALOG["Aspirant Leda 1"],
		},
	},
	[159278] = { -- Aspirant Ikaran
		["g"] = {
			L_DIALOG["Aspirant Ikaran 1"],
		},
	},
	[169022] = { -- Helpful Steward
		["g"] = {
			L_DIALOG["Helpful Steward 1"],
		},
	},
	[169023] = { -- Helpful Steward
		["g"] = {
			L_DIALOG["Helpful Steward 1"],
		},
	},
	[169024] = { -- Helpful Steward
		["g"] = {
			L_DIALOG["Helpful Steward 1"],
		},
	},
	[169025] = { -- Helpful Steward
		["g"] = {
			L_DIALOG["Helpful Steward 1"],
		},
	},
	[169026] = { -- Helpful Steward
		["g"] = {
			L_DIALOG["Helpful Steward 1"],
		},
	},
	[169027] = { -- Helpful Steward
		["g"] = {
			L_DIALOG["Helpful Steward 1"],
		},
	},
	[169077] = { -- Helpful Steward
		["g"] = {
			L_DIALOG["Helpful Steward 2"],
		},
	},
	[169078] = { -- Helpful Steward
		["g"] = {
			L_DIALOG["Helpful Steward 2"],
		},
	},
	[169079] = { -- Helpful Steward
		["g"] = {
			L_DIALOG["Helpful Steward 2"],
		},
	},
	[169080] = { -- Helpful Steward
		["g"] = {
			L_DIALOG["Helpful Steward 2"],
		},
	},
	[169081] = { -- Helpful Steward
		["g"] = {
			L_DIALOG["Helpful Steward 2"],
		},
	},
	[169082] = { -- Helpful Steward
		["g"] = {
			L_DIALOG["Helpful Steward 2"],
		},
	},
	[172714] = { -- Trapped Caretaker
		["g"] = {
			L_DIALOG["Trapped Caretaker 1"],
		},
	},
	[161279] = { -- Sparring Aspirant
		["g"] = {
			-- When there is only one Sparring Aspirant.
			L_DIALOG["Sparring Aspirant 1"],
		},
	},
	[159504] = { -- Sparring Aspirant
		["g"] = {
			L_DIALOG["Sparring Aspirant 1"],
			L_DIALOG["Sparring Aspirant 2"],
		},
	},
	[159505] = { -- Sparring Aspirant
		["g"] = {
			-- When there are Sparring Aspirants... sparring.
			L_DIALOG["Sparring Aspirant 1"],
			L_DIALOG["Sparring Aspirant 2"],
		},
	},
	[171834] = { -- Aspirant Thetes
		["g"] = {
			L_DIALOG["Aspirant Thetes 1"],
		},
	},
	[173131] = { -- Stratios
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[160598] = { -- Klystere
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[181286] = { -- Sylvanas Windrunner
		["g"] = {
			L_DIALOG["Sylvanas Windrunner 1"],
		},
	},
	[160037] = { -- Polemarch Adrestes
		["g"] = {
			L_DIALOG["I know my way around the Sanctum."],
		},
		["c"] = {
			L_DIALOG["Are you sure?"],
		},
	},
	[165412] = { -- Xandria
		["g"] = {
			L_DIALOG["I'm ready."],
		},
	},
	[165794] = { -- Xandria
		["g"] = {
			L_DIALOG["Xandria 2"],
		},
	},
	[162542] = { -- Kleia
		["g"] = {
			L_DIALOG["I am ready."],
			L_DIALOG["I'm ready."],
			L_DIALOG["Kleia 1"],
			L_DIALOG["Kleia 2"],
		},
	},
	[163650] = { -- Kleia
		["g"] = {
			L_DIALOG["Let us soulbind."],
		},
	},
	[167716] = { -- Pelagos
		["g"] = {
			L_DIALOG["Pelagos 2"],
		},
	},
	[162556] = { -- Clora
		["g"] = {
			L_DIALOG["Clora 1"],
		},
	},
	[162557] = { -- Forgelite Sophone
		["g"] = {
			L_DIALOG["Forgelite Sophone 1"],
		},
	},
	[160280] = { -- Mikanikos
		["g"] = {
			L_DIALOG["I am ready."],
			L_DIALOG["Mikanikos 1"],
		},
	},
	[173860] = { -- Kalisthene
		["g"] = {
			L_DIALOG["Kalisthene 1"],
		},
	},
	[156361] = { -- Kleia
		["g"] = {
			L_DIALOG["I am ready."],
			L_DIALOG["Kleia 3"],
			L_DIALOG["Kleia 4"],
		},
	},
	[174497] = { -- Polemarch Adrestes
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[162889] = { -- Eridia
		["g"] = {
			L_DIALOG["Eridia 1"],
		},
	},
	[162904] = { -- Apolon
		["g"] = {
			L_DIALOG["Apolon 1"],
		},
	},
	[162888] = { -- Sika
		["g"] = {
			L_DIALOG["Sika 1"],
		},
	},
	[162907] = { -- Arios Riftbearer
		["g"] = {
			L_DIALOG["Arios Riftbearer 1"],
		},
	},
	[164473] = { -- Polemarch Adrestes
		["g"] = {
			L_DIALOG["I am."],
		},
	},
	[166740] = { -- Mikanikos
		["g"] = {
			L_DIALOG["I am."],
		},
	},
	[174503] = { -- Polemarch Adrestes
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[161637] = { -- Theotar
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[171147] = { -- General Draven
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	-- End of Bastion
	-- Maldraxxus
	[173263] = { -- Rotgut
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[165052] = { -- Vial Master Lurgy
		["g"] = {
			L_DIALOG["Is there any way I can help?"],
			L_DIALOG["O.K."],
		},
	},
	[157313] = { -- Foul-Tongue Cyrlix
		["g"] = {
			L_DIALOG["Is there any way I can help?"],
			L_DIALOG["O.K."],
		},
	},
	[157945] = { -- Boil Master Yetch
		["g"] = {
			L_DIALOG["Is there any way I can help?"],
			L_DIALOG["O.K."],
		},
	},
	[159696] = { -- Rencissa the Dynamo
		["g"] = {
			L_DIALOG["Rencissa the Dynamo 1"],
		},
	},
	[159827] = { -- Scrapper Minoire
		["g"] = {
			L_DIALOG["Scrapper Minoire 1"],
		},
	},
	[160917] = { -- Grimshadow
		["g"] = {
			L_DIALOG["Grimshadow 1"],
		},
	},
	[161710] = { -- Marcel Mullby
		["g"] = {
			L_DIALOG["Marcel Mullby 1"],
		},
	},
	[165966] = { -- Khaliiq
		["g"] = {
			L_DIALOG["Khaliiq 1"],
		},
	},
	[157130] = { -- Recruitable Animate
		["g"] = {
			L_DIALOG["Recruitable Animate 1"],
		},
	},
	[157168] = { -- Stubborn Animate
		["g"] = {
			L_DIALOG["Stubborn Animate 1"],
		},
	},
	[166129] = { -- Specialist Entra
		["g"] = {
			L_DIALOG["Specialist Entra 1"],
		},
	},
	[166657] = { -- Ta'eran
		["g"] = {
			L_DIALOG["Ta'eran 1"],
		},
	},
	[171747] = { -- Project Lead Allen
		["g"] = {
			L_DIALOG["Project Lead Allen 1"],
		},
	},
	[172871] = { -- Taloned Flayedwing
		["g"] = {
			L_DIALOG["Taloned Flayedwing 1"],
		},
	},
	[173267] = { -- Dundley Stickyfingers
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[159824] = { -- Gunn Gorgebone
		["g"] = {
			L_DIALOG["Is there anything you need?"],
		},
	},
	[159827] = { -- Scrapper Minoire
		["g"] = {
			L_DIALOG["Is there anything you need?"],
			L_DIALOG["Scrapper Minoire 1"],
		},
	},
	[159696] = { -- Rencissa the Dynamo
		["g"] = {
			L_DIALOG["Is there anything you need?"],
			L_DIALOG["Rencissa the Dynamo 1"],
		},
	},
	[163083] = { -- Valuator Malus
		["g"] = {
			L_DIALOG["Very well. Let us fight."],
		},
	},
	[163084] = { -- Tester Sahaari
		["g"] = {
			L_DIALOG["Very well. Let us fight."],
		},
	},
	[164492] = { -- Arena Spectator
		["g"] = {
			L_DIALOG["Au'narim claims you owe her anima."],
		},
	},
	[164507] = { -- Arena Spectator
		["g"] = {
			L_DIALOG["Au'narim claims you owe her anima."],
		},
	},
	[164508] = { -- Arena Spectator
		["g"] = {
			L_DIALOG["Au'narim claims you owe her anima."],
		},
	},
	[161712] = { -- Nana Redcap
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[157130] = { -- Recruitable Animate
		["g"] = {
			L_DIALOG["Maldraxxus needs your service. Will you fight?"],
		},
	},
	[157168] = { -- Stubborn Animate
		["g"] = {
			L_DIALOG["Maldraxxus needs your service. Will you fight?"],
		},
	},
	[158453] = { -- Baroness Draka
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[165182] = { -- Baroness Draka
		["g"] = {
			L_DIALOG["I know my way around the Sanctum."],
		},
		["c"] = {
			L_DIALOG["Are you sure?"],
		},
	},
	[173257] = { -- Caregiver Maximillian
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[161985] = { -- Baroness Vashj
		["g"] = {
			L_DIALOG["Baroness Vashj 1"],
		},
	},
	[158604] = { -- Navigator Xennir
		["g"] = {
			L_DIALOG["Navigator Xennir 1"],
		},
	},
	[160518] = { -- Whisperer Vyn
		["g"] = {
			L_DIALOG["Whisperer Vyn 1"],
		},
	},
	[172566] = { -- Twigin
		["g"] = {
			L_DIALOG["I'm ready."],
		},
	},
	[172809] = { -- Twigin
		["g"] = {
			L_DIALOG["I'm ready."],
		},
	},
	[172901] = { -- Twigin
		["g"] = {
			L_DIALOG["I'm ready."],
		},
	},
	[172574] = { -- Navigator Xennir
		["g"] = {
			L_DIALOG["Navigator Xennir 2"],
		},
	},
	[168860] = { -- Kynthia
		["g"] = {
			L_DIALOG["Kynthia 1"],
		},
	},
	[166211] = { -- Alexandros Mograine
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[172002] = { -- Xandria
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[172923] = { -- Kel'Thuzad
		["g"] = {
			L_DIALOG["Kel'Thuzad 1"],
		},
	},
	[174179] = { -- Baroness Draka
		["g"] = {
			L_DIALOG["Baroness Draka 1"],
		},
	},
	[173523] = { -- General Draven
		["g"] = {
			L_DIALOG["General Draven 1"],
		},
	},
	[173222] = { -- Xandria
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	-- End of Maldraxxus
	-- Ardenweald
	[171743] = { -- Dapperdew
		["g"] = {
			L_DIALOG["Dapperdew 1"],
		},
	},
	[157710] = { -- Cortinarius
		["g"] = {
			L_DIALOG["Cortinarius 1"],
		},
	},
	[170571] = { -- Timaeron
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[168082] = { -- Tinybell
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[160929] = { -- Guardian Molan
		["g"] = {
			L_DIALOG["The forces of Mueh'zala have invaded Ardenweald."],
		},
	},
	[158921] = { -- Guardian Kota
		["g"] = {
			L_DIALOG["The forces of Mueh'zala have invaded Ardenweald."],
		},
	},
	[158519] = { -- Sorcha
		["g"] = {
			L_DIALOG["The forces of Mueh'zala have invaded Ardenweald."],
			L_DIALOG["I would like you to have the supplies."],
		},
	},
	[161785] = { -- Thiernax
		["g"] = {
			L_DIALOG["Thiernax 1"],
			L_DIALOG["Thiernax 2"],
		},
	},
	[165382] = { -- Gormsmith Cavina
		["g"] = {
			L_DIALOG["I would like you to have the supplies."],
		},
	},
	[165703] = { -- Elder Finnan
		["g"] = {
			L_DIALOG["I would like you to have the supplies."],
		},
	},
	[158345] = { -- Lady of the Falls
		["g"] = {
			L_DIALOG["I would like you to have the supplies."],
		},
	},
	[165704] = { -- Elder Gwenna
		["g"] = {
			L_DIALOG["I would like you to have the supplies."],
		},
	},
	[165705] = { -- Groonoomcrooek
		["g"] = {
			L_DIALOG["I would like you to have the supplies."],
		},
	},
	[158543] = { -- Attendant Sparkledew
		["g"] = {
			L_DIALOG["Attendant Sparkledew 1"],
		},
	},
	[160121] = { -- Master Sha'lor
		["g"] = {
			L_DIALOG["Master Sha'lor 1"],
		},
	},
	[158544] = { -- Lord Herne
		["g"] = {
			L_DIALOG["Lord Herne 2"],
			L_DIALOG["Lord Herne 3"],
			L_DIALOG["Lord Herne 4"],
		},
	},
	[165550] = { -- Attendant Shimmerwing
		["g"] = {
			L_DIALOG["Attendant Shimmerwing 1"],
		},
	},
	[169273] = { -- Silkstrider Caretaker
		["g"] = {
			L_DIALOG["Silkstrider Caretaker 1"],
		},
	},
	[161509] = { -- Lady Moonberry
		["g"] = {
			L_DIALOG["Lady Moonberry 3"],
			L_DIALOG["I know my way around the Sanctum."],
		},
		["c"] = {
			L_DIALOG["Are you sure?"],
		},
	},
	[172431] = { -- Lady Moonberry
		["g"] = {
			L_DIALOG["Lady Moonberry 1"],
		},
	},
	[170705] = { -- Ara'lon
		["g"] = {
			L_DIALOG["Ara'lon 1"],
		},
	},
	[164023] = { -- Vesperbloom
		["g"] = {
			L_DIALOG["Vesperbloom 1"],
			L_DIALOG["Vesperbloom 2"],
		},
	},
	[172185] = { -- Zayhad, The Builder
		["g"] = {
			L_DIALOG["Zayhad, The Builder 1"],
			L_DIALOG["Zayhad, The Builder 2"],
		},
	},
	[156634] = { -- Winter Queen
		["g"] = {
			L_DIALOG["Winter Queen 1"],
			L_DIALOG["Winter Queen 2"],
		},
	},
	[166887] = { -- Winter Queen
		["g"] = {
			L_DIALOG["Winter Queen 3"],
			L_DIALOG["Winter Queen 4"],
			L_DIALOG["I am ready to go."],
		},
	},
	[171992] = { -- Lady Moonberry
		["g"] = {
			L_DIALOG["Lady Moonberry 4"],
		},
	},
	[172091] = { -- Lord Herne
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[173377] = { -- Faryl
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[172886] = { -- Mask of Bwonsamdi
		["g"] = {
			L_DIALOG["Mask of Bwonsamdi 1"],
		},
	},
	[173372] = { -- Glitterdust
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[157949] = { -- Heartwood Grove Holdout
		["g"] = {
			L_DIALOG["Evacuate, now!"],
		},
	},
	[161354] = { -- Huln Highmountain
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[158006] = { -- Heartwood Grove Holdout
		["g"] = {
			L_DIALOG["Evacuate, now!"],
		},
	},
	[170924] = { -- Nortera
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[159427] = { -- Elder Finnan
		["g"] = {
			L_DIALOG["The Lady of the Falls wanted to make sure you were safe."],
		},
	},
	[159428] = { -- Groonoomcrooek
		["g"] = {
			L_DIALOG["The Lady of the Falls wanted to make sure you were safe."],
		},
	},
	[159465] = { -- Elder Gwenna
		["g"] = {
			L_DIALOG["The Lady of the Falls wanted to make sure you were safe."],
		},
	},
	[160262] = { -- Ysera
		["g"] = {
			L_DIALOG["Ysera 1"],
			L_DIALOG["I'm ready."],
		},
	},
	[162434] = { -- Littlewing
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[104553] = { -- Odrogg
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	[172677] = { -- Niya
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[165671] = { -- Pelagos
		["g"] = {
			L_DIALOG["Pelagos 3"],
		},
	},
	[165736] = { -- Lady Moonberry's Soap
		["g"] = {
			L_DIALOG["Lady Moonberry's Soap 1"],
		},
	},
	[162392] = { -- Willowblossom
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[163328] = { -- Pelagos
		["g"] = {
			L_DIALOG["I am ready."],
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
	-- End of Revendreth
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

local function GetParentMapID(mapId)
	-- Get the parent map ID, then check
	-- to see if it's a continent.
	--
	-- If not a continent, then recursively
	-- scan the map relationship until the
	-- first continent is found.
	local mapInfo = C_Map.GetMapInfo(mapId)
	if mapInfo.mapType ~= 2 and mapInfo.parentMapID ~= 0 then
		GetParentMapID(mapInfo.parentMapID)
	else
		parentMapId = mapInfo.mapID
	end
end

local function SelectGossipOption(options, npcId, parentMapId)
	-- Use the parent map ID to determine
	-- which populated table to use.
	--
	-- If the parent map ID isn't supported
	-- then set 't' to the default creatures
	-- table.
	if parentMapId == 12 or parentMapId == 13 or parentMapId == 948 then
		t = addonTable.DIALOG_CLASSIC
	elseif parentMapId == 101 then
		t = addonTable.DIALOG_TBC
	elseif parentMapId == 113 then
		t = addonTable.DIALOG_WOTLK
	elseif parentMapId == 424 then
		t = addonTable.DIALOG_MOP
	elseif parentMapId == 572 then
		t = addonTable.DIALOG_WOD
	elseif parentMapId == 619 or parentMapId == 905 then
		t = addonTable.DIALOG_LEGION
	elseif parentMapId == 875 or parentMapId == 876 then
		t = addonTable.DIALOG_BFA
	elseif parentMapId == 946 or parentMapId == 947 then
		t = Cosmic
	elseif parentMapId == 1409 or parentMapId == 1550 then
		t = Shadowlands
	end
	
	for index, gossipOptionsSubTable in ipairs(options) do
		-- These are player submitted dialogs
		-- using the Dialog command.
		for id, gossip in ipairs(HelpMePlayPlayerDialogDB) do
			if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(gossip)) then
				C_GossipInfo.SelectOption(index)
				return
			end
		end
		
		-- These are NPC dialogs associated
		-- with a specific NPC that are explicitly
		-- in the established table.
		for id, _ in pairs(t) do
			if id == npcId then
				-- We found a match in the table
				-- so let's move forward.
				for i=1,#t[id]["g"] do
					--- DEBUG ---
					-- Only enable these if dialogs aren't being
					-- selected when they should be.
					--print(string.lower(gossipOptionsSubTable["name"]))
					--print(string.lower(t[id]["g"][i]))
					if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(t[id]["g"][i])) then
						C_GossipInfo.SelectOption(index)
						return
					end
				end
			end
		end
	end
	
	-- We're done with 't', so reset
	-- it back to an empty table.
	t = {}
end

local function ProcessDialogTree()
	local index = 1
	local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
	local gossipOptions = C_GossipInfo.GetOptions()
	if unitGUID then
		local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
		SelectGossipOption(gossipOptions, npcId, parentMapId)
	else
		-- This must be an object with a
		-- dialog table.
		SelectGossipOption(gossipOptions, 0, parentMapId)
	end
end

local function CheckActiveQuests(activeQuests)
	if #activeQuests == 1 then
		if activeQuests[1].isComplete then
			HMP_CompleteQuest()
		else
			ProcessDialogTree()
		end
	else
		for i=1,#activeQuests do
			if activeQuests[i].isComplete then
				HMP_CompleteQuest()
			end
		end
		ProcessDialogTree()
	end
end

local function ConfirmConfirmationMessage(message, npcId)
	-- Use the parent map ID to determine
	-- which populated table to use.
	--
	-- If the parent map ID isn't supported
	-- then set 't' to the default creatures
	-- table.
	if parentMapId == 12 or parentMapId == 13 then
		t = addonTable.DIALOG_CLASSIC
	elseif parentMapId == 101 then
		t = addonTable.DIALOG_TBC
	elseif parentMapId == 113 then
		t = addonTable.DIALOG_WOTLK
	elseif parentMapId == 424 then
		t = addonTable.DIALOG_MOP
	elseif parentMapId == 572 then
		t = addonTable.DIALOG_WOD
	elseif parentMapId == 619 or parentMapId == 905 then
		t = addonTable.DIALOG_LEGION
	elseif parentMapId == 875 or parentMapId == 876 then
		t = addonTable.DIALOG_BFA
	elseif parentMapId == 946 or parentMapId == 947 then
		t = Cosmic
	elseif parentMapId == 1409 or parentMapId == 1550 then
		t = Shadowlands
	end
	
	for id, _ in pairs(t) do
		if id == npcId then
			for i=1,#t[id]["c"] do
				if string.find(string.lower(message), string.lower(t[id]["c"][i])) then
					StaticPopup1Button1:Click("LeftButton")
					return
				end
			end
		end
	end
end

e:RegisterEvent("GOSSIP_CONFIRM")
e:RegisterEvent("GOSSIP_CONFIRM_CANCEL")
e:RegisterEvent("GOSSIP_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_CONFIRM" then
		local _, message = ...
		if HelpMePlayOptionsDB.Dialog == false or HelpMePlayOptionsDB.Dialog == nil then return end
		local index = 1
		local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
		if unitGUID then
			local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
			ConfirmConfirmationMessage(message, npcId)
		end
	end
	if event == "GOSSIP_SHOW" then
		if HelpMePlayOptionsDB.Dialog == false or HelpMePlayOptionsDB.Dialog == nil then return end
		GetParentMapID(C_Map.GetBestMapForUnit("player"))
		local numAvailableQuests = C_GossipInfo.GetNumAvailableQuests()
		local activeQuests = C_GossipInfo.GetActiveQuests()
		if HelpMePlayOptionsDB.Quests then
			if next(activeQuests) then
				CheckActiveQuests(activeQuests)
			elseif numAvailableQuests > 0 then
				for i=1,numAvailableQuests do
					SelectAvailableQuest(i)
				end
			else
				ProcessDialogTree()
			end
		else
			ProcessDialogTree()
		end
	end
end)