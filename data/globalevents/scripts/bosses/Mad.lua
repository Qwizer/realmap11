local BOSSii = "Mad Mage" -- boss name
local BOSS_POSii = {x = 33361, y = 31873, z = 9} -- boss spawn coord 
local roomii = {fromx = 33306, tox = 33372, fromy = 31844, toy = 31917, z = 9} -- boss room
local BOSS_GLOBAL_STORAGEii = 80701 -- dont change

function onTime()
--function onThink(interval, lastExecution)

local bossii = 0
for x = roomii.fromx, roomii.tox do
for y = roomii.fromy, roomii.toy do
for z = roomii.z, roomii.z do

creatureii = {x = x, y = y, z = z}
mobii = getTopCreature(creatureii).uid

    if getCreatureName(mobii) == BOSSii then
        bossii = 1
    end
end
end
end

if bossii == 1 then
end

if bossii == 0 then
  local monster3 = Game.createMonster("Mad Mage", Position(33361, 31873, 9))
 monster3:setReward(true)
end

return true
end
