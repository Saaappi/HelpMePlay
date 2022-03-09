local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_LEGION = {
	-- Supported Maps: 619 (Broken Isles), 905 (Argus)
	-- Objects
	[0] = {
		["g"] = {
			L_DIALOG["Leave the Darkpens."], -- Ravencrest Cemetary
		},
	},
	-- Dalaran
	[96507] = { -- Tassia Whisperglen
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[115287] = { -- Serr'ah
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[99210] = { -- Bodhi Sunwayver
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	[97804] = { -- Tiffany Nelson
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	-- End of Dalaran
	-- Highmountain
	[151641] = { -- Spiritwalker Ebonhorn
		["g"] = {
			L_DIALOG["Spiritwalker Ebonhorn 3"],
		},
	},
	[151643] = { -- Navarrogg
		["g"] = {
			L_DIALOG["Quest"],
		},
	},
	[151963] = { -- Navarrogg
		["g"] = {
			L_DIALOG["Quest"],
		},
	},
	[97862] = { -- Parek Splitfeather
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[97854] = { -- Liza Galestride
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[98825] = { -- Spiritwalker Ebonhorn
		["g"] = {
			L_DIALOG["Spiritwalker Ebonhorn 1"],
			L_DIALOG["Spiritwalker Ebonhorn 2"],
		},
	},
	[99745] = { -- Snazzle Shinyfinder
		["g"] = {
			L_DIALOG["Snazzle Shinyfinder 1"],
		},
	},
	[99746] = { -- Trytooth Hardchisel
		["g"] = {
			L_DIALOG["Trytooth Hardchisel 1"],
		},
	},
	[99747] = { -- Kindle Candlecrafter
		["g"] = {
			L_DIALOG["Kindle Candlecrafter 1"],
		},
	},
	[99748] = { -- Dug Digger
		["g"] = {
			L_DIALOG["Dug Digger 1"],
		},
	},
	[99781] = { -- Snazzle Shinyfinder
		["g"] = {
			L_DIALOG["Snazzle Shinyfinder 2"],
		},
	},
	[99782] = { -- Trytooth Hardchisel
		["g"] = {
			L_DIALOG["Trytooth Hardchisel 2"],
			L_DIALOG["Trytooth Hardchisel 3"],
		},
	},
	[99784] = { -- Kindle Candlecrafter
		["g"] = {
			L_DIALOG["Kindle Candlecrafter 2"],
		},
	},
	[95403] = { -- Windmaster Julan
		["g"] = {
			L_DIALOG["Windmaster Julan 1"],
		},
	},
	[96286] = { -- Navarrogg
		["g"] = {
			L_DIALOG["Navarrogg 1"],
		},
	},
	[98773] = { -- Lasan Skyhorn
		["g"] = {
			L_DIALOG["Yes!"],
		},
	},
	[99619] = { -- Navarrogg
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[96591] = { -- Amateur Hunter
		["g"] = {
			L_DIALOG["Go hunt somewhere else!"],
		},
	},
	[98804] = { -- Amateur Hunter
		["g"] = {
			L_DIALOG["Go hunt somewhere else!"],
		},
	},
	[94434] = { -- Addie Fizzlebog
		["g"] = {
			L_DIALOG["Addie Fizzlebog 1"],
		},
	},
	[106153] = { -- Tarvim Daywalker
		["g"] = {
			L_DIALOG["There is no time left. Run!"],
		},
	},
	[106115] = { -- Red Skymane
		["g"] = {
			L_DIALOG["There is no time left. Run!"],
		},
	},
	[106191] = { -- Old Nefu
		["g"] = {
			L_DIALOG["There is no time left. Run!"],
		},
	},
	-- End of Highmountain
	-- Val'sharah
	[91462] = { -- Malfurion Stormrage
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[91109] = { -- Malfurion Stormrage
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[92742] = { -- Ysera
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[104799] = { -- Tyrande Whisperwind
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[92734] = { -- Penelope Heathrow
		["g"] = {
			L_DIALOG["Penelope Heathrow 1"],
		},
	},
	[92620] = { -- Commander Jarod Shadowsong
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[94974] = { -- Sirius Ebonwing
		["g"] = {
			L_DIALOG["Sirius Ebonwing 1"],
		},
	},
	[94975] = { -- Asha Ravensong
		["g"] = {
			L_DIALOG["Asha Ravensong 1"],
			L_DIALOG["Asha Ravensong 2"],
		},
	},
	[94976] = { -- Cassiel Nightthorn
		["g"] = {
			L_DIALOG["Cassiel Nightthorn 1"],
			L_DIALOG["Cassiel Nightthorn 2"],
		},
	},
	[104739] = { -- Tyrande Whisperwind
		["g"] = {
			L_DIALOG["Tyrande Whisperwind 1"],
			L_DIALOG["Tyrande Whisperwind 2"],
		},
	},
	[99035] = { -- Durian Strongfruit
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	[106638] = { -- Leafbeard the Storied
		["g"] = {
			L_DIALOG["Leafbeard the Storied 1"],
		},
	},
	-- End of Val'sharah
	-- Stormheim
	[105386] = { -- Rydyr
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	[105455] = { -- Trapper Jarrun
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	-- End of Stormheim
	-- Suramar
	[105250] = { -- Aulier
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	[105779] = { -- Felsoul Leer
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	-- End of Suramar
	-- Mardum, the Shattered Abyss
	[99914] = { -- Ashtongue Mystic
		["g"] = {
			L_DIALOG["Thank you for your sacrifice."],
		},
	},
	[99915] = { -- Sevis Brightflame
		["g"] = {
			L_DIALOG["Sevis Brightflame 1"],
			L_DIALOG["Sevis Brightflame 2"],
		},
	},
	[93693] = { -- Lady S'theno
		["g"] = {
			L_DIALOG["Lady S'theno 1"],
		},
	},
	[94435] = { -- Matron Mother Malevolence
		["g"] = {
			L_DIALOG["Matron Mother Malevolence 1"],
		},
	},
	[90247] = { -- Battlelord Gaardoun
		["g"] = {
			L_DIALOG["Battlelord Gaardoun 1"],
		},
	},
	[96436] = { -- Jace Darkweaver
		["g"] = {
			L_DIALOG["Jace Darkweaver 1"],
		},
	},
	[96420] = { -- Cyana Nightglaive
		["g"] = {
			L_DIALOG["Cyana Nightglaive 1"],
		},
	},
	[99045] = { -- Kor'vas Bloodthorn
		["g"] = {
			L_DIALOG["Kor'vas Bloodthorn 1"],
		},
	},
	[93127] = { -- Kayn Sunfury
		["g"] = {
			L_DIALOG["Kayn Sunfury 1"],
		},
	},
	[96655] = { -- Allari the Souleater
		["g"] = {
			L_DIALOG["Allari the Souleater 1"],
		},
	},
	[96652] = { -- Mannethrel Darkstar
		["g"] = {
			L_DIALOG["Mannethrel Darkstar 1"],
		},
	},
	[96653] = { -- Izal Whitemoon
		["g"] = {
			L_DIALOG["Izal Whitemoon 1"],
		},
	},
	-- End of Mardum, the Shattered Abyss
	-- Vault of the Wardens
	[97644] = { -- Kor'vas Bloodthorn
		["g"] = {
			L_DIALOG["Kor'vas Bloodthorn 2"],
		},
	},
	-- End of Vault of the Wardens
	-- Argus
	[121263] = { -- Grand Artificer Romuul
		["g"] = {
			L_DIALOG["Grand Artificer Romuul 1"],
		},
	},
	[108642] = { -- Keeper Remulos
		["g"] = {
			L_DIALOG["Keeper Remulos 1"],
		},
	},
	[127752] = { -- Raelaara the Kind
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Argus
	-- The Nighthold
	[110677] = { -- Image of Khadgar
		["g"] = {
			L_DIALOG["I'm ready."],
		},
	},
	[116662] = { -- Suramar Portal (Bottom Floor)
		["g"] = {
			L_DIALOG["Suramar Portal 1"],
		},
	},
	[116667] = { -- Suramar Portal (After Elisande)
		["g"] = {
			L_DIALOG["Suramar Portal 2"],
		},
	},
	-- End of The Nighthold
	-- Antorus, the Burning Throne
	[122500] = { -- Essence of Eonar
		["g"] = {
			L_DIALOG["Essence of Eonar 1"],
			L_DIALOG["Essence of Eonar 2"],
		},
		["c"] = {
			L_DIALOG["Do you want to start the encounter?"],
		},
	},
	[125720] = { -- Lightforged Beacon
		["g"] = {
			L_DIALOG["Lightforged Beacon 1"],
		},
	},
	[128303] = { -- Lightforged Beacon
		["g"] = {
			L_DIALOG["Lightforged Beacon 2"],
		},
	},
	[128169] = { -- Magni Bronzebeard
		["g"] = {
			L_DIALOG["I'm ready."],
		},
	},
	-- End of Antorus, the Burning Throne
}

addonTable.DIALOG_LEGION = DIALOG_LEGION