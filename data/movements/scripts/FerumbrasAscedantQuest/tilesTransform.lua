local ITEM_IDS = {
[25194] = 25195,
[25195] = 25196,
[25196] = 25197,
[25197] = 25194
}


function onStepIn(cid, item, fromPosition, itemEx, toPosition)
if(not ITEM_IDS[item.itemid]) then
return false
end


doTransformItem(item.uid, ITEM_IDS[item.itemid])
doDecayItem(item.uid)
return true
end