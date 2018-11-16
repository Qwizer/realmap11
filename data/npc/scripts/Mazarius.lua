 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
local items = {
          item1 = {6500, 24838} -- item1 item que será pedido e que será dado na primeira troca
		 
}
local counts = {
          count1 = {30, 1}
		 
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local player = Player(cid)
          if msgcontains(msg, 'demonic essence') or msgcontains(msg, 'short') then
		  if player:getStorageValue(88419) <= 0 then 
                    if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
                              doPlayerAddItem(cid, items.item1[2], counts.count1[2])
                              selfSay('Excellente! Now you can pass in the teleport.', cid)
							 player:setStorageValue(88419, 1)
                    else
                              selfSay('You need '.. counts.count1[1] ..' '.. getItemName(items.item1[1]) ..'.', cid)
                    end

          				
					
          end
		  selfSay('You already have access to teleport.', cid)
          return TRUE
end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())