toolshortcuts = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, "R", "T", "Y", "U", "I", "O", "P", "", "", ""}

tilesetnames =
	{
	"tiles.png",
	"tiles2.png",
	"tiles3.png"
	}

usedtilesets =
	{
	[0] = 1, -- space station
				-- 
	[1] = 2, -- outside
	[2] = 2, -- lab
	[3] = 2, -- warp zone
	[4] = 2, -- ship
				--
	[5] = 3, -- tower
	}

enemysprites =
	{
	[0] = 78,
	[1] = 88,
	[2] = 36,
	[3] = 164,
	[4] = 68,
	[5] = 48,
	[6] = 176,
	[7] = 168,
	[8] = 112,
	[9] = 114,
	[10] = 92,
	[11] = 40,
	[12] = 28,
	[13] = 32,
	[14] = 100,
	[15] = 52,
	[16] = 54,
	[17] = 51,
	[18] = 156,
	[19] = 44,
	[20] = 106,
	[21] = 82,
	[22] = 116,
	[23] = 64,
	[24] = 56,
	}

enemyframes =
	{
	[0] = 4,
	[1] = 4,
	[2] = 4,
	[3] = 4,
	[4] = 4,
	[5] = 2,
	[6] = 4,
	[7] = 4,
	[8] = 2,
	[9] = 2,
	[10] = 4,
	[11] = 4,
	[12] = 4,
	[13] = 4,
	[14] = 4,
	[15] = 2,
	[16] = 1,
	[17] = 1,
	[18] = 4,
	[19] = 4,
	[20] = 2,
	[21] = 2,
	[22] = 4,
	[23] = 1,
	[24] = 1,
	}

-- Some array with arrays of names+ids
listmusicnamesids =
{
	{"Pending Silence (" .. L.CAPNONE .. ")", 0}, -- Path Complete, but this is about custom levels where 0 is silence
	{"Pushing Onwards", 1},
	{"Positive Force", 2},
	{"Potential For Anything", 3},
	{"Passion For Exploring", 4},
	{"Pause", 5},
	{"Presenting VVVVVV", 6},
	{"Plenary", 7},
	{"Predestined Fate", 8},
	{"ecroF evitisoP", 9},
	{"Popular Potpourri", 10},
	{"Pipe Dream", 11},
	{"Pressure Cooker", 12},
	{"Paced Energy", 13},
	{"Piercing The Sky", 14},
	{"Predestined Fate remix", 15},
}

-- Just the names because right click menu
listmusicnames = {}
for k,v in pairs(listmusicnamesids) do
	table.insert(listmusicnames, v[1])
end

-- Internal VVVVVV IDs as keys
listmusicids = {}
for k,v in pairs(listmusicnamesids) do
	table.insert(listmusicids, v[2], v[1])
end

-- Ok well I guess we actually need Path Complete for music commands
listmusiccommandsnamesids = table.copy(listmusicnamesids)
listmusiccommandsnamesids[1] = {"Path Complete", 0}

listmusiccommandsids = {}
for _, v in pairs(listmusiccommandsnamesids) do
	table.insert(listmusiccommandsids, v[2], v[1])
end

-- Mappings from simplified `music` IDs to internal `play` IDs
musicsimplifiedtointernal = {
	[0] = -1,
	[1] = 1,
	[2] = 2,
	[3] = 3,
	[4] = 4,
	[5] = 6,
	[6] = 8,
	[7] = 10,
	[8] = 11,
	[9] = 12,
	[10] = 13,
	[11] = 14,
}

listsoundids =
{
	[0] = "jump.wav",
	"jump2.wav",
	"hurt.wav",
	"souleyeminijingle.wav",
	"coin.wav",
	"save.wav",
	"crumble.wav",
	"vanish.wav",
	"blip.wav",
	"preteleport.wav",
	"teleport.wav",
	"crew1.wav",
	"crew2.wav",
	"crew3.wav",
	"crew4.wav",
	"crew5.wav",
	"crew6.wav",
	"terminal.wav",
	"gamesaved.wav",
	"crashing.wav",
	"blip2.wav",
	"countdown.wav",
	"go.wav",
	"crash.wav",
	"combine.wav",
	"newrecord.wav",
	"trophy.wav",
	"rescue.wav",
}

--entityidtotool = {9, }
entitytooltoid = {nil, nil, nil, 9, 10, 3, 2, 2, 1, 11, 17, 18, 19, 13, 50, 15, 16, 5, 8, 14}

state_hotkeys = {
	--[1] = {
		--{"q", "}
	--},
}

platform_labels = {
	[0] = " VV",
	[1] = " ^^",
	[2] = " <",
	[3] = "  >",
	[4] = " >I",
	[5] = ">>>>",
	[6] = "<<<<",
	[7] = ">>>>>>>>",
	[8] = "<<<<<<<<",
}

-- States in which the map is loaded at low priority
lowprio_maploading_states = {
	[3] = true,
	[10] = true,
	[11] = true,
	[19] = true,
	[28] = true,
}

-- Map exporting resolutions
map_resolutions = {
	{-1, L.MAPRES_ASSHOWN},
	{1/8, langkeys(L.MAPRES_RATIO, {1, 8, 40, 30})},
	{1/4, langkeys(L.MAPRES_PERCENT, {25, 80, 60})},
	{1/2, langkeys(L.MAPRES_PERCENT, {50, 160, 120})},
	{1, langkeys(L.MAPRES_PERCENT, {100, 320, 240})},
	{2, langkeys(L.MAPRES_PERCENT, {200, 640, 480})}
}

-- Make some dropdownable arrays from that.
map_resolutions_labels = {}
map_resolutions_numbertolabel = {}
map_resolutions_labeltonumber = {}
for k,v in pairs(map_resolutions) do
	table.insert(map_resolutions_labels, v[2])
	map_resolutions_numbertolabel[v[1]] = v[2]
	map_resolutions_labeltonumber[v[2]] = v[1]
end

limit_v = {
	mapwidth = 20,
	mapheight = 20,
	scripts = 500,
	scriptlines = 500,
	flags = 100,
	entities = 3000,
	trinkets = 100,
	crewmates = 100,
}

limit_vce = {
	mapwidth = 100,
	mapheight = 100,
	scripts = math.huge,
	scriptlines = math.huge,
	flags = 1000,
	entities = math.huge,
	trinkets = 100,
	crewmates = 100,
}


knowncommands =
	{
	say = true,
	reply = true,
	delay = true,
	happy = true,
	sad = true,
	flag = true,
	ifflag = true,
	iftrinkets = true,
	iftrinketsless = true,
	destroy = true,
	music = true,
	flash = true,

	map = true,
	squeak = true,
	speaker = true,
	playremix = true,
	warpdir = true,
	ifwarp = true,
	}

knowninternalcommands = {
	["activateteleporter"] = 1,
	["activeteleporter"] = 1,
	["addvar"] = 2,
	["alarmoff"] = 1,
	["alarmon"] = 1,
	["altstates"] = 1,
	["analogue"] = 2,
	["automapimage"] = 2,
	["backgroundtext"] = 1,
	["befadein"] = 1,
	["befadeout"] = 2,
	["blackon"] = 1,
	["blackout"] = 1,
	["bluecontrol"] = 1,
	["changeai"] = 1,
	["changecolour"] = 1,
	["changecustommood"] = 1,
	["changedir"] = 1,
	["changegravity"] = 1,
	["changemood"] = 1,
	["changeplayercolour"] = 1,
	["changetile"] = 1,
	["clearteleportscript"] = 1,
	["coincounter"] = 2,
	["companion"] = 1,
	["createactivityzone"] = 1,
	["createcrewman"] = 1,
	["createdamage"] = 2,
	["createentity"] = 1,
	["createlastrescued"] = 1,
	["createrescuedcrew"] = 1,
	["createroomtext"] = 2,
	["createscriptbox"] = 2,
	["csay"] = 2,
	["csayquiet"] = 2,
	["customactivityzone"] = 2,
	["customifflag"] = 1,
	["customiftrinkets"] = 1,
	["customiftrinketsless"] = 1,
	["custommap"] = 1,
	["customposition"] = 1,
	["customquicksave"] = 2,
	["cutscene"] = 1,
	["cutscenefast"] = 2,
	["delay"] = 1,
	["delchar"] = 2,
	["destroy"] = 1,
	["do"] = 1,
	["drawimage"] = 2,
	["drawimagemasked"] = 2,
	["drawimagepersist"] = 2,
	["drawpixel"] = 2,
	["drawrect"] = 2,
	["drawtext"] = 2,
	["endcutscene"] = 1,
	["endcutscenefast"] = 2,
	["endtext"] = 1,
	["endtextfast"] = 1,
	["endtrial"] = 2,
	["entersecretlab"] = 1,
	["everybodysad"] = 1,
	["face"] = 1,
	["fadein"] = 1,
	["fadeout"] = 1,
	["fatal_bottom"] = 2,
	["fatal_left"] = 2,
	["fatal_right"] = 2,
	["fatal_top"] = 2,
	["finalmode"] = 1,
	["finalstretch"] = 2,
	["flag"] = 1,
	["flash"] = 1,
	["flip"] = 1,
	["flipgravity"] = 1,
	["flipme"] = 1,
	["fog"] = 2,
	["foundlab"] = 1,
	["foundlab2"] = 1,
	["foundtrinket"] = 1,
	["gamemode"] = 1,
	["gamestate"] = 1,
	["gamestatedelay"] = 2,
	["getentitydata"] = 2,
	["getvar"] = 2,
	["gotocheckpoint"] = 2,
	["gotodimension"] = 2,
	["gotoposition"] = 1,
	["gotoroom"] = 1,
	["greencontrol"] = 1,
	["hascontrol"] = 1,
	["hidecoordinates"] = 1,
	["hideplayer"] = 1,
	["hidesecretlab"] = 1,
	["hideship"] = 1,
	["hidetargets"] = 1,
	["hideteleporters"] = 1,
	["hidetrinkets"] = 1,
	["ifcoins"] = 2,
	["ifcoinsless"] = 2,
	["ifcrewlost"] = 1,
	["ifcrewmates"] = 2,
	["ifcrewmatesless"] = 2,
	["ifexplored"] = 1,
	["ifflag"] = 1,
	["ifflipmode"] = 2,
	["ifkey"] = 2,
	["iflast"] = 1,
	["ifmod"] = 2,
	["ifnotflag"] = 2,
	["ifrand"] = 2,
	["ifskip"] = 1,
	["iftrial"] = 2,
	["iftrinkets"] = 1,
	["iftrinketsless"] = 1,
	["ifvar"] = 2,
	["ifvce"] = 2,
	["ifwarp"] = 1,
	["inf"] = 2,
	["infiniflip"] = 2,
	["jukebox"] = 1,
	["killplayer"] = 2,
	["leavesecretlab"] = 1,
	["load"] = 2,
	["loadimage"] = 2,
	["loadscript"] = 1,
	["loop"] = 1,
	["mapimage"] = 2,
	["markers"] = 2,
	["markmap"] = 2,
	["missing"] = 1,
	["moveplayer"] = 1,
	["moveplayersafe"] = 2,
	["musicfadein"] = 1,
	["musicfadeout"] = 1,
	["niceplay"] = 2,
	["noautobars"] = 2,
	["nocontrol"] = 1,
	["pdelay"] = 2,
	["pinf"] = 2,
	["play"] = 1,
	["playef"] = 1,
	["playfile"] = 2,
	["position"] = 1,
	["puntilbars"] = 2,
	["puntilfade"] = 2,
	["puntilmusic"] = 2,
	["purplecontrol"] = 1,
	["randchoose"] = 2,
	["randrange"] = 2,
	["realign_tower"] = 2,
	["redcontrol"] = 1,
	["reloadactivityzones"] = 2,
	["reloadcustomactivityzones"] = 2,
	["reloadonetime"] = 2,
	["reloadroom"] = 2,
	["reloadscriptboxes"] = 2,
	["reloadterminalactivityzones"] = 2,
	["removeimage"] = 2,
	["replacetiles"] = 2,
	["replyquiet"] = 2,
	["rescued"] = 1,
	["resetgame"] = 1,
	["restoreplayercolour"] = 1,
	["resumemusic"] = 1,
	["return"] = 2,
	["rollcredits"] = 1,
	["sayquiet"] = 2,
	["setblendmode"] = 2,
	["setcallback"] = 2,
	["setcheckpoint"] = 1,
	["setentitydata"] = 2,
	["setinterrupt"] = 2,
	["setroomname"] = 2,
	["setspeed"] = 2,
	["settile"] = 2,
	["setvar"] = 2,
	["setvelocity"] = 2,
	["shake"] = 1,
	["showcoordinates"] = 1,
	["showplayer"] = 1,
	["showsecretlab"] = 1,
	["showship"] = 1,
	["showtargets"] = 1,
	["showteleporters"] = 1,
	["showtrinkets"] = 1,
	["speak"] = 1,
	["speak_active"] = 1,
	["speak_active_fast"] = 2,
	["speak_fast"] = 2,
	["specialline"] = 1,
	["squeak"] = 1,
	["startintermission2"] = 1,
	["stop"] = 2,
	["stopfile"] = 2,
	["stopmusic"] = 1,
	["suicide"] = 2,
	["supercrewmate"] = 2,
	["supercrewmateroom"] = 2,
	["teleportscript"] = 1,
	["telesave"] = 1,
	["text"] = 1,
	["textboxactive"] = 1,
	["textboxtimer"] = 2,
	["toceil"] = 2,
	["tofloor"] = 1,
	["toggleflip"] = 2,
	["togglepause"] = 2,
	["trinketbluecontrol"] = 1,
	["trinketscriptmusic"] = 1,
	["trinketyellowcontrol"] = 1,
	["undovvvvvvman"] = 1,
	["unloadscriptimages"] = 2,
	["unmarkmap"] = 2,
	["untilbars"] = 1,
	["untilfade"] = 1,
	["untilmusic"] = 2,
	["vvvvvvman"] = 1,
	["walk"] = 1,
	["warpdir"] = 1,
	["yellowcontrol"] = 1,
}

warpbgcolors =
	{
		{ {16, 34, 33}, {10, 16, 14} },
		{ {34, 16, 17}, {17, 9, 11} },
		{ {34, 16, 34}, {15, 10, 16} },
		{ {16, 16, 34}, {10, 11, 16} },
		{ {34, 30, 16}, {16, 13, 10} },
		{ {20, 34, 16}, {13, 16, 10} },
		{ {18, 18, 18}, {10, 10, 10} }
	}

textboxcolors =
	{
	player = {164, 164, 255},
	cyan = {164, 164, 255},
	red = {255, 60, 60},
	yellow = {255, 255, 134},
	green = {144, 255, 144},
	blue = {95, 95, 255},
	purple = {255, 134, 255},
	gray = {174, 174, 174}
	}

alttextboxcolors =
	{
	player = {19, 164, 255},
	cyan = {19, 164, 255},
	red = {19, 60, 60},
	yellow = {19, 255, 134},
	green = {19, 255, 144},
	blue = {19, 95, 255},
	purple = {19, 134, 255},
	gray = {19, 174, 174}
	}

tilesetblocks =
	{
	[0]	=
		{
		tilesetid = 10100,
		name = langtilesetnames.short0,
		longname = langtilesetnames.long0,
		tileimg = 1,
		colors =
			{
			[-1] =
				{
				colorid = 10199,
				blocks =
					{
					  80,   81,   82,    0,    0,    0,
					 120,  121,  122,    0,    0,    0,
					 160,  161,  162,    0,    0,    0,
					 200,  201,  202,    0,    0,    0,
					 240,  241,  242,    0,    0,    0,
					},
				background =
					{
					 680,  681,  682,  880,  881,  882,
					 720,  721,  722,  920,  921,  922,
					 760,  761,  762,  960,  961,  962,
					 800,  801,  802, 1000, 1001, 1002,
					 840,  841,  842, 1040, 1041, 1042,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {109,109,109},
				v6col = 7,
				warpbg = 7,
				entcolourrow = nil, -- It's complicated
				},
			[0] = -- blue1 =
				{
				colorid = 10101,
				blocks =
					{
					  83,   84,   85,    0,    0,    0,
					 123,  124,  125,    0,    0,    0,
					 163,  164,  165,    0,    0,    0,
					 203,  204,  205,    0,    0,    0,
					 243,  244,  245,    0,    0,    0,
					},
				background =
					{
					 680,  681,  682,  880,  881,  882,
					 720,  721,  722,  920,  921,  922,
					 760,  761,  762,  960,  961,  962,
					 800,  801,  802, 1000, 1001, 1002,
					 840,  841,  842, 1040, 1041, 1042,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {131,141,235},
				v6col = 12,
				warpbg = 4,
				entcolourrow = 1,
				},
			[1] = -- pink1 =
				{
				colorid = 10102,
				blocks =
					{
					  86,   87,   88,    0,    0,    0,
					 126,  127,  128,    0,    0,    0,
					 166,  167,  168,    0,    0,    0,
					 206,  207,  208,    0,    0,    0,
					 246,  247,  248,    0,    0,    0,
					},
				background =
					{
					 698,  699,  700,  898,  899,  900,
					 738,  739,  740,  938,  939,  940,
					 778,  779,  780,  978,  979,  980,
					 818,  819,  820, 1018, 1019, 1020,
					 858,  859,  860, 1058, 1059, 1060,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {227,140,227},
				v6col = 20,
				warpbg = 3,
				entcolourrow = 2,
				},
			[2] = -- red1 =
				{
				colorid = 10103,
				blocks =
					{
					  89,   90,   91,    0,    0,    0,
					 129,  130,  131,    0,    0,    0,
					 169,  170,  171,    0,    0,    0,
					 209,  210,  211,    0,    0,    0,
					 249,  250,  251,    0,    0,    0,
					},
				background =
					{
					 695,  696,  697,  895,  896,  897,
					 735,  736,  737,  935,  936,  937,
					 775,  776,  777,  975,  976,  977,
					 815,  816,  817, 1015, 1016, 1017,
					 855,  856,  857, 1055, 1056, 1057,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,126,151},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 3,
				},
			[3] = -- yellow1 =
				{
				colorid = 10104,
				blocks =
					{
					  92,   93,   94,    0,    0,    0,
					 132,  133,  134,    0,    0,    0,
					 172,  173,  174,    0,    0,    0,
					 212,  213,  214,    0,    0,    0,
					 252,  253,  254,    0,    0,    0,
					},
				background =
					{
					 683,  684,  685,  883,  884,  885,
					 723,  724,  725,  923,  924,  925,
					 763,  764,  765,  963,  964,  965,
					 803,  804,  805, 1003, 1004, 1005,
					 843,  844,  845, 1043, 1044, 1045,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {229,235,133},
				v6col = 9,
				warpbg = 5,
				entcolourrow = 4,
				},
			[4] = -- green1 =
				{
				colorid = 10105,
				blocks =
					{
					  95,   96,   97,    0,    0,    0,
					 135,  136,  137,    0,    0,    0,
					 175,  176,  177,    0,    0,    0,
					 215,  216,  217,    0,    0,    0,
					 255,  256,  257,    0,    0,    0,
					},
				background =
					{
					 689,  690,  691,  889,  890,  891,
					 729,  730,  731,  929,  930,  931,
					 769,  770,  771,  969,  970,  971,
					 809,  810,  811, 1009, 1010, 1011,
					 849,  850,  851, 1049, 1050, 1051,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {148,238,130},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 5,
				},
			[5] = -- blue2 =
				{
				colorid = 10106,
				blocks =
					{
					  98,   99,  100,    0,    0,    0,
					 138,  139,  140,    0,    0,    0,
					 178,  179,  180,    0,    0,    0,
					 218,  219,  220,    0,    0,    0,
					 258,  259,  260,    0,    0,    0,
					},
				background =
					{
					 680,  681,  682,  880,  881,  882,
					 720,  721,  722,  920,  921,  922,
					 760,  761,  762,  960,  961,  962,
					 800,  801,  802, 1000, 1001, 1002,
					 840,  841,  842, 1040, 1041, 1042,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {140,165,227},
				v6col = 12,
				warpbg = 4,
				entcolourrow = 6,
				},
			[6] = -- red2 =
				{
				colorid = 10107,
				blocks =
					{
					 101,  102,  103,    0,    0,    0,
					 141,  142,  143,    0,    0,    0,
					 181,  182,  183,    0,    0,    0,
					 221,  222,  223,    0,    0,    0,
					 261,  262,  263,    0,    0,    0,
					},
				background =
					{
					 695,  696,  697,  895,  896,  897,
					 735,  736,  737,  935,  936,  937,
					 775,  776,  777,  975,  976,  977,
					 815,  816,  817, 1015, 1016, 1017,
					 855,  856,  857, 1055, 1056, 1057,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {227,140,148},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 7,
				},
			[7] = -- eight =
				{
				colorid = 10108,
				blocks =
					{
					 104,  105,  106,    0,    0,    0,
					 144,  145,  146,    0,    0,    0,
					 184,  185,  186,    0,    0,    0,
					 224,  225,  226,    0,    0,    0,
					 264,  265,  266,    0,    0,    0,
					},
				background =
					{
					 704,  705,  706,  904,  905,  906,
					 744,  745,  746,  944,  945,  946,
					 784,  785,  786,  984,  985,  986,
					 824,  825,  826, 1024, 1025, 1026,
					 864,  865,  866, 1064, 1065, 1066,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {140,173,228},
				v6col = 11,
				warpbg = 1,
				entcolourrow = 8,
				},
			[8] = -- eight =
				{
				colorid = 10109,
				blocks =
					{
					 107,  108,  109,    0,    0,    0,
					 147,  148,  149,    0,    0,    0,
					 187,  188,  189,    0,    0,    0,
					 227,  228,  229,    0,    0,    0,
					 267,  268,  269,    0,    0,    0,
					},
				background =
					{
					 689,  690,  691,  889,  890,  891,
					 729,  730,  731,  929,  930,  931,
					 769,  770,  771,  969,  970,  971,
					 809,  810,  811, 1009, 1010, 1011,
					 849,  850,  851, 1049, 1050, 1051,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {142,235,137},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 9,
				},
			[9] =
				{
				colorid = 10110,
				blocks =
					{
					 110,  111,  112,    0,    0,    0,
					 150,  151,  152,    0,    0,    0,
					 190,  191,  192,    0,    0,    0,
					 230,  231,  232,    0,    0,    0,
					 270,  271,  272,    0,    0,    0,
					},
				background =
					{
					 686,  687,  688,  886,  887,  888,
					 726,  727,  728,  926,  927,  928,
					 766,  767,  768,  966,  967,  968,
					 806,  807,  808, 1006, 1007, 1008,
					 846,  847,  848, 1046, 1047, 1048,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {137,235,206},
				v6col = 11,
				warpbg = 1,
				entcolourrow = 10,
				},
			[10] =
				{
				colorid = 10111,
				blocks =
					{
					 113,  114,  115,    0,    0,    0,
					 153,  154,  155,    0,    0,    0,
					 193,  194,  195,    0,    0,    0,
					 233,  234,  235,    0,    0,    0,
					 273,  274,  275,    0,    0,    0,
					},
				background =
					{
					 698,  699,  700,  898,  899,  900,
					 738,  739,  740,  938,  939,  940,
					 778,  779,  780,  978,  979,  980,
					 818,  819,  820, 1018, 1019, 1020,
					 858,  859,  860, 1058, 1059, 1060,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {235,139,223},
				v6col = 20,
				warpbg = 3,
				entcolourrow = 11,
				},
			[11] =
				{
				colorid = 10112,
				blocks =
					{
					 283,  284,  285,    0,    0,    0,
					 323,  324,  325,    0,    0,    0,
					 363,  364,  365,    0,    0,    0,
					 403,  404,  405,    0,    0,    0,
					 443,  444,  445,    0,    0,    0,
					},
				background =
					{
					 695,  696,  697,  895,  896,  897,
					 735,  736,  737,  935,  936,  937,
					 775,  776,  777,  975,  976,  977,
					 815,  816,  817, 1015, 1016, 1017,
					 855,  856,  857, 1055, 1056, 1057,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {238,130,138},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 12,
				},
			[12] =
				{
				colorid = 10113,
				blocks =
					{
					 286,  287,  288,    0,    0,    0,
					 326,  327,  328,    0,    0,    0,
					 366,  367,  368,    0,    0,    0,
					 406,  407,  408,    0,    0,    0,
					 446,  447,  448,    0,    0,    0,
					},
				background =
					{
					 686,  687,  688,  886,  887,  888,
					 726,  727,  728,  926,  927,  928,
					 766,  767,  768,  966,  967,  968,
					 806,  807,  808, 1006, 1007, 1008,
					 846,  847,  848, 1046, 1047, 1048,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {137,235,178},
				v6col = 11,
				warpbg = 6,
				entcolourrow = 13,
				},
			[13] =
				{
				colorid = 10114,
				blocks =
					{
					 289,  290,  291,    0,    0,    0,
					 329,  330,  331,    0,    0,    0,
					 369,  370,  371,    0,    0,    0,
					 409,  410,  411,    0,    0,    0,
					 449,  450,  451,    0,    0,    0,
					},
				background =
					{
					 704,  705,  706,  904,  905,  906,
					 744,  745,  746,  944,  945,  946,
					 784,  785,  786,  984,  985,  986,
					 824,  825,  826, 1024, 1025, 1026,
					 864,  865,  866, 1064, 1065, 1066,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {125,205,247},
				v6col = 12,
				warpbg = 1,
				entcolourrow = 14,
				},
			[14] =
				{
				colorid = 10115,
				blocks =
					{
					 292,  293,  294,    0,    0,    0,
					 332,  333,  334,    0,    0,    0,
					 372,  373,  374,    0,    0,    0,
					 412,  413,  414,    0,    0,    0,
					 452,  453,  454,    0,    0,    0,
					},
				background =
					{
					 701,  702,  703,  901,  902,  903,
					 741,  742,  743,  941,  942,  943,
					 781,  782,  783,  981,  982,  983,
					 821,  822,  823, 1021, 1022, 1023,
					 861,  862,  863, 1061, 1062, 1063,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {190,137,235},
				v6col = 20,
				warpbg = 4,
				entcolourrow = 15,
				},
			[15] =
				{
				colorid = 10116,
				blocks =
					{
					 295,  296,  297,    0,    0,    0,
					 335,  336,  337,    0,    0,    0,
					 375,  376,  377,    0,    0,    0,
					 415,  416,  417,    0,    0,    0,
					 455,  456,  457,    0,    0,    0,
					},
				background =
					{
					 698,  699,  700,  898,  899,  900,
					 738,  739,  740,  938,  939,  940,
					 778,  779,  780,  978,  979,  980,
					 818,  819,  820, 1018, 1019, 1020,
					 858,  859,  860, 1058, 1059, 1060,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {235,137,206},
				v6col = 8,
				warpbg = 3,
				entcolourrow = 16,
				},
			[16] =
				{
				colorid = 10117,
				blocks =
					{
					 298,  299,  300,    0,    0,    0,
					 338,  339,  340,    0,    0,    0,
					 378,  379,  380,    0,    0,    0,
					 418,  419,  420,    0,    0,    0,
					 458,  459,  460,    0,    0,    0,
					},
				background =
					{
					 683,  684,  685,  883,  884,  885,
					 723,  724,  725,  923,  924,  925,
					 763,  764,  765,  963,  964,  965,
					 803,  804,  805, 1003, 1004, 1005,
					 843,  844,  845, 1043, 1044, 1045,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {229,247,127},
				v6col = 9,
				warpbg = 5,
				entcolourrow = 17,
				},
			[17] =
				{
				colorid = 10118,
				blocks =
					{
					 301,  302,  303,    0,    0,    0,
					 341,  342,  343,    0,    0,    0,
					 381,  382,  383,    0,    0,    0,
					 421,  422,  423,    0,    0,    0,
					 461,  462,  463,    0,    0,    0,
					},
				background =
					{
					 704,  705,  706,  904,  905,  906,
					 744,  745,  746,  944,  945,  946,
					 784,  785,  786,  984,  985,  986,
					 824,  825,  826, 1024, 1025, 1026,
					 864,  865,  866, 1064, 1065, 1066,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {127,200,247},
				v6col = 11,
				warpbg = 1,
				entcolourrow = 18,
				},
			[18] =
				{
				colorid = 10119,
				blocks =
					{
					 304,  305,  306,    0,    0,    0,
					 344,  345,  346,    0,    0,    0,
					 384,  385,  386,    0,    0,    0,
					 424,  425,  426,    0,    0,    0,
					 464,  465,  466,    0,    0,    0,
					},
				background =
					{
					 701,  702,  703,  901,  902,  903,
					 741,  742,  743,  941,  942,  943,
					 781,  782,  783,  981,  982,  983,
					 821,  822,  823, 1021, 1022, 1023,
					 861,  862,  863, 1061, 1062, 1063,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {197,137,235},
				v6col = 20,
				warpbg = 4,
				entcolourrow = 19,
				},
			[19] =
				{
				colorid = 10120,
				blocks =
					{
					 307,  308,  309,    0,    0,    0,
					 347,  348,  349,    0,    0,    0,
					 387,  388,  389,    0,    0,    0,
					 427,  428,  429,    0,    0,    0,
					 467,  468,  469,    0,    0,    0,
					},
				background =
					{
					 698,  699,  700,  898,  899,  900,
					 738,  739,  740,  938,  939,  940,
					 778,  779,  780,  978,  979,  980,
					 818,  819,  820, 1018, 1019, 1020,
					 858,  859,  860, 1058, 1059, 1060,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {235,131,175},
				v6col = 8,
				warpbg = 2,
				entcolourrow = 20,
				},
			[20] =
				{
				colorid = 10121,
				blocks =
					{
					 310,  311,  312,    0,    0,    0,
					 350,  351,  352,    0,    0,    0,
					 390,  391,  392,    0,    0,    0,
					 430,  431,  432,    0,    0,    0,
					 470,  471,  472,    0,    0,    0,
					},
				background =
					{
					 692,  693,  694,  892,  893,  894,
					 732,  733,  734,  932,  933,  934,
					 772,  773,  774,  972,  973,  974,
					 812,  813,  814, 1012, 1013, 1014,
					 852,  853,  854, 1052, 1053, 1054,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,210,123},
				v6col = 17,
				warpbg = 5,
				entcolourrow = 21,
				},
			[21] =
				{
				colorid = 10122,
				blocks =
					{
					 313,  314,  315,    0,    0,    0,
					 353,  354,  355,    0,    0,    0,
					 393,  394,  395,    0,    0,    0,
					 433,  434,  435,    0,    0,    0,
					 473,  474,  475,    0,    0,    0,
					},
				background =
					{
					 686,  687,  688,  886,  887,  888,
					 726,  727,  728,  926,  927,  928,
					 766,  767,  768,  966,  967,  968,
					 806,  807,  808, 1006, 1007, 1008,
					 846,  847,  848, 1046, 1047, 1048,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {131,235,158},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 22,
				},
			[22] =
				{
				colorid = 10123,
				blocks =
					{
					 483,  484,  485,    0,    0,    0,
					 523,  524,  525,    0,    0,    0,
					 563,  564,  565,    0,    0,    0,
					 603,  604,  605,    0,    0,    0,
					 643,  644,  645,    0,    0,    0,
					},
				background =
					{
					 695,  696,  697,  895,  896,  897,
					 735,  736,  737,  935,  936,  937,
					 775,  776,  777,  975,  976,  977,
					 815,  816,  817, 1015, 1016, 1017,
					 855,  856,  857, 1055, 1056, 1057,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,126,151},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 23,
				},
			[23] =
				{
				colorid = 10124,
				blocks =
					{
					 486,  487,  488,    0,    0,    0,
					 526,  527,  528,    0,    0,    0,
					 566,  567,  568,    0,    0,    0,
					 606,  607,  608,    0,    0,    0,
					 646,  647,  648,    0,    0,    0,
					},
				background =
					{
					 683,  684,  685,  883,  884,  885,
					 723,  724,  725,  923,  924,  925,
					 763,  764,  765,  963,  964,  965,
					 803,  804,  805, 1003, 1004, 1005,
					 843,  844,  845, 1043, 1044, 1045,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {219,243,123},
				v6col = 9,
				warpbg = 5,
				entcolourrow = 24,
				},
			[24] =
				{
				colorid = 10125,
				blocks =
					{
					 489,  490,  491,    0,    0,    0,
					 529,  530,  531,    0,    0,    0,
					 569,  570,  571,    0,    0,    0,
					 609,  610,  611,    0,    0,    0,
					 649,  650,  651,    0,    0,    0,
					},
				background =
					{
					 689,  690,  691,  889,  890,  891,
					 729,  730,  731,  929,  930,  931,
					 769,  770,  771,  969,  970,  971,
					 809,  810,  811, 1009, 1010, 1011,
					 849,  850,  851, 1049, 1050, 1051,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {131,234,145},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 25,
				},
			[25] =
				{
				colorid = 10126,
				blocks =
					{
					 492,  493,  494,    0,    0,    0,
					 532,  533,  534,    0,    0,    0,
					 572,  573,  574,    0,    0,    0,
					 612,  613,  614,    0,    0,    0,
					 652,  653,  654,    0,    0,    0,
					},
				background =
					{
					 704,  705,  706,  904,  905,  906,
					 744,  745,  746,  944,  945,  946,
					 784,  785,  786,  984,  985,  986,
					 824,  825,  826, 1024, 1025, 1026,
					 864,  865,  866, 1064, 1065, 1066,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {131,199,234},
				v6col = 11,
				warpbg = 1,
				entcolourrow = 26,
				},
			[26] =
				{
				colorid = 10127,
				blocks =
					{
					 495,  496,  497,    0,    0,    0,
					 535,  536,  537,    0,    0,    0,
					 575,  576,  577,    0,    0,    0,
					 615,  616,  617,    0,    0,    0,
					 655,  656,  657,    0,    0,    0,
					},
				background =
					{
					 680,  681,  682,  880,  881,  882,
					 720,  721,  722,  920,  921,  922,
					 760,  761,  762,  960,  961,  962,
					 800,  801,  802, 1000, 1001, 1002,
					 840,  841,  842, 1040, 1041, 1042,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {141,131,234},
				v6col = 12,
				warpbg = 4,
				entcolourrow = 27,
				},
			[27] =
				{
				colorid = 10128,
				blocks =
					{
					 498,  499,  500,    0,    0,    0,
					 538,  539,  540,    0,    0,    0,
					 578,  579,  580,    0,    0,    0,
					 618,  619,  620,    0,    0,    0,
					 658,  659,  660,    0,    0,    0,
					},
				background =
					{
					 695,  696,  697,  895,  896,  897,
					 735,  736,  737,  935,  936,  937,
					 775,  776,  777,  975,  976,  977,
					 815,  816,  817, 1015, 1016, 1017,
					 855,  856,  857, 1055, 1056, 1057,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {226,140,144},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 28,
				},
			[28] =
				{
				colorid = 10129,
				blocks =
					{
					 501,  502,  503,    0,    0,    0,
					 541,  542,  543,    0,    0,    0,
					 581,  582,  583,    0,    0,    0,
					 621,  622,  623,    0,    0,    0,
					 661,  662,  663,    0,    0,    0,
					},
				background =
					{
					 689,  690,  691,  889,  890,  891,
					 729,  730,  731,  929,  930,  931,
					 769,  770,  771,  969,  970,  971,
					 809,  810,  811, 1009, 1010, 1011,
					 849,  850,  851, 1049, 1050, 1051,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {129,236,144},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 29,
				},
			[29] =
				{
				colorid = 10130,
				blocks =
					{
					 504,  505,  506,    0,    0,    0,
					 544,  545,  546,    0,    0,    0,
					 584,  585,  586,    0,    0,    0,
					 624,  625,  626,    0,    0,    0,
					 664,  665,  666,    0,    0,    0,
					},
				background =
					{
					 692,  693,  694,  892,  893,  894,
					 732,  733,  734,  932,  933,  934,
					 772,  773,  774,  972,  973,  974,
					 812,  813,  814, 1012, 1013, 1014,
					 852,  853,  854, 1052, 1053, 1054,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {235,231,131},
				v6col = 9,
				warpbg = 5,
				entcolourrow = 30,
				},
			[30] =
				{
				colorid = 10131,
				blocks =
					{
					 507,  508,  509,    0,    0,    0,
					 547,  548,  549,    0,    0,    0,
					 587,  588,  589,    0,    0,    0,
					 627,  628,  629,    0,    0,    0,
					 667,  668,  669,    0,    0,    0,
					},
				background =
					{
					 689,  690,  691,  889,  890,  891,
					 729,  730,  731,  929,  930,  931,
					 769,  770,  771,  969,  970,  971,
					 809,  810,  811, 1009, 1010, 1011,
					 849,  850,  851, 1049, 1050, 1051,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {153,235,131},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 31,
				},
			[31] =
				{
				colorid = 10132,
				blocks =
					{
					 510,  511,  512,    0,    0,    0,
					 550,  551,  552,    0,    0,    0,
					 590,  591,  592,    0,    0,    0,
					 630,  631,  632,    0,    0,    0,
					 670,  671,  672,    0,    0,    0,
					},
				background =
					{
					 698,  699,  700,  898,  899,  900,
					 738,  739,  740,  938,  939,  940,
					 778,  779,  780,  978,  979,  980,
					 818,  819,  820, 1018, 1019, 1020,
					 858,  859,  860, 1058, 1059, 1060,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {207,131,235},
				v6col = 20,
				warpbg = 3,
				entcolourrow = 32,
				},
			}
		},
	[1] =
		{
		tilesetid = 20200,
		name = langtilesetnames.short1,
		longname = langtilesetnames.long1,
		tileimg = 2,
		colors =
			{
			[0] =
				{
				colorid = 20201,
				name = L.BLUE,
				blocks =
					{
					 480,  481,  482,    0,    0,    0,
					 520,  521,  522,    0,    0,    0,
					 560,  561,  562,    0,    0,    0,
					 600,  601,  602,    0,    0,    0,
					 640,  641,  642,    0,    0,    0,
					},
				background =
					{
					 680,  681,  682,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {57,86,140},
				v6col = 12,
				warpbg = 4,
				entcolourrow = 33,
				},
			[1] =
				{
				colorid = 20202,
				name = L.RED,
				blocks =
					{
					 483,  484,  485,    0,    0,    0,
					 523,  524,  525,    0,    0,    0,
					 563,  564,  565,    0,    0,    0,
					 603,  604,  605,    0,    0,    0,
					 643,  644,  645,    0,    0,    0,
					},
				background =
					{
					 683,  684,  685,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {156,42,42},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 34,
				},
			[2] =
				{
				colorid = 20203,
				name = L.CYAN,
				blocks =
					{
					 486,  487,  488,    0,    0,    0,
					 526,  527,  528,    0,    0,    0,
					 566,  567,  568,    0,    0,    0,
					 606,  607,  608,    0,    0,    0,
					 646,  647,  648,    0,    0,    0,
					},
				background =
					{
					 686,  687,  688,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {42,156,155},
				v6col = 11,
				warpbg = 1,
				entcolourrow = 35,
				},
			[3] =
				{
				colorid = 20204,
				name = L.PURPLE,
				blocks =
					{
					 489,  490,  491,    0,    0,    0,
					 529,  530,  531,    0,    0,    0,
					 569,  570,  571,    0,    0,    0,
					 609,  610,  611,    0,    0,    0,
					 649,  650,  651,    0,    0,    0,
					},
				background =
					{
					 689,  690,  691,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {125,36,162},
				v6col = 20,
				warpbg = 3,
				entcolourrow = 36,
				},
			[4] =
				{
				colorid = 20205,
				name = L.YELLOW,
				blocks =
					{
					 492,  493,  494,    0,    0,    0,
					 532,  533,  534,    0,    0,    0,
					 572,  573,  574,    0,    0,    0,
					 612,  613,  614,    0,    0,    0,
					 652,  653,  654,    0,    0,    0,
					},
				background =
					{
					 692,  693,  694,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {191,198,0},
				v6col = 9,
				warpbg = 5,
				entcolourrow = 37,
				},
			[5] =
				{
				colorid = 20206,
				name = L.GREEN,
				blocks =
					{
					 495,  496,  497,    0,    0,    0,
					 535,  536,  537,    0,    0,    0,
					 575,  576,  577,    0,    0,    0,
					 615,  616,  617,    0,    0,    0,
					 655,  656,  657,    0,    0,    0,
					},
				background =
					{
					 695,  696,  697,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {0,198,126},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 38,
				},
			[6] =
				{
				colorid = 20207,
				name = L.PINK,
				blocks =
					{
					 498,  499,  500,    0,    0,    0,
					 538,  539,  540,    0,    0,    0,
					 578,  579,  580,    0,    0,    0,
					 618,  619,  620,    0,    0,    0,
					 658,  659,  660,    0,    0,    0,
					},
				background =
					{
					 698,  699,  700,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {224,110,177},
				v6col = 8,
				warpbg = 3,
				entcolourrow = 39,
				},
			[7] =
				{
				colorid = 20208,
				name = L.BROWN,
				blocks =
					{
					 501,  502,  503,    0,    0,    0,
					 541,  542,  543,    0,    0,    0,
					 581,  582,  583,    0,    0,    0,
					 621,  622,  623,    0,    0,    0,
					 661,  662,  663,    0,    0,    0,
					},
				background =
					{
					 701,  702,  703,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {255,142,87},
				v6col = 17,
				warpbg = 5,
				entcolourrow = 40,
				},
			}
		},
	[2] =
		{
		tilesetid = 20300,
		name = langtilesetnames.short2,
		longname = langtilesetnames.long2,
		tileimg = 2,
		colors =
			{
			[0] =
				{
				colorid = 20301,
				name = L.CYAN,
				blocks =
					{
					 280,  281,  282,  304,  305,  306,
					 479,  321,  322,  344,  345,  346,
					 360,  361,  362,  384,  385,  386,
					 400,  401,  402,  424,  425,  426,
					 440,  441,  442,  464,  465,  466,
					},
				background =
					{
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,   63,    0,    0,    0,
					   0,   52,    0,   51,    0,    0,
					   0,    0,   64,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {0,165,206},
				v6col = 11,
				warpbg = 1,
				entcolourrow = 41,
				},
			[1] =
				{
				colorid = 20302,
				name = L.RED,
				blocks =
					{
					 283,  284,  285,  313,  314,  315,
					 359,  324,  325,  353,  354,  355,
					 363,  364,  365,  393,  394,  395,
					 403,  404,  405,  433,  434,  435,
					 443,  444,  445,  473,  474,  475,
					},
				background =
					{
					 713,  713,  713,    0,    0,  439,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,   65,    0,    0,    0,
					   0,   54,    0,   53,    0,    0,
					   0,    0,   66,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {206,5,0},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 42,
				},
			[2] =
				{
				colorid = 20303,
				name = L.PINK,
				blocks =
					{
					 286,  287,  288,  310,  311,  312,
					 399,  327,  328,  350,  351,  352,
					 366,  367,  368,  390,  391,  392,
					 406,  407,  408,  430,  431,  432,
					 446,  447,  448,  470,  471,  472,
					},
				background =
					{
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,   67,    0,    0,    0,
					   0,   56,    0,   55,    0,    0,
					   0,    0,   68,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {222,0,173},
				v6col = 8,
				warpbg = 3,
				entcolourrow = 43,
				},
			[3] =
				{
				colorid = 20304,
				name = L.BLUE,
				blocks =
					{
					 289,  290,  291,    0,    0,    0,
					 329,  330,  331,    0,    0,    0,
					 369,  370,  371,    0,    0,    0,
					 409,  410,  411,    0,    0,    0,
					 449,  450,  451,    0,    0,    0,
					},
				background =
					{
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,   69,    0,    0,    0,
					   0,   58,    0,   57,    0,    0,
					   0,    0,   70,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {27,67,255},
				v6col = 12,
				warpbg = 4,
				entcolourrow = 44,
				},
			[4] =
				{
				colorid = 20305,
				name = L.YELLOW,
				blocks =
					{
					 292,  293,  294,  307,  308,  309,
					 319,  333,  334,  347,  348,  349,
					 372,  373,  374,  387,  388,  389,
					 412,  413,  414,  427,  428,  429,
					 452,  453,  454,  467,  468,  469,
					},
				background =
					{
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,   71,    0,    0,    0,
					   0,   60,    0,   59,    0,    0,
					   0,    0,   72,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {194,206,0},
				v6col = 9,
				warpbg = 5,
				entcolourrow = 45,
				},
			[5] =
				{
				colorid = 20306,
				name = L.GREEN,
				blocks =
					{
					 295,  296,  297,  316,  317,  318,
					 335,  336,  337,  356,  357,  358,
					 375,  376,  377,  396,  397,  398,
					 415,  416,  417,  436,  437,  438,
					 455,  456,  457,  476,  477,  478,
					},
				background =
					{
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,   73,    0,    0,    0,
					   0,   62,    0,   61,    0,    0,
					   0,    0,   74,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {0,206,39},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 46,
				},
			[6] =
				{
				colorid = 20306,
				name = L.RAINBOWBG,
				blocks =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				background =
					{
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {0,165,206},
				v6col = 11,
				warpbg = 7, -- actually gray, but I can't be bothered to look up what VVVVVV does with this currently
				entcolourrow = 47,
				},
			}
		},
	[3]	=
		{
		tilesetid = 20400,
		name = langtilesetnames.short3,
		longname = langtilesetnames.long3,
		tileimg = 2,
		colors =
			{
			[0] =
				{
				colorid = 20401,
				name = L.CYAN,
				blocks =
					{
					  80,   81,   82,    0,    0,    0,
					 120,  121,  122,    0,    0,    0,
					 160,  161,  162,    0,    0,    0,
					 200,  201,  202,    0,    0,    0,
					 240,  241,  242,    0,    0,    0,
					},
				background =
					{
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {113,178,197},
				v6col = 11,
				warpbg = 1,
				entcolourrow = 47,
				},
			[1] =
				{
				colorid = 20402,
				name = L.RED,
				blocks =
					{
					  83,   84,   85,    0,    0,    0,
					 123,  124,  125,    0,    0,    0,
					 163,  164,  165,    0,    0,    0,
					 203,  204,  205,    0,    0,    0,
					 243,  244,  245,    0,    0,    0,
					},
				background =
					{
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {197,113,119},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 48,
				},
			[2] =
				{
				colorid = 20403,
				name = L.PINK,
				blocks =
					{
					  86,   87,   88,    0,    0,    0,
					 126,  127,  128,    0,    0,    0,
					 166,  167,  168,    0,    0,    0,
					 206,  207,  208,    0,    0,    0,
					 246,  247,  248,    0,    0,    0,
					},
				background =
					{
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {196,113,197},
				v6col = 20,
				warpbg = 3,
				entcolourrow = 49,
				},
			[3] =
				{
				colorid = 20404,
				name = L.PURPLE,
				blocks =
					{
					  89,   90,   91,    0,    0,    0,
					 129,  130,  131,    0,    0,    0,
					 169,  170,  171,    0,    0,    0,
					 209,  210,  211,    0,    0,    0,
					 249,  250,  251,    0,    0,    0,
					},
				background =
					{
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {149,113,197},
				v6col = 12,
				warpbg = 4,
				entcolourrow = 50,
				},
			[4] =
				{
				colorid = 20405,
				name = L.YELLOW,
				blocks =
					{
					  92,   93,   94,    0,    0,    0,
					 132,  133,  134,    0,    0,    0,
					 172,  173,  174,    0,    0,    0,
					 212,  213,  214,    0,    0,    0,
					 252,  253,  254,    0,    0,    0,
					},
				background =
					{
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {197,182,113},
				v6col = 9,
				warpbg = 5,
				entcolourrow = 51,
				},
			[5] =
				{
				colorid = 20406,
				name = L.GREEN,
				blocks =
					{
					  95,   96,   97,    0,    0,    0,
					 135,  136,  137,    0,    0,    0,
					 175,  176,  177,    0,    0,    0,
					 215,  216,  217,    0,    0,    0,
					 255,  256,  257,    0,    0,    0,
					},
				background =
					{
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {141,197,113},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 52,
				},
			[6] =
				{
				colorid = 20407,
				name = L.GRAY,
				blocks =
					{
					  98,   99,  100,    0,    0,    0,
					 138,  139,  140,    0,    0,    0,
					 178,  179,  180,    0,    0,    0,
					 218,  219,  220,    0,    0,    0,
					 258,  259,  260,    0,    0,    0,
					},
				background =
					{
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					 713,  713,  713,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {109,109,109},
				v6col = 7,
				warpbg = 7,
				entcolourrow = 53,
				},
			}
		},
	[4] =
		{
		tilesetid = 20500,
		name = langtilesetnames.short4,
		longname = langtilesetnames.long4,
		tileimg = 2,
		colors =
			{
			[0] =
				{
				colorid = 20501,
				name = L.GREEN,
				blocks =
					{
					 101,  102,  103,    0,    0,    0,
					 141,  142,  143,    0,    0,    0,
					 181,  182,  183,    0,    0,    0,
					 221,  222,  223,    0,    0,    0,
					 261,  262,  263,    0,    0,    0,
					},
				background =
					{
					 741,  742,  743,    0,    0,    0,
					 781,  782,  783,    0,    0,    0,
					 821,  822,  823,    0,    0,    0,
					 861,  862,  863,    0,    0,    0,
					 901,  902,  903,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {0,206,39},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 53,
				},
			[1] =
				{
				colorid = 20502,
				name = L.CYAN,
				blocks =
					{
					 104,  105,  106,    0,    0,    0,
					 144,  145,  146,    0,    0,    0,
					 184,  185,  186,    0,    0,    0,
					 224,  225,  226,    0,    0,    0,
					 264,  265,  266,    0,    0,    0,
					},
				background =
					{
					 744,  745,  746,    0,    0,    0,
					 784,  785,  786,    0,    0,    0,
					 824,  825,  826,    0,    0,    0,
					 864,  865,  866,    0,    0,    0,
					 904,  905,  906,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {0,165,206},
				v6col = 11,
				warpbg = 1,
				entcolourrow = 54,
				},
			[2] =
				{
				colorid = 20503,
				name = L.YELLOW,
				blocks =
					{
					 107,  108,  109,    0,    0,    0,
					 147,  148,  149,    0,    0,    0,
					 187,  188,  189,    0,    0,    0,
					 227,  228,  229,    0,    0,    0,
					 267,  268,  269,    0,    0,    0,
					},
				background =
					{
					 747,  748,  749,    0,    0,    0,
					 787,  788,  789,    0,    0,    0,
					 827,  828,  829,    0,    0,    0,
					 867,  868,  869,    0,    0,    0,
					 907,  908,  909,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {194,206,0},
				v6col = 9,
				warpbg = 5,
				entcolourrow = 55,
				},
			[3] =
				{
				colorid = 20504,
				name = L.PINK,
				blocks =
					{
					 110,  111,  112,    0,    0,    0,
					 150,  151,  152,    0,    0,    0,
					 190,  191,  192,    0,    0,    0,
					 230,  231,  232,    0,    0,    0,
					 270,  271,  272,    0,    0,    0,
					},
				background =
					{
					 750,  751,  752,    0,    0,    0,
					 790,  791,  792,    0,    0,    0,
					 830,  831,  832,    0,    0,    0,
					 870,  871,  872,    0,    0,    0,
					 910,  911,  912,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {206,0,160},
				v6col = 8,
				warpbg = 3,
				entcolourrow = 56,
				},
			[4] =
				{
				colorid = 20505,
				name = L.BLUE,
				blocks =
					{
					 113,  114,  115,    0,    0,    0,
					 153,  154,  155,    0,    0,    0,
					 193,  194,  195,    0,    0,    0,
					 233,  234,  235,    0,    0,    0,
					 273,  274,  275,    0,    0,    0,
					},
				background =
					{
					 753,  754,  755,    0,    0,    0,
					 793,  794,  795,    0,    0,    0,
					 833,  834,  835,    0,    0,    0,
					 873,  874,  875,    0,    0,    0,
					 913,  914,  915,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {27,67,255},
				v6col = 12,
				warpbg = 4,
				entcolourrow = 57,
				},
			[5] =
				{
				colorid = 20506,
				name = L.RED,
				blocks =
					{
					 116,  117,  118,    0,    0,    0,
					 156,  157,  158,    0,    0,    0,
					 196,  197,  198,    0,    0,    0,
					 236,  237,  238,    0,    0,    0,
					 276,  277,  278,    0,    0,    0,
					},
				background =
					{
					 756,  757,  758,    0,    0,    0,
					 796,  797,  798,    0,    0,    0,
					 836,  837,  838,    0,    0,    0,
					 876,  877,  878,    0,    0,    0,
					 916,  917,  918,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    0,    0,
					   0,   50,    0,   49,    0,    0,
					   0,    0,    9,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {206,5,0},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 58,
				},
			}
		},
	[5] =
		{
		tilesetid = 30600,
		name = langtilesetnames.short5,
		longname = langtilesetnames.long5,
		tileimg = 3,
		colors =
			{
			[0] =
				{
				colorid = 30601,
				blocks =
					{
					  12,   13,   14,   25,   27,    0,
					  12,   15,   16,    0,    0,    0,
					  17,   18,   19,    0,    0,    0,
					  20,   26,   21,    0,    0,    0,
					  22,   23,   24,    0,    0,    0,
					},
				background =
					{
					  28,   28,   28,    1,    0,    0,
					  28,   28,   28,    2,    3,    0,
					  28,   28,   28,    4,    5,    0,
					  28,   28,   28,    0,    0,    0,
					  28,   28,   28,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    8,    0,    6,    0,
					   0,   11,    0,   10,    0,    0,
					   0,    0,    9,    0,    7,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 0,
				},
			[1] =
				{
				colorid = 30602,
				blocks =
					{
					  42,   43,   44,   55,   57,    0,
					  42,   45,   46,    0,    0,    0,
					  47,   48,   49,    0,    0,    0,
					  50,   56,   51,    0,    0,    0,
					  52,   53,   54,    0,    0,    0,
					},
				background =
					{
					  58,   58,   58,   31,    0,    0,
					  58,   58,   58,   32,   33,    0,
					  58,   58,   58,   34,   35,    0,
					  58,   58,   58,    0,    0,    0,
					  58,   58,   58,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,   38,    0,   36,    0,
					   0,   41,    0,   40,    0,    0,
					   0,    0,   39,    0,   67,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 0,
				},
			[2] =
				{
				colorid = 30603,
				blocks =
					{
					  72,   73,   74,   85,   87,    0,
					  72,   75,   76,    0,    0,    0,
					  77,   78,   79,    0,    0,    0,
					  80,   86,   81,    0,    0,    0,
					  82,   83,   84,    0,    0,    0,
					},
				background =
					{
					  88,   88,   88,   61,    0,    0,
					  88,   88,   88,   62,   63,    0,
					  88,   88,   88,   64,   65,    0,
					  88,   88,   88,    0,    0,    0,
					  88,   88,   88,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,   68,    0,   66,    0,
					   0,   71,    0,   70,    0,    0,
					   0,    0,   69,    0,   67,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 0,
				},
			[3] =
				{
				colorid = 30604,
				blocks =
					{
					 102,  103,  104,  115,  117,    0,
					 102,  105,  106,    0,    0,    0,
					 107,  108,  109,    0,    0,    0,
					 110,  116,  111,    0,    0,    0,
					 112,  113,  114,    0,    0,    0,
					},
				background =
					{
					 118,  118,  118,   91,    0,    0,
					 118,  118,  118,   92,   93,    0,
					 118,  118,  118,   94,   95,    0,
					 118,  118,  118,    0,    0,    0,
					 118,  118,  118,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,   98,    0,   96,    0,
					   0,  101,    0,  100,    0,    0,
					   0,    0,   99,    0,   97,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 0,
				},
			[4] =
				{
				colorid = 30605,
				blocks =
					{
					 132,  133,  134,  145,  147,    0,
					 132,  135,  136,    0,    0,    0,
					 137,  138,  139,    0,    0,    0,
					 140,  146,  141,    0,    0,    0,
					 142,  143,  144,    0,    0,    0,
					},
				background =
					{
					 148,  148,  148,  121,    0,    0,
					 148,  148,  148,  122,  123,    0,
					 148,  148,  148,  124,  125,    0,
					 148,  148,  148,    0,    0,    0,
					 148,  148,  148,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  128,    0,  126,    0,
					   0,  131,    0,  130,    0,    0,
					   0,    0,  129,    0,  127,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 6,
				warpbg = 2,
				entcolourrow = 0,
				},
			[5] =
				{
				colorid = 30606,
				blocks =
					{
					 162,  163,  164,  175,  177,    0,
					 162,  165,  166,    0,    0,    0,
					 167,  168,  169,    0,    0,    0,
					 170,  176,  171,    0,    0,    0,
					 172,  173,  174,    0,    0,    0,
					},
				background =
					{
					 178,  178,  178,  151,    0,    0,
					 178,  178,  178,  152,  153,    0,
					 178,  178,  178,  124,  125,    0,
					 178,  178,  178,    0,    0,    0,
					 178,  178,  178,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  158,    0,  156,    0,
					   0,  161,    0,  160,    0,    0,
					   0,    0,  159,    0,  157,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 9,
				warpbg = 5,
				entcolourrow = 0,
				},
			[6] =
				{
				colorid = 30607,
				blocks =
					{
					 192,  193,  194,  205,  207,    0,
					 192,  195,  196,    0,    0,    0,
					 197,  198,  199,    0,    0,    0,
					 200,  206,  201,    0,    0,    0,
					 202,  203,  204,    0,    0,    0,
					},
				background =
					{
					 208,  208,  208,  181,    0,    0,
					 208,  208,  208,  182,  183,    0,
					 208,  208,  208,  184,  185,    0,
					 208,  208,  208,    0,    0,    0,
					 208,  208,  208,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  188,    0,  186,    0,
					   0,  191,    0,  190,    0,    0,
					   0,    0,  189,    0,  187,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 9,
				warpbg = 5,
				entcolourrow = 0,
				},
			[7] =
				{
				colorid = 30608,
				blocks =
					{
					 222,  223,  224,  235,  237,    0,
					 222,  225,  226,    0,    0,    0,
					 227,  228,  229,    0,    0,    0,
					 230,  236,  231,    0,    0,    0,
					 232,  233,  234,    0,    0,    0,
					},
				background =
					{
					 238,  238,  238,  211,    0,    0,
					 238,  238,  238,  212,  213,    0,
					 238,  238,  238,  214,  215,    0,
					 238,  238,  238,    0,    0,    0,
					 238,  238,  238,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  218,    0,  216,    0,
					   0,  221,    0,  220,    0,    0,
					   0,    0,  219,    0,  217,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 9,
				warpbg = 5,
				entcolourrow = 0,
				},
			[8] =
				{
				colorid = 30609,
				blocks =
					{
					 252,  253,  254,  265,  267,    0,
					 252,  255,  256,    0,    0,    0,
					 257,  258,  259,    0,    0,    0,
					 260,  266,  261,    0,    0,    0,
					 262,  263,  264,    0,    0,    0,
					},
				background =
					{
					 268,  268,  268,  241,    0,    0,
					 268,  268,  268,  242,  243,    0,
					 268,  268,  268,  244,  245,    0,
					 268,  268,  268,    0,    0,    0,
					 268,  268,  268,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  248,    0,  246,    0,
					   0,  251,    0,  250,    0,    0,
					   0,    0,  249,    0,  247,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 9,
				warpbg = 5,
				entcolourrow = 0,
				},
			[9] =
				{
				colorid = 30610,
				blocks =
					{
					 282,  283,  284,  295,  297,    0,
					 282,  285,  286,    0,    0,    0,
					 287,  288,  289,    0,    0,    0,
					 290,  296,  291,    0,    0,    0,
					 292,  293,  294,    0,    0,    0,
					},
				background =
					{
					 298,  298,  298,  271,    0,    0,
					 298,  298,  298,  272,  273,    0,
					 298,  298,  298,  274,  275,    0,
					 298,  298,  298,    0,    0,    0,
					 298,  298,  298,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  278,    0,  276,    0,
					   0,  281,    0,  280,    0,    0,
					   0,    0,  279,    0,  277,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 9,
				warpbg = 5,
				entcolourrow = 0,
				},
			[10] =
				{
				colorid = 30611,
				blocks =
					{
					 312,  313,  314,  325,  327,    0,
					 312,  315,  316,    0,    0,    0,
					 317,  318,  319,    0,    0,    0,
					 320,  326,  321,    0,    0,    0,
					 322,  323,  324,    0,    0,    0,
					},
				background =
					{
					 328,  328,  328,  301,    0,    0,
					 328,  328,  328,  302,  303,    0,
					 328,  328,  328,  304,  305,    0,
					 328,  328,  328,    0,    0,    0,
					 328,  328,  328,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  308,    0,  306,    0,
					   0,  311,    0,  310,    0,    0,
					   0,    0,  309,    0,  307,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 0,
				},
			[11] =
				{
				colorid = 30612,
				blocks =
					{
					 342,  343,  344,  355,  357,    0,
					 342,  345,  346,    0,    0,    0,
					 347,  348,  349,    0,    0,    0,
					 350,  356,  351,    0,    0,    0,
					 352,  353,  354,    0,    0,    0,
					},
				background =
					{
					 358,  358,  358,  331,    0,    0,
					 358,  358,  358,  332,  333,    0,
					 358,  358,  358,  334,  335,    0,
					 358,  358,  358,    0,    0,    0,
					 358,  358,  358,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  338,    0,  336,    0,
					   0,  341,    0,  340,    0,    0,
					   0,    0,  339,    0,  337,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 0,
				},
			[12] =
				{
				colorid = 30613,
				blocks =
					{
					 372,  373,  374,  385,  387,    0,
					 372,  375,  376,    0,    0,    0,
					 377,  378,  379,    0,    0,    0,
					 380,  386,  381,    0,    0,    0,
					 382,  383,  384,    0,    0,    0,
					},
				background =
					{
					 388,  388,  388,  361,    0,    0,
					 388,  388,  388,  362,  363,    0,
					 388,  388,  388,  364,  365,    0,
					 388,  388,  388,    0,    0,    0,
					 388,  388,  388,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  368,    0,  366,    0,
					   0,  371,    0,  370,    0,    0,
					   0,    0,  369,    0,  367,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 0,
				},
			[13] =
				{
				colorid = 30614,
				blocks =
					{
					 402,  403,  404,  415,  417,    0,
					 402,  405,  406,    0,    0,    0,
					 407,  408,  409,    0,    0,    0,
					 410,  416,  411,    0,    0,    0,
					 412,  413,  414,    0,    0,    0,
					},
				background =
					{
					 418,  418,  418,  391,    0,    0,
					 418,  418,  418,  392,  393,    0,
					 418,  418,  418,  394,  395,    0,
					 418,  418,  418,    0,    0,    0,
					 418,  418,  418,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  398,    0,  396,    0,
					   0,  401,    0,  400,    0,    0,
					   0,    0,  399,    0,  397,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 0,
				},
			[14] =
				{
				colorid = 30615,
				blocks =
					{
					 432,  433,  434,  445,  447,    0,
					 432,  435,  436,    0,    0,    0,
					 437,  438,  439,    0,    0,    0,
					 440,  446,  441,    0,    0,    0,
					 442,  443,  444,    0,    0,    0,
					},
				background =
					{
					 448,  448,  448,  421,    0,    0,
					 448,  448,  448,  422,  423,    0,
					 448,  448,  448,  424,  425,    0,
					 448,  448,  448,    0,    0,    0,
					 448,  448,  448,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  428,    0,  426,    0,
					   0,  431,    0,  430,    0,    0,
					   0,    0,  429,    0,  427,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 7,
				warpbg = 6,
				entcolourrow = 0,
				},
			[15] =
				{
				colorid = 30616,
				blocks =
					{
					 462,  463,  464,  475,  477,    0,
					 462,  465,  466,    0,    0,    0,
					 467,  468,  469,    0,    0,    0,
					 470,  476,  471,    0,    0,    0,
					 472,  473,  474,    0,    0,    0,
					},
				background =
					{
					 478,  478,  478,  451,    0,    0,
					 478,  478,  478,  452,  453,    0,
					 478,  478,  478,  454,  455,    0,
					 478,  478,  478,    0,    0,    0,
					 478,  478,  478,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  458,    0,  456,    0,
					   0,  461,    0,  460,    0,    0,
					   0,    0,  459,    0,  457,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 11,
				warpbg = 1,
				entcolourrow = 0,
				},
			[16] =
				{
				colorid = 30617,
				blocks =
					{
					 492,  493,  494,  505,  507,    0,
					 492,  495,  496,    0,    0,    0,
					 497,  498,  499,    0,    0,    0,
					 500,  506,  501,    0,    0,    0,
					 502,  503,  504,    0,    0,    0,
					},
				background =
					{
					 508,  508,  508,  481,    0,    0,
					 508,  508,  508,  482,  483,    0,
					 508,  508,  508,  484,  485,    0,
					 508,  508,  508,    0,    0,    0,
					 508,  508,  508,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  488,    0,  486,    0,
					   0,  491,    0,  490,    0,    0,
					   0,    0,  489,    0,  487,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 11,
				warpbg = 1,
				entcolourrow = 0,
				},
			[17] =
				{
				colorid = 30618,
				blocks =
					{
					 522,  523,  524,  535,  537,    0,
					 522,  525,  526,    0,    0,    0,
					 527,  528,  529,    0,    0,    0,
					 530,  536,  531,    0,    0,    0,
					 532,  533,  534,    0,    0,    0,
					},
				background =
					{
					 538,  538,  538,  511,    0,    0,
					 538,  538,  538,  512,  513,    0,
					 538,  538,  538,  514,  515,    0,
					 538,  538,  538,    0,    0,    0,
					 538,  538,  538,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  518,    0,  516,    0,
					   0,  521,    0,  520,    0,    0,
					   0,    0,  519,    0,  517,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 11,
				warpbg = 1,
				entcolourrow = 0,
				},
			[18] =
				{
				colorid = 30619,
				blocks =
					{
					 552,  553,  554,  565,  567,    0,
					 552,  555,  556,    0,    0,    0,
					 557,  558,  559,    0,    0,    0,
					 560,  566,  561,    0,    0,    0,
					 562,  563,  564,    0,    0,    0,
					},
				background =
					{
					 568,  568,  568,  541,    0,    0,
					 568,  568,  568,  542,  543,    0,
					 568,  568,  568,  544,  545,    0,
					 568,  568,  568,    0,    0,    0,
					 568,  568,  568,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  548,    0,  546,    0,
					   0,  551,    0,  550,    0,    0,
					   0,    0,  549,    0,  547,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 11,
				warpbg = 1,
				entcolourrow = 0,
				},
			[19] =
				{
				colorid = 30620,
				blocks =
					{
					 582,  583,  584,  595,  597,    0,
					 582,  585,  586,    0,    0,    0,
					 587,  588,  589,    0,    0,    0,
					 590,  596,  591,    0,    0,    0,
					 592,  593,  594,    0,    0,    0,
					},
				background =
					{
					 598,  598,  598,  571,    0,    0,
					 598,  598,  598,  572,  573,    0,
					 598,  598,  598,  574,  575,    0,
					 598,  598,  598,    0,    0,    0,
					 598,  598,  598,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  578,    0,  576,    0,
					   0,  581,    0,  580,    0,    0,
					   0,    0,  579,    0,  577,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 11,
				warpbg = 1,
				entcolourrow = 0,
				},
			[20] =
				{
				colorid = 30621,
				blocks =
					{
					 612,  613,  614,  625,  627,    0,
					 612,  615,  616,    0,    0,    0,
					 617,  618,  619,    0,    0,    0,
					 620,  626,  621,    0,    0,    0,
					 622,  623,  624,    0,    0,    0,
					},
				background =
					{
					 628,  628,  628,  601,    0,    0,
					 628,  628,  628,  602,  603,    0,
					 628,  628,  628,  604,  605,    0,
					 628,  628,  628,    0,    0,    0,
					 628,  628,  628,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  608,    0,  606,    0,
					   0,  611,    0,  610,    0,    0,
					   0,    0,  609,    0,  607,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 20,
				warpbg = 4,
				entcolourrow = 0,
				},
			[21] =
				{
				colorid = 30622,
				blocks =
					{
					 642,  643,  644,  655,  657,    0,
					 642,  645,  646,    0,    0,    0,
					 647,  648,  649,    0,    0,    0,
					 650,  656,  651,    0,    0,    0,
					 652,  653,  654,    0,    0,    0,
					},
				background =
					{
					 658,  658,  658,  631,    0,    0,
					 658,  658,  658,  632,  633,    0,
					 658,  658,  658,  634,  635,    0,
					 658,  658,  658,    0,    0,    0,
					 658,  658,  658,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  638,    0,  636,    0,
					   0,  641,    0,  640,    0,    0,
					   0,    0,  639,    0,  637,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 20,
				warpbg = 4,
				entcolourrow = 0,
				},
			[22] =
				{
				colorid = 30623,
				blocks =
					{
					 672,  673,  674,  685,  687,    0,
					 672,  675,  676,    0,    0,    0,
					 677,  678,  679,    0,    0,    0,
					 680,  686,  681,    0,    0,    0,
					 682,  683,  684,    0,    0,    0,
					},
				background =
					{
					 688,  688,  688,  661,    0,    0,
					 688,  688,  688,  662,  663,    0,
					 688,  688,  688,  664,  665,    0,
					 688,  688,  688,    0,    0,    0,
					 688,  688,  688,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  668,    0,  666,    0,
					   0,  671,    0,  670,    0,    0,
					   0,    0,  669,    0,  667,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 20,
				warpbg = 4,
				entcolourrow = 0,
				},
			[23] =
				{
				colorid = 30624,
				blocks =
					{
					 702,  703,  704,  715,  717,    0,
					 702,  705,  706,    0,    0,    0,
					 707,  708,  709,    0,    0,    0,
					 710,  716,  711,    0,    0,    0,
					 712,  713,  714,    0,    0,    0,
					},
				background =
					{
					 718,  718,  718,  691,    0,    0,
					 718,  718,  718,  692,  693,    0,
					 718,  718,  718,  694,  695,    0,
					 718,  718,  718,    0,    0,    0,
					 718,  718,  718,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  698,    0,  696,    0,
					   0,  701,    0,  700,    0,    0,
					   0,    0,  699,    0,  697,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 20,
				warpbg = 4,
				entcolourrow = 0,
				},
			[24] =
				{
				colorid = 30625,
				blocks =
					{
					 732,  733,  734,  745,  747,    0,
					 732,  735,  736,    0,    0,    0,
					 737,  738,  739,    0,    0,    0,
					 740,  746,  741,    0,    0,    0,
					 742,  743,  744,    0,    0,    0,
					},
				background =
					{
					 748,  748,  748,  721,    0,    0,
					 748,  748,  748,  722,  723,    0,
					 748,  748,  748,  724,  725,    0,
					 748,  748,  748,    0,    0,    0,
					 748,  748,  748,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  728,    0,  726,    0,
					   0,  731,    0,  730,    0,    0,
					   0,    0,  729,    0,  727,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 20,
				warpbg = 4,
				entcolourrow = 0,
				},
			[25] =
				{
				colorid = 30626,
				blocks =
					{
					 762,  763,  764,  775,  777,    0,
					 762,  765,  766,    0,    0,    0,
					 767,  768,  769,    0,    0,    0,
					 770,  776,  771,    0,    0,    0,
					 772,  773,  774,    0,    0,    0,
					},
				background =
					{
					 778,  778,  778,  751,    0,    0,
					 778,  778,  778,  752,  753,    0,
					 778,  778,  778,  754,  755,    0,
					 778,  778,  778,    0,    0,    0,
					 778,  778,  778,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  758,    0,  756,    0,
					   0,  761,    0,  760,    0,    0,
					   0,    0,  759,    0,  757,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 8,
				warpbg = 3,
				entcolourrow = 0,
				},
			[26] =
				{
				colorid = 30627,
				blocks =
					{
					 792,  793,  794,  805,  807,    0,
					 792,  795,  796,    0,    0,    0,
					 797,  798,  799,    0,    0,    0,
					 800,  806,  801,    0,    0,    0,
					 802,  803,  804,    0,    0,    0,
					},
				background =
					{
					 808,  808,  808,  781,    0,    0,
					 808,  808,  808,  782,  783,    0,
					 808,  808,  808,  784,  785,    0,
					 808,  808,  808,    0,    0,    0,
					 808,  808,  808,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  788,    0,  786,    0,
					   0,  791,    0,  790,    0,    0,
					   0,    0,  789,    0,  787,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 8,
				warpbg = 3,
				entcolourrow = 0,
				},
			[27] =
				{
				colorid = 30628,
				blocks =
					{
					 822,  823,  824,  835,  837,    0,
					 822,  825,  826,    0,    0,    0,
					 827,  828,  829,    0,    0,    0,
					 830,  836,  831,    0,    0,    0,
					 832,  833,  834,    0,    0,    0,
					},
				background =
					{
					 838,  838,  838,  811,    0,    0,
					 838,  838,  838,  812,  813,    0,
					 838,  838,  838,  814,  815,    0,
					 838,  838,  838,    0,    0,    0,
					 838,  838,  838,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  818,    0,  816,    0,
					   0,  821,    0,  820,    0,    0,
					   0,    0,  819,    0,  817,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 8,
				warpbg = 3,
				entcolourrow = 0,
				},
			[28] =
				{
				colorid = 30629,
				blocks =
					{
					 852,  853,  854,  865,  867,    0,
					 852,  855,  856,    0,    0,    0,
					 857,  858,  859,    0,    0,    0,
					 860,  866,  861,    0,    0,    0,
					 862,  863,  864,    0,    0,    0,
					},
				background =
					{
					 868,  868,  868,  841,    0,    0,
					 868,  868,  868,  842,  843,    0,
					 868,  868,  868,  844,  845,    0,
					 868,  868,  868,    0,    0,    0,
					 868,  868,  868,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  848,    0,  846,    0,
					   0,  851,    0,  850,    0,    0,
					   0,    0,  849,    0,  847,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 8,
				warpbg = 3,
				entcolourrow = 0,
				},
			[29] =
				{
				colorid = 30630,
				blocks =
					{
					 882,  883,  884,  895,  897,    0,
					 882,  885,  886,    0,    0,    0,
					 887,  888,  889,    0,    0,    0,
					 890,  896,  891,    0,    0,    0,
					 892,  893,  894,    0,    0,    0,
					},
				background =
					{
					 898,  898,  898,  871,    0,    0,
					 898,  898,  898,  872,  873,    0,
					 898,  898,  898,  874,  875,    0,
					 898,  898,  898,    0,    0,    0,
					 898,  898,  898,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,  878,    0,  876,    0,
					   0,  881,    0,  880,    0,    0,
					   0,    0,  879,    0,  877,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {242,52,52},
				v6col = 8,
				warpbg = 3,
				entcolourrow = 0,
				},
			}
		},
	creator =
		{
		tilesetid = 99900,
		tileimg = 1,
		colors =
			{
			creator =
				{
				colorid = 99999,
				blocks =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				background =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				spikes =
					{
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					   0,    0,    0,    0,    0,    0,
					},
				entcolor = {0,0,0},
				warpbg = 7,
				}
			}
		},
	}

-- For showhotkey()
ALIGN = {
	LEFT = 1,
	CENTER = 2,
	RIGHT = 3,
}

VALIGN = {
	TOP = 1,
	CENTER = 2,
	BOTTOM = 3,
}

-- For shiftrooms()
SHIFT = {
	LEFT = 1,
	RIGHT = 2,
	UP = 3,
	DOWN = 4,
}

-- For playtesting
PLAYTESTING = {
	DONE = 1,
	ERROR = 2,
}

-- For map_correspondreset()
DIRTY = {
	ROW = 1,
	OUTROW29 = 2,
	PROPERTY = 3,
	ENTITY = 4,
}

-- For input
INPUT = {
	ONELINE = 1,
	MULTILINE = 2,
}

-- Also for input
UNRE = {
	INSERT = 1,
	DELETE = 2,
}
