local LHMP = LibStub("LibHelpMePlay")
if not LHMP then
    return false
end

-- This table is currently only used for the NPCs involved in the
-- "A Perfect Match" quest in Pearlfin Village in The Jade Forest.
--
-- It may get used elsewhere later on.
LHMP.GossipTextLookupByNPC = {
    [54959] = {40054},
    [56585] = {40057},
    [56591] = {40056, 40060},
    [56592] = {40154}
}

LHMP.Gossips = {
    -- Non-NPC Gossips
    [0] = {
        {ID = 33294, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31130"}},
        {ID = 40006, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29743"}},
        {ID = 39082, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29743"}},
        {ID = 39808, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29743"}},
        {ID = 39083, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29743"}},
    },
    -- Exile's Reach
    [153211] = {{ID = 49526, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 55763"}}},
    [162998] = {
        {ID = 51269, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 58923"}},
        {ID = 51271, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 58923"}}
    },
    [156943] = {{ID = 50819, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 55981"}}},
    [161350] = {{ID = 51352, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 55992"}}},
    [154169] = {{ID = 51396, CanConfirm = false, Conditions = {"NONE = NONE"}}},
    [162943] = {
        {ID = 51265, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 58915"}},
        {ID = 51265, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59972"}}
    },
    [156886] = {
        {ID = 51802, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59354"}},
        {ID = 51803, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59355"}}
    },
    [161666] = {
        {ID = 49525, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 60168"}},
        {ID = 49523, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 60168", "QUEST_OBJECTIVE_INCOMPLETE = 60168,3"}}
    },
    [164835] = {{ID = 51237, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59347"}}},
    [162972] = {
        {ID = 51266, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 58917"}},
        {ID = 51267, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 58917"}}
    },
    [163209] = {{ID = 51202, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 58962"}}},
    [167298] = {{ID = 52949, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59944"}}},
    [167179] = {
        {ID = 52641, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59958"}},
        {ID = 52643, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59958"}}
    },
    [167598] = {{ID = 54297, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59978"}}},
    [167663] = {{ID = 52784, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59984"}}},
    [168431] = {{ID = 51745, CanConfirm = false, Conditions = {"NONE = NONE"}}},
    [167309] = {
        {ID = 52664, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59952"}},
        {ID = 52665, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59955"}}
    },
    [167215] = {
        {ID = 52668, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 60162"}},
        {ID = 52666, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 60162", "QUEST_OBJECTIVE_INCOMPLETE = 60162,3"}}
    },
    [167184] = {
        {ID = 52644, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59967"}},
        {ID = 52645, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59967"}}
    },
    [167537] = {{ID = 52640, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59956"}}},
    [167478] = {{ID = 52639, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59970"}}},
    -- Death Knights
    [28406] = {{ID = 37188, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 12733"}}},
    [29173] = {{ID = 36227, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 12801"}}},
    -- Pandaria: Remix
    [216591] = {{ID = 120607, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 79432"}}},
    [217538] = {{ID = 120604, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 79440"}}},
    -- Pandaria: Alliance Intro
    -- Pandaria: Horde Intro
    [3310] = {{ID = 30402, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31853", "QUEST_OBJECTIVE_INCOMPLETE = 31853,1", "LEVEL_LOWER = 30"}}},
    [55054] = {{ID = 41023, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29690"}}},
    -- Pandaria
    [62202] = {
        {
            ID = 35586,
            CanConfirm = false,
            Conditions = {"QUEST_ACTIVE = 31006", "QUEST_OBJECTIVE_INCOMPLETE = 31006,1", "LEVEL_LOWER = 30"}
        }
    },
    [62538] = {
        {
            ID = 35587,
            CanConfirm = true,
            Conditions = {"QUEST_ACTIVE = 31007", "QUEST_OBJECTIVE_INCOMPLETE = 31007,1", "LEVEL_LOWER = 30"}
        }
    },
    [63876] = {{ID = 28603, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31091"}}},
    [62667] = {{ID = 35828, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31129"}}},
    [62845] = {{ID = 35823, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31129"}}},
    [62666] = {{ID = 35825, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31129"}}},
    [62771] = {{ID = 40853, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31084"}}},
    [64259] = {{ID = 40852, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31189"}}},
    [60980] = {{ID = 33096, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30881"}}},
    [60979] = {{ID = 37429, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30881"}}},
    [60997] = {{ID = 37075, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30883"}}},
    [61004] = {{ID = 37431, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30907"}}},
    [61006] = {{ID = 37430, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30907"}}},
    [61007] = {{ID = 37432, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30907"}}},
    [62151] = {{ID = 33893, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31211"}}},
    [67940] = {{ID = 121752, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32248"}}},
    [68599] = {{ID = 41933, CanConfirm = false, Conditions = {"NONE = NONE"}}},
    [68526] = {
        {ID = 41352, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32380"}},
        {ID = 41353, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32381"}},
        {ID = 41354, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32381"}},
        {ID = 41355, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32381"}}
    },
    [68539] = {{ID = 41359, CanConfirm = false, Conditions = {"HAS_ITEM = 92977"}}},
    [68537] = {{ID = 41404, CanConfirm = false, Conditions = {"HAS_ITEM = 92975"}}},
    [68540] = {{ID = 41361, CanConfirm = false, Conditions = {"HAS_ITEM = 92976"}}},
    [68741] = {
        {ID = 41244, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32382"}},
        {ID = 41242, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32193"}},
        {ID = 41241, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32315"}},
        {ID = 41240, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32370"}},
        {ID = 41239, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32393"}},
        {ID = 41237, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32355"}},
        {ID = 41236, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32400"}}
    },
    [68108] = {
        {ID = 41503, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32362"}},
        {ID = 40954, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32362"}},
        {ID = 40956, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32362"}}
    },
    [67848] = {{ID = 40720, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32414"}}},
    [68651] = {{ID = 40723, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32460"}}},
    [68687] = {{ID = 41763, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32423"}}},
    [68004] = {
        {ID = 41051, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32321"}},
        {ID = 41925, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32321"}}
    },
    [68130] = {{ID = 41837, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32334"}}},
    [68545] = {{ID = 40881, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32336"}}},
    [70360] = {{ID = 41772, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32681"}}},
    [70370] = {{ID = 41766, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32644"}}},
    [67992] = {
        {ID = 41768, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32654"}},
        {ID = 41767, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32652"}},
        {ID = 41765, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32656"}}
    },
    [69949] = {{ID = 41587, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32654"}}},
    [69810] = {{ID = 41898, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32652"}}},
    [70297] = {{ID = 41662, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32655"}}},
    [69615] = {{ID = 42150, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32656"}}},
    [165505] = {{ID = 54294, CanConfirm = false, Conditions = {"LEVEL_LOWER = 40", "QUEST_ACTIVE = 29548"}}},
    [66292] = {{ID = 40614, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29548"}}},
    [54763] = {{ID = 39167, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29579"}}},
    [54914] = {
        {ID = 39493, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29620"}},
        {ID = 40364, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29620"}}
    },
    [54944] = {{ID = 40241, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29632"}}},
    [54924] = {{ID = 40594, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29633"}}},
    [54925] = {{ID = 40595, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29634"}}},
    [54926] = {{ID = 40337, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29635"}}},
    [56133] = {
        {ID = 40440, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29919"}},
        {ID = 40423, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29952"}},
        {ID = 39238, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30078"}}
    },
    [56113] = {{ID = 40669, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29577"}}},
    [56474] = {
        {ID = 40623, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30051"}},
        {ID = 40622, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30172"}}
    },
    [62377] = {
        {ID = 36036, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30053"}},
        {ID = 36034, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30050"}}
    },
    [62385] = {{ID = 35295, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30053"}}},
    [57385] = {
        {ID = 40211, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30053"}},
        {ID = 40209, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30052"}}
    },
    [57123] = {{ID = 40362, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}},
    [57124] = {{ID = 40362, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}},
    [57126] = {{ID = 40473, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}},
    [57127] = {{ID = 40261, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}},
    [57121] = {{ID = 40474, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}},
    [57122] = {{ID = 40508, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}},
    [57120] = {
        {ID = 40360, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}},
        {ID = 40361, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}
    },
    [56714] = {
        {ID = 41438, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29984"}},
        {ID = 41439, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29987"}},
        {ID = 41440, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29989"}}
    },
    [58461] = {{ID = 40247, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30186"}}},
    [59058] = {{ID = 40616, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29883"}}},
    [54960] = {
        {ID = 40442, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29883"}},
        {ID = 40441, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29894"}}
    },
    [56690] = {{ID = 40617, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29883"}}},
    [56693] = {{ID = 40427, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29883"}}},
    [55343] = {{ID = 40098, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29733"}}},
    [55381] = {
        {ID = 40113, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29726"}},
        {ID = 40114, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29730"}}
    },
    [56434] = {{ID = 40503, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29901"}}},
    [56737] = {{ID = 41374, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29922"}}},
    [55267] = {{ID = 39304, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29716"}}},
    [55368] = {{ID = 39810, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29723"}}},
    [56209] = {{ID = 40636, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29920"}}},
    [56210] = {{ID = 40637, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29920"}}},
    [56206] = {{ID = 40541, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29920"}}},
    [59395] = {{ID = 39183, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30495"}}},
    [59401] = {{ID = 40697, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30495"}}},
    [59397] = {{ID = 39805, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30495"}}},
    [59392] = {
        {ID = 39632, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30495"}},
        {ID = 39633, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29932"}}
    },
    [57242] = {{ID = 40586, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29932"}}},
    [59572] = {{ID = 39293, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30568"}}},
    [59563] = {{ID = 39488, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30568"}}},
    [64244] = {{ID = 38770, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31303"}}},
    [58376] = {
        {ID = 40644, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30082"}},
        {ID = 40648, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30082"}}
    },
    [59151] = {{ID = 41038, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30178"}}},
    [55597] = {{ID = 39799, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30347"}}},
    [58547] = {{ID = 40208, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30269"}}},
    [59653] = {{ID = 39489, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30273"}}},
    [58976] = {{ID = 40353, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30359"}}},
    [59857] = {{ID = 39267, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30627"}}},
    [61566] = {{ID = 35732, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30967"}}},
    [60973] = {{ID = 38108, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30480"}}},
    [63754] = {{ID = 41284, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30512"}}},
    [63542] = {{ID = 41467, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30512"}}},
    [60189] = {{ID = 37051, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30682"}}},
    [60190] = {{ID = 37052, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30682"}}},
    [60187] = {{ID = 35293, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30682"}}},
    [59818] = {
        {ID = 33656, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30601"}},
        {ID = 33655, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30601"}}
    },
    [60795] = {{ID = 40517, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30829"}}},
    [61382] = {{ID = 30224, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30935"}}},
    [61380] = {{ID = 30226, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30935"}}},
    [61417] = {{ID = 38585, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30944"}}},
    [61381] = {{ID = 38591, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30944"}}},
    [62629] = {{ID = 40352, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30946"}}},
    [60587] = {{ID = 34810, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30747"}}},
    [61512] = {{ID = 29681, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30724"}}},
    [61454] = {{ID = 30541, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30994"}}},
    [61819] = {
        {ID = 29128, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30993"}},
        {ID = 29129, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30993"}}
    },
    [62220] = {{ID = 41432, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30752"}}},
    [60899] = {{ID = 32679, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30774"}}},
    [60864] = {{ID = 37073, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30827"}}},
    [60857] = {{ID = 35731, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30815"}}},
    [61378] = {{ID = 40590, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30890"}}},
    [61395] = {{ID = 37625, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30890"}}},
    [61397] = {{ID = 37888, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30890"}}},
    [61396] = {{ID = 37889, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30890"}}},
    [155707] = {{ID = 49933, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 56617"}}},
    [64848] = {{ID = 41177, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31512"}}},
    [78709] = {
        {ID = 42526, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32806"}},
        {ID = 42524, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32807"}}
    },
    [71358] = {{ID = 42205, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32807"}}},
    [73306] = {{ID = 41556, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 33343", "QUEST_OBJECTIVE_INCOMPLETE = 33343,1"}}},
    [55141] = {{ID = 39490, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29694"}}},
    [55162] = {{ID = 39687, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29694"}}},
    [55146] = {{ID = 39686, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29694"}}},
    [55170] = {{ID = 39688, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29694"}}},
    [67090] = {{ID = 41782, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31778"}}},
    [65974] = {{ID = 41756, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31778"}}},
    [56340] = {{ID = 40184, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29941"}}},
    [56336] = {{ID = 40464, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29941"}}},
    [56478] = {{ID = 40187, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29941"}}},
    [56477] = {{ID = 40186, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29941"}}},
    [55688] = {{ID = 39795, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29823"}}},
    [56525] = {{ID = 40650, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29967"}}},
    -- Demon Hunters
    [99914] = {{ID = 45047, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 40379"}}},
    [99915] = {
        {ID = 45048, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 38765"}},
        {ID = 45101, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 38765"}}
    },
    [93693] = {{ID = 44410, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 38813"}}},
    [94435] = {{ID = 44865, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 38813"}}},
    [90247] = {{ID = 42930, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 38813"}}},
    [96436] = {{ID = 45064, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39262"}}},
    [96655] = {{ID = 44405, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39516"}}},
    [93127] = {{ID = 44408, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39516"}}},
    [99045] = {{ID = 44442, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39516"}}},
    [96420] = {{ID = 44440, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39516"}}},
    [96652] = {{ID = 44661, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39516"}}},
    [96653] = {{ID = 44646, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39663"}}},
    [97644] = {{ID = 44913, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 40373"}}},
    [100429] = {{ID = 45043, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 44463"}}},
    -- Evokers
    [182317] = {{ID = 54978, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 65060"}}},
    [184165] = {{ID = 51921, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 65071"}}},
    [182258] = {{ID = 55597, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 65701"}}},
    [182610] = {{ID = 51849, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 65100"}}},
    [182611] = {{ID = 51850, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 65100"}}},
}