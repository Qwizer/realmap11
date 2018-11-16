--- [[ Warzone 2 feito por Yuri Lagrotta ]] ---
local BOSS = "gnomevil"
local posGnome = {x=33115, y=31950, z=11}
local kickposs = {x=33000, y=31899, z=9} 
local kickposs1 = {x=33097, y=31978, z=11} 

local function deGnomevil()
if(getGlobalStorageValue(91149) < 1) then
    TOP_LEFT_CORNER = {x = 33102, y = 31942, z = 11, stackpos=253}
    BOTTOM_RIGHT_CORNER = {x = 33130, y = 31970, z = 11, stackpos=253}
	for Py = TOP_LEFT_CORNER.y, BOTTOM_RIGHT_CORNER.y do
		for Px = TOP_LEFT_CORNER.x, BOTTOM_RIGHT_CORNER.x do
			creature = getThingfromPos({x=Px, y=Py, z=11, stackpos=253})
			if isMonster(creature.uid) then
				if getCreatureName(creature.uid) == "Gnomevil" then
					--doRemoveCreature(creature.uid)
					setGlobalStorageValue(91149, 1)
					addEvent(setGlobalStorageValue, 30 * 60 * 1000, 91149, 0) 
					else Game.createMonster(BOSS, posGnome)
					end
				end
			end
		end
    end
    return FALSE
end    
 local function deSummonGnomevil()
	if(getGlobalStorageValue(99159) < 1) then
		--addEvent(doSummonCreature, 45*1000, "gnomevil", {x=33115, y=31950, z=11})
		--Game.createMonster(BOSS, posGnome)
		addEvent(setGlobalStorageValue, 600 * 60 * 1000, 99159, 0)
		--setGlobalStorageValue(99159, 1)
		
	end
end

function onStepIn(cid, item, position, topos, frompos)
    if not isPlayer(cid) then
        return false
    end
           
if item.actionid == 5159 then
if(getGlobalStorageValue(99159) < 1) then
	doTeleportThing(cid, {x = 33105, y = 31955, z = 11})
	doPlayerSendTextMessage(cid, 19, "You have half an hour to heroically defeat Gnomevil. Otherwise you'll be teleported out by the gnomish emergency device.")
	deGnomevil()
	deSummonGnomevil()
	addEvent(setGlobalStorageValue, 2 * 60 * 1000, 99159, 1)
	
elseif item.actionid == 5160 then
        doTeleportThing(cid, {x=33000, y=31899, z=9})
		--else 
		--doPlayerSendTextMessage(cid, 19, "The boss has already been killed today, the spawn takes place from 10 to 10 hours.")
		--doTeleportThing(cid, kickposs1)
    end
	
    return true
end
end