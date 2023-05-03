local name, addon = ...
local PLAYER_TALENTS = {
	-- Death Knight
	[250] = { -- Blood
		["importString"] 	= "BoPAAAAAAAAAAAAAAAAAAAAAAACJJCJJi0iEBJiECSSSkAAAAAAJSiQk0kISAAAikkEAAAA",
		["patch"] 			= "10.1.0",
	},
	[251] = { -- Frost
		["importString"] 	= "BsPAAAAAAAAAAAAAAAAAAAAAAkIAiQSCJiEBJSSIkIJRESCERSSkkkkkWAAAAAAAAAAAAA",
		["patch"] 			= "10.1.0",
	},
	[252] = { -- Unholy
		["importString"] 	= "BwPAAAAAAAAAAAAAAAAAAAAAAAAiQSCJtIBkIRIkkkEBAAAAAAAAAKkERSSSKAAkIFRSSikA",
		["patch"] 			= "10.1.0",
	},
	-- Demon Hunter
	[577] = { -- Havoc
		["importString"] 	= "BEkAAAAAAAAAAAAAAAAAAAAAAQSSSCpEkWSiIRaiAAAAAAAolkgIFSiSIJtkgDkgECA",
		["patch"] 			= "10.1.0",
	},
	[581] = { -- Vengeance
		["importString"] 	= "BUkAAAAAAAAAAAAAAAAAAAAAAAAQEKJJicgAIBIpkgkodgIRikQiWSkkkkQJkAAAAAA",
		["patch"] 			= "10.1.0",
	},
	-- Druid
	[102] = { -- Balance
		["importString"] 	= "BYGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFASSEhkEgkEJRKQLRSSSUSCJHIEaJtIERDgCNAA",
		["patch"] 			= "10.1.0",
	},
	[103] = { -- Feral
		["importString"] 	= "BcGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEJt0kQSSSSRJokEJSCAAAAAAFAkEAISSSCJ5ApE0ScAAAAAAAIB0AA",
		["patch"] 			= "10.1.0",
	},
	[104] = { -- Guardian
		["importString"] 	= "BgGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgERSkSiSSSSEIkkCFAkEEIQSSSSSkC0SAAAAAAQEQ0gA",
		["patch"] 			= "10.1.0",
	},
	[105] = { -- Restoration
		["importString"] 	= "BkGAAAAAAAAAAAAAAAAAAAAAAgkEtSSSSKSLJwBSjmWkEAAAAAAAAAAAAQJBkEBBQCJJSSAJtEAAAAAAiAAAA",
		["patch"] 			= "10.1.0",
	},
	-- Evoker
	[1467] = { -- Devastation
		["importString"] 	= "BsbBAAAAAAAAAAAAAAAAAAAAAQDCAAAAAAkSaJJCJIkkkUSSig0QiEJhESSkIkkEB",
		["patch"] 			= "10.1.0",
	},
	[1468] = { -- Preservation
		["importString"] 	= "BwbBAAAAAAAAAAAAAAAAAAAAAABlISIJSRSSIiWSSSIAAAAAgQSLRiEJBSSSIESC",
		["patch"] 			= "10.1.0",
	},
	-- Hunter
	[253] = { -- Beast Mastery
		["importString"] 	= "B0PAAAAAAAAAAAAAAAAAAAAAA4ACaJAoQAAAAAAAAAAAoRkiEa5ARCJCJhWCRIJkFkEhGJRA",
		["patch"] 			= "10.1.0",
	},
	[254] = { -- Marksmanship
		["importString"] 	= "B4PAAAAAAAAAAAAAAAAAAAAAA4ARoFASKIIAAAAARSSkkECCJRJRaERUkiGRSyBIhEaAAAAAA",
		["patch"] 			= "10.1.0",
	},
	[255] = { -- Survival
		["importString"] 	= "B8PAAAAAAAAAAAAAAAAAAAAAA4ABahkEhSQQSSSaJCQIpEhAAAAAARkSRKaQiESIhCAAAAA",
		["patch"] 			= "10.1.0",
	},
	-- Mage
	[62] = { -- Arcane
		["importString"] 	= "B4DAAAAAAAAAAAAAAAAAAAAAAIJChWikIJNQOQTiIiIJSIhWCSLJAAAAAAAAAAAASSSSIJJJC",
		["patch"] 			= "10.1.0",
	},
	[63] = { -- Fire
		["importString"] 	= "B8DAAAAAAAAAAAAAAAAAAAAAAkkIEaJSIJNQ0SiIiIJAAAAAAAAA4AEIRokkIJRSSSSBAAAA",
		["patch"] 			= "10.1.0",
	},
	[64] = { -- Frost
		["importString"] 	= "BAEAAAAAAAAAAAAAAAAAAAAAAIJEhWiESSBItkIiISCAAAJJJRIRSSikSSSiAAAAAAAAAAI",
		["patch"] 			= "10.1.0",
	},
	-- Monk
	[268] = { -- Brewmaster
		["importString"] 	= "BwQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAAAgSUKJJRIJp1IAAAApEaJRikkUIJJJpIB0iEplWJE",
		["patch"] 			= "10.1.0",
	},
	[270] = { -- Mistweaver
		["importString"] 	= "B4QAAAAAAAAAAAAAAAAAAAAAA0SSpIJBKaRIlISaBpkiAAAAAAAAAAAAAgkSkEJJSBJJJpBBAAiA",
		["patch"] 			= "10.1.0",
	},
	[269] = { -- Windwalker
		["importString"] 	= "B0QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIJSSiWEJCAAAAkIJpQCQSSESKJJiEShkkkkWCAAAA",
		["patch"] 			= "10.1.0",
	},
	-- Paladin
	[65] = { -- Holy
		["importString"] 	= "BEEAAAAAAAAAAAAAAAAAAAAAAAABAABAEBAAIAtkAUiko0EpIRSJBHolIaESSRQSCRaAiAACEQBIE",
		["patch"] 			= "10.1.0",
	},
	[66] = { -- Protection
		["importString"] 	= "BIEAAAAAAAAAAAAAAAAAAAAAA0SaJkiodAtkko0kkIRkIBAAIAAAAAAAAIOQSSRgkQSKSgAAiABAgA",
		["patch"] 			= "10.1.0",
	},
	[70] = { -- Retribution
		["importString"] 	= "BYEAAAAAAAAAAAAAAAAAAAAAAAAAAQAgIUKtSSr0koIJpIJAAAAAAApBJJEIBRKRQCpkWiGJAJiSjWA",
		["patch"] 			= "10.1.0",
	},
	-- Priest
	[256] = { -- Discipline
		["importString"] 	= "BAQAAAAAAAAAAAAAAAAAAAAAAAASKhEIJSJi0apkkEhAAAAAAAAAAAAk0QLJEpQIJJioItEJBFA",
		["patch"] 			= "10.1.0",
	},
	[257] = { -- Holy
		["importString"] 	= "BEQAAAAAAAAAAAAAAAAAAAAAAQRAAAAAAAoQiUCSCEhQSElkkSAAAAAk0QLJQKkikkIii0IJBFA",
		["patch"] 			= "10.1.0",
	},
	[258] = { -- Shadow
		["importString"] 	= "BIQAAAAAAAAAAAAAAAAAAAAAAESiQAAAAAAAAAAAAAioIRSSDSSSSkIINSSSkGBJIki0CJBQSA",
		["patch"] 			= "10.1.0",
	},
	-- Rogue
	[259] = { -- Assassination
		["importString"] 	= "BMQAAAAAAAAAAAAAAAAAAAAAAIkIJRkQJBAAAAAAQSAkIAAAAAAASDJOQJJkkkkSKJCkEJRCA",
		["patch"] 			= "10.1.0",
	},
	[260] = { -- Outlaw
		["importString"] 	= "BQQAAAAAAAAAAAAAAAAAAAAAAAAAgERSAOQSSkQSCkEJRikkkkECAAAAAAQ0CkUSCIRKBAAAA",
		["patch"] 			= "10.1.0",
	},
	[261] = { -- Subtlety
		["importString"] 	= "BUQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAARAJJiQASkkkIJJRQSESSSLQSJJkkEpFAAAA",
		["patch"] 			= "10.1.0",
	},
	-- Shaman
	[262] = { -- Elemental
		["importString"] 	= "BYQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAoVSSLJJlk0S0QAkIBAAAAAoEgUSCpIpg0SSaBQkEAC",
		["patch"] 			= "10.1.0",
	},
	[263] = { -- Enhancement
		["importString"] 	= "BcQAAAAAAAAAAAAAAAAAAAAAAIRSaQSSikIAJtEJAAAAAAAAAAAAgSESCJapIKk0SSKAKBJkCC",
		["patch"] 			= "10.1.0",
	},
	[264] = { -- Restoration
		["importString"] 	= "BgQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIhkkkkWSJpIJNBNIpEESJJEhCSTCIiSSSIBC",
		["patch"] 			= "10.1.0",
	},
	-- Warlock
	[265] = { -- Affliction
		["importString"] 	= "BkQAAAAAAAAAAAAAAAAAAAAAAAIJRSCkmCRaJJhUCAAAAItEAAAAAAQS0IJRikkolQAAJ",
		["patch"] 			= "10.1.0",
	},
	[266] = { -- Demonology
		["importString"] 	= "BoQAAAAAAAAAAAAAAAAAAAAAAoBSSkkQkmCRaSSIlAAAAAgSEkQiWkEJSOQkWSkDQAAAAAAQC",
		["patch"] 			= "10.1.0",
	},
	[267] = { -- Destruction
		["importString"] 	= "BsQAAAAAAAAAAAAAAAAAAAAAAAIJRSCkmCRaJJhUCSClkERJoVKSCAAAAAAAAAAAgApkkkA",
		["patch"] 			= "10.1.0",
	},
	-- Warrior
	[71] = { -- Arms 
		["importString"] 	= "BcEAAAAAAAAAAAAAAAAAAAAAAAIFJSSkQkkWpEJBAAAABRgCBRREQiQSoIRIBESIAAAAAAAAkokgACRDB",
		["patch"] 			= "10.1.0",
	},
	[72] = { -- Fury
		["importString"] 	= "BgEAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAQggSAEBhIIRDSIJQkESSaJJSkggEJRapFgkkEAAAEQQA",
		["patch"] 			= "10.1.0",
	},
	[73] = { -- Protection
		["importString"] 	= "BkEAAAAAAAAAAAAAAAAAAAAAAIkEAAAAIJJRSCSLpkkkSBRgQRiElkEgAJBNkkgAEJAAAAAAAQEAgiGAIA",
		["patch"] 			= "10.1.0",
	},
}
addon.PLAYER_TALENTS = PLAYER_TALENTS