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
}