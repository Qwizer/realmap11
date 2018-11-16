function onLogin(player)
	player:registerEvent("battledeath")
	if Game.getStorageValue(_Lib_Battle_Info.TeamOne.storage) == -1 then
		Game.setStorageValue(_Lib_Battle_Info.TeamOne.storage, 0)
		Game.setStorageValue(_Lib_Battle_Info.TeamTwo.storage, 0)
		Game.setStorageValue(_Lib_Battle_Info.storage_count, 0)
	end
	if player:getStorageValue(_Lib_Battle_Info.TeamOne.storage) >= 1 or player:getStorageValue(_Lib_Battle_Info.TeamTwo.storage) >= 1 then
		player:setStorageValue(_Lib_Battle_Info.TeamOne.storage, -1)
		player:setStorageValue(_Lib_Battle_Info.TeamTwo.storage, -1)
		player:teleportTo(player:getTown():getTemplePosition())
	end
	return true
end

function onPrepareDeath(creature, lastHitKiller, mostDamageKiller)
	if creature:isPlayer() and creature:getStorageValue(_Lib_Battle_Info.TeamOne.storage) >= 1 or creature:getStorageValue(_Lib_Battle_Info.TeamTwo.storage) >= 1 then
		local MyTeam = creature:getStorageValue(_Lib_Battle_Info.TeamOne.storage) >= 1 and _Lib_Battle_Info.TeamOne.storage or _Lib_Battle_Info.TeamTwo.storage
		local EnemyTeam = creature:getStorageValue(_Lib_Battle_Info.TeamOne.storage) >= 1 and _Lib_Battle_Info.TeamTwo.storage or _Lib_Battle_Info.TeamOne.storage
		Game.setStorageValue(MyTeam, (Game.getStorageValue(MyTeam)-1))
		creature:sendTextMessage(MESSAGE_INFO_DESCR, "[BattleField] You are dead.")
		creature:setStorageValue(MyTeam, -1)
		creature:removeCondition(CONDITION_OUTFIT)
		if Game.getStorageValue(MyTeam) == 0 then
			getWinnersBattle(EnemyTeam)
		else
			doBroadCastBattle(23, "[BattleField] " .. _Lib_Battle_Info.TeamOne.name .. " " .. Game.getStorageValue(_Lib_Battle_Info.TeamOne.storage) .. " VS " .. Game.getStorageValue(_Lib_Battle_Info.TeamTwo.storage) .. " " .._Lib_Battle_Info.TeamTwo.name)
		end
	end
	return true
end
