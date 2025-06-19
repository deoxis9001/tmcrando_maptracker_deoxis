SLOTS_DATA_MAPPING = {
    -- goal_vaati
    ["goal_vaati"]  = {"dhc_closed","OPT",{1,0}},
    -- Dungeons
    ["dungeon_small_keys"]   =   {"small_key_none","OPT",{0,0,1,2,2,2,2,2,2,2}},
    ["dungeon_big_keys"]   =   {"big_key_none","OPT",{0,0,1,2,2,2,2,2,2,2}},
   -- ["dungeon_maps"]   =   {"","OPT",{0,0,1,2,2,2,2,2,2,2}},
   -- ["dungeon_compasses"]   =   {"","OPT",{0,0,1,2,2,2,2,2,2,2}},
   -- options
    ["goal_dungeons"]   =   {"dungeons","INT",{0,6}},
    ["goal_swords"]     =   {"sword0Needed","INT",{0,5}},
    ["goal_elements"]   =   {"element0Needed","INT",{0,4}},
    ["goal_figurines"]   =   {"figurine_option","INT",{0,136}},

    ["dungeon_warp_dws"]   =   {"dws_warps_none","OPT",{0,1,2,3}},
    ["dungeon_warp_cof"]   =   {"cof_warps_none","OPT",{0,1,2,3}},
    ["dungeon_warp_fow"]   =   {"fow_warps_none","OPT",{0,1,2,3}},
    ["dungeon_warp_tod"]   =   {"tod_warps_none","OPT",{0,1,2,3}},
    ["dungeon_warp_pow"]   =   {"pow_warps_none","OPT",{0,1,2,3}},
    ["dungeon_warp_dhc"]   =   {"dhc_warps_none","OPT",{0,1,2,3}},

    ["cucco_rounds"]   =   {"cucco_none","INT",{0,10}},

    ["goron_sets"]     =   {"goron_none","INT",{0,5}},
    ["goron_jp_prices"] = {"dungeonser_off","OPT",{0,1}},

    ["shuffle_heart_pieces"]   =   {"hp_vanilla","OPT",{0,1}},
    ["shuffle_rupees"]   =    {"rupees_off","OPT",{0,1}},
    ["shuffle_pots"]   =   {"specialpot_off","OPT",{0,1}},
    ["shuffle_digging"]   =   {"digging_off","OPT",{0,1}},
    ["shuffle_underwater"]   =   {"underwater_off","OPT",{0,1}},
    ["shuffle_gold_enemies"] = {"golden_enemy_off","OPT",{0,1}},
    ["shuffle_pedestal"]   =   {"ped_items_off","OPT",{0,1}},
    ["shuffle_biggoron"] = {"biggoron_none","OPT",{0,1}},

    ["kinstones_gold"]   =   {"fusiongold_removed","KIN",{0,1,3,2},"fusiongoldcombined"},
    ["kinstones_red"]   =   {"fusionred_removed","KIN",{0,1,3,2},"fusionredcombined"},
    ["kinstones_blue"]   =   {"fusionblue_removed","KIN",{0,1,3,2},"fusionbluecombined"},
    ["kinstones_green"]   =   {"fusiongreen_removed","KIN",{0,1,3,2},"fusiongreencombined"},

    ["grabbables"]   =   {"grabbable_none","OPT",{0,1,2,3}},

    ["open_world"]   =   {"openworld_off","OPT",{0,1}},
    ["open_wind_tribe"] = {"open_wind_tribe_no","OPT",{0,1}},
    ["open_tingle_brothers"] = {"open_tingle_no","OPT",{0,1}},
    ["open_library"] = {"open_library_no","OPT",{0,1}},

    ["extra_shop_item"]   =   {"shopbag_extra_off","OPT",{0,1}},

    ["wind_crest_crenel"]   =   {"crenelwindcrest_no","OPT",{0,1}},
    ["wind_crest_castor"]   =   {"swampwindcrest_no","OPT",{0,1}},
    ["wind_crest_clouds"]   =   {"cloudwindcrest_no","OPT",{0,1}},
    ["wind_crest_lake"]   =   {"lakewindcrest_no","OPT",{0,1}},
    --["wind_crest_town"]   =   {"","OPT",{0,1}},
    ["wind_crest_falls"]   =   {"fallswindcrest_no","OPT",{0,1}},
    ["wind_crest_south_field"]   =   {"shfwindcrest_no","OPT",{0,1}},
    ["wind_crest_minish_woods"]   =   {"minishwindcrest_no","OPT",{0,1}},

    ["weapon_bombs"]   =   {"weaponsbombs_no","OPT",{0,1,2}},
    ["weapon_bows"]   =   {"weaponsbow_no","OPT",{0,1,2}},
    ["weapon_gust_jar"]   =   {"weaponsgust_no","OPT",{0,1}},
    ["weapon_lantern"]   =   {"weaponslamp_no","OPT",{0,1}},

    
    ["entrance_rando"] = {"dungeonser_off","OPT",{0,1}},

    --["trick_mitts_farm_rupees"]   =   {"","OPT",{0,1}},
    ["trick_bombable_dust"]   =   {"blowdust_off","OPT",{0,1}},
    ["trick_crenel_mushroom_gust_jar"]   =   {"crenelmushroom_off","OPT",{0,1}},
    ["trick_light_arrows_break_objects"]   =   {"lightarrowbreak_off","OPT",{0,1}},
    ["trick_bobombs_destroy_walls"]   =   {"bobombs_off","OPT",{0,1}},
    ["trick_like_like_cave_no_sword"]   =   {"likelike_off","OPT",{0,1}},
    ["trick_boots_skip_town_guard"]   =   {"guardskip_off","OPT",{0,1}},
    ["trick_beam_crenel_switch"]   =   {"crenelbeam_off","OPT",{0,1}},
    ["trick_down_thrust_spikey_beetle"]   =   {"downstrikebeetle_off","OPT",{0,1}},
    ["trick_dark_rooms_no_lantern"]   =   {"darkrooms_off","OPT",{0,1}},
    ["trick_cape_extensions"]   =   {"capeextension_off","OPT",{0,1}},
    ["trick_lake_minish_no_boots"]   =   {"lakeminish_off","OPT",{0,1}},
    ["trick_cabin_swim_no_lilypad"]   =   {"cabinswim_off","OPT",{0,1}},
    ["trick_cloud_sharks_no_weapons"]   =   {"cloudskill_off","OPT",{0,1}},
    ["trick_pow_2f_no_cane"]   =   {"powjump_off","OPT",{0,1}},
    ["trick_pot_puzzle_no_bracelets"]   =   {"powpotpuzzleool_off","OPT",{0,1}},
    ["trick_fow_pot_gust_jar"]   =   {"fowpot_off","OPT",{0,1}},
    ["trick_dhc_cannons_no_four_sword"]   =   {"dhccanonhit_off","OPT",{0,1}},
    ["trick_dhc_pads_no_four_sword"]   =   {"dhcbladepuzzleshuffle_off","OPT",{0,1}},
    ["trick_dhc_switches_no_four_sword"]   =   {"dhcswitchhit_off","OPT",{0,1}},

    ["prize_dws"] = {"dwsx","PRIZE"},
    ["prize_cof"] = {"cofx","PRIZE"},
    ["prize_fow"] = {"fowx","PRIZE"},
    ["prize_tod"] = {"todx","PRIZE"},
    ["prize_rc"] = {"rcx","PRIZE"},
    ["prize_pow"] = {"powx","PRIZE"},
}
-- SLOTS_DATA_RESET_MAPPING = {
    -- ["prize_dws"] = {"dwsx"},
    -- ["prize_cof"] = {"cofx"},
    -- ["prize_fow"] = {"fowx"},
    -- ["prize_tod"] = {"todx"},
    -- ["prize_rc"] = {"rcx"},
    -- ["prize_pow"] = {"powx"},
-- }