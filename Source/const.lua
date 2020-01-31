limit = { -- temporary, this will be modifiable later. For unlimited, just use math.huge
	mapwidth = 20,
	mapheight = 20,
	scripts = 500,
	scriptlines = 500,
	flags = 100,
	entities = 3000,
	trinkets = 100,
	crewmates = 100,
}

toolshortcuts = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, "R", "T", "Y", "U", "I", "O", "P"}

tilesetnames =
	{
	"tiles.png",
	"tiles2.png"
	}

usedtilesets =
	{
	[0] = 1, -- space station
				-- 
	[1] = 2, -- outside
	[2] = 2, -- lab
	[3] = 2, -- warp zone
	[4] = 2, -- ship
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
entitytooltoid = {nil, nil, nil, 9, 10, 3, 2, 2, 1, 11, 17, 18, 19, 13, 50, 15, 16}

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
	[4] = " >|",
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

knowninternalcommands =
	{
	moveplayer = true,
	delay = true,
	flash = true,
	shake = true,
	walk = true,
	flip = true,
	tofloor = true,
	playef = true,
	play = true,
	stopmusic = true,
	resumemusic = true,
	musicfadeout = true,
	musicfadein = true,
	gotoposition = true,
	gotoroom = true,
	cutscene = true,
	endcutscene = true,
	untilbars = true,
	text = true,
	position = true,
	backgroundtext = true,
	flipme = true,
	speak_active = true,
	speak = true,
	endtext = true,
	endtextfast = true,
	["do"] = true,
	loop = true,
	vvvvvvman = true,
	undovvvvvvman = true,
	createentity = true,
	createcrewman = true,
	changemood = true,
	changetile = true,
	flipgravity = true,
	changegravity = true,
	changedir = true,
	alarmon = true,
	alarmoff = true,
	changeai = true,
	activateteleporter = true,
	changecolour = true,
	squeak = true,
	blackout = true,
	blackon = true,
	setcheckpoint = true,
	gamestate = true,
	textboxactive = true,
	gamemode = true,
	ifexplored = true,
	iflast = true,
	ifskip = true,
	ifflag = true,
	ifcrewlost = true,
	iftrinkets = true,
	--iftrinketsless = true,
	warpdir = true,
	ifwarp = true,
	hidecoordinates = true,
	showcoordinates = true,
	hideship = true,
	showship = true,
	showsecretlab = true,
	hidesecretlab = true,
	showteleporters = true,
	showtargets = true,
	showtrinkets = true,
	hideteleporters = true,
	hidetargets = true,
	hidetrinkets = true,
	hideplayer = true,
	showplayer = true,
	teleportscript = true,
	clearteleportscript = true,
	nocontrol = true,
	hascontrol = true,
	companion = true,
	befadein = true,
	fadein = true,
	fadeout = true,
	untilfade = true,
	entersecretlab = true,
	leavesecretlab = true,
	resetgame = true,
	loadscript = true,
	rollcredits = true,
	finalmode = true,
	rescued = true,
	missing = true,
	face = true,
	jukebox = true,
	createactivityzone = true,
	createrescuedcrew = true,
	restoreplayercolour = true,
	changeplayercolour = true,
	altstates = true,
	activeteleporter = true,
	foundtrinket = true,
	foundlab = true,
	foundlab2 = true,
	everybodysad = true,
	startintermission2 = true,
	telesave = true,
	createrescued = true,
	specialline = true,
	trinketbluecontrol = true,
	trinketyellowcontrol = true,
	redcontrol = true,
	greencontrol = true,
	bluecontrol = true,
	yellowcontrol = true,
	purplecontrol = true,
	trinketscriptmusic = true,

	customifflag = true,
	customiftrinkets = true,
	customiftrinketsless = true,
	customposition = true,
	changecustommood = true,
	custommap = true,
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

-- For map_correspondreset()
DIRTY = {
	ROW = 1,
	OUTROW29 = 2,
	PROPERTY = 3,
	ENTITY = 4,
}
