-- <event type="healthchange" name="HealGaz" script="heal_gaz.lua"/>

local config = {
	life_ative = 43750,
	life_add = 300000,
	seconds_ative = 7,
	gStorage = 90702
}

local function Uheal(cid)
	local gaz = Monster(cid)

	gaz:addHealth(config.life_add)
	gaz:say("Gaz'haragoth HEALS himself!", TALKTYPE_MONSTER_SAY)
	gaz:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	Game.setStorageValue(config.gStorage, 0)
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	
	if attacker then
		if creature:getHealth() < config.life_ative and Game.getStorageValue(config.gStorage) < 1 then
			creature:say("Gaz'haragoth begins to draw on the nightmares to HEAL himself!", TALKTYPE_MONSTER_SAY)
			addEvent(Uheal, 1000 * config.seconds_ative, creature.uid)
			Game.setStorageValue(config.gStorage, 1)
		end
	end

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end
