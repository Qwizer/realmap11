function onKill(cid, target)


if (string.lower(getCreatureName(target)) == "Parasite" and getGlobalStorageValue(3144) < 100) then
pos = {
{x = 33097, y = 31976, z = 11},
{x = 33097, y = 31977, z = 11},
{x = 33097, y = 31978, z = 11},
{x = 33097, y = 31979, z = 11} 
}
barrier = false
for i = 1, 4 do
if(getCreaturePosition(target).x == pos.x and
getCreaturePosition(target).y == pos.y and
getCreaturePosition(target).z == pos.z
) then
barrier = true
end
end
last = false
if(barrier == true) then
for i = 1, 4 do
barrier = {
{x = 33098, y = 31976, z = 11},
{x = 33098, y = 31977, z = 11},
{x = 33098, y = 31978, z = 11},
{x = 33098, y = 31979, z = 11}
}
if(getTileItemById(barrier, 18459).uid > 0) then
doTransformItem(getTileItemById(barrier, 18459).uid, getTileItemById(barrier, 18459), 19460, 1)
elseif(getTileItemById(barrier, 18460).uid > 0) then
doTransformItem(getTileItemById(barrier, 18460).uid, getTileItemById(barrier, 18459), 19461, 1)
elseif(getTileItemById(barrier, 18459).uid > 0) then
doRemoveItem(getTileItemById(barrier, 18461).uid, 1)
addEvent(Game.createItem, 30 * 60 * 1000, 18459, 1, barrier)
last = true
end
end
end
if(barrier == true and last == true) then
setGlobalStorageValue(3144, 1)
addEvent(setGlobalStorageValue, 30 * 60 * 1000, 3144, 0)
end
end
return true
end