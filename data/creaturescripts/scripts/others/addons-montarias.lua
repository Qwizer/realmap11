function onLogin(cid)

								
local player = Player(cid)
local addons ={	
	  --[storage] = {outfit_male, outfit_female},
	[28416] = {128, 136}, -- Citizen
	[28417] = {129, 137}, -- Hunter
	[28418] = {130, 138}, -- Mage
	[28419] = {131, 139}, -- Knight
	[28420] = {132, 140}, -- Nobleman
	[28421] = {133, 141}, -- Summoner
	[28422] = {134, 142}, -- Warrior
	[28423] = {143, 147}, -- Barbarian
	[28424] = {144, 148}, -- Druid
	[28425] = {145, 149}, -- Wizard
	[28426] = {146, 150}, -- Oriental
	[28427] = {151, 155}, -- Pirate
	[28428] = {152, 156}, -- Assassin
	[28429] = {153, 157}, -- Beggar
	[28430] = {154, 158}, -- Shaman
	[28431] = {251, 252}, -- Norseman
	[28432] = {268, 269}, -- Nightmare
	[28433] = {273, 270}, -- Jester
	[28434] = {278, 279}, -- Brotherhood
	[28435] = {289, 288}, -- Demonhunter
	[28436] = {325, 324}, -- Yalaharian
	[28437] = {328, 329}, -- Husband
	[28438] = {335, 336}, -- Warmaster
	[28439] = {367, 366}, -- Wayfarer
	[28440] = {430, 431}, -- Afflicted
	[28441] = {432, 433}, -- Elementalist
	[28442] = {463, 464}, -- Deepling
	[28443] = {465, 466}, -- Insectoid
	[28444] = {472, 471}, -- Entrepreneur
	[28445] = {512, 513}, -- Crystal Warlord
	[28446] = {516, 514}, -- Soil Guardian
	[28447] = {541, 542}, -- Demon
	[28448] = {574, 575}, -- Cave Explorer
	[28449] = {577, 578}, -- Dream Warden
	[28450] = {610, 618}, -- Glooth Engineer
	[28451] = {619, 620}, -- Jersey
	[28452] = {633, 632}, -- Champion
	[28453] = {634, 635}, -- Conjurer
	[28454] = {637, 636}, -- Beastmaster
	[28455] = {665, 664}, -- Chaos Acolyte
	[28456] = {667, 666}, -- Death Herald
	[28457] = {684, 683}, -- Ranger
	[28458] = {695, 694}, -- Ceremonial Garb
	[28459] = {697, 696}, -- Puppeteer
	[28460] = {699, 698}, -- Spirit Caller
	[28461] = {725, 724}, -- Evoker
	[28462] = {733, 732}, -- Seaweaver
	[28463] = {746, 725}, -- Recruiter
	[28464] = {750, 749}, -- Sea Dog
	[28465] = {760, 759}, -- Royal Pumpkin
	[28466] = {846, 845}, -- Rift Warrior
	[28467] = {853, 852},  -- Winter Warden
	[28468]	= {874, 873}, -- Philosopher
	[28469]	= {884, 885}, -- Arena Champion
	[28470]	= {899, 900} -- Lupine Warden

	}
	
		for storage, addon in pairs(addons) do
			if player:getStorageValue(storage) > 0 then
				player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
				player:addOutfitAddon(addon[1], 3)
				player:addOutfitAddon(addon[2], 3)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Seu Addon full foi adicionado!")
				player:setStorageValue(storage, 0)
			end
		end
		
												
local mounts ={	
		--[storage] = mounts,
	[80000] = 1, -- Widow Queen
	[80001] = 2, -- Racing Bird
	[80002] = 3, -- War Bear
	[80003] = 4, -- Black Sheep
	[80004] = 5, -- Midnight Panther
	[80005] = 6, -- Draptor
	[80006] = 7, -- Titanica
	[80007] = 8, -- Tin Lizzard
	[80008] = 9, -- Blazebringer
	[80009] = 10, -- Rapid Boar
	[80010] = 11, -- Stampor
	[80011] = 12, -- Undead Cavebear
	[80012] = 13, -- Donkey
	[80013] = 14, -- Tiger Slug
	[80014] = 15, -- Uniwheel
	[80015] = 16, -- Crystal Wolf
	[80016] = 17, -- War Horse
	[80017] = 18, -- Kingly Deer
	[80018] = 19, -- Tamed Panda
	[80019] = 20, -- Dromedary
	[80020] = 21, -- King Scorpion
	[80021] = 22, -- Rented Horse
	[80022] = 23, -- Armoured War Horse
	[80023] = 24, -- Shadow Draptor"
	[80024] = 25, -- Rented Horse Grey
	[80025] = 26, -- Rented Horse Thais
	[80026] = 27, -- Ladybug
	[80027] = 28, -- Manta Ray
	[80028] = 29, -- Ironblight
	[80029] = 30, -- Magma Crawler
	[80030] = 31, -- Dragonling
	[80031] = 32, -- Gnarlhound
	[80032] = 33, -- Crimson Ray
	[80033] = 34, -- Steelbeak
	[80034] = 35, -- Water Buffalo
	[80035] = 36, -- Armoured Scorpion
	[80036] = 37, -- Armoured Dragonling
	[80037] = 38, -- Ursagrodon
	[80038] = 39, -- Hellgrip
	[80039] = 40, -- Noble Lion
	[80040] = 41, -- Desert King
	[80041] = 42, -- Shock Head
	[80042] = 43, -- Walker
	[80043] = 44, -- Azudocus
	[80044] = 45, -- Carpacosaurus
	[80045] = 46, -- Death Crawler
	[80046] = 47, -- Flamesteed
	[80047] = 48, -- Jade Lion
	[80048] = 49, -- Jade Pincer 
	[80049] = 50, -- Nethersteed
	[80050] = 51, -- Tempest
	[80051] = 52, -- Winter King
	[80052] = 53, -- Doombringer
	[80053] = 54, -- Woodland Prince
	[80054] = 55, -- Hailtorm Fury
	[80055] = 56, -- Siegebreaker
	[80056] = 57, -- Poisonbane
	[80057] = 58, -- Blackpelt
	[80058] = 59, -- Golden Dragonfly
	[80059] = 60, -- Steel Bee
	[80060] = 61, -- Copper Fly
	[80061] = 62, -- Tundra Rambler
	[80062] = 63, -- Highland Yak
	[80063] = 64, -- Glacier Vagabond
	[80064] = 65, -- Flying Divan
	[80065] = 66, -- Magic Carpet
	[80066] = 67, -- Floating Kashmir
	[80067] = 68, -- Ringnail Waccoon
	[80068] = 69, -- Night Waccoon
	[80069] = 70, -- Emerald Waccoon
	[80070] = 71, -- Glooth Glider
	[80071] = 72, -- Shadow Hart
	[80072] = 73, -- Black Stag
	[80073] = 74, -- Emperor Deer
	[80074] = 75, -- Flitterkatzen
	[80075] = 76, -- Venompaw
	[80076] = 77, -- Batcat
	[80077] = 78, -- Sea Devil
	[80078] = 79, -- Coralripper
	[80079] = 80, -- Plumfish
	[80080] = 81, -- Gorongra
	[80081] = 82, -- Noctungra
	[80082] = 83, -- Silverneck
	[80083] = 84, -- Slagnare
	[80084] = 85, -- Nightstinger
	[80085] = 86, -- Razorcreep
	[80086] = 87, -- Rift Runner
	[80087] = 88, -- Nightdweller
	[80088] = 89, -- Frostflare
	[80089] = 90, -- Cinderhoof
	[80090] = 92, -- Moldpincer
	[80091] = 93, -- Bloodcurl
	[80092] = 94, -- Leafscuttler
	[80093] = 95, -- Sparkion
	[80094] = 96, -- Swamp Nnapper
	[80095] = 97, -- Mould Shell
	[80096] = 98, -- Reed Lurker
	[80097] = 99, -- Neon Sparkid
	[80098] = 100, -- Vortexion
	[80099] = 101, -- Wolf White
	[80100] = 102, -- Wolf Black
	[80101] = 103 -- Winter Wolf

	}
		
		for storage, mount in pairs(mounts) do
			if player:getStorageValue(storage) > 0 then
				player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
				player:addMount(mount)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Sua Mount foi adicionado!")
				player:setStorageValue(storage, 0)
			end
		end	
	return true
end