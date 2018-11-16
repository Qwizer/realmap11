	_Lib_Battle_Info1 = {
	Reward1 = {
		exp1 = {true, 100000}, items1 = {true, 27872, 2}, premium_days1 = {false, 1}
	},
	TeamOne1 = {name1 = "Black Warrios", storage1 = 150120, pos1 = {x = 32335, y = 31505, z = 7}}, 
	TeamTwo1 = {name1 = "Red Warrios", storage1 = 150121, pos1 = {x = 32370, y = 31505, z = 7}},
	storage_count1 = 191400,
	tpPos1 = {x = 32310, y = 31858, z = 6},
	limit_Time1 = 10 -- em minutos  
}

_Lib_Battle_Days1 = {
    ["Monday"] = {   -- segunda 
		["22:28"] = {players1 = 30}
	},
	["Wednesday"] = { -- quarta 
		["22:28"] = {players1 = 30}
	},
	["Friday"] = { --sexta
		["22:28"] = {players1 = 30}
	},	
	["Sunday"] = { -- domingo
		["22:28"] = {players1 = 30}
	}
}

function resetBattle1()
	Game.setStorageValue(_Lib_Battle_Info1.TeamOne1.storage1, 0) 
	Game.setStorageValue(_Lib_Battle_Info1.TeamTwo1.storage1, 0)
end

function doBroadCastBattle1(type, msg)
	for _, cid in pairs(Game.getPlayers()) do
		if Player(cid):getStorageValue(_Lib_Battle_Info1.TeamOne1.storage1) == 1 or Player(cid):getStorageValue(_Lib_Battle_Info1.TeamTwo1.storage1) == 1 then
			Player(cid):sendTextMessage(type, msg)
		end
	end
end

function getWinnersBattle1(storage1)
	local str1, c1 = "[BattleField] " , 0
	for _, cid in pairs(Game.getPlayers()) do
		local player = Player(cid)
		if player:getStorageValue(storage1) >= 1 then
			if _Lib_Battle_Info1.Reward1.exp1[1] then player:addExperience(_Lib_Battle_Info1.Reward1.exp1[2], true) end
			if _Lib_Battle_Info1.Reward1.items1[1] then player:addItem(_Lib_Battle_Info1.Reward1.items1[2], _Lib_Battle_Info1.Reward1.items1[3]) end
			if _Lib_Battle_Info1.Reward1.premium_days1[1] then player:addPremiumDays(_Lib_Battle_Info1.Reward1.premium_days1[2]) end
			player:teleportTo(player:getTown():getTemplePosition())
			player:setStorageValue(storage1, -1)
			player:removeCondition(CONDITION_OUTFIT)
			c1 = c1 + 1 
		end
	end
	str1 = str1 .. "" .. c1 .. " jogadores" .. (c1 > 1 and "s" or "") .. " do time " .. (Game.getStorageValue(_Lib_Battle_Info1.TeamOne1.storage1) == 0 and _Lib_Battle_Info1.TeamTwo1.name1 or _Lib_Battle_Info1.TeamOne1.name1) .. " ganharam o evento!"
	resetBattle1()
	OpenWallBattle1()
	return broadcastMessage(str1)
end

function OpenWallBattle1()
	local B1 = {
		{1498, {x = 32353, y = 31504, z = 7, stackpos = 6}}, -- {x = 31424, y = 32550, z = 6}
		{1498, {x = 32353, y = 31505, z = 7, stackpos = 6}}, -- {x = 31424, y = 32551, z = 6}
		{1498, {x = 32353, y = 31506, z = 7, stackpos = 6}},
		{1498, {x = 32353, y = 31507, z = 7, stackpos = 6}},
		{1498, {x = 32352, y = 31506, z = 7, stackpos = 8}},
		{1498, {x = 32353, y = 31506, z = 7, stackpos = 8}},
		{1498, {x = 32354, y = 31506, z = 7, stackpos = 8}}	
	}

	for i1 = 1, #B1 do
		if getTileItemById(B1[i1][2], B1[i1][1]).uid == 0 then
			doCreateItem(B1[i1][1], 1, B1[i1][2])
		else
			doRemoveItem(getThingfromPos(B1[i1][2]).uid,1)
		end
	end
end

function removeBattleTp1()
	local t1 = getTileItemById(_Lib_Battle_Info1.tpPos1, 1387).uid
	return t1 > 0 and doRemoveItem(t1) and doSendMagicEffect(_Lib_Battle_Info1.tpPos1, CONST_ME_POFF)
end

function CheckEvent1(delay1)
	if delay1 > 0 and Game.getStorageValue(_Lib_Battle_Info1.storage_count1) > 0 then
		broadcastMessage("[BattleField] Faltam " .. Game.getStorageValue(_Lib_Battle_Info1.storage_count1) .. " jogadores para o evento comecar.")
	elseif delay1 == 0 and Game.getStorageValue(_Lib_Battle_Info1.storage_count1) > 0 then
		for _, cid in pairs(Game.getPlayers()) do
			local player = Player(cid)
			if player:getStorageValue(_Lib_Battle_Info1.TeamOne1.storage1) == 1 or player:getStorageValue(_Lib_Battle_Info1.TeamTwo1.storage1) == 1 then
				player:teleportTo(player:getTown():getTemplePosition())
				player:setStorageValue(_Lib_Battle_Info1.TeamOne1.storage1, -1)
				player:setStorageValue(_Lib_Battle_Info1.TeamTwo1.storage1, -1)
				player:removeCondition(CONDITION_OUTFIT)
			end
		end
		broadcastMessage("[BattleField] O evento nao foi iniciado por nao atingir o numero de jogadores.")
		Game.setStorageValue(_Lib_Battle_Info1.storage_count1, 0)
		resetBattle1()
		removeBattleTp1()
	end
	addEvent(CheckEvent1, 60000, delay1 - 1)
end
