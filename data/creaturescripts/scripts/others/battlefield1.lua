function onLogin(player)
	player:registerEvent("battledeath1")
	if Game.getStorageValue(_Lib_Battle_Info1.TeamOne1.storage1) == -1 then
		Game.setStorageValue(_Lib_Battle_Info1.TeamOne1.storage1, 0)
		Game.setStorageValue(_Lib_Battle_Info1.TeamTwo1.storage1, 0)
		Game.setStorageValue(_Lib_Battle_Info1.storage_count1, 0)
	end
	if player:getStorageValue(_Lib_Battle_Info1.TeamOne1.storage1) >= 1 or player:getStorageValue(_Lib_Battle_Info1.TeamTwo1.storage1) >= 1 then
		player:setStorageValue(_Lib_Battle_Info1.TeamOne1.storage1, -1)
		player:setStorageValue(_Lib_Battle_Info1.TeamTwo1.storage1, -1)
		player:teleportTo(player:getTown():getTemplePosition())
	end
	return true
end

function onPrepareDeath(creature, lastHitKiller, mostDamageKiller)
	if creature:isPlayer() and creature:getStorageValue(_Lib_Battle_Info1.TeamOne1.storage1) >= 1 or creature:getStorageValue(_Lib_Battle_Info1.TeamTwo1.storage1) >= 1 then
		local MyTeam1 = creature:getStorageValue(_Lib_Battle_Info1.TeamOne1.storage1) >= 1 and _Lib_Battle_Info1.TeamOne1.storage1 or _Lib_Battle_Info1.TeamTwo1.storage1
		local EnemyTeam1 = creature:getStorageValue(_Lib_Battle_Info1.TeamOne1.storage1) >= 1 and _Lib_Battle_Info1.TeamTwo1.storage1 or _Lib_Battle_Info1.TeamOne1.storage1
		Game.setStorageValue(MyTeam1, (Game.getStorageValue(MyTeam1)-1))
		creature:sendTextMessage(MESSAGE_INFO_DESCR, "[BattleField] You are dead.")
		creature:setStorageValue(MyTeam1, -1)
		creature:removeCondition(CONDITION_OUTFIT)
		if Game.getStorageValue(MyTeam1) == 0 then
			getWinnersBattle1(EnemyTeam1)
		else
			doBroadCastBattle1(23, "[BattleField] " .. _Lib_Battle_Info1.TeamOne1.name1 .. " " .. Game.getStorageValue(_Lib_Battle_Info1.TeamOne1.storage1) .. " VS " .. Game.getStorageValue(_Lib_Battle_Info1.TeamTwo1.storage1) .. " " .._Lib_Battle_Info1.TeamTwo1.name1)
		end
	end
	return true
end
