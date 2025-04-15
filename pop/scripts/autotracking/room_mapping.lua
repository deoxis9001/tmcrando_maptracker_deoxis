ROOM_FLAG_MAPPING = {
    ["00"] = {[0] = {"Overworld"}}
    --    ["10"] = {[0] = {"Melari's Mines"}},
    --    ["48"] = {[0] = {"Maps Dungeons", "Deepwood Shrine"}},
    --    ["49"] = {[0] = {"Maps Dungeons", "Deepwood Shrine"}},
    --    ["50"] = {[0] = {"Maps Dungeons", "Cave of Flames"}},
    --    ["51"] = {[0] = {"Maps Dungeons", "Cave of Flames"}},
    --    ["18"] = {[0] = {"Maps Dungeons", "Fortress of Winds"}},
    --    ["58"] = {[0] = {"Maps Dungeons", "Fortress of Winds"}},
    --    ["59"] = {[0] = {"Maps Dungeons", "Fortress Of Winds"}},
    --    ["5a"] = {[0] = {"Maps Dungeons", "Fortress Of Winds"}},
    --    ["60"] = {[0] = {"Maps Dungeons", "Temple of Droplets"}},
    --    ["68"] = {[0] = {"Maps Dungeons", "Royal Crypt"}},
    --    ["70"] = {[0] = {"Maps Dungeons", "Palace of Winds"}},
    --    ["71"] = {[0] = {"Maps Dungeons", "Palace of Winds"}},
    --    ["88"] = {[0] = {"Maps Dungeons", "Dark Hyrule Castle"}},
    --    ["89"] = {[0] = {"Maps Dungeons", "Dark Hyrule Castle"}},
    --    ["8a"] = {[0] = {"Maps Dungeons", "Dark Hyrule Castle"}},
    --    ["8b"] = {[0] = {"Maps Dungeons", "Dark Hyrule Castle"}},
    --    ["8c"] = {[0] = {"Maps Dungeons", "Dark Hyrule Castle"}},
    --    ["8d"] = {[0] = {"Maps Dungeons", "Dark Hyrule Castle"}},
}
ROOM_FLAG_MAPPING_SPEC = {
    -- area = 00
    ['0000'] = {[0] = {'Overworld'}}, -- Minish Woods - Main

    -- area = 01
    ['0001'] = {[0] = {'Overworld'}}, -- Minish Village - Main
    ['0101'] = {[0] = {'Overworld'}}, -- Minish Village - Side House Area

    -- area = 02
    ['0002'] = {[0] = {'Overworld'}}, -- Hyrule Town - Main

    -- area = 03
    ['0003'] = {[0] = {'Overworld'}}, -- Hyrule Field - Western Wood (South)
    ['0103'] = {[0] = {'Overworld'}}, -- Hyrule Field - Outside Link's House
    ['0203'] = {[0] = {'Overworld'}}, -- Hyrule Field - Exit from Minish Woods
    ['0303'] = {[0] = {'Overworld'}}, -- Hyrule Field - North from Minish Woods Exit
    ['0403'] = {[0] = {'Overworld'}}, -- Hyrule Field - Minish Woods Entrance & Farmers
    ['0503'] = {[0] = {'Overworld'}}, -- Hyrule Field - Lon Lon Ranch
    ['0603'] = {[0] = {'Overworld'}}, -- Hyrule Field - Outside Castle
    ['0703'] = {[0] = {'Overworld'}}, -- Hyrule Field - West Hyrule (Crenel)
    ['0803'] = {[0] = {'Overworld'}}, -- Hyrule Field - West Hyrule (Castor Wilds)
    ['0903'] = {[0] = {'Overworld'}}, -- Hyrule Field - Percy's House Area (Moblin)

    -- area = 04
    ['0004'] = {[0] = {'Overworld'}}, -- Castor Wilds - Main

    -- area = 05
    ['0005'] = {[0] = {'Overworld'}}, -- Wind Ruins - Entrance
    ['0105'] = {[0] = {'Overworld'}}, -- Wind Ruins - Beanstalk
    ['0205'] = {[0] = {'Overworld'}}, -- Wind Ruins - Triple Tektites
    ['0305'] = {[0] = {'Overworld'}}, -- Wind Ruins - Ladder to Tektites
    ['0405'] = {[0] = {'Overworld'}}, -- Wind Ruins - Minish & Fortress Entrance
    ['0505'] = {[0] = {'Overworld'}}, -- Wind Ruins - Armos & Beetle

    -- area = 06
    ['0006'] = {[0] = {'Overworld'}}, -- Mount Crenel - Mountain Top (Jump to Rain)
    ['0106'] = {[0] = {'Overworld'}}, -- Mount Crenel - The Wall Climb
    ['0206'] = {[0] = {'Overworld'}}, -- Mount Crenel - Cave of Flames Entrance
    ['0306'] = {[0] = {'Overworld'}}, -- Mount Crenel - Gust Jar Shortcut
    ['0406'] = {[0] = {'Overworld'}}, -- Mount Crenel - Entrance

    -- area = 07
    ['0007'] = {[0] = {'Overworld'}}, -- Hyrule Castle Garden - Main

    -- area = 08
    ['0008'] = {[0] = {'Overworld'}}, -- Cloud Tops - Cloud Tops (House)
    ['0108'] = {[0] = {'Overworld'}}, -- Cloud Tops - Cloud Middles
    ['0208'] = {[0] = {'Overworld'}}, -- Cloud Tops - Cloud Bottoms

    -- area = 09
    ['0009'] = {[0] = {'Overworld'}}, -- Royal Valley - Main
    ['0109'] = {[0] = {'Overworld'}}, -- Royal Valley - Forest Maze

    -- area = 0A
    ['000A'] = {[0] = {'Overworld'}}, -- Veil Falls - Main

    -- area = 0B
    ['000B'] = {[0] = {'Overworld'}}, -- Lake Hylia - Main
    ['010B'] = {[0] = {'Overworld'}}, -- Lake Hylia - Beanstalk & Ladders

    -- area = 0C
    ['000C'] = {[0] = {'Overworld'}}, -- Caves - Minish Woods - Lake Hylia

    -- area = 0D
    ['000D'] = {[0] = {'Overworld'}}, -- Beanstalk - Mount Crenel Beanstalk
    ['010D'] = {[0] = {'Overworld'}}, -- Beanstalk - Lake Hylia Beanstalk
    ['020D'] = {[0] = {'Overworld'}}, -- Beanstalk - Wind Ruins Beanstalk
    ['030D'] = {[0] = {'Overworld'}}, -- Beanstalk - Eastern Hills Beanstalk (Exit from Minish Woods)
    ['040D'] = {[0] = {'Overworld'}}, -- Beanstalk - Western Woods (South) Beanstalk
    ['100D'] = {[0] = {'Overworld'}}, -- Beanstalk - Mount Crenel Beanstalk Climb
    ['110D'] = {[0] = {'Overworld'}}, -- Beanstalk - Lake Hylia Beanstalk Climb
    ['120D'] = {[0] = {'Overworld'}}, -- Beanstalk - Wind Ruins Beanstalk Climb
    ['130D'] = {[0] = {'Overworld'}}, -- Beanstalk - Eastern Hills Beanstalk Climb
    ['140D'] = {[0] = {'Overworld'}}, -- Beanstalk - Western Woods Beanstalk Climb

    -- area = 0F
    ['000F'] = {[0] = {'Overworld'}}, -- Digging Cave - Hyrule Town

    -- area = 10
    ['0010'] = {[0] = {"Melari's Mines"}}, -- Melari's Mine - Main

    -- area = 11
    ['0011'] = {[0] = {'Overworld'}}, -- Minish Paths - Minish Woods - Minish Village
    ['0111'] = {[0] = {'Overworld'}}, -- Minish Paths - To Bow (Castor Wilds)
    ['0211'] = {[0] = {'Overworld'}}, -- Minish Paths - Hyrule Town Schoolyard
    ['0311'] = {[0] = {'Overworld'}}, -- Minish Paths - Lon Lon Ranch
    ['0411'] = {[0] = {'Overworld'}}, -- Minish Paths - Lake Hylia - Mayor's Cabin

    -- area = 12
    ['0012'] = {[0] = {'Overworld'}}, -- Crenel Minish Paths - Crenel Bean
    ['0112'] = {[0] = {'Overworld'}}, -- Crenel Minish Paths - Crenel Water
    ['0212'] = {[0] = {'Overworld'}}, -- Crenel Minish Paths - Rainfall
    ['0312'] = {[0] = {'Overworld'}}, -- Crenel Minish Paths - To Melari's Mine

    -- area = 13
    ['0013'] = {[0] = {'Overworld'}}, -- Digging Cave - Hyrule Field Farm
    ['0313'] = {[0] = {'Overworld'}}, -- Digging Cave - Trilby Highlands

    -- area = 14
    ['0014'] = {[0] = {'Overworld'}}, -- Digging Cave - Crenel Wall

    -- area = 15
    ['0015'] = {[0] = {'Overworld'}}, -- Hyrule Town Festival - Main

    -- area = 16
    ['0016'] = {[0] = {'Overworld'}}, -- Digging Cave - Veil Falls

    -- area = 17
    ['0017'] = {[0] = {'Overworld'}}, -- Digging Cave - Castor Wilds

    -- area = 18
    ['0018'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '1F'}}, -- Fortress of Winds "Outside" - Entrance Hall
    ['0118'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds "Outside" - 2F
    ['0218'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '3F'}}, -- Fortress of Winds "Outside" - 3F
    ['0318'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds "Outside" - Mole Mitts Room
    ['0418'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds "Outside" - Small Key Spark Room

    -- area = 19
    ['0019'] = {[0] = {'Overworld'}}, -- Digging Cave - Lake Hylia Middle Cave
    ['0119'] = {[0] = {'Overworld'}}, -- Digging Cave - Lake Hylia Northern Cave

    -- area = 1A
    ['001A'] = {[0] = {'Overworld'}}, -- Veil Springs (Top) - Main

    -- area = 20
    ['0020'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Minish Elder Gentari's House (Main)
    ['0120'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Minish Elder Gentari's House (Exit)
    ['0220'] = {[0] = {'Overworld'}}, -- Minish House Interiors - House to Deepwood, Festari
    ['0320'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Red Minish House
    ['0420'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Green Minish House
    ['0520'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Blue Minish House
    ['0620'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Side Area House
    ['0720'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Shoe Minish House
    ['0820'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Pot Minish House
    ['0920'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Barrel Minish House
    ['1020'] = {[0] = {"Melari's Mines"}}, -- Minish House Interiors - Melari's Mines Southwest Room
    ['1120'] = {[0] = {"Melari's Mines"}}, -- Minish House Interiors - Melari's Mines Southeast Room
    ['1220'] = {[0] = {"Melari's Mines"}}, -- Minish House Interiors - Melari's Mines East Room
    ['2020'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Hyrule Field Southwest Minish House
    ['2120'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Hyrule Field Minish House Outside Link's House
    ['2220'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Hyrule Field Minish House next to Knuckle
    ['2320'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Lake Hylia Librari's House
    ['2420'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Hyrule Field Minish Woods Exit Minish House
    ['2520'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Hyrule Town Minish House
    ['2620'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Minish Woods Bomb Minish House
    ['2720'] = {[0] = {'Overworld'}}, -- Minish House Interiors - Lake Hylia Ocarina Minish House

    -- area = 21
    ['0021'] = {[0] = {'Overworld'}}, -- House Green Interiors - Mayor's House
    ['0121'] = {[0] = {'Overworld'}}, -- House Green Interiors - Post Office
    ['0221'] = {[0] = {'Overworld'}}, -- House Green Interiors - Library 2F
    ['0321'] = {[0] = {'Overworld'}}, -- House Green Interiors - Library 1F
    ['0421'] = {[0] = {'Overworld'}}, -- House Green Interiors - Inn 1F
    ['0521'] = {[0] = {'Overworld'}}, -- House Green Interiors - Inn West Room
    ['0621'] = {[0] = {'Overworld'}}, -- House Green Interiors - Inn Middle Room
    ['0721'] = {[0] = {'Overworld'}}, -- House Green Interiors - Inn East Room
    ['0821'] = {[0] = {'Overworld'}}, -- House Green Interiors - Inn 2F West
    ['0921'] = {[0] = {'Overworld'}}, -- House Green Interiors - Inn 2F East
    ['0A21'] = {[0] = {'Overworld'}}, -- House Green Interiors - Inn Minish Heart Piece
    ['0B21'] = {[0] = {'Overworld'}}, -- House Green Interiors - School West
    ['0C21'] = {[0] = {'Overworld'}}, -- House Green Interiors - School East

    -- area = 22
    ['0022'] = {[0] = {'Overworld'}}, -- House Wood Interiors - Stranger's House
    ['0122'] = {[0] = {'Overworld'}}, -- House Wood Interiors - West Oracle House (Nayru?)
    ['0222'] = {[0] = {'Overworld'}}, -- House Wood Interiors - West Oracle House (Farore?)
    ['0322'] = {[0] = {'Overworld'}}, -- House Wood Interiors - West Oracle House (Din?)
    ['0422'] = {[0] = {'Overworld'}}, -- House Wood Interiors - Dr. Left's House
    ['0522'] = {[0] = {'Overworld'}}, -- House Wood Interiors - "ナシ" Unused Room
    ['0622'] = {[0] = {'Overworld'}}, -- House Wood Interiors - Romio's House
    ['0722'] = {[0] = {'Overworld'}}, -- House Wood Interiors - Julietta's House
    ['0822'] = {[0] = {'Overworld'}}, -- House Wood Interiors - Percy's House
    ['0922'] = {[0] = {'Overworld'}}, -- House Wood Interiors - East Oracle House (Nayru?)
    ['0A22'] = {[0] = {'Overworld'}}, -- House Wood Interiors - East Oracle House (Farore?)
    ['0B22'] = {[0] = {'Overworld'}}, -- House Wood Interiors - East Oracle House (Din?)
    ['0C22'] = {[0] = {'Overworld'}}, -- House Wood Interiors - Cucco House
    ['1022'] = {[0] = {'Overworld'}}, -- House Wood Interiors - Link's House (Entrance)
    ['1122'] = {[0] = {'Overworld'}}, -- House Wood Interiors - Link's House (Smith)
    ['1222'] = {[0] = {'Overworld'}}, -- House Wood Interiors - Dampe's House
    ['1322'] = {[0] = {'Overworld'}}, -- House Wood Interiors - "ナシ" Unused Room
    ['1422'] = {[0] = {'Overworld'}}, -- House Wood Interiors - Lake Hylia Stockwell's House
    ['1522'] = {[0] = {'Overworld'}}, -- House Wood Interiors - Link's House 2F

    -- area = 23
    ['0023'] = {[0] = {'Overworld'}}, -- Hyrule Blue Interiors - Stockwell's Shop
    ['0123'] = {[0] = {'Overworld'}}, -- Hyrule Blue Interiors - Cafe
    ['0223'] = {[0] = {'Overworld'}}, -- Hyrule Blue Interiors - Rem's Shoe Shop
    ['0323'] = {[0] = {'Overworld'}}, -- Hyrule Blue Interiors - Bakery
    ['0423'] = {[0] = {'Overworld'}}, -- Hyrule Blue Interiors - Simon's Simulations
    ['0523'] = {[0] = {'Overworld'}}, -- Hyrule Blue Interiors - Figurine Reward House
    ['0623'] = {[0] = {'Overworld'}}, -- Hyrule Blue Interiors - Borlov Chest Game Entrance
    ['0723'] = {[0] = {'Overworld'}}, -- Hyrule Blue Interiors - Carlov's Room
    ['0823'] = {[0] = {'Overworld'}}, -- Hyrule Blue Interiors - Borlov Chest Game

    -- area = 24
    ['0024'] = {[0] = {'Overworld'}}, -- Tree Interiors - Witch's Hut
    ['1024'] = {[0] = {'Overworld'}}, -- Tree Interiors - Stairs to Carlov
    ['1124'] = {[0] = {'Overworld'}}, -- Tree Interiors - Percy's Tree House (West Field)
    ['1224'] = {[0] = {'Overworld'}}, -- Tree Interiors - Heart Piece (Southeast from Link's House)
    ['1324'] = {[0] = {'Overworld'}}, -- Tree Interiors - Stairs to Blade Brother (Lake Hylia)
    ['1424'] = {[0] = {'Overworld'}}, -- Tree Interiors - Unused (Exits to Minish Woods Business Scrub)
    ['1524'] = {[0] = {'Overworld'}}, -- Tree Interiors - Stairs to Magic Boomerang (Northwest)
    ['1624'] = {[0] = {'Overworld'}}, -- Tree Interiors - Stairs to Magic Boomerang (Northeast)
    ['1724'] = {[0] = {'Overworld'}}, -- Tree Interiors - Stairs to Magic Boomerang (Southwest)
    ['1824'] = {[0] = {'Overworld'}}, -- Tree Interiors - Stairs to Magic Boomerang (Southeast)
    ['1924'] = {[0] = {'Overworld'}}, -- Tree Interiors - Heart Piece (Southwest Field)
    ['1A24'] = {[0] = {'Overworld'}}, -- Tree Interiors - Stairs to Fairy Fountain (East of Magic Boomerang)
    ['1B24'] = {[0] = {'Overworld'}}, -- Tree Interiors - Stairs to Minish Woods Wallet Fairy
    ['1C24'] = {[0] = {'Overworld'}}, -- Tree Interiors - "未" Unfinished Room
    ['1D24'] = {[0] = {'Overworld'}}, -- Tree Interiors - Stairs to Business Scrub (Minish Woods)
    ['1E24'] = {[0] = {'Overworld'}}, -- Tree Interiors - "未" Unfinished Room
    ['1F24'] = {[0] = {'Overworld'}}, -- Tree Interiors - Heart Container (Lake Hylia Minish House)

    -- area = 25
    ['0025'] = {[0] = {'Overworld'}}, -- Blade Brothers - Grayblade (Mount Crenel)
    ['0125'] = {[0] = {'Overworld'}}, -- Blade Brothers - Splitblade (Veil Falls)
    ['0225'] = {[0] = {'Overworld'}}, -- Blade Brothers - Greatblade (North Hyrule)
    ['0325'] = {[0] = {'Overworld'}}, -- Blade Brothers - Scarblade (Castor Wilds North)
    ['0425'] = {[0] = {'Overworld'}}, -- Blade Brothers - Swiftblade I (Castor Wilds Grave)
    ['0525'] = {[0] = {'Overworld'}}, -- Blade Brothers - Grimblade (Castle Garden)
    ['0625'] = {[0] = {'Overworld'}}, -- Blade Brothers - Waveblade (Lake Hylia)
    ['0725'] = {[0] = {'Overworld'}}, -- Blade Brothers - "ナシ" Unused Room
    ['0825'] = {[0] = {'Overworld'}}, -- Blade Brothers - "ナシ" Unused Room
    ['0925'] = {[0] = {'Overworld'}}, -- Blade Brothers - "ナシ" Unused Room
    ['0A25'] = {[0] = {'Overworld'}}, -- Blade Brothers - To Grimblade
    ['0B25'] = {[0] = {'Overworld'}}, -- Blade Brothers - To Splitblade
    ['0C25'] = {[0] = {'Overworld'}}, -- Blade Brothers - To Greatblade
    ['0D25'] = {[0] = {'Overworld'}}, -- Blade Brothers - To Scarblade

    -- area = 26
    ['0026'] = {[0] = {'Overworld'}}, -- Crenel Caves - Block Pushing/Helmasaur
    ['0126'] = {[0] = {'Overworld'}}, -- Crenel Caves - Pillar Cave
    ['0226'] = {[0] = {'Overworld'}}, -- Crenel Caves - Bridge Switch
    ['0326'] = {[0] = {'Overworld'}}, -- Crenel Caves - Exit to Melari's Mines entrance
    ['0426'] = {[0] = {'Overworld'}}, -- Crenel Caves - Grip Ring Business Scrub
    ['0526'] = {[0] = {'Overworld'}}, -- Crenel Caves - Fairy Fountain Heart Piece
    ['0626'] = {[0] = {'Overworld'}}, -- Crenel Caves - Spiny Chu Bomb Block Puzzle
    ['0726'] = {[0] = {'Overworld'}}, -- Crenel Caves - Chuchu Pot Chest
    ['0826'] = {[0] = {'Overworld'}}, -- Crenel Caves - Water Heart Piece
    ['0926'] = {[0] = {'Overworld'}}, -- Crenel Caves - 15 Rupee Fairy Fountain
    ['0A26'] = {[0] = {'Overworld'}}, -- Crenel Caves - Helmasaur Hallway (2F)
    ['0B26'] = {[0] = {'Overworld'}}, -- Crenel Caves - Mushroom and Keese (1F)
    ['0C26'] = {[0] = {'Overworld'}}, -- Crenel Caves - Ladder to Green Water
    ['0D26'] = {[0] = {'Overworld'}}, -- Crenel Caves - Bomb Business Scrub
    ['0E26'] = {[0] = {'Overworld'}}, -- Crenel Caves - Hermit's Cave
    ['0F26'] = {[0] = {'Overworld'}}, -- Crenel Caves - Hint Scrub
    ['1026'] = {[0] = {'Overworld'}}, -- Crenel Caves - To Grayblade

    -- area = 27
    ['0027'] = {[0] = {'Overworld'}}, -- Minish Holes - Lon Lon Ranch, north
    ['0127'] = {[0] = {'Overworld'}}, -- Minish Holes - Lake Hylia East Minish Hole House
    ['0227'] = {[0] = {'Overworld'}}, -- Minish Holes - Hyrule Castle Garden, top right
    ['0327'] = {[0] = {'Overworld'}}, -- Minish Holes - Mt. Crenel Minish Hole House
    ['0427'] = {[0] = {'Overworld'}}, -- Minish Holes - Outside Hyrule Castle, East
    ['0527'] = {[0] = {'Overworld'}}, -- Minish Holes - "ナシ" Unused Room
    ['0627'] = {[0] = {'Overworld'}}, -- Minish Holes - Castor Wilds Bow Hole
    ['0727'] = {[0] = {'Overworld'}}, -- Minish Holes - Wind Ruins Entrance Minish Hole House
    ['0827'] = {[0] = {'Overworld'}}, -- Minish Holes - Minish Woods South Hole
    ['0927'] = {[0] = {'Overworld'}}, -- Minish Holes - Castor Wilds North Hole
    ['0A27'] = {[0] = {'Overworld'}}, -- Minish Holes - Castor Wilds West Hole
    ['0B27'] = {[0] = {'Overworld'}}, -- Minish Holes - Castor Wilds Middle Hole
    ['0C27'] = {[0] = {'Overworld'}}, -- Minish Holes - Wind Ruins Tektite Room
    ['0D27'] = {[0] = {'Overworld'}}, -- Minish Holes - Castor Wilds Next to Bow Hole
    ['0E27'] = {[0] = {'Overworld'}}, -- Minish Holes - "ナシ" Unused Room
    ['0F27'] = {[0] = {'Overworld'}}, -- Minish Holes - "ナシ" Unused Room
    ['1027'] = {[0] = {'Overworld'}}, -- Minish Holes - "ナシ" Unused Room
    ['1127'] = {[0] = {'Overworld'}}, -- Minish Holes - "ナシ" Unused Room

    -- area = 28
    ['0028'] = {[0] = {'Overworld'}}, -- House Tile Interiors - Carpenter House
    ['0128'] = {[0] = {'Overworld'}}, -- House Tile Interiors - Swiftblade's House
    ['0228'] = {[0] = {'Overworld'}}, -- House Tile Interiors - Ranch House West
    ['0328'] = {[0] = {'Overworld'}}, -- House Tile Interiors - Ranch House East
    ['0428'] = {[0] = {'Overworld'}}, -- House Tile Interiors - Farm House
    ['0528'] = {[0] = {'Overworld'}}, -- House Tile Interiors - Lake Hylia Mayor's House

    -- area = 29
    ['0029'] = {[0] = {'Overworld'}}, -- Great Fairy Fountains - Graveyard Quiver Fairy
    ['0129'] = {[0] = {'Overworld'}}, -- Great Fairy Fountains - Minish Woods Wallet Fairy
    ['0229'] = {[0] = {'Overworld'}}, -- Great Fairy Fountains - Mount Crenel Bomb Fairy

    -- area = 2A
    ['002A'] = {[0] = {'Overworld'}}, -- Castor Wilds Caves - South Gold Kinstone
    ['012A'] = {[0] = {'Overworld'}}, -- Castor Wilds Caves - North Business Scrub & Gold Kinstone
    ['022A'] = {[0] = {'Overworld'}}, -- Castor Wilds Caves - Wind Ruins Cave
    ['032A'] = {[0] = {'Overworld'}}, -- Castor Wilds Caves - Darknut Cave Entrance
    ['042A'] = {[0] = {'Overworld'}}, -- Castor Wilds Caves - Northeast Heart Piece Cave

    -- area = 2B
    ['002B'] = {[0] = {'Overworld'}}, -- Castor Wilds Darknut Cave - Darknut Room
    ['012B'] = {[0] = {'Overworld'}}, -- Castor Wilds Darknut Cave - Hallway

    -- area = 2C
    ['002C'] = {[0] = {'Overworld'}}, -- Armos Interiors - Wind Ruins Entrance North
    ['012C'] = {[0] = {'Overworld'}}, -- Armos Interiors - Wind Ruins Entrance South
    ['022C'] = {[0] = {'Overworld'}}, -- Armos Interiors - Wind Ruins 4 Armos Leftmost
    ['032C'] = {[0] = {'Overworld'}}, -- Armos Interiors - Wind Ruins 4 Armos Middle left
    ['042C'] = {[0] = {'Overworld'}}, -- Armos Interiors - Wind Ruins 4 Armos Middle right
    ['052C'] = {[0] = {'Overworld'}}, -- Armos Interiors - Wind Ruins 4 Armos Rightmost
    ['062C'] = {[0] = {'Overworld'}}, -- Armos Interiors - Unused (Exits from 05's position)
    ['072C'] = {[0] = {'Overworld'}}, -- Armos Interiors - Wind Ruins Minish Grass Path
    ['082C'] = {[0] = {'Overworld'}}, -- Armos Interiors - Unused (Wind Ruins Entrance, front of cave)
    ['092C'] = {[0] = {"Maps Dungeons", "Fortress of Winds", "3F"}}, -- Armos Interiors - Fortress of Winds East Side Left Armos
    ['0A2C'] = {[0] = {"Maps Dungeons", "Fortress of Winds", "3F"}}, -- Armos Interiors - Fortress of Winds East Side Right Armos

    -- area = 2D
    ['002D'] = {[0] = {'Overworld'}}, -- Town House Minish - Mayor's House Hole
    ['012D'] = {[0] = {'Overworld'}}, -- Town House Minish - West Oracle House Hole
    ['022D'] = {[0] = {'Overworld'}}, -- Town House Minish - Dr. Left's House Hole
    ['032D'] = {[0] = {'Overworld'}}, -- Town House Minish - Carpenter House Hole
    ['042D'] = {[0] = {'Overworld'}}, -- Town House Minish - Cafe Hole
    ['052D'] = {[0] = {'Overworld'}}, -- Town House Minish - Unused
    ['102D'] = {[0] = {'Overworld'}}, -- Town House Minish - Library Bookshelf
    ['112D'] = {[0] = {'Overworld'}}, -- Town House Minish - Librari's Book House
    ['122D'] = {[0] = {'Overworld'}}, -- Town House Minish - Rem's Shoe Shop

    -- area = 2E
    ['002E'] = {[0] = {'Overworld'}}, -- House Roofs - Cafe Roof
    ['012E'] = {[0] = {'Overworld'}}, -- House Roofs - Stockwell's Roof
    ['022E'] = {[0] = {'Overworld'}}, -- House Roofs - Dr. Left's Roof
    ['032E'] = {[0] = {'Overworld'}}, -- House Roofs - Bakery Roof

    -- area = 2F
    ['002F'] = {[0] = {'Overworld'}}, -- Goron Cave - Stairs to Cave
    ['012F'] = {[0] = {'Overworld'}}, -- Goron Cave - Main

    -- area = 30
    ['0030'] = {[0] = {'Overworld'}}, -- Wind Tribe Tower - Entrance
    ['0130'] = {[0] = {'Overworld'}}, -- Wind Tribe Tower - Floor 2
    ['0230'] = {[0] = {'Overworld'}}, -- Wind Tribe Tower - Floor 3
    ['0330'] = {[0] = {'Overworld'}}, -- Wind Tribe Tower - Floor 4

    -- area = 31
    ['0031'] = {[0] = {'Overworld'}}, -- Entrance to Palace of Winds - Main

    -- area = 32
    ['0032'] = {[0] = {'Overworld'}}, -- Caves - Magic Boomerang
    ['0132'] = {[0] = {'Overworld'}}, -- Caves - To Graveyard
    ['0232'] = {[0] = {'Overworld'}}, -- Caves - Unused Spring Cave
    ['0332'] = {[0] = {'Overworld'}}, -- Caves - Unused Spring Cave
    ['0432'] = {[0] = {'Overworld'}}, -- Caves - Unused Bomb Block Cave
    ['0532'] = {[0] = {'Overworld'}}, -- Caves - Unused Bomb Block Cave
    ['0632'] = {[0] = {'Overworld'}}, -- Caves - Unused Block Cave
    ['0732'] = {[0] = {'Overworld'}}, -- Caves - Keese Chest Cave (Trilby Highlands)
    ['0832'] = {[0] = {'Overworld'}}, -- Caves - Fairy Fountain (Trilby Highlands)
    ['0932'] = {[0] = {'Overworld'}}, -- Caves - Fairy Fountain (Outside Link's House)
    ['0A32'] = {[0] = {'Overworld'}}, -- Caves - Unused Water Cave
    ['0B32'] = {[0] = {'Overworld'}}, -- Caves - Hyrule Town Waterfall
    ['0C32'] = {[0] = {'Overworld'}}, -- Caves - Lon Lon Ranch Cave
    ['0D32'] = {[0] = {'Overworld'}}, -- Caves - Lon Lon Ranch Secret Cave
    ['0E32'] = {[0] = {'Overworld'}}, -- Caves - Trilby Highlands Cave
    ['0F32'] = {[0] = {'Overworld'}}, -- Caves - Lon Lon Ranch Wallet
    ['1032'] = {[0] = {'Overworld'}}, -- Caves - 75 Rupee Cave (Outside Link's House)
    ['1132'] = {[0] = {'Overworld'}}, -- Caves - 75 Rupee Cave (Trilby Highlands)
    ['1232'] = {[0] = {'Overworld'}}, -- Caves - Fairy Fountain (Trilby Highlands Mole Mitts Cave)
    ['1332'] = {[0] = {'Overworld'}}, -- Caves - Keese Chest Cave (Southeast Hyrule)
    ['1432'] = {[0] = {'Overworld'}}, -- Caves - Bottle Business Scrub
    ['1532'] = {[0] = {'Overworld'}}, -- Caves - Heart Piece Hallway
    ['1632'] = {[0] = {'Overworld'}}, -- Caves - Fairy Fountain (Tree East of Magic Boomerang)
    ['1732'] = {[0] = {'Overworld'}}, -- Caves - Kinstone Business Scrub

    -- area = 33
    ['0033'] = {[0] = {'Overworld'}}, -- Veil Falls Caves - Helmasaur Keese Hallway 2F
    ['0133'] = {[0] = {'Overworld'}}, -- Veil Falls Caves - Helmasaur Keese Hallway 1F
    ['0233'] = {[0] = {'Overworld'}}, -- Veil Falls Caves - Helmasaur Keese Hallway Secret Room
    ['0333'] = {[0] = {'Overworld'}}, -- Veil Falls Caves - Entrance Cave
    ['0433'] = {[0] = {'Overworld'}}, -- Veil Falls Caves - Entrance Cave Exit
    ['0533'] = {[0] = {'Overworld'}}, -- Veil Falls Caves - Entrance Cave Secret Chest Room
    ['0633'] = {[0] = {'Overworld'}}, -- Veil Falls Caves - Entrance Cave Secret Staircases
    ['0733'] = {[0] = {'Overworld'}}, -- Veil Falls Caves - Entrance Cave Clone Block Puzzle
    ['0833'] = {[0] = {'Overworld'}}, -- Veil Falls Caves - Water Rupee Path
    ['0933'] = {[0] = {'Overworld'}}, -- Veil Falls Caves - Waterfall Heart Piece Cave

    -- area = 34
    ['0034'] = {[0] = {'Overworld'}}, -- Graveyard Caves - Heart Piece Grave
    ['0134'] = {[0] = {'Overworld'}}, -- Graveyard Caves - Gina Grave

    -- area = 35
    ['0035'] = {[0] = {'Overworld'}}, -- Minish Caves - Mount Crenel Bean Plant Pesto Cave
    ['0135'] = {[0] = {'Overworld'}}, -- Minish Caves - Castor Wilds Southeast Water 1
    ['0235'] = {[0] = {'Overworld'}}, -- Minish Caves - Castor Wilds Southeast Water 2
    ['0335'] = {[0] = {'Overworld'}}, -- Minish Caves - Wind Ruins Minish Cave
    ['0435'] = {[0] = {'Overworld'}}, -- Minish Caves - Outside Link's House, Water Cave
    ['0535'] = {[0] = {'Overworld'}}, -- Minish Caves - Minish Woods North Cave 1
    ['0635'] = {[0] = {'Overworld'}}, -- Minish Caves - Minish Woods North Cave 2
    ['0735'] = {[0] = {'Overworld'}}, -- Minish Caves - Lake Hylia North Cave
    ['0835'] = {[0] = {'Overworld'}}, -- Minish Caves - Lake Hylia, Cave to Librari's House
    ['0935'] = {[0] = {'Overworld'}}, -- Minish Caves - Minish Woods Southwest Caves

    -- area = 36
    ['0036'] = {[0] = {'Overworld'}}, -- Castle Garden Minish Holes - East Fountain Hole
    ['0136'] = {[0] = {'Overworld'}}, -- Castle Garden Minish Holes - West Fountain Hole

    -- area = 37
    ['0037'] = {[0] = {'Overworld'}}, -- Castle Garden Minish Holes - Unused?
    ['0137'] = {[0] = {'Overworld'}}, -- Castle Garden Minish Holes - Unused?

    -- area = 38
    ['0038'] = {[0] = {'Overworld'}}, -- Ezlo's Room - Ezlo's Room

    -- area = 40
    ['0040'] = {[0] = {'Overworld'}}, -- Castle Underground Test Dungeon? - Top Left Room
    ['0140'] = {[0] = {'Overworld'}}, -- Castle Underground Test Dungeon? - Top Room
    ['0240'] = {[0] = {'Overworld'}}, -- Castle Underground Test Dungeon? - Top Right Room
    ['0340'] = {[0] = {'Overworld'}}, -- Castle Underground Test Dungeon? - Left Room
    ['0440'] = {[0] = {'Overworld'}}, -- Castle Underground Test Dungeon? - Middle Room
    ['0540'] = {[0] = {'Overworld'}}, -- Castle Underground Test Dungeon? - Right Room
    ['0640'] = {[0] = {'Overworld'}}, -- Castle Underground Test Dungeon? - Bottom Right Room
    ['0740'] = {[0] = {'Overworld'}}, -- Castle Underground Test Dungeon? - Bottom Room
    ['0840'] = {[0] = {'Overworld'}}, -- Castle Underground Test Dungeon? - Bottom Left Room

    -- area = 41
    ['0041'] = {[0] = {'Overworld'}}, -- Hyrule Town Well - Main
    ['0141'] = {[0] = {'Overworld'}}, -- Hyrule Town Well - Well Entrance

    -- area = 42
    ['0042'] = {[0] = {'Overworld'}}, -- Castle Garden Fountain Stairs - East Heart Piece
    ['0142'] = {[0] = {'Overworld'}}, -- Castle Garden Fountain Stairs - West Fairy Fountain

    -- area = 43
    ['0043'] = {[0] = {'Overworld'}}, -- Castle Garden Underground - Entrance
    ['0143'] = {[0] = {'Overworld'}}, -- Castle Garden Underground - Exit to Castle

    -- area = 44
    ['0044'] = {[0] = {'Overworld'}}, -- Simon's Simulations - Main

    -- area = 45
    ['0045'] = {[0] = {'Overworld'}}, -- Pillar Test Room? - Main

    -- area = 46
    ['0046'] = {[0] = {'Overworld'}}, -- Cave Test Dungeon? - Top Left Room
    ['0146'] = {[0] = {'Overworld'}}, -- Cave Test Dungeon? - Top Room
    ['0246'] = {[0] = {'Overworld'}}, -- Cave Test Dungeon? - Top Right Room
    ['0346'] = {[0] = {'Overworld'}}, -- Cave Test Dungeon? - Left Room
    ['0446'] = {[0] = {'Overworld'}}, -- Cave Test Dungeon? - Middle Room
    ['0546'] = {[0] = {'Overworld'}}, -- Cave Test Dungeon? - Right Room
    ['0646'] = {[0] = {'Overworld'}}, -- Cave Test Dungeon? - Middle Bottom Room
    ['0746'] = {[0] = {'Overworld'}}, -- Cave Test Dungeon? - Bottom Middle

    -- area = 47
    ['0047'] = {[0] = {'Overworld'}}, -- Clone Test Cave - Entrance
    ['0147'] = {[0] = {'Overworld'}}, -- Clone Test Cave - Middle
    ['0247'] = {[0] = {'Overworld'}}, -- Clone Test Cave - End

    -- area = 48
    ['0048'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Madderpillar
    ['0148'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Pre-Madderpillar, Blue Portal
    ['0248'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Stairs to B1
    ['0348'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Pot Bridge Room
    ['0448'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Double Statue Room
    ['0548'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Map & Heart Piece Room
    ['0648'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Barrel Room
    ['0748'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Button & Mushrooms
    ['0848'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Mulldozer Fight
    ['0948'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Pillars & Slugs
    ['0A48'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Lever & Mushroom
    ['0B48'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Entrance Room
    ['1048'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Slug & Torch Room
    ['1148'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B2'}}, -- Deepwood Shrine - Boss Key Room
    ['1248'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B2'}}, -- Deepwood Shrine - Compass Room
    ['1348'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B2'}}, -- Deepwood Shrine - Unused
    ['1448'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B2'}}, -- Deepwood Shrine - Lily Pad West
    ['1548'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B2'}}, -- Deepwood Shrine - Lily Pad East
    ['1648'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B2'}}, -- Deepwood Shrine - Softlock
    ['1748'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', '1F'}}, -- Deepwood Shrine - Pre-Boss Room
    ['2048'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', 'B1'}}, -- Deepwood Shrine - Inside Barrel

    -- area = 49
    ['0049'] = {[0] = {'Maps Dungeons', 'Deepwood Shrine', '1F'}}, -- Deepwood Shrine Boss Room - Main

    -- area = 4A
    ['004A'] = {[0] = {'Overworld'}}, -- Outside Deepwood Shrine - Main

    -- area = 4D
    ['004D'] = {[0] = {'Overworld'}}, -- Deepwood Shrine Test Room - Main

    -- area = 50
    ['0050'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B1'}}, -- Cave of Flames - Room After Cane
    ['0150'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B1'}}, -- Cave of Flames - Spiny Chu Room
    ['0250'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B1'}}, -- Cave of Flames - Cart to Spiny Chu
    ['0350'] = {[0] = {'Maps Dungeons', 'Cave of Flames', '1F'}}, -- Cave of Flames - Entrance Room
    ['0450'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B1'}}, -- Cave of Flames - Main Cart
    ['0550'] = {[0] = {'Maps Dungeons', 'Cave of Flames', '1F'}}, -- Cave of Flames - North from Entrance
    ['0650'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B1'}}, -- Cave of Flames - Cart West
    ['0750'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B1'}}, -- Cave of Flames - Helmasaur Fight
    ['0850'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B1'}}, -- Cave of Flames - Rollobite Lava Room
    ['0950'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B1'}}, -- Cave of Flames - Minish Lava Room
    ['1050'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B2'}}, -- Cave of Flames - Minish Spike Trap Room
    ['1150'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B2'}}, -- Cave of Flames - Four Rollobite Switch Room
    ['1250'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B2'}}, -- Cave of Flames - Hole to Gleerok
    ['1350'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B2'}}, -- Cave of Flames - Path to Boss Key
    ['1450'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B2'}}, -- Cave of Flames - Path to Boss Key 2
    ['1550'] = {[0] = {'Maps Dungeons', 'Cave of Flames', '1F'}}, -- Cave of Flames - Compass Room
    ['1650'] = {[0] = {'Maps Dungeons', 'Cave of Flames', '1F'}}, -- Cave of Flames - Bob-omb Cracked Wall Room
    ['1750'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B2'}}, -- Cave of Flames - Boss Door & Boss Key Room

    -- area = 51
    ['0051'] = {[0] = {'Maps Dungeons', 'Cave of Flames', 'B3'}}, -- Cave of Flames Boss Room - Main

    -- area = 57
    ['0057'] = {[0] = {'Overworld'}}, -- Cave of Flames Test Room - Main

    -- area = 58
    ['0058'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '3F'}}, -- Fortress of Winds - Double Eyegore
    ['0158'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '3F'}}, -- Fortress of Winds - Before Mazaal
    ['0258'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '3F'}}, -- Fortress of Winds - East Side Key Lever
    ['0358'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '3F'}}, -- Fortress of Winds - Pit Platforms
    ['0458'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '3F'}}, -- Fortress of Winds - West Side Key Lever
    ['1058'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds - Darknut Room
    ['1158'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds - Arrow Eye Bridge to Darknut
    ['1258'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds - North Split Path Pit
    ['1358'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds - Wallmaster Minish Portal
    ['1458'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds - Pillar Clone Buttons
    ['1558'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds - Rotating Spike Traps after Darknut
    ['1658'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '3F'}}, -- Fortress of Winds - Mazaal
    ['1758'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds - West Side Stalfos Fight
    ['1858'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds - West Side Eye/Entrance to Mole Mitts Room
    ['1958'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds - 2F Main Room
    ['1A58'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds - Wallmaster Minish Hole to Small Key
    ['1B58'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds - Boss Key
    ['1C58'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds - West Side Stairs 2F
    ['1D58'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '2F'}}, -- Fortress of Winds - East Side Stairs 2F
    ['2058'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '1F'}}, -- Fortress of Winds - West Side Stairs 1F
    ['2158'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '1F'}}, -- Fortress of Winds - Center Stairs 1F
    ['2258'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '1F'}}, -- Fortress of Winds - East Side Stairs 1F
    ['2358'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '1F'}}, -- Fortress of Winds - West Wizzrobe Fight Room
    ['2458'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '1F'}}, -- Fortress of Winds - East Heart Piece Room

    -- area = 59
    ['0059'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '3F'}}, -- Top of Fortress - Main

    -- area = 5A
    ['005A'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '3F'}}, -- Inside Mazaal - Other Phases
    ['015A'] = {[0] = {'Maps Dungeons', 'Fortress of Winds', '3F'}}, -- Inside Mazaal - Phase 1

    -- area = 5B

    -- area = 5F
    ['005F'] = {[0] = {'Overworld'}}, -- Fortress of Winds Test Room - Main

    -- area = 60
    ['0060'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - West Hole to Boss Key
    ['0160'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - North Split Room
    ['0260'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - East Hole to Key
    ['0360'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - Entrance Room
    ['0460'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - Stairs to Northwest Lever
    ['0560'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - Scissors Beetle Miniboss Room
    ['0660'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - West Waterfall Northwest
    ['0760'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - West Waterfall Northeast
    ['0860'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - Waifu & Element
    ['0960'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - Ice Corner to East
    ['0A60'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - Ice Pit Maze
    ['0B60'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - Hole to Blue Chuchu Key
    ['0C60'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - West Waterfall Southeast
    ['0D60'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - West Waterfall Southwest
    ['0E60'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - Big Octo Room
    ['0F60'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - Room to Big Blue Chuchu
    ['1060'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B1'}}, -- Temple of Droplets - Big Blue Chuchu Room
    ['1160'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B3'}}, -- Temple of Droplets - Big Blue Chuchu Key
    
    ['2060'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Boss Key Room
    ['2160'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - North Small Key Room
    ['2260'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Block Clone Button Puzzle
    ['2360'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Block Clone Puzzle
    ['2460'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Block Clone Ice Bridge
    ['2560'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Stairs to Scissors Beetle Miniboss Room
    ['2660'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Spike Bar Flipper Room after 9 Lanterns
    ['2760'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - 9 Lanterns
    ['2860'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Lilypad Ice Blocks
    ['2960'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - "1 Frame Roll" Pit
    ['2A60'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Mulldozers & Fire Bars
    ['2B60'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Dark Lantern Maze
    ['2C60'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Twin Madderpillars
    ['2D60'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - After Twin Madderpillars
    ['2E60'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Blue Chuchu Key Lever
    ['2F60'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Mulldozer Key Room
    ['3060'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Bomb Wall to Twin Madderpillars
    ['3160'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Lilypad B2 West
    ['3260'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Compass Room to 4 Lanterns
    ['3360'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - 4 Lantern Scissors Beetles
    ['3460'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Lilypad B2 Middle
    ['3560'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Lilypad B2 East Madderpillar
    ['3660'] = {[0] = {'Maps Dungeons', 'Temple of Droplets','B2'}}, -- Temple of Droplets - Flamebar Block Puzzle

    -- area = 61
    ['0061'] = {[0] = {'Overworld'}}, -- Unused (Outside Droplets?) - Main

    -- area = 62
    ['0062'] = {[0] = {'Overworld'}}, -- Hyrule Town Sewer (Bracelets) - Entrance
    ['0162'] = {[0] = {'Overworld'}}, -- Hyrule Town Sewer (Bracelets) - North Room
    ['0262'] = {[0] = {'Overworld'}}, -- Hyrule Town Sewer (Bracelets) - Pacci Jump Room
    ['0362'] = {[0] = {'Overworld'}}, -- Hyrule Town Sewer (Bracelets) - Blue Mulldozer Fight
    ['0462'] = {[0] = {'Overworld'}}, -- Hyrule Town Sewer (Bracelets) - West Chest Room
    ['1062'] = {[0] = {'Overworld'}}, -- Hyrule Town Sewer (Flippers) - Flippers Room
    ['1162'] = {[0] = {'Overworld'}}, -- Hyrule Town Sewer (Flippers) - Librari Trapdoor Entrance
    ['1262'] = {[0] = {'Overworld'}}, -- Hyrule Town Sewer (Flippers) - West Frozen Chest
    ['1362'] = {[0] = {'Overworld'}}, -- Hyrule Town Sewer (Flippers) - Cross Intersection
    ['1462'] = {[0] = {'Overworld'}}, -- Hyrule Town Sewer (Flippers) - Southeast Corner
    ['1562'] = {[0] = {'Overworld'}}, -- Hyrule Town Sewer (Flippers) - Entrance

    -- area = 67
    ['0067'] = {[0] = {'Overworld'}}, -- Temple of Droplets Test Room? - Broken Room

    -- area = 68
    ['0068'] = {[0] = {'Maps Dungeons', 'Royal Crypt'}}, -- Royal Crypt - King Gustaf's Room
    ['0168'] = {[0] = {'Maps Dungeons', 'Royal Crypt'}}, -- Royal Crypt - Water Rope Hallway
    ['0268'] = {[0] = {'Maps Dungeons', 'Royal Crypt'}}, -- Royal Crypt - Gibdo Fight
    ['0368'] = {[0] = {'Maps Dungeons', 'Royal Crypt'}}, -- Royal Crypt - Unused Clone Button Room
    ['0468'] = {[0] = {'Maps Dungeons', 'Royal Crypt'}}, -- Royal Crypt - Key Block Room
    ['0568'] = {[0] = {'Maps Dungeons', 'Royal Crypt'}}, -- Royal Crypt - Unused Block Room
    ['0668'] = {[0] = {'Maps Dungeons', 'Royal Crypt'}}, -- Royal Crypt - Unused Door Hall
    ['0768'] = {[0] = {'Maps Dungeons', 'Royal Crypt'}}, -- Royal Crypt - Mushroom Pit
    ['0868'] = {[0] = {'Maps Dungeons', 'Royal Crypt'}}, -- Royal Crypt - Entrance

    -- area = 6F
    ['006F'] = {[0] = {'Overworld'}}, -- Royal Crypt Test Room - Main

    -- area = 70
    ['0070'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - Tornado to Gyorg Pair
    ['0170'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - Boss Key Room
    ['0270'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - Before Ball and Chain Soldiers
    ['0370'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - Boss Door to Gyorg
    ['0470'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - East Chest from Gyorg Boss Door
    ['0570'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - Moblin & Wizzrobe Fight
    ['0670'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - 4 Button Stalfos
    ['0770'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - Fan & Small Key to Boss Key
    ['0870'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - Ball and Chain Soldiers
    ['0970'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - Bombarossa Path
    ['0A70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - Hole to Red Darknut Miniboss
    ['0B70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - To Bombarossa Path
    ['0C70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '1F'}}, -- Palace of Winds - Red Darknut Miniboss Fight
    ['0D70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - Bombable Wall to Outside
    ['0E70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds - Bombable Walls Outside
    ['0F70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '4F'}}, -- Palace of Winds - Cloud Jumps to Ball and Chain Soldiers
    ['1070'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '4F'}}, -- Palace of Winds - Block Maze to Boss Door
    ['1170'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '4F'}}, -- Palace of Winds - Cracked Floor Lakitu Jumps
    ['1270'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '4F'}}, -- Palace of Winds - Bridge to Heart Piece
    ['1370'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '4F'}}, -- Palace of Winds - Bridge Fan Floor Spike Room
    ['1470'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '4F'}}, -- Palace of Winds - To Bridge Fan Floor Spike Room
    ['1570'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '4F'}}, -- Palace of Winds - Red Portal Hall
    ['1670'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '3F'}}, -- Palace of Winds - Platform Clone Ride to Block
    ['1770'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '3F'}}, -- Palace of Winds - Pit Corner after Switch Small Key
    ['1870'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '3F'}}, -- Palace of Winds - Platform Crow Ride
    ['1970'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '3F'}}, -- Palace of Winds - Grate Platform Ride
    ['1A70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '3F'}}, -- Palace of Winds - Spike Bar Minish Pot Maze
    ['1B70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '3F'}}, -- Palace of Winds - Floormaster Lever Room
    ['1C70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '3F'}}, -- Palace of Winds - Fire Wizzrobe Map Room
    ['1D70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '3F'}}, -- Palace of Winds - Corner to Fire Wizzrobe Map Room
    ['1E70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '3F'}}, -- Palace of Winds - Stairs after Floormaster Lever
    ['1F70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '3F'}}, -- Palace of Winds - Hole to Kinstone Wizzrobe Fight
    ['2070'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '3F'}}, -- Palace of Winds - Key Arrow Button from Minish
    ['2170'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '2F'}}, -- Palace of Winds - Grates to 3F
    ['2270'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '2F'}}, -- Palace of Winds - Spiny Fight & Fan Path
    ['2370'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '2F'}}, -- Palace of Winds - Peahat Switch Cracked Floor Room
    ['2470'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '2F'}}, -- Palace of Winds - Whirlwind Bombarossa Room
    ['2570'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '2F'}}, -- Palace of Winds - Door to Stalfos Fire Bar Room
    ['2670'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '2F'}}, -- Palace of Winds - Stalfos Fire Bar Hole to Small Key
    ['2770'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '2F'}}, -- Palace of Winds - Shortcut Door Buttons
    ['2870'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '2F'}}, -- Palace of Winds - To Peahat Switch Cracked Floor Room
    ['2970'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '2F'}}, -- Palace of Winds - Kinstone Wizzrobe Fight
    ['2A70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '2F'}}, -- Palace of Winds - Gibdo Stairs
    ['2B70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '2F'}}, -- Palace of Winds - Spike Bar Small Key
    ['2C70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '1F'}}, -- Palace of Winds - Roc's Cape Room
    ['2D70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '1F'}}, -- Palace of Winds - Fire Bar Grates
    ['2E70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '1F'}}, -- Palace of Winds - Platform Ride Bombarossas
    ['2F70'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '1F'}}, -- Palace of Winds - Bridge after Red Darknut Miniboss
    ['3070'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '1F'}}, -- Palace of Winds - Bridge Switches & Clone Block
    ['3170'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '1F'}}, -- Palace of Winds - Entrance Room
    ['3270'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '1F'}}, -- Palace of Winds - Dark Compass Hall

    -- area = 71
    ['0071'] = {[0] = {'Maps Dungeons', 'Palace of Winds', '5F'}}, -- Palace of Winds Boss Room - Main

    -- area = 77
    ['0077'] = {[0] = {'Overworld'}}, -- Palace of Winds Test Room - 

    -- area = 78
    ['0078'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'Sanctuary'}}, -- Elemental Sanctuary - Hall
    ['0178'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'Sanctuary'}}, -- Elemental Sanctuary - Main
    ['0278'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'Sanctuary'}}, -- Elemental Sanctuary - Stained Glass

    -- area = 7F
    ['007F'] = {[0] = {'Overworld'}}, -- Elemental Sanctuary Test Room - Main

    -- area = 80
    ['0080'] = {[0] = {'Overworld'}}, -- Hyrule Castle - Entrance Room
    ['0180'] = {[0] = {'Overworld'}}, -- Hyrule Castle - Halls
    ['0280'] = {[0] = {'Overworld'}}, -- Hyrule Castle - Throne Room
    ['0380'] = {[0] = {'Overworld'}}, -- Hyrule Castle - Basement Halls
    ['0480'] = {[0] = {'Overworld'}}, -- Hyrule Castle - Throne Bed Room

    -- area = 81
    ['0081'] = {[0] = {'Overworld'}}, -- Hyrule Castle - Garden to Elemental Sanctuary

    -- area = 87
    ['0087'] = {[0] = {'Overworld'}}, -- Hyrule Castle Test Room - Main

    -- area = 88
    ['0088'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Entrance Room
    ['0188'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '3F'}}, -- Dark Hyrule Castle - Top Left Corner Key Chest
    ['0288'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '3F'}}, -- Dark Hyrule Castle - Top Right Corner Key Chest
    ['0388'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '3F'}}, -- Dark Hyrule Castle - Bottom Left Corner Key Chest
    ['0488'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '3F'}}, -- Dark Hyrule Castle - Bottom Right Corner Key Chest
    ['0588'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '3F'}}, -- Dark Hyrule Castle - Keaton Hall to Vaati
    ['0688'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '3F'}}, -- Dark Hyrule Castle - Triple Darknut Fight
    ['0788'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '3F'}}, -- Dark Hyrule Castle - Top Left Stairs Corner
    ['0888'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Top Left Eye Fire Bar
    ['0988'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Boss Key Room
    ['0A88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Darknut Miniboss to Boss Key
    ['0B88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Top Right Ghini Fight
    ['0C88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - 8 Lantern Fire Bar
    ['0D88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Top Right Stairs Corner
    ['0E88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Top Left Darknut Fight
    ['0F88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Sparks to Darknut Miniboss
    ['1088'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Top Right Twin Darknut Fight
    ['1188'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Bomb Block Grate Switches
    ['1288'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - East Clone Block & Grate
    ['1388'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Bottom Left Darknut Fight
    ['1488'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Ball and Chain Soldier Boss Door Room
    ['1588'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Bottom Right Corner Darknut Fight
    ['1688'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Bottom Left Floor Tile Puzzle
    ['1788'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Entrance to Boss Door Section
    ['1888'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Clone Buttons to Bottom Right Stairs Corner
    ['1988'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Bottom Left Stairs Corner
    ['1A88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Bottom Left Ghini Fight
    ['1C88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B1'}}, -- Dark Hyrule Castle - Basement, North
    ['1D88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle - Bottom Right Stairs Corner
    ['1E88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Top Left Corner Gibdo Room
    ['1F88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Throne Room Darknut
    ['2088'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Compass Room
    ['2188'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Moldorm Stairs
    ['2288'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Entrance to Throne Room
    ['2388'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Floormasters
    ['2488'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Floor Tiles
    ['2588'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Moblin Corner to Key
    ['2688'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Cannons
    ['2788'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Spike Trap Clone Buttons
    ['2888'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Corner to Cannon
    ['2988'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Entrance Hall to 1F Small Key
    ['2A88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Corner from Small Key
    ['2B88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Bottom Left Corner Pot Room
    ['2C88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '1F'}}, -- Dark Hyrule Castle - Bottom Left Corner Gibdo Room
    ['2D88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B1'}}, -- Dark Hyrule Castle - Dark Gibdo Hall West
    ['2E88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B1'}}, -- Dark Hyrule Castle - Dark Gibdo Hall East
    ['2F88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B1'}}, -- Dark Hyrule Castle - Stairs to Throne Room
    ['3088'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B1'}}, -- Dark Hyrule Castle - Stairs to Prison
    ['3188'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B1'}}, -- Dark Hyrule Castle - Minish Portal & Fire Bars
    ['3288'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B1'}}, -- Dark Hyrule Castle - Purple Keaton Room
    ['3388'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B1'}}, -- Dark Hyrule Castle - Basement West Firebars
    ['3488'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B1'}}, -- Dark Hyrule Castle - Basement East Cannons
    ['3588'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B1'}}, -- Dark Hyrule Castle - Basement West Hall
    ['3688'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B1'}}, -- Dark Hyrule Castle - Basement East Hall
    ['3788'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B1'}}, -- Dark Hyrule Castle - Basement, South
    ['3888'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B2'}}, -- Dark Hyrule Castle - Prison, West
    ['3988'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B2'}}, -- Dark Hyrule Castle - Prison, East
    ['3A88'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'B2'}}, -- Dark Hyrule Castle - Prison, South

    -- area = 89
    ['0089'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '4F'}}, -- Dark Hyrule Castle (Outside) - Zelda Statue Platform
    ['0189'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'Sanctuary'}}, -- Dark Hyrule Castle (Outside) - Garden to Elemental Sanctuary
    ['0289'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle (Outside) - Outside, Northwest
    ['0389'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle (Outside) - Outside, Northeast
    ['0489'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle (Outside) - Outside, East
    ['0589'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle (Outside) - Outside, Southwest
    ['0689'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle (Outside) - Outside, South
    ['0789'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '2F'}}, -- Dark Hyrule Castle (Outside) - Outside, Southeast

    -- area = 8A
    ['008A'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'Sanctuary'}}, -- Vaati's Wrath Hand Rooms - First Hand
    ['018A'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'Sanctuary'}}, -- Vaati's Wrath Hand Rooms - Second Hand
    ['028A'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'Sanctuary'}}, -- Vaati's Wrath Hand Rooms - Unused

    -- area = 8B
    ['008B'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'Sanctuary'}}, -- Dark Hyrule Castle - Vaati's Wrath

    -- area = 8C
    ['008C'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', 'Sanctuary'}}, -- Dark Hyrule Castle - Vaati Transfigured

    -- area = 8D
    ['008D'] = {[0] = {'Maps Dungeons', 'Dark Hyrule Castle', '3F'}}, -- Dark Hyrule Castle - First Hallway to Vaati 1

    -- area = 8F
    ['008F'] = {[0] = {'Overworld'}} -- Dark Hyrule Castle Test Room - Main

}
