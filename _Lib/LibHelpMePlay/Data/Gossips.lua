local LHMP = LibStub("LibHelpMePlay")
if not LHMP then return end

--LHMP.Gossips={[0]={},[62202]={{ID=35586,CanConfirm=false,Conditions={"QUEST_ACTIVE = 31006"}}},[62538]={{ID=35587,CanConfirm=true,Conditions={"QUEST_ACTIVE = 31007 OR 31660 OR 31175"}}},[63876]={{ID=28603,CanConfirm=false,Conditions={"QUEST_ACTIVE = 31091"}}},[62667]={{ID=35828,CanConfirm=false,Conditions={"QUEST_ACTIVE = 31129"}}},[62845]={{ID=35823,CanConfirm=false,Conditions={"QUEST_ACTIVE = 31129"}}},[62666]={{ID=35825,CanConfirm=false,Conditions={"QUEST_ACTIVE = 31129"}}},[62771]={{ID=40853,CanConfirm=false,Conditions={"QUEST_ACTIVE = 31084"}}},[64259]={{ID=40852,CanConfirm=false,Conditions={"QUEST_ACTIVE = 31189"}}}}
LHMP.Gossips = {
    [0] = {},
    [62202] = {
        {
            ID = 35586,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 31006",
            }
        }
    },
    [62538] = {
        {
            ID = 35587,
            CanConfirm = true,
            Conditions = {
                "QUEST_ACTIVE = 31007 OR 31660 OR 31175",
            }
        }
    },
    [63876] = {
        {
            ID = 28603,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 31091",
            }
        }
    },
    [62667] = {
        {
            ID = 35828,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 31129",
            }
        }
    },
    [62845] = {
        {
            ID = 35823,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 31129",
            }
        }
    },
    [62666] = {
        {
            ID = 35825,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 31129",
            }
        }
    },
    [62771] = {
        {
            ID = 40853,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 31084",
            }
        }
    },
    [64259] = {
        {
            ID = 40852,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 31189",
            }
        }
    },
    [60980] = {
        {
            ID = 33096,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30881",
            }
        }
    },
    [60979] = {
        {
            ID = 37429,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30881",
            }
        }
    },
    [60997] = {
        {
            ID = 37075,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30883",
            }
        }
    },
    [61004] = {
        {
            ID = 37431,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30907",
            }
        }
    },
    [61006] = {
        {
            ID = 37430,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30907",
            }
        }
    },
    [61007] = {
        {
            ID = 37432,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30907",
            }
        }
    },
    [62151] = {
        {
            ID = 33893,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 31211",
            }
        }
    },
    [67940] = {
        {
            ID = 121752,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32248",
            }
        }
    },
    [68599] = {
        {
            ID = 41933,
            CanConfirm = false,
            Conditions = {
                "NONE = NONE",
            }
        }
    },
    [68526] = {
        {
            ID = 41352,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32380",
            }
        },
        {
            ID = 41353,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32381",
            }
        },
        {
            ID = 41354,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32381",
            }
        },
        {
            ID = 41355,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32381",
            }
        },
    },
    [68539] = {
        {
            ID = 41359,
            CanConfirm = false,
            Conditions = {
                "HAS_ITEM = 92977",
            }
        },
    },
    [68537] = {
        {
            ID = 41404,
            CanConfirm = false,
            Conditions = {
                "HAS_ITEM = 92975",
            }
        },
    },
    [68540] = {
        {
            ID = 41361,
            CanConfirm = false,
            Conditions = {
                "HAS_ITEM = 92976",
            }
        },
    },
    [68741] = {
        {
            ID = 41244,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32382",
            }
        },
        {
            ID = 41242,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32193",
            }
        },
        {
            ID = 41241,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32315",
            }
        },
        {
            ID = 41240,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32370",
            }
        },
        {
            ID = 41239,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32393",
            }
        },
        {
            ID = 41237,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32355",
            }
        },
        {
            ID = 41236,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32400",
            }
        },
    },
    [68108] = {
        {
            ID = 41503,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32362",
            }
        },
        {
            ID = 40954,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32362",
            }
        },
        {
            ID = 40956,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32362",
            }
        },
    },
    [67848] = {
        {
            ID = 40720,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32414",
            }
        },
    },
    [68651] = {
        {
            ID = 40723,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32460",
            }
        },
    },
    [68687] = {
        {
            ID = 41763,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32423",
            }
        },
    },
    [68004] = {
        {
            ID = 41051,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32321",
            }
        },
        {
            ID = 41925,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32321",
            }
        },
    },
    [68130] = {
        {
            ID = 41837,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32334",
            }
        },
    },
    [68545] = {
        {
            ID = 40881,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32336",
            }
        },
    },
    [70360] = {
        {
            ID = 41772,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32681",
            }
        },
    },
    [70370] = {
        {
            ID = 41766,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32644",
            }
        },
    },
    [67992] = {
        {
            ID = 41768,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32654",
            }
        },
        {
            ID = 41767,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32652",
            }
        },
        {
            ID = 41765,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32656",
            }
        },
    },
    [69949] = {
        {
            ID = 41587,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32654",
            }
        },
    },
    [69810] = {
        {
            ID = 41898,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32652",
            }
        },
    },
    [70297] = {
        {
            ID = 41662,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32655",
            }
        },
    },
    [69615] = {
        {
            ID = 42150,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 32656",
            }
        },
    },
    [165505] = {
        {
            ID = 54294,
            CanConfirm = false,
            Conditions = {
                "LEVEL_LOWER = 40",
                "QUEST_ACTIVE = 29548",
            }
        },
    },
    [66292] = {
        {
            ID = 40614,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29548",
            }
        },
    },
    [54763] = {
        {
            ID = 39167,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29579",
            }
        },
    },
    [54914] = {
        {
            ID = 39493,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29620",
            }
        },
        {
            ID = 40364,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29620",
            }
        },
    },
    [54944] = {
        {
            ID = 40241,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29632",
            }
        },
    },
    [54924] = {
        {
            ID = 40594,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29633",
            }
        },
    },
    [54925] = {
        {
            ID = 40595,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29634",
            }
        },
    },
    [54926] = {
        {
            ID = 40337,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29635",
            }
        },
    },
    [56133] = {
        {
            ID = 40440,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29919",
            }
        },
        {
            ID = 40423,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29952",
            }
        },
        {
            ID = 39238,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30078",
            }
        },
    },
    [56113] = {
        {
            ID = 40669,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29577",
            }
        },
    },
    [56474] = {
        {
            ID = 40623,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30051",
            }
        },
        {
            ID = 40622,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30172",
            }
        },
    },
    [62377] = {
        {
            ID = 36036,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30053",
            }
        },
        {
            ID = 36034,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30050",
            }
        },
    },
    [62385] = {
        {
            ID = 35295,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30053",
            }
        },
    },
    [57385] = {
        {
            ID = 40211,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30053",
            }
        },
        {
            ID = 40209,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 30052",
            }
        },
    },
    [57123] = {
        {
            ID = 40362,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29982",
            }
        },
    },
    [57124] = {
        {
            ID = 40362,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29982",
            }
        },
    },
    [57126] = {
        {
            ID = 40473,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29982",
            }
        },
    },
    [57127] = {
        {
            ID = 40261,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29982",
            }
        },
    },
    [57121] = {
        {
            ID = 40474,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29982",
            }
        },
    },
    [57122] = {
        {
            ID = 40508,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29982",
            }
        },
    },
    [57120] = {
        {
            ID = 40360,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29982",
            }
        },
        {
            ID = 40361,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29982",
            }
        },
    },
    [56714] = {
        {
            ID = 41438,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29984",
            }
        },
        {
            ID = 41439,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29987",
            }
        },
        {
            ID = 41440,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 29989",
            }
        },
    },
}