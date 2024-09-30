local LHMP = LibStub("LibHelpMePlay")
if not LHMP then
	return false
end

LHMP.Gossips = {
	-------------------------
	-- Game Object Gossips --
	-------------------------
	[0] = {
		-------------------------
		-- MISTS OF PANDARIA ----
		-------------------------
		-- Ancient Statue (The Jade Forest)
		{ID = 40006, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29743}}}},
		{ID = 39082, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29743}}}},
		{ID = 39808, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29743}}}},
		{ID = 39083, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29743}}}},
	},
	-------------------------
	-- VANILLA --------------
	-------------------------
	-- Teldrassil
	[34761] = {{ID = 38299, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 10}, {"QUESTS_ACTIVE", {483}}}}},
	-- Elwynn Forest
	[240] = {{ID = 38407, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 10}, {"QUESTS_ACTIVE", {35}}}}},
	-- Darkshore
	[33037] = {{ID = 35901, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {13547}}}}},
	[33035] = {{ID = 35900, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {13547}}}}},
	[33033] = {{ID = 35899, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {13547}}}}},
	[33001] = {{ID = 37276, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {13547}}}}},
	[33072] = {{ID = 37858, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {13882}}}}},
	[34392] = {{ID = 36843, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {13885}}}}},
	[194771] = {{ID = 37215, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {13569}}}}},
	-- Ashenvale
	[34289] = {{ID = 37319, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {13886}}, {"QUEST_OBJECTIVES_COMPLETE", {{13886,1}}}}}},
	[34377] = {{ID = 37711, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {13935}}, {"QUEST_OBJECTIVES_COMPLETE", {{13935,1}}}}}},
	[34618] = {
		{ID = 38020, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26482}}}},
		{ID = 38287, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26482}}}}
	},
	-- Stonetalon Mountains
	[41071] = {{ID = 38774, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {25669}}, {"QUEST_OBJECTIVES_COMPLETE", {{25669,1}}}}}},
	-- Southern Barrens
	[38383] = {{ID = 38139, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {25191}}}}},
	[38619] = {{ID = 37512, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 20}, {"QUESTS_ACTIVE", {24934}}}}},
	[38622] = {{ID = 37724, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 20}, {"QUEST_COMPLETE", {24934}}}}},
	[37570] = {{ID = 37335, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {24601}}, {"QUEST_OBJECTIVES_COMPLETE", {{24601,1}}}}}},
	[37743] = {{ID = 38196, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {25057}}, {"QUEST_OBJECTIVES_COMPLETE", {{25057,1}}}}}},
	[39155] = {{ID = 36883, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {25120}}, {"QUEST_OBJECTIVES_COMPLETE", {{25120,1}}}}}},
	-- Desolace
	[35773] = {
		{ID = 38386, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {14256}}, {"QUEST_OBJECTIVES_COMPLETE", {{14256,1}}}}},
		{ID = 38387, CanConfirm = false, Conditions = {{"MISSING_ITEM", {49064}}}}
	},
	[35902] = {{ID = 37927, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {14284}}, {"QUEST_OBJECTIVES_COMPLETE", {{14284,1}}}}}},
	[36056] = {{ID = 37413, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {14318}}}}},
	[36398] = {{ID = 37290, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {14394}}}}},
	-- Feralas
	[41383] = {{ID = 38510, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {25304}}}}},
	[39723] = {{ID = 38132, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 20}, {"QUESTS_ACTIVE", {25399,25458}}, {"QUEST_OBJECTIVES_COMPLETE", {{25399,1}, {25458,1}}}}}},
	[40367] = {{ID = 37491, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {25437,25481}}}}},
	-- Thousand Needles
	[40832] = {{ID = 38546, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {25517}}, {"QUEST_OBJECTIVES_INCOMPLETE", {25517,1}}}}},
	[40726] = {{ID = 37885, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {25532}}}}},
	[47620] = {{ID = 39078, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {28136}}, {"QUEST_OBJECTIVES_INCOMPLETE", {28136,2}}}}},
	[47619] = {{ID = 39781, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {28136}}, {"QUEST_OBJECTIVES_INCOMPLETE", {28136,3}}}}},
	[47602] = {{ID = 39780, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {28136}}, {"QUEST_OBJECTIVES_INCOMPLETE", {28136,1}}}}},
	-- Dustwallow Marsh
	[23602] = {{ID = 36821, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27210}}, {"QUEST_OBJECTIVES_INCOMPLETE", {27210,1}}}}},
	[4979] = {{ID = 35789, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27212}}, {"QUEST_OBJECTIVES_INCOMPLETE", {27212,1}}}}},
	[23704] = {{ID = 35260, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27239}}}}},
	[4968] = {{ID = 29819, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27240}}}}},
	-- Felwood
	[206831] = {{ID = 39709, CanConfirm = false, Conditions = {}}},
	-- Westfall
	[42383] = {{ID = 38008, CanConfirm = true, Conditions = {{"QUESTS_ACTIVE", {26209}}}}},
	[42384] = {{ID = 38008, CanConfirm = true, Conditions = {{"QUESTS_ACTIVE", {26209}}}}},
	[42386] = {{ID = 38008, CanConfirm = true, Conditions = {{"QUESTS_ACTIVE", {26209}}}}},
	[42391] = {{ID = 38008, CanConfirm = true, Conditions = {{"QUESTS_ACTIVE", {26209}}}}},
	-- Northern Stranglethorn
	[44017] = {
		{ID = 37876, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26773}}}},
		{ID = 37877, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26775}}}}
	},
	[42881] = {{ID = 37412, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26775}}}}},
	[42882] = {
		{ID = 36965, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26775}}}},
		{ID = 36966, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26775}}}},
		{ID = 37129, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26775}}}}
	},
	[42883] = {{ID = 36967, CanConfirm = true, Conditions = {{"QUESTS_ACTIVE", {26775}}}}},
	-- The Cape of Stranglethorn
	[43377] = {{ID = 38572, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26595}}}}},
	[43505] = {
		{ID = 38304, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26630}}}},
		{ID = 38306, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26630}}}}
	},
	[2663] = {{ID = 38527, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26630}}}}},
	[2487] = {
		{ID = 38529, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26630}}}},
		{ID = 38530, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26630}}}},
	},
	[43605] = {{ID = 38569, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26649}}}}},
	[43659] = {{ID = 37799, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26662}}}}},
	[43636] = {{ID = 39613, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26664}}}}},
	[43660] = {{ID = 38351, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26662}}}}},
	[43661] = {{ID = 38489, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26662}}}}},
	[737] = {
		{ID = 40380, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26697}}}},
		{ID = 40381, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26703}}}}
	},
	[49635] = {{ID = 39916, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {28749}}}}},
	[204361] = {{ID = 38325, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26809}}}}},
	[2289] = {{ID = 38201, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26602}}}}},
	[204454] = {{ID = 39383, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26663}}}}},
	[204455] = {{ID = 38808, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26663}}}}},
	[204456] = {{ID = 38809, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26663}}}}},
	-- Western Plaguelands
	[46006] = {{ID = 39847, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 20}, {"QUESTS_ACTIVE", {27165}}}}},
	[44456] = {{ID = 39187, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26953}}, {"BUFF_INACTIVE", 83456}}}},
	[45212] = {{ID = 38631, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27174}}}}},
	[45162] = {{ID = 38252, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27156}}}}},
	[45150] = {{ID = 37536, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27153}}}}},
	[45151] = {{ID = 37875, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27153}}}}},
	[45148] = {{ID = 38735, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27153}}}}},
	[45149] = {{ID = 38829, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27153}}}}},
	[45152] = {{ID = 38251, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27154}}}}},
	-- Eastern Plaguelands
	[45400] = {
		{ID = 37586, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27373}}}},
		{ID = 37587, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27448}}}},
		{ID = 37588, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27489}}}}
	},
	[45451] = {{ID = 37583, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27381}}}}},
	[11063] = {{ID = 29395, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27388}}}}},
	[205485] = {{ID = 38411, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {27454}}}}},
	-- Stormwind City
	[167032] = {{ID = 51901, CanConfirm = false, Conditions = {{"CHROMIE_TIME_INACTIVE"}}}},
	-- Loch Modan
	[1573] = {{ID = 31712, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {26131}}}}},
	-------------------------
	-- THE BURNING CRUSADE --
	-------------------------
	-- Nagrand (Outland)
	[18417] = {
		{ID = 34530, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10646}}}},
		{ID = 34755, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10646}}}},
		{ID = 33588, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10646}}}},
		{ID = 34692, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10646}}}},
		{ID = 33281, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10646}}}},
		{ID = 33283, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10646}}}}
	},
	-- Shadowmoon Valley (Outland)
	[21727] = {{ID = 34446, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10583}}}}},
	[21774] = {{ID = 33587, CanConfirm = false, Conditions = {{"MISSING_ITEM", {30721}}}}},
	[21183] = {
		{ID = 34734, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10519}}}},
		{ID = 34710, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10519}}}},
		{ID = 34709, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10519}}}},
		{ID = 34708, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10519}}}},
		{ID = 33825, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10519}}}},
		{ID = 35045, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10519}}}},
		{ID = 33837, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10519}}}}
	},
	[20563] = {
		{ID = 33911, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10577}}}},
		{ID = 33671, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10577}}}},
		{ID = 33897, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10577}}}},
		{ID = 33912, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10577}}}},
		{ID = 33459, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10577}}}},
		{ID = 34482, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10577}}}}
	},
	[21685] = {{ID = 34153, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {10588}}}}},
	-------------------------
	-- WRATH OF THE LICH KING
	-------------------------
	-- Death Knights
	[28406] = {{ID = 37188, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {12733}}}}},
	[29173] = {{ID = 36227, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {12801}}}}},
	-------------------------
	-- MISTS OF PANDARIA ----
	-------------------------
	-- Introduction (Alliance)
	[165505] = {{ID = 54294, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 40}, {"QUESTS_ACTIVE", {29548}}}}},
	-- Introduction (Horde)
	[3310] = {{ID = 30402, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 30}, {"QUESTS_ACTIVE", {31853}}, {"QUEST_OBJECTIVES_COMPLETE", {{31853,1}}}}}},
	[55054] = {{ID = 41023, CanConfirm = false, Conditions = {"QUESTS_ACTIVE = 29690"}}},
	-- The Jade Forest
	[66292] = {{ID = 40614, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29548}}}}},
	[54763] = {{ID = 39167, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29579}}}}},
	[54914] = {
		{ID = 39493, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29620}}}},
		{ID = 40364, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29620}}}}
	},
	[211661] = {{ID = 33294, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {31130}}}}},
	[54944] = {{ID = 40241, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29632}}}}},
	[54924] = {{ID = 40594, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29633}}}}},
	[54925] = {{ID = 40595, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29634}}}}},
	[54926] = {{ID = 40337, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29635}}}}},
	[59058] = {{ID = 40616, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29883}}}}},
	[54960] = {
		{ID = 40442, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29883}}}},
		{ID = 40441, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29894}}}}
	},
	[56690] = {{ID = 40617, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29883}}}}},
	[56693] = {{ID = 40427, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29883}}}}},
	[55343] = {{ID = 40098, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29733}}}}},
	[55381] = {
		{ID = 40113, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29726}}}},
		{ID = 40114, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29730}}}}
	},
	[56434] = {{ID = 40503, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29901}}}}},
	[56737] = {{ID = 41374, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29922}}}}},
	[55267] = {{ID = 39304, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29716}}}}},
	[55368] = {{ID = 39810, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29723}}}}},
	[56209] = {{ID = 40636, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29920}}}}},
	[56210] = {{ID = 40637, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29920}}}}},
	[56206] = {{ID = 40541, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29920}}}}},
	[59395] = {{ID = 39183, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30495}}}}},
	[59401] = {{ID = 40697, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30495}}}}},
	[59397] = {{ID = 39805, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30495}}}}},
	[59392] = {
		{ID = 39631, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 30}, {"QUESTS_ACTIVE", {30495}}, {"QUEST_OBJECTIVES_INCOMPLETE", {30495,4}}}},
		{ID = 39632, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30495}}}},
		{ID = 39633, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29932}}}}
	},
	[59400] = {{ID = 39806, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30495}}}}},
	[57242] = {{ID = 40586, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29932}}}}},
	[59572] = {{ID = 39293, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30568}}}}},
	[59563] = {{ID = 39488, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30568}}}}},
	[64244] = {{ID = 38770, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {31303}}}}},
	[55141] = {{ID = 39490, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29694}}}}},
	[55162] = {{ID = 39687, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29694}}}}},
	[55146] = {{ID = 39686, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29694}}}}},
	[55170] = {{ID = 39688, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29694}}}}},
	[67090] = {{ID = 41782, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {31778}}}}},
	[65974] = {{ID = 41756, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {31778}}}}},
	[56340] = {{ID = 40184, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29941}}}}},
	[56336] = {{ID = 40464, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29941}}}}},
	[56478] = {{ID = 40187, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29941}}}}},
	[56477] = {{ID = 40186, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29941}}}}},
	[55688] = {{ID = 39795, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29823}}}}},
	[56525] = {{ID = 40650, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29967}}}}},
	[60952] = {{ID = 34466, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 30}, {"QUESTS_ACTIVE", {30015}}}}},
	[54959] = {{ID = 40054, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29903}}}}},
	[56585] = {{ID = 40057, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29903}}}}},
	[56592] = {{ID = 40154, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29903}}}}},
	[56591] = {
		{ID = 40056, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29903}}}},
		{ID = 40060, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29903}}}}
	},
	[59727] = {{ID = 28345, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 30}, {"QUESTS_ACTIVE", {30499}}}}},
	[59305] = {{ID = 40695, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30484}}}}},
	[56841] = {{ID = 40230, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30484}}}}},
	[56838] = {{ID = 40583, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30484}}}}},
	[56840] = {{ID = 40301, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30484}}}}},
	[64207] = {{ID = 28426, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 30}, {"QUESTS_ACTIVE", {30485}}}}},
	[59899] = {{ID = 29679, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 30}, {"QUESTS_ACTIVE", {30648}}}}},
	-- Valley of the Four Winds
	[56133] = {
		{ID = 40440, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29919}}}},
		{ID = 40423, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29952}}}},
		{ID = 39238, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30078}}}}
	},
	[56113] = {{ID = 40669, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29577}}}}},
	[56474] = {
		{ID = 40623, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30051}}}},
		{ID = 40622, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30172}}}}
	},
	[62377] = {
		{ID = 36036, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30053}}}},
		{ID = 36034, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30050}}}}
	},
	[62385] = {{ID = 35295, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30053}}}}},
	[57385] = {
		{ID = 40211, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30053}}}},
		{ID = 40209, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30052}}}}
	},
	[57123] = {{ID = 40362, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29982}}}}},
	[57124] = {{ID = 40362, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29982}}}}},
	[57126] = {{ID = 40473, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29982}}}}},
	[57127] = {{ID = 40261, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29982}}}}},
	[57121] = {{ID = 40474, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29982}}}}},
	[57122] = {{ID = 40508, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29982}}}}},
	[57120] = {
		{ID = 40360, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29982}}}},
		{ID = 40361, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29982}}}}
	},
	[56714] = {
		{ID = 41438, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29984}}}},
		{ID = 41439, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29987}}}},
		{ID = 41440, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29989}}}}
	},
	[58461] = {{ID = 40247, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30186}}}}},
	[59857] = {{ID = 39267, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30627}}}}},
	[56192] = {
		{ID = 40435, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29912}}}},
		{ID = 40431, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29912}}}},
		{ID = 40430, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {29912}}}}
	},
	-- Krasarang Wilds
	[58376] = {
		{ID = 40644, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30082}}}},
		{ID = 40648, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30082}}}}
	},
	[59151] = {{ID = 41038, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30178}}}}},
	[55597] = {{ID = 39799, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30347}}}}},
	[58547] = {{ID = 40208, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30269}}}}},
	[59653] = {{ID = 39489, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30273}}}}},
	[58976] = {{ID = 40353, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30359}}}}},
	-- Kun-Lai Summit
	[60980] = {{ID = 33096, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30881}}}}},
	[60979] = {{ID = 37429, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30881}}}}},
	[60997] = {{ID = 37075, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30883}}}}},
	[61004] = {{ID = 37431, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30907}}}}},
	[61006] = {{ID = 37430, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30907}}}}},
	[61007] = {{ID = 37432, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30907}}}}},
	[61566] = {{ID = 35732, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30967}}}}},
	[60973] = {{ID = 38108, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30480}}}}},
	[63754] = {{ID = 41284, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30512}}}}},
	[63542] = {{ID = 41467, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30512}}}}},
	[60189] = {{ID = 37051, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30682}}}}},
	[60190] = {{ID = 37052, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30682}}}}},
	[60187] = {{ID = 35293, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30682}}}}},
	[59818] = {
		{ID = 33656, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30601}}}},
		{ID = 33655, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30601}}}}
	},
	[60795] = {{ID = 40517, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30829}}}}},
	[61382] = {{ID = 30224, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30935}}}}},
	[61380] = {{ID = 30226, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30935}}}}},
	[61417] = {{ID = 38585, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30944}}}}},
	[61381] = {{ID = 38591, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30944}}}}},
	[62629] = {{ID = 40352, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30946}}}}},
	[60587] = {{ID = 34810, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30747}}}}},
	[61512] = {{ID = 29681, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30724}}}}},
	[61454] = {{ID = 30541, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30994}}}}},
	[61819] = {
		{ID = 29128, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30993}}}},
		{ID = 29129, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30993}}}}
	},
	[62220] = {{ID = 41432, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30752}}}}},
	[64848] = {{ID = 41177, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {31512}}}}},
	-- Townlong Steppes
	[60899] = {{ID = 32679, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30774}}}}},
	[60864] = {{ID = 37073, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30827}}}}},
	[60857] = {{ID = 35731, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30815}}}}},
	[61378] = {{ID = 40590, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30890}}}}},
	[61395] = {{ID = 37625, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30890}}}}},
	[61397] = {{ID = 37888, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30890}}}}},
	[61396] = {{ID = 37889, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {30890}}}}},
	-- Dread Wastes
	[62202] = {{ID = 35586, CanConfirm = false, Conditions = {{"LEVEL_LOWER", 30}, {"QUESTS_ACTIVE", {31006}}, {"QUEST_OBJECTIVES_INCOMPLETE", {31006,1}}}}},
	[62538] = {{ID = 35587, CanConfirm = true, Conditions = {{"LEVEL_LOWER", 30}, {"QUESTS_ACTIVE", {31007}}, {"QUEST_OBJECTIVES_INCOMPLETE", {31007,1}}}}},
	[63876] = {{ID = 28603, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {31091}}}}},
	[62667] = {{ID = 35828, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {31129}}}}},
	[62845] = {{ID = 35823, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {31129}}}}},
	[62666] = {{ID = 35825, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {31129}}}}},
	[62771] = {{ID = 40853, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {31084}}}}},
	[64259] = {{ID = 40852, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {31189}}}}},
	[62151] = {{ID = 33893, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {31211}}}}},
	[155707] = {{ID = 49933, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {56617}}}}},
	-- Vale of Eternal Blossoms
	[78709] = {
		{ID = 42526, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32806}}}},
		{ID = 42524, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32807}}}}
	},
	-- Landfall Campaign (Alliance)
	[67940] = {{ID = 121752, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32248}}}}},
	[68526] = {
		{ID = 41352, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32380}}}},
		{ID = 41353, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32381}}}},
		{ID = 41354, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32381}}}},
		{ID = 41355, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32381}}}}
	},
	[68539] = {{ID = 41359, CanConfirm = false, Conditions = {{"HAS_ITEM", {92977}}}}},
	[68537] = {{ID = 41404, CanConfirm = false, Conditions = {{"HAS_ITEM", {92975}}}}},
	[68540] = {{ID = 41361, CanConfirm = false, Conditions = {{"HAS_ITEM", {92976}}}}},
	[68741] = {
		{ID = 41244, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32382}}}},
		{ID = 41242, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32193}}}},
		{ID = 41241, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32315}}}},
		{ID = 41240, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32370}}}},
		{ID = 41239, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32393}}}},
		{ID = 41237, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32355}}}},
		{ID = 41236, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32400}}}}
	},
	[68108] = {
		{ID = 41503, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32362}}}},
		{ID = 40954, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32362}}}},
		{ID = 40956, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32362}}}}
	},
	[67848] = {{ID = 40720, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32414}}}}},
	[68651] = {{ID = 40723, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32460}}}}},
	[68687] = {{ID = 41763, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32423}}}}},
	[68004] = {
		{ID = 41051, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32321}}}},
		{ID = 41925, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32321}}}}
	},
	[68130] = {
		{ID = 41837, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32334}}}},
		{ID = 41838, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32334}}}}
	},
	[68545] = {{ID = 40881, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32336}}}}},
	-- Isle of Thunder Campaign (Alliance)
	[70360] = {{ID = 41772, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32681}}}}},
	[70370] = {{ID = 41766, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32644}}}}},
	[67992] = {
		{ID = 41768, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32654}}}},
		{ID = 41767, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32652}}}},
		{ID = 41765, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32656}}}}
	},
	[69949] = {{ID = 41587, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32654}}}}},
	[69810] = {{ID = 41898, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32652}}}}},
	[70297] = {{ID = 41662, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32655}}}}},
	[69615] = {{ID = 42150, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {32656}}}}},
	-- Timeless Isle
	[73306] = {{ID = 41556, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {33343}}, {"QUEST_OBJECTIVES_INCOMPLETE", {33343,1}}}}},
	-------------------------
	-- WARLORDS OF DRAENOR --
	-------------------------
	-- Introduction (Alliance)
	[150122] = {{ID = 50005, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {34398}}}}},
	[79243] = {{ID = 43035, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {34586}}}}},
	[84455] = {{ID = 42666, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {35176}}}}},
	[81441] = {{ID = 42677, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {35176}}}}},
	-- Introduction (Horde)
	-- Introduction (Neutral)
	[78423] = {{ID = 43231, CanConfirm = true, Conditions = {{"QUESTS_ACTIVE", {34398}}}}},
	[78556] = {{ID = 43152, CanConfirm = true, Conditions = {{"QUESTS_ACTIVE", {34423}}}}},
	[78568] = {{ID = 42452, CanConfirm = true, Conditions = {{"QUESTS_ACTIVE", {35747}}}}},
	-- Shadowmoon Valley
	[72871] = {{ID = 42039, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {33112}}}}},
	-- Gorgrond
	[81018] = {{ID = 42547, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {35050}}}}},
	[81013] = {{ID = 42546, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {35050}}}}},
	[81020] = {{ID = 42548, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {35050}}}}},
	[81074] = {{ID = 43219, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {35686}}}}},
	[81056] = {{ID = 43078, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {35665}}}}},
	[83569] = {{ID = 42758, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {36508}}}}},
	[81674] = {{ID = 42953, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {35128}}}}},
	[81213] = {{ID = 42653, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {36223}}}}},
	[83933] = {{ID = 42956, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {35139}}}}},
	--[[ 
	===============================================================================
								LEGION
	===============================================================================
	--]]
	-- Introduction (Alliance)
	[107934] = {{ID = 47484, CanConfirm = true, Conditions = {{"QUESTS_ACTIVE", {42782}}}}},
	-- Dalaran
	[99210] = {{ID = 44840, CanConfirm = false, Conditions = {}}},
	[99182] = {{ID = 44787, CanConfirm = false, Conditions = {}}},
	-- Demon Hunters
	[99914] = {{ID = 45047, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {40379}}}}},
	[99915] = {
		{ID = 45048, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38765}}}},
		{ID = 45101, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38765}}}}
	},
	[93693] = {{ID = 44410, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38813}}}}},
	[94435] = {{ID = 44865, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38813}}}}},
	[90247] = {{ID = 42930, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38813}}}}},
	[96436] = {{ID = 45064, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {39262}}}}},
	[96655] = {{ID = 44405, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {39516}}}}},
	[93127] = {{ID = 44408, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {39516}}}}},
	[99045] = {{ID = 44442, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {39516}}}}},
	[96420] = {{ID = 44440, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {39516}}}}},
	[96652] = {{ID = 44661, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {39516}}}}},
	[96653] = {{ID = 44646, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {39663}}}}},
	[97644] = {{ID = 44913, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {40373}}}}},
	[100429] = {{ID = 45043, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {44463}}}}},
	-- ===== Val'sharah =====
	[91462] = {{ID = 44675, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {40122}}}}},
	[108642] = {{ID = 45772, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {42751}}}}},
	[91109] = {{ID = 44789, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38377}}}}},
	[92742] = {{ID = 44776, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38595}}}}},
	[104739] = {{ID = 45498, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41708}}}}},
	[104799] = {{ID = 45380, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38743}}}}},
	-- ===== Storyline | Suramar | Masquerade =====
	[104998] = {
		{ID = 45205, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41762}}}},
		{ID = 45204, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41762}}}}
	},
	[105351] = {
		{ID = 45628, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41834}}}},
		{ID = 45629, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41834}}}},
		{ID = 45630, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41834}}}},
		{ID = 45631, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41834}}}},
		{ID = 45632, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41834}}}},
		{ID = 45633, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41834}}}},
		{ID = 45634, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41834}}}},
		{ID = 45381, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41834}}}},
		{ID = 45382, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41834}}}}
	},
	[105342] = {{ID = 45279, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41834}}}}},
	[114357] = {{ID = 45280, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {41989}}}}},
	[106495] = {{ID = 45323, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {42147}}}}},
	-- ===== Storyline | Legion | Imp Mother Challenge =====
	[92195] = {{ID = 44544, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {47055}}}}},
	[97331] = {{ID = 46833, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {47055}}}}},
	[96806] = {{ID = 46820, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {47055}}}}},
	[116714] = {{ID = 46671, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {45125}}}}},
	[118450] = {{ID = 47137, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {45917}}}}},
	-- ===== Storyline | Legion | God-Queen Challenge =====
	[119230] = {{ID = 47482, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {45482}}}}},
	[119232] = {{ID = 47483, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {45482}}}}},
	[119233] = {{ID = 46690, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {45482}}}}},
	[116568] = {
		{ID = 47302, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {45486}}}},
		{ID = 46830, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {45525}}}}
	},
	[117107] = {{ID = 46784, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {45486}}}}},
	-- ===== Storyline | The Broken Shore | Legionfall Campaign =====
	[120215] = {{ID = 47270, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {46734}}}}},
	-- ===== Storyline | Legion: Professions | Enchanting =====
	[98683] = {{ID = 44228, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {40130}}}}},
	-- ===== Storyline | Legion: Professions | Tailoring =====
	[93524] = {{ID = 44588, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38950}}}}},
	[93526] = {{ID = 44590, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38952}}}}},
	[93967] = {
		{ID = 44594, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38954}}}},
		{ID = 44595, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38956}}}}
	},
	[92456] = {{ID = 44234, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38964}}}}},
	[96347] = {{ID = 44284, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {39602}}}}},
	[92183] = {{ID = 44456, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38966}}}}},
	[242641] = {
		{ID = 44868, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38966}}}},
		{ID = 44869, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38966}}}}
	},
	[94242] = {
		{ID = 44793, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38970}}}},
		{ID = 44794, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38970}}}},
		{ID = 44844, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {38970}}}}
	},
	-- ===== Storyline | Legion: Class Halls | Mage =====
	[102700] = {{ID = 45566, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {42452}}}}},
	[107622] = {{ID = 45770, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {42455}}}}},
	[107716] = {
		{ID = 45996, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {42477}}}},
		{ID = 45997, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {42477}}}},
		{ID = 45998, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {42477}}}}
	},
	[96813] = {{ID = 44179, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {42479}}}}},
	-------------------------
	-- SHADOWLANDS ----------
	-------------------------
	-- Exile's Reach
	[153211] = {{ID = 49526, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {55763}}}}},
	[162998] = {
		{ID = 51269, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {58923}}}},
		{ID = 51271, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {58923}}}}
	},
	[156943] = {{ID = 50819, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {55981}}}}},
	[161350] = {{ID = 51352, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {55992}}}}},
	[154169] = {{ID = 51396, CanConfirm = false, Conditions = {}}},
	[162943] = {
		{ID = 51265, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {58915}}}},
		{ID = 51265, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59972}}}}
	},
	[156886] = {
		{ID = 51802, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59354}}}},
		{ID = 51803, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59355}}}}
	},
	[161666] = {
		{ID = 49525, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {60168}}}},
		{ID = 49523, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {60168}}, {"QUEST_OBJECTIVES_INCOMPLETE", {60168,3}}}}
	},
	[164835] = {{ID = 51237, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59347}}}}},
	[162972] = {
		{ID = 51266, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {58917}}}},
		{ID = 51267, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {58917}}}}
	},
	[163209] = {{ID = 51202, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {58962}}}}},
	[167298] = {{ID = 52949, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59944}}}}},
	[167179] = {
		{ID = 52641, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59958}}}},
		{ID = 52643, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59958}}}}
	},
	[167598] = {{ID = 54297, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59978}}}}},
	[167663] = {{ID = 52784, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59984}}}}},
	[168431] = {{ID = 51745, CanConfirm = false, Conditions = {}}},
	[167309] = {
		{ID = 52664, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59952}}}},
		{ID = 52665, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59955}}}}
	},
	[167215] = {
		{ID = 52668, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {60162}}}},
		{ID = 52666, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {60162}}, {"QUEST_OBJECTIVES_INCOMPLETE", {60162,3}}}}
	},
	[167184] = {
		{ID = 52644, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59967}}}},
		{ID = 52645, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59967}}}}
	},
	[167537] = {{ID = 52640, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59956}}}}},
	[167478] = {{ID = 52639, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {59970}}}}},
	-------------------------
	-- DRAGONFLIGHT ---------
	-------------------------
	-- Introduction (Alliance)
	[189569] = {{ID = 55659, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66577}}}}},
	[198401] = {{ID = 107417, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66589}}}}},
	[189767] = {{ID = 55651, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66589}}}}},
	[189765] = {{ID = 55650, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66589}}}}},
	[189763] = {{ID = 55649, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66589}}}}},
	[193450] = {{ID = 55739, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66596}}}}},
	-- The Waking Shores
	[193362] = {
		{ID = 55636, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {70125}}}},
		{ID = 55637, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {69912}}}}
	},
	[193393] = {{ID = 55674, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {69911}}}}},
	[193372] = {{ID = 55872, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {69914}}}}},
	[193363] = {{ID = 55900, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65760}}}}},
	[378435] = {
		{ID = 55746, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {69911}}}},
		{ID = 55757, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {69911}}}},
		{ID = 55762, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {69911}}}},
		{ID = 55773, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {69911}}}}
	},
	[190564] = {{ID = 55298, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65992}}}}},
	[190563] = {{ID = 55297, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65992}}}}},
	[188299] = {{ID = 55335, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65992}}}}},
	[187406] = {{ID = 55225, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65997}}}}},
	[190269] = {{ID = 55259, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66001}}}}},
	[186795] = {{ID = 54941, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66114}}}}},
	[187290] = {{ID = 107094, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66114}}}}},
	[189261] = {{ID = 55288, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66115}}}}},
	[189262] = {{ID = 55289, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66115}}}}},
	[193287] = {{ID = 55643, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {68795}}}}},
	[192574] = {
		{ID = 55059, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {67100}}}},
		{ID = 55062, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {67100}}}},
		{ID = 55066, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {67100}}}}
	},
	[194076] = {{ID = 63862, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {70132}}}}},
	[198040] = {{ID = 107284, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {68796}}}}},
	[193364] = {{ID = 55584, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {68798}}, {"QUEST_OBJECTIVES_INCOMPLETE", {68798,2}}}}},
	[189089] = {{ID = 54942, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66435}}}}},
	[190334] = {{ID = 55167, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66438}}}}},
	[190423] = {{ID = 55168, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66438}}}}},
	[190352] = {{ID = 54908, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66442}}}}},
	[185904] = {{ID = 55258, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66115}}}}},
	[189260] = {{ID = 55290, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66115}}}}},
	[187278] = {{ID = 107159, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66124}}}}},
	[192795] = {{ID = 107399, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {72241}}, {"QUEST_OBJECTIVES_INCOMPLETE", {72241,1}}}}},
	[186331] = {{ID = 55311, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66048}}}}},
	[186493] = {
		{ID = 55309, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66048}}}},
		{ID = 55310, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66048}}}}
	},
	[187466] = {{ID = 55307, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66048}}}}},
	[187187] = {{ID = 54628, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66078}}, {"QUEST_OBJECTIVES_INCOMPLETE", {66078,1}}}}},
	[187189] = {{ID = 54628, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66078}}, {"QUEST_OBJECTIVES_INCOMPLETE", {66078,1}}}}},
	[189507] = {{ID = 54996, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66048}}}}},
	[186681] = {{ID = 55405, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65939}}}}},
	[186933] = {{ID = 54627, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66044}}}}},
	[217220] = {
		{ID = 120740, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65118}}}},
		{ID = 120741, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65120}}}},
		{ID = 120742, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65133}}}},
		{ID = 120770, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77345}}}},
		{ID = 120773, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {68796}}}}
	},
	[187393] = {{ID = 54942, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66435}}}}},
	-- Valdrakken
	[214051] = {{ID = 120505, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78865}}}}},
	-- Tyr's Fall Questline
	[200078] = {
		{ID = 108977, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {72443}}}},
		{ID = 108976, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {72443}}}}
	},
	-- In the Halls of Titans Questline
	[191853] = {{ID = 55194, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {66174}}}}},
	-- Bronze Reconciliation Questline
	[205882] = {{ID = 110335, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77417}}}}},
	[207634] = {
		{ID = 110339, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {76407}}}},
		{ID = 110477, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {76421}}}}
	},
	[208035] = {{ID = 110423, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {76422}}}}},
	-- Reforging the Tyr's Guard Questline
	[204576] = {{ID = 110100, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {75633}}}}},
	[204538] = {{ID = 110602, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {76171}}}}},
	[204539] = {{ID = 110608, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {76171}}}}},
	[204541] = {{ID = 110597, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {76171}}}}},
	[204540] = {{ID = 110599, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {76171}}}}},
	[205837] = {{ID = 110380, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {75952}}}}},
	[205878] = {{ID = 110333, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {75951}}}}},
	[206124] = {{ID = 110080, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {75953}}}}},
	[204602] = {{ID = 110145, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {75635}}}}},
	[204599] = {{ID = 110194, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {75637}}}}},
	-- Tyr's Return Questline
	[208707] = {
		{ID = 110939, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77340}}}},
		{ID = 111128, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77340}}}}
	},
	[208705] = {{ID = 111124, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77340}}}}},
	[208706] = {{ID = 111125, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77340}}}}},
	[208709] = {{ID = 111127, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77340}}}}},
	[208796] = {{ID = 111046, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77344}}}}},
	[208839] = {{ID = 111059, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77344}}}}},
	[209890] = {{ID = 111070, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77341}}}}},
	-- Reconciliation Questline
	[207888] = {{ID = 110909, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77340}}}}},
	-- Azerothian Archives Questline
	[209192] = {
		{ID = 120339, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79223}}}},
		{ID = 120371, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77331}}}}
	},
	[208362] = {{ID = 110629, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77100}}}}},
	[208398] = {{ID = 110763, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77151}}}}},
	[200010] = {{ID = 110789, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77154}}}}},
	[205413] = {{ID = 110375, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {76026}}}}},
	[208055] = {{ID = 110432, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {76032}}}}},
	[204215] = {{ID = 110787, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {75604}}}}},
	[215736] = {{ID = 120336, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {75604}}}}},
	[208167] = {{ID = 120351, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77331}}}}},
	[208355] = {{ID = 120361, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77331}}}}},
	[208614] = {{ID = 120366, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77331}}}}},
	[206107] = {{ID = 120356, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {77331}}}}},
	-- The Harbinger Questline
	[214615] = {{ID = 120217, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79009}}}}},
	[215142] = {{ID = 120247, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79011}}}}},
	[215157] = {{ID = 120248, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79011}}}}},
	[215158] = {{ID = 120249, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79011}}}}},
	[214657] = {{ID = 120568, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79021}}}}},
	-- Evokers
	[182317] = {{ID = 54978, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65060}}}}},
	[184165] = {{ID = 51921, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65071}}}}},
	[182258] = {{ID = 55597, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65071}}}}},
	[182610] = {{ID = 51849, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65100}}}}},
	[182611] = {{ID = 51850, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {65100}}}}},
	--[[ 
	===============================================================================
								KHAZ ALGAR
	===============================================================================
	--]]
	-- ===== The War Within Questline =====
	[213624] = {{ID = 120882, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78715}}}}},
	[214669] = {{ID = 121542, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80500}}}}},
	[213627] = {
		{ID = 121395, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78717}}}},
		{ID = 120143, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78722}}}}
	},
	[220018] = {{ID = 121860, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78721}}}}},
	[219956] = {{ID = 124153, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80321}}}}},
	-- ===============================================================================
	-- ===== Isle of Dorn =====
	[219757] = {{ID = 121391, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78536}}}}},
	[219014] = {{ID = 122786, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78457}}, {"QUEST_OBJECTIVES_INCOMPLETE", {78457,1}}}}},
	[212369] = {{ID = 120909, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78457}}, {"QUEST_OBJECTIVES_INCOMPLETE", {78457,2}}}}},
	[212370] = {
		{ID = 120913, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78457}}, {"QUEST_OBJECTIVES_INCOMPLETE", {78457,3}}}},
		{ID = 121503, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79545}}, {"QUEST_OBJECTIVES_INCOMPLETE", {79545,2}}}}
	},
	[206017] = {
		{ID = 122129, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78457}}, {"QUEST_OBJECTIVES_INCOMPLETE", {78457,4}}}},
		{ID = 121598, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81510}}}}
	},
	[223652] = {{ID = 122467, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82441}}}}},
	[223648] = {{ID = 122466, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82441}}}}},
	[214459] = {{ID = 120276, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78996}}}}},
	[223649] = {{ID = 122463, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82441}}}}},
	[217879] = {{ID = 122307, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78461}}}}},
	[214460] = {{ID = 120275, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78996}}}}},
	[223858] = {{ID = 122660, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78464}}, {"QUEST_OBJECTIVES_INCOMPLETE", {78464,3}}}}},
	[216094] = {{ID = 121126, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78469}}}}},
	[214462] = {{ID = 120267, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78996}}}}},
	[214461] = {{ID = 120274, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78996}}}}},
	[214463] = {{ID = 120277, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78996}}}}},
	[213030] = {
		{ID = 120958, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78464}}}},
		{ID = 120969, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78464}}}}
	},
	[433930] = {{ID = 121546, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78469}}}}},
	[433929] = {{ID = 121673, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78469}}}}},
	[433922] = {{ID = 121544, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78469}}}}},
	[223923] = {{ID = 122493, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82465}}}}},
	[216109] = {{ID = 120682, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78462}}}}},
	[216111] = {{ID = 120684, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78462}}}}},
	[226838] = {{ID = 123365, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82800}}}}},
	[222177] = {{ID = 122130, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80022}}}}},
	[222555] = {{ID = 122154, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78539}}}}},
	[214292] = {{ID = 120867, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78749}}}}},
	[216169] = {{ID = 120605, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79336}}}}},
	[216171] = {
		{ID = 120893, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79338}}}},
		{ID = 120892, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79338}}}}
	},
	[216174] = {{ID = 120638, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79342}}}}},
	[224948] = {{ID = 122723, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82895}}}}},
	[214921] = {{ID = 120785, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78758}}}}},
	[212756] = {
		{ID = 120672, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78544}}}},
		{ID = 120678, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78544}}}}
	},
	[222260] = {{ID = 122511, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80209}}}}},
	[222259] = {{ID = 123322, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80209}}}}},
	[222263] = {{ID = 122512, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80209}}}}},
	[430152] = {{ID = 122552, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80211}}}}},
	[449449] = {{ID = 122553, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80211}}}}},
	[222338] = {{ID = 122554, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80211}}}}},
	[217883] = {{ID = 122368, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78546}}}}},
	[217880] = {{ID = 120762, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78546}}}}},
	[217069] = {{ID = 121397, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79542}}}}},
	[217863] = {
		{ID = 121100, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79728}}}},
		{ID = 121103, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79728}}}}
	},
	[219431] = {{ID = 121217, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79543}}}}},
	[217080] = {{ID = 121218, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79543}}}}},
	[217081] = {
		{ID = 121219, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79543}}}},
		{ID = 121405, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79543}}}}
	},
	[217072] = {
		{ID = 121407, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79544}}}},
		{ID = 121412, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79544}}}},
		{ID = 122742, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79176}}}}
	},
	[217091] = {
		{ID = 121505, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79545}}}},
		{ID = 121504, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79545}}}}
	},
	[217090] = {{ID = 121507, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79545}}}}},
	[433720] = {
		{ID = 121512, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79545}}}},
		{ID = 123981, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79545}}}},
		{ID = 121518, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79545}}}},
		{ID = 121521, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79545}}}}
	},
	[217088] = {
		{ID = 121452, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79545}}}},
		{ID = 121528, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79545}}}},
		{ID = 121547, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79545}}}}
	},
	[220564] = {{ID = 121576, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79546}}}}},
	[217082] = {{ID = 121577, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79546}}}}},
	[212407] = {{ID = 120273, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78464}}, {"QUEST_OBJECTIVES_INCOMPLETE", {78464,5}}}}},
	-- ===============================================================================
	-- ===== The Ringing Deeps =====
	[212592] = {{ID = 122955, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78837}}}}},
	[215563] = {{ID = 121192, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78838}}}}},
	[213875] = {{ID = 121195, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78838}}}}},
	[213869] = {{ID = 121196, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78838}}}}},
	[212839] = {{ID = 120320, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78631}}}}},
	[212991] = {{ID = 119957, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78642}}}}},
	[216103] = {{ID = 119961, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78642}}}}},
	[219158] = {{ID = 121184, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80079}}}}},
	[219155] = {{ID = 121181, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80079}}}}},
	[218724] = {{ID = 121038, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80079}}}}},
	[218722] = {{ID = 121182, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80079}}}}},
	[213633] = {{ID = 123513, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78697}}}}},
	[213674] = {{ID = 121209, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78741}}}}},
	[213673] = {{ID = 121212, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78741}}}}},
	[213763] = {{ID = 120506, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78760}}}}},
	[216600] = {{ID = 121058, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79556}}}}},
	[218474] = {{ID = 120927, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79681}}}}},
	[216438] = {
		{ID = 121559, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79504}}}},
		{ID = 121585, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79505}}}},
		{ID = 121599, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79507}}}},
		{ID = 121622, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79508}}}},
		{ID = 121650, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79510}}}}
	},
	[212695] = {{ID = 120147, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78564}}}}},
	[217722] = {
		{ID = 121379, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79565}}}},
		{ID = 121378, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79565}}}}
	},
	[213840] = {
		{ID = 121380, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79565}}}},
		{ID = 121385, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79565}}}},
		{ID = 121384, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79565}}}},
		{ID = 122864, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78874}}}}
	},
	[219705] = {
		{ID = 121387, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79565}}}},
		{ID = 121386, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79565}}}}
	},
	[217730] = {
		{ID = 121389, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79565}}}},
		{ID = 121388, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79565}}}}
	},
	[213841] = {{ID = 121390, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79565}}}}},
	[224602] = {{ID = 122684, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82990}}}}},
	[216164] = {
		{ID = 123847, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79343}}, {"QUEST_OBJECTIVES_INCOMPLETE", {79343,1}}}},
		{ID = 124026, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79343}}, {"QUEST_OBJECTIVES_INCOMPLETE", {79343,3}}}}
	},
	[215737] = {{ID = 121187, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79371}}}}},
	[222234] = {{ID = 121872, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80509}}, {"QUEST_OBJECTIVES_COMPLETE", {80509,1}}}}},
	[223730] = {{ID = 121909, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80514}}}}},
	[221011] = {
		{ID = 122206, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80578}}}},
		{ID = 122203, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80578}}}}
	},
	[220597] = {{ID = 122201, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80682}}}}},
	[219477] = {{ID = 121524, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79530}}}}},
	-- ===============================================================================
	-- ===== Hallowfall =====
	[217826] = {{ID = 120738, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78671}}}}},
	[214407] = {{ID = 121725, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78937}}}}},
	[221411] = {{ID = 121757, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78939}}}}},
	[214404] = {
		{ID = 120685, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78939}}}},
		{ID = 120602, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78954}}}}
	},
	[213749] = {{ID = 120326, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78690}}}}},
	[213748] = {{ID = 120326, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78690}}}}},
	[213745] = {{ID = 120327, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78690}}}}},
	[213836] = {{ID = 120323, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78690}}}}},
	[215667] = {{ID = 120328, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78692}}}}},
	[215666] = {{ID = 120328, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78692}}}}},
	[213614] = {{ID = 120324, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78695}}}}},
	[217642] = {{ID = 122686, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78613}}, {"QUEST_OBJECTIVES_INCOMPLETE", {78613,2}}}}},
	[215727] = {{ID = 120333, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78626}}}}},
	[214429] = {{ID = 120333, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78626}}}}},
	[219963] = {{ID = 121459, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78614}}}}},
	[223365] = {{ID = 122367, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78614}}}}},
	[223408] = {{ID = 122374, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78614}}}}},
	[218515] = {{ID = 120932, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78614}}}}},
	[214402] = {{ID = 121810, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78624}}}}},
	[225188] = {{ID = 122699, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80049}}, {"QUEST_OBJECTIVES_INCOMPLETE", {80049, 3}}}}},
	[214362] = {{ID = 122705, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80049}}}}},
	[213107] = {{ID = 121683, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80049}}}}},
	[225226] = {
		{ID = 122721, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80049}}}},
		{ID = 122713, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80049}}}},
		{ID = 122718, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80049}}}},
		{ID = 122712, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80049}}}},
		{ID = 122719, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80049}}}}
	},
	[218062] = {{ID = 120791, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79151}}}}},
	[213145] = {{ID = 122432, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82216}}}}},
	[445190] = {
		{ID = 122415, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82216}}}},
		{ID = 122428, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82216}}}},
		{ID = 122426, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82216}}}},
		{ID = 122421, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82216}}}}
	},
	[215301] = {{ID = 120554, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79159}}}}},
	[213286] = {{ID = 120658, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78629}}}}},
	[221530] = {{ID = 121794, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79646}}}}},
	[217424] = {{ID = 121923, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79647}}}}},
	[217434] = {{ID = 121830, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79649}}}}},
	[217464] = {{ID = 121830, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79649}}}}},
	[217452] = {{ID = 121830, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79649}}}}},
	[216313] = {{ID = 122775, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79300}}}}},
	[216316] = {{ID = 122777, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79300}}}}},
	[216011] = {{ID = 122778, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79300}}}}},
	[216314] = {{ID = 122830, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79300}}}}},
	[216014] = {{ID = 122835, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79301}}}}},
	[225927] = {{ID = 122848, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79303}}}}},
	[226082] = {{ID = 122873, CanConfirm = true, Conditions = {{"QUESTS_ACTIVE", {79303}}}}},
	[223193] = {{ID = 122456, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82217}}}}},
	[223194] = {
		{ID = 122461, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82217}}}},
		{ID = 122465, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82217}}}}
	},
	[213613] = {
		{ID = 122576, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82479}}}},
		{ID = 122578, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82479}}}},
		{ID = 122584, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82479}}}},
		{ID = 122588, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82479}}}},
		{ID = 122592, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82479}}}},
		{ID = 122596, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82479}}}},
		{ID = 122597, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82479}}}}
	},
	[224380] = {{ID = 122601, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82480}}}}},
	[219173] = {{ID = 122070, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80178}}}}},
	[219189] = {{ID = 122071, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80179}}}}},
	[215335] = {{ID = 122492, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79650}}}}},
	[215527] = {{ID = 121756, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81673}}}}},
	[224154] = {{ID = 122519, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82222}}}}},
	[224237] = {{ID = 122559, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82222}}}}},
	[452434] = {{ID = 122764, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82223}}}}},
	[223267] = {
		{ID = 123086, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82223}}}},
		{ID = 123085, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82223}}}}
	},
	[224338] = {{ID = 123084, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82223}}}}},
	[223258] = {
		{ID = 123082, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82223}}}},
		{ID = 123081, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82223}}}}
	},
	[215331] = {{ID = 120709, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79165}}}}},
	[217813] = {{ID = 120737, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79167}}}}},
	[217830] = {{ID = 120739, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79167}}}}},
	[217831] = {{ID = 120740, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79167}}}}},
	[217808] = {{ID = 120735, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79167}}}}},
	[215333] = {{ID = 120755, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79168}}}}},
	[218267] = {{ID = 120750, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79168}}}}},
	-- ===============================================================================
	-- ===== Azj-Kahet =====
	[219109] = {{ID = 121150, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79139}}}}},
	[207471] = {
		{ID = 122860, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78392}}, {"QUEST_OBJECTIVES_INCOMPLETE", {78392,1}}}},
		{ID = 122859, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78392}}, {"QUEST_OBJECTIVES_INCOMPLETE", {78392,2}}}},
		{ID = 122858, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78392}}, {"QUEST_OBJECTIVES_INCOMPLETE", {78392,3}}}},
		{ID = 122863, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78392}}, {"QUEST_OBJECTIVES_INCOMPLETE", {78392,4}}}},
		{ID = 120666, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78248}}}},
		{ID = 123526, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {84022}}}},
		{ID = 121590, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79244}}}}
	},
	[224734] = {{ID = 124125, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {84682}}}}},
	[211409] = {
		{ID = 122308, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81929}}}},
		{ID = 122311, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81929}}}}
	},
	[220051] = {{ID = 121919, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78236}}}}},
	[219156] = {{ID = 121784, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79625}}}}},
	[221757] = {
		{ID = 121832, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78251}}}},
		{ID = 121834, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78251}}}}
	},
	[221806] = {
		{ID = 121832, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78251}}}},
		{ID = 121834, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78251}}}},
		{ID = 121833, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78251}}}}
	},
	[221722] = {{ID = 121812, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78251}}}}},
	[215413] = {{ID = 121494, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78255}}}}},
	[215419] = {{ID = 120311, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78255}}}}},
	[211499] = {{ID = 121538, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78228}}}}},
	[222139] = {
		{ID = 120653, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78231}}}},
		{ID = 120657, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78231}}}}
	},
	[217386] = {{ID = 120665, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78244}}}}},
	[217958] = {
		{ID = 123219, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83628}}}},
		{ID = 123220, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83628}}}}
	},
	[215724] = {
		{ID = 123221, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83628}}}},
		{ID = 123222, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83628}}}}
	},
	[227222] = {
		{ID = 123232, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83639}}}},
		{ID = 123233, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83639}}}}
	},
	[227185] = {{ID = 123235, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83639}}}}},
	[224733] = {{ID = 124127, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {84682}}}}},
	[224729] = {{ID = 124123, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {84682}}}}},
	[220867] = {{ID = 124129, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {84682}}}}},
	[228184] = {{ID = 123902, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {84664}}}}},
	[223353] = {
		{ID = 122364, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81964}}}},
		{ID = 122369, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81964}}}},
		{ID = 122370, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81964}}}}
	},
	[223507] = {{ID = 122400, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81969}}}}},
	[220584] = {{ID = 121582, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80558}}}}},
	[220583] = {{ID = 121581, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80558}}}}},
	[217402] = {{ID = 121583, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80558}}}}},
	[216994] = {{ID = 121584, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80558}}}}},
	[214360] = {{ID = 120647, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79122}}}}},
	[219057] = {{ID = 121154, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79122}}}}},
	[219058] = {{ID = 121156, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79122}}}}},
	[219059] = {{ID = 121160, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79122}}}}},
	[219062] = {{ID = 121162, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79122}}}}},
	[219061] = {{ID = 121164, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79122}}}}},
	[219060] = {{ID = 121158, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79122}}}}},
	[217250] = {{ID = 120644, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79123}}}}},
	[224352] = {
		{ID = 122840, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82340}}}},
		{ID = 122844, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82340}}}},
		{ID = 122846, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82340}}}}
	},
	[217355] = {
		{ID = 123185, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79630}}}},
		{ID = 121589, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79631}}}}
	},
	[222063] = {{ID = 122159, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81928}}}}},
	[222064] = {{ID = 122259, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81928}}}}},
	[222065] = {{ID = 122264, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81928}}}}},
	[223173] = {{ID = 122341, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81963}}}}},
	[223174] = {{ID = 122343, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81963}}}}},
	[223175] = {{ID = 122345, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81963}}}}},
	[221557] = {{ID = 122668, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83616}}}}},
	[221550] = {{ID = 122758, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81667}}}}},
	[220608] = {{ID = 123210, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80565}}}}},
	[219375] = {{ID = 121667, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80203}}}}},
	[219496] = {{ID = 122623, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80203}}}}},
	[219373] = {{ID = 121666, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80203}}}}},
	[221695] = {{ID = 122622, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80203}}}}},
	[219374] = {{ID = 121668, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80203}}}}},
	[221697] = {{ID = 122624, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80203}}}}},
	[219372] = {{ID = 121669, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80203}}}}},
	[221094] = {{ID = 121776, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80205}}}}},
	-- ===============================================================================
	-- ===== Storyline | The War Within | Against the Current =====
	[216149] = {{ID = 121591, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79333}}}}},
	[220963] = {{ID = 122277, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82153}}}}},
	[221143] = {
		{ID = 121721, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82153}}}},
		{ID = 122284, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {82153}}}}
	},
	[217859] = {{ID = 122851, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83271}}}}},
	[453194] = {{ID = 122852, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83271}}}}},
	[453366] = {{ID = 122926, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83286}}}}},
	-- ===============================================================================
	-- ===== Storyline | The War Within | Ties That Bind =====
	[214965] = {
		{ID = 121930, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79107}}}},
		{ID = 121932, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79107}}}}
	},
	[214966] = {
		{ID = 121936, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79107}}}},
		{ID = 121948, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79107}}}}
	},
	[214964] = {
		{ID = 121935, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79107}}}},
		{ID = 121945, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79107}}}}
	},
	[220669] = {
		{ID = 121937, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79107}}}},
		{ID = 121938, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79107}}}}
	},
	[222279] = {{ID = 122017, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83286}}}}},
	[215126] = {{ID = 122193, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79124}}}}},
	[215125] = {{ID = 122190, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79124}}}}},
	[215127] = {{ID = 122144, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79124}}}}},
	[222716] = {{ID = 122158, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79124}}}}},
	[215039] = {{ID = 120784, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79129}}}}},
	[218118] = {{ID = 120807, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79140}}}}},
	[218745] = {{ID = 120979, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79477}}}}},
	[218744] = {{ID = 120968, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79477}}}}},
	[218743] = {{ID = 120977, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79477}}}}},
	[217835] = {{ID = 121165, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79147}}}}},
	[223762] = {{ID = 121199, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81912}}}}},
	[223763] = {{ID = 121198, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81913}}}}},
	[214916] = {{ID = 121537, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79156}}}}},
	[223764] = {{ID = 121565, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79157}}}}},
	-- ===============================================================================
	-- ===== Storyline | The War Within | The Machines March to War =====
	[214664] = {
		{ID = 120642, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79023}}}},
		{ID = 121305, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79024}}}}
	},
	[230643] = {{ID = 121561, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {80145}}}}},
	[220896] = {{ID = 121606, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79029}}}}},
	-- ===============================================================================
	-- ===== Storyline | The War Within | A Light in the Dark =====
	[214273] = {{ID = 122377, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {78948}}}}},
	[220641] = {{ID = 123406, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83503}}}}},
	[226362] = {{ID = 123407, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {83503}}}}},
	-- ===============================================================================
	--[[
	===============================================================================
								DELVES
	===============================================================================
	--]]
	-- ===== Earthcrawl Mines =====
	[215685] = {
		{ID = 120330, CanConfirm = false, Conditions = {}},
		{ID = 120383, CanConfirm = false, Conditions = {}}
	},
	-- ===== Fungal Folly =====
	[210677] = {{ID = 111366, CanConfirm = false, Conditions = {}}},
	[211061] = {{ID = 113928, CanConfirm = false, Conditions = {}}},
	[211060] = {{ID = 113929, CanConfirm = false, Conditions = {}}},
	[211027] = {{ID = 113937, CanConfirm = false, Conditions = {}}},
	[211028] = {{ID = 113939, CanConfirm = false, Conditions = {}}},
	[211062] = {{ID = 113941, CanConfirm = false, Conditions = {}}},
	-- ===== Kriegval's Rest =====
	[213447] = {{ID = 119802, CanConfirm = false, Conditions = {}}},
	[213775] = {{ID = 119930, CanConfirm = false, Conditions = {}}},
	-- ===== The Waterworks =====
	[214143] = {
		{ID = 120018, CanConfirm = false, Conditions = {}},
		{ID = 120096, CanConfirm = false, Conditions = {}}
	},
	[214290] = {
		{ID = 120081, CanConfirm = false, Conditions = {}},
		{ID = 120082, CanConfirm = false, Conditions = {}}
	},
	-- ===== The Dread Pit =====
	[219680] = {
		{ID = 121508, CanConfirm = false, Conditions = {}},
		{ID = 123392, CanConfirm = false, Conditions = {}}
	},
	[220181] = {{ID = 121526, CanConfirm = false, Conditions = {}}},
	-- ===== Mycomancer Cavern =====
	[220354] = {
		{ID = 121540, CanConfirm = false, Conditions = {}},
		{ID = 121541, CanConfirm = false, Conditions = {}}
	},
	[220293] = {{ID = 121536, CanConfirm = false, Conditions = {}}},
	-- ===== The Sinkhole =====
	[220565] = {{ID = 121578, CanConfirm = false, Conditions = {}}},
	-- ===== Skittering Breach =====
	[220585] = {{ID = 121408, CanConfirm = false, Conditions = {}}},
	-- ===== Storyline | Delves: Season 1 =====
	[226763] = {{ID = 123080, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {81596}}}}},
	--[[
	===============================================================================
								ALLIED RACES
	===============================================================================
	--]]
	-- ===== Earthen =====
	-- Starter
	[224809] = {
		{ID = 122137, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79201}}}},
		{ID = 122179, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79201}}}},
		{ID = 123625, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79201}}}}
	},
	[224797] = {
		{ID = 122312, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79201}}}},
		{ID = 122199, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79201}}}},
		{ID = 123793, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79201}}}}
	},
	[224810] = {
		{ID = 122313, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79201}}}},
		{ID = 122219, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79201}}}},
		{ID = 124010, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79201}}}}
	},
	[227273] = {{ID = 122263, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79202}}}}},
	[221912] = {{ID = 122263, CanConfirm = false, Conditions = {{"QUESTS_ACTIVE", {79202}}}}},
	-- Heritage
	-- ===============================================================================
}