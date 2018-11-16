function onUse(cid, item)
local p = Player(cid)

       -- VERIFICAR SE JÁ TEM BLESS 
if(p:hasBlessing(1) and p:hasBlessing(2) and p:hasBlessing(3) and p:hasBlessing(4) and p:hasBlessing(5) and p:hasBlessing(6)) then
		return	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have already been blessed by the gods.") and doSendMagicEffect(getCreaturePosition(cid), 3)
	end

		-- COLOCAR BLESS
for i = 1, 6 do
p:addBlessing(i)
doSendMagicEffect(getCreaturePosition(cid), 47)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have been blessed by the gods!")
end

return true
end