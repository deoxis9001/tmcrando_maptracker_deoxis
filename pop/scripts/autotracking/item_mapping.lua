
ITEM_MAPPING = {
	[256] = {{ "sword0","custom" },{ "smithsword","custom" }},
	[512] = {{ "sword0","custom" },{ "greensword","custom" }},
	[768] = {{ "sword0","custom" },{ "redsword","custom" }},
	[1024] = {{ "sword0","custom" },{ "bluesword","custom" }},
	[1536] = {{ "sword0","custom" },{ "foursword","custom" }},
	[1792] = {{ "bombs","toggle"}}, --bombs
	[2048] = {{ "remote","toggle"}},--remote bombs.
	[2304] = {{ "bow","progressive"}},
	[2560] = {{ "bow","progressive"}},
	[2816] = {{ "boomerang","progressive" }},
	[3072] = {{ "boomerang","progressive" }},
	[3328] = {{ "shield","progressive" }},
	[3584] = {{ "shield","progressive" }},
	[3840] = {{ "lamp","progressive" }},
	[4352] = {{ "gust","toggle"}},
	[4608] = {{ "cane","toggle"}},
	[4864] = {{ "mitts","toggle"}},
	[5120] = {{ "cape","toggle" }},
	[5376] = {{ "boots","toggle"}},
	[5888] = {{ "ocarina","toggle" }},
	
	[7168] = {{ "bottle","progressive"}},
	[7200] = {{ "bottle","progressive"}},
	[7201] = {{ "bottle","progressive"}},
	[7202] = {{ "bottle","progressive"}},
	[7203] = {{ "bottle","progressive"}},
	[7204] = {{ "bottle","progressive"}},
	[7205] = {{ "bottle","progressive"}},
	[7206] = {{ "bottle","progressive"}},
	[7207] = {{ "bottle","progressive"}},
	[7208] = {{ "bottle","progressive"}},
	[7209] = {{ "bottle","progressive"}},
	[7210] = {{ "bottle","progressive"}},
	[7211] = {{ "bottle","progressive"}},
	[7212] = {{ "bottle","progressive"}},
	[7213] = {{ "bottle","progressive"}},
	[7214] = {{ "bottle","progressive"}},
	[7215] = {{ "bottle","progressive"}},
	[7216] = {{ "bottle","progressive"}},
	[7217] = {{ "bottle","progressive"}},
	[7424] = {{ "bottle","progressive"}},
	[7680] = {{ "bottle","progressive"}},
	[7936] = {{ "bottle","progressive"}},
	[8192] = {{ "bottle","progressive"}},

	[13824] = {{ "dogbottle","toggle"}},
	[14080] = {{ "llrkey","toggle"}},
	[14336] = {{ "mushroom","toggle"}},
	[14592] = {{ "books","progressive"}}, 
	[14848] = {{ "books","progressive"}},
	[15104] = {{ "books","progressive"}},
	[15360] = {{ "gravekey","toggle"}},
	[15616] = {{ "trophy","toggle"}},
	[15872] = {{ "carlov","toggle"}},

	[16384] = {{ "earth","toggle" }},
	[16640] = {{ "fire","toggle"}},
	[16896] = {{ "water","toggle"}},
	[17152] = {{ "wind","toggle"}},

	[17408] = {{ "grip","toggle"}},
	[17664] = {{ "bracelets","toggle"}},
	[17920] = {{ "flippers","toggle"}},


	--[18432] = {{ "spinattack","spin" },{ "sevenscrolls","consumable" }}, -- event
	[18432] = {{ "spinattack","spin" },{ "sevenscrolls","consumable" }},
	[18688] = {{ "rollattack","toggle" },{ "sevenscrolls","consumable" }},
	[18944] = {{ "dashattack","toggle" },{ "sevenscrolls","consumable" }},
	[19200] = {{ "rockbreaker","toggle" },{ "sevenscrolls","consumable" }},
	[19456] = {{ "swordbeam","toggle" },{ "sevenscrolls","consumable" }},
	--[19712] = {{ "greatspin","spin" },{ "sevenscrolls","consumable" }}, -- event
	[19712] = {{ "greatspin","spin" },{ "sevenscrolls","consumable" }},
	[19968] = {{ "downthrust","toggle" },{ "sevenscrolls","consumable" }},
	[20224] = {{ "perilbeam","toggle" },{ "sevenscrolls","consumable" }},

	[20504] = {{ "dws_Map","toggle"}},
	[20505] = {{ "cof_Map","toggle"}},
	[20506] = {{ "fow_Map","toggle"}}, 
	[20507] = {{ "tod_Map","toggle"}},
	[20508] = {{ "pow_Map","toggle"}}, 
	[20509] = {{ "dhc_Map","toggle"}},

	[20760] = {{ "dws_Compass","toggle"}},
	[20761] = {{ "cof_Compass","toggle"}},
	[20762] = {{ "fow_Compass","toggle"}},
	[20763] = {{ "tod_Compass","toggle"}},
	[20764] = {{ "pow_Compass","toggle"}},
	[20765] = {{ "dhc_Compass","toggle"}},

	[21016] = {{ "dws_bigkey","toggle" }},
	[21017] = {{ "cof_bigkey","toggle" }},
	[21018] = {{ "fow_bigkey","toggle" }},
	[21019] = {{ "tod_bigkey","toggle" }},
	[21020] = {{ "pow_bigkey","toggle" }},
	[21021] = {{ "dhc_bigkey","toggle" }},
	
	[21272] = {{ "dws_smallkey","consumable" }},
	[21273] = {{ "cof_smallkey","consumable" }},
	[21274] = {{ "fow_smallkey","consumable" }},
	[21275] = {{ "tod_smallkey","consumable" }},
	[21276] = {{ "pow_smallkey","consumable" }},
	[21277] = {{ "dhc_smallkey","consumable" }},
	[21278] = {{ "rc_smallkey","consumable" }},

	[23296] = {{ "jabber","toggle"}},
	[23653] = {{ "clouds","custom"}},
	[23658] = {{ "wilds","custom"}},
	[23661] = {{ "falls","custom"}},

	[25088] = {{ "hearts","custom",4 }},
	[25344] = {{ "hearts","custom" }},
	[25600] = {{ "wallet","progressive"}},
	[25856] = {{ "bombs","progressive"}},--bombs bag
	
	[26112] = {{ "quiver","progressive" }},
	[28672] = {{ "bowandfly","toggle"}},
	[28928] = {{ "mittsButterfly","toggle"}},

	[29184] = {{ "flippersButterfly","toggle"}},
	[29696] = {{ "fastsplit","spin" },{ "sevenscrolls","consumable" }},
	[29440] = {{ "fastspin","spin" },{ "sevenscrolls","consumable" }},
	[29952] = {{ "longspin","spin" },{ "sevenscrolls","consumable" }},
	--[29696] = {{ "fastsplit","spin" },{ "sevenscrolls","consumable" }}, -- event
	--[29440] = {{ "fastspin","spin" },{ "sevenscrolls","consumable" }}, -- event
	--[29952] = {{ "longspin","spin" },{ "sevenscrolls","consumable" }}, -- event



	[21504] = {{ "","" }},
	[22016] = {{ "","" }},
	[22016] = {{ "","" }},
	[22784] = {{ "","" }},
	[22528] = {{ "","" }},
	[21760] = {{ "","" }},
	[22272] = {{ "","" }},
	[24064] = {{ "","" }},
	[24320] = {{ "","" }},
	[23808] = {{ "","" }},
	[27648] = {{ "","" }},
	[27904] = {{ "","" }},
	[28160] = {{ "","" }},
	[28416] = {{ "","" }}

}