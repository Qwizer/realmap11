-- Ferumbras Quest feita por Ciroc
local bossesf = {
	[39792] = {storageValue = 54992},
	[39793] = {storageValue = 54993},
	[39794] = {storageValue = 54994},
	[39795] = {storageValue = 54995},
	[39796] = {storageValue = 54996},
	[39797] = {storageValue = 54997},
	[39798] = {storageValue = 54998}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	local saidatp = bossesf[item.actionid]

        player:setStorageValue(saidatp.storageValue, os.time()+48*3600)
	player:teleportTo(Position(33320, 32318, 13))
	return true
end