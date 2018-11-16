 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local tokenid = 25377

local player = {}
local chargetypechoose = {}

local weaponChargeChoose = {}
local weaponCharge = {"charged", "heavilycharged", "overcharged"}

local weaponEnhanceChoose = {}
local weaponEnhance = {"carving", "mayhem", "remedy"}


local weaponTypeChoose = {}
local weaponType = {"axe", "blade", "bow", "chopper", "crossbow", "hammer", "mace", "rod", "slayer", "wand"}

local weapon = {

	["axe"] 		= {	carving 		= 	{normal = 25967, charged = 25968, heavilycharged = 25969, overcharged = 25970}, 	
						mayhem 			= 	{normal = 25881, charged = 25891, heavilycharged = 25901, overcharged = 25911}, 	
						remedy 			= 	{normal = 25927, charged = 25928, heavilycharged = 25929, overcharged = 25930}, 	
						price 			= 50,		
						charged 		= {5,100},	
						heavilycharged 	= {10,100},	
						overcharged 	= {15,70}}, 

	["blade"] 		= {	carving 		= 	{normal = 25959, charged = 25960, heavilycharged = 25961, overcharged = 25962}, 	
						mayhem 			= 	{normal = 25879, charged = 25889, heavilycharged = 25899, overcharged = 25909}, 	
						remedy 			= 	{normal = 25919, charged = 25920, heavilycharged = 25921, overcharged = 25922}, 	
						price 			= 50,		
						charged 		= {5,100},	
						heavilycharged 	= {10,100},	
						overcharged 	= {15,70}}, 

	["bow"] 		= {	carving 		= 	{normal = 25983, charged = 25984, heavilycharged = 25985, overcharged = 25986}, 	
						mayhem 			= 	{normal = 25885, charged = 25895, heavilycharged = 25906, overcharged = 25915}, 	
						remedy 			= 	{normal = 25943, charged = 25944, heavilycharged = 25945, overcharged = 25946}, 	
						price 			= 50,		
						charged 		= {5,100},	
						heavilycharged 	= {10,100},	
						overcharged 	= {15,70}}, 

	["chopper"] 	= {	carving 		= 	{normal = 25971, charged = 25972, heavilycharged = 25973, overcharged = 25974}, 	
						mayhem 			= 	{normal = 25882, charged = 25892, heavilycharged = 25902, overcharged = 25912}, 	
						remedy 			= 	{normal = 25931, charged = 25932, heavilycharged = 25933, overcharged = 25934}, 	
						price 			= 50,		
						charged 		= {5,100},	
						heavilycharged 	= {10,100},	
						overcharged 	= {15,70}}, 

	["crossbow"] 	= {	carving 		= 	{normal = 25987, charged = 25988, heavilycharged = 25989, overcharged = 25990}, 	
						mayhem 			= 	{normal = 25886, charged = 25896, heavilycharged = 25905, overcharged = 25916}, 	
						remedy 			= 	{normal = 25947, charged = 25948, heavilycharged = 25949, overcharged = 25950}, 	
						price 			= 50,		
						charged 		= {5,100},	
						heavilycharged 	= {10,100},	
						overcharged 	= {15,70}}, 

	["hammer"] 		= {	carving 		= 	{normal = 25979, charged = 25980, heavilycharged = 25981, overcharged = 25982}, 	
						mayhem 			= 	{normal = 25884, charged = 25894, heavilycharged = 25904, overcharged = 25914}, 	
						remedy 			= 	{normal = 25939, charged = 25940, heavilycharged = 25941, overcharged = 25942}, 	
						price 			= 50,		
						charged 		= {5,100},	
						heavilycharged 	= {10,100},	
						overcharged 	= {15,70}}, 

	["mace"] 		= {	carving 		= 	{normal = 25975, charged = 25976, heavilycharged = 25977, overcharged = 25978}, 	
						mayhem 			= 	{normal = 25883, charged = 25893, heavilycharged = 25903, overcharged = 25913}, 	
						remedy 			= 	{normal = 25935, charged = 25936, heavilycharged = 25937, overcharged = 25938}, 	
						price 			= 50,		
						charged 		= {5,100},	
						heavilycharged 	= {10,100},	
						overcharged 	= {15,70}}, 

	["rod"] 		= {	carving 		= 	{normal = 25995, charged = 25996, heavilycharged = 25997, overcharged = 25998}, 	
						mayhem 			= 	{normal = 25888, charged = 25898, heavilycharged = 25908, overcharged = 25918}, 	
						remedy 			= 	{normal = 25955, charged = 25956, heavilycharged = 25957, overcharged = 25958}, 	
						price 			= 50,		
						charged 		= {5,100},	
						heavilycharged 	= {10,100},	
						overcharged 	= {15,70}}, 

	["slayer"] 		= {	carving 		= 	{normal = 25963, charged = 25964, heavilycharged = 25965, overcharged = 25966}, 	
						mayhem 			= 	{normal = 25880, charged = 25890, heavilycharged = 25900, overcharged = 25910}, 	
						remedy 			= 	{normal = 25923, charged = 25924, heavilycharged = 25925, overcharged = 25926}, 	
						price 			= 50,		
						charged 		= {5,100},	
						heavilycharged 	= {10,100},	
						overcharged 	= {15,70}}, 

	["wand"] 		= {	carving 		= 	{normal = 25991, charged = 25992, heavilycharged = 25993, overcharged = 25994}, 	
						mayhem 			= 	{normal = 25887, charged = 25897, heavilycharged = 25907, overcharged = 25917}, 	
						remedy 			= 	{normal = 25951, charged = 25952, heavilycharged = 25953, overcharged = 25954}, 	
						price 			= 50,		
						charged 		= {5,100},	
						heavilycharged 	= {10,100},	
						overcharged 	= {15,70}}

}

local function exchangeItem(cid)
	local playerToItem   = weapon[weaponTypeChoose[cid]]
	local price = chargetypechoose[cid][1]
	local chance = chargetypechoose[cid][2]

	if weaponEnhanceChoose[cid] == "carving" then
		playerToItem = weapon[weaponTypeChoose[cid]].carving
	elseif weaponEnhanceChoose[cid] == "remedy" then
		playerToItem = weapon[weaponTypeChoose[cid]].remedy
	elseif weaponEnhanceChoose[cid] == "mayhem" then
		playerToItem = weapon[weaponTypeChoose[cid]].mayhem
	end

	local playerFromItem = playerToItem.normal

	if weaponChargeChoose[cid] == "charged" then
		playerToItem = playerToItem.charged
	elseif weaponChargeChoose[cid] == "heavilycharged" then
		playerToItem = playerToItem.heavilycharged
	elseif weaponChargeChoose[cid] == "overcharged" then
		playerToItem = playerToItem.overcharged
	end

	if player[cid]:removeItem(playerFromItem, 1) then
		if player[cid]:removeItem(tokenid, price) then
			if math.random(100) < chance then
				doPlayerAddItem(cid, playerToItem)
				return 1
			else
				return 2
			end
		else
			doPlayerAddItem(cid, playerFromItem)
			return 3
		end
	else
		return 4
	end

end

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	npcHandler.topic[cid] = 0
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "information") and npcHandler.topic[cid] == 0 then
		npcHandler:say({"Tokens are small objects made of metal or other materials. You can use them to buy superior equipment from token traders like me.", "There are several ways to obtain the tokens I'm interested in - killing certain bosses, for example. In exchange for a certain amount of tokens, I can offer you some first-class items."}, cid)
		npcHandler.topic[cid] = 1
	elseif npcHandler.topic[cid] == 1 and msgcontains(msg, "token") then
		npcHandler:say("If you have any gold tokens with you, let's have a look! Maybe I can offer you something in exchange.", cid)
		npcHandler.topic[cid] = 2
	elseif npcHandler.topic[cid] == 2 and msgcontains(msg, "gold") then
		npcHandler:say({"Here's the deal, Jess Leewyn. For 100 of your gold tokens, I can offer you some special equipment pieces which you can charge with a certain item type. I have the following item types to offer: mayhem, remedy or carving. ...", "I may also give you a short description what these labels mean. So, which item type are you most interested in?"}, cid)
		npcHandler.topic[cid] = 3
	elseif npcHandler.topic[cid] == 3 and msgcontains(msg, "description") then
		npcHandler:say({"A weapon of mayhem increases your chance to hit harder and to enhance the damage you inflict. A weapon of remedy gives you a certain chance to gain a part of a creature's life energy for yourself. ...", "And a weapon of carving does the same with a creature's mana."}, cid)
	elseif msgcontains(msg, "gold") and npcHandler.topic[cid] == 0 then
		npcHandler:say("What weapon enhance would you like? We have {carving}, {mayhem} and {remedy}.", cid)
		npcHandler.topic[cid] = 1
	elseif	isInArray(weaponEnhance, msg:lower()) and npcHandler.topic[cid] == 1 then
		weaponEnhanceChoose[cid] = msg:lower()
		npcHandler:say(weaponEnhanceChoose[cid]:gsub("^%l", string.upper) .. " nice! Choose a weapon type: {axe}, {blade}, {bow}, {chopper}, {crossbow}, {hammer}, {mace}, {rod}, {slayer} or {wand}.", cid)	
		npcHandler.topic[cid] = 2
	elseif	isInArray(weaponType, msg:lower()) and npcHandler.topic[cid] == 2 then
		weaponTypeChoose[cid] = msg:lower()
		npcHandler:say(weaponTypeChoose[cid]:gsub("^%l", string.upper) .. " of " .. weaponEnhanceChoose[cid]:gsub("^%l", string.upper) .. " will cost " .. weapon[weaponTypeChoose[cid]].price .. " tokens. Would you like it?", cid)
		npcHandler.topic[cid] = 3
	elseif	msgcontains(msg, "yes") and npcHandler.topic[cid] == 3 then
		if player[cid]:removeItem(tokenid, weapon[weaponTypeChoose[cid]].price) then
			if weaponEnhanceChoose[cid] == "carving" then
				doPlayerAddItem(cid,weapon[weaponTypeChoose[cid]].carving.normal)
			elseif weaponEnhanceChoose[cid] == "remedy" then
				doPlayerAddItem(cid,weapon[weaponTypeChoose[cid]].remedy.normal)
			elseif weaponEnhanceChoose[cid] == "mayhem" then
				doPlayerAddItem(cid,weapon[weaponTypeChoose[cid]].mayhem.normal)
			end
			
			npcHandler:say("There you go!", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("You don\'t have enough tokens.", cid)
			npcHandler.topic[cid] = 0
		end
	return true
end
end

local function onAddFocus(cid)
	chargetypechoose[cid] = 0
	weaponChargeChoose[cid] = 0
	weaponEnhanceChoose[cid] = 0
	weaponTypeChoose[cid] = 0
	player[cid] = Player(cid)
end

local function onReleaseFocus(cid)
	chargetypechoose[cid] = nil
	weaponChargeChoose[cid] = nil
	weaponEnhanceChoose[cid] = nil
	weaponTypeChoose[cid] = nil
	player[cid] = nil
end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
