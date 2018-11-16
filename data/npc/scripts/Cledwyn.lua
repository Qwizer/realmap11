 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
local items = {
          item1 = {25172, 13030}, -- item1 item que será pedido e que será dado na primeira troca
          item2 = {25172, 25177},
		  item3 = {25172, 25179},
		  item4 = {25172, 25191},
		  item5 = {25172, 25187},
		  item6 = {25172, 25174},
		  item7 = {25172, 25175},
		  item8 = {25172, 25176},
		  item9 = {25172, 25190},
		  item10 = {25172, 25186},
		  item11 = {25172, 25183},
		  item12 = {25172, 25184},
		  item13 = {25172, 25185},
		  item14 = {25172, 25189},
		  item15 = {25172, 25188},
		  item16 = {25172, 25192},
		  item17 = {25172, 25182},
		  item18 = {25172, 25181},
		  item19 = {25172, 25180},
		  item20 = {25172, 25193} 
}
local counts = {
          count1 = {100, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
          count2 = {100, 1},
		  count3 = {100, 1},
		  count4 = {100, 1},
		  count5 = {100, 1},
		  count6 = {100, 1},
		  count7 = {100, 1},
		  count8 = {100, 1},
		  count9 = {100, 1},
		  count10 = {100, 1},
		  count11 = {100, 1},
		  count12 = {100, 1},
		  count13 = {100, 1},
		  count14 = {100, 1},
		  count15 = {100, 1},
		  count16 = {100, 1},
		  count17 = {100, 1},
		  count18 = {100, 1}, 
		  count19 = {100, 1}, 
		  count20 = {100, 1}
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

          if  msgcontains(msg, 'earthheart cuirass') then
                    if getPlayerItemCount(cid, items.item2[1]) >= counts.count2[1] then
                              doPlayerRemoveItem(cid, items.item2[1], counts.count2[1])
                              doPlayerAddItem(cid, items.item2[2], counts.count2[2])
                              selfSay('You just swap '.. counts.count2[1] ..' '.. getItemName(items.item2[1]) ..' for '.. counts.count2[2] ..' '.. getItemName(items.item2[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count2[1] ..' '.. getItemName(items.item2[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'earthheart platemail') then
                    if getPlayerItemCount(cid, items.item3[1]) >= counts.count3[1] then
                              doPlayerRemoveItem(cid, items.item3[1], counts.count3[1])
                              doPlayerAddItem(cid, items.item3[2], counts.count3[2])
                              selfSay('You just swap '.. counts.count3[1] ..' '.. getItemName(items.item3[1]) ..' for '.. counts.count3[2] ..' '.. getItemName(items.item3[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count3[1] ..' '.. getItemName(items.item3[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'earthmind raiment') then
                    if getPlayerItemCount(cid, items.item4[1]) >= counts.count4[1] then
                              doPlayerRemoveItem(cid, items.item4[1], counts.count4[1])
                              doPlayerAddItem(cid, items.item4[2], counts.count4[2])
                              selfSay('You just swap '.. counts.count4[1] ..' '.. getItemName(items.item4[1]) ..' for '.. counts.count4[2] ..' '.. getItemName(items.item4[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count4[1] ..' '.. getItemName(items.item4[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'earthsoul tabard') then
                    if getPlayerItemCount(cid, items.item5[1]) >= counts.count5[1] then
                              doPlayerRemoveItem(cid, items.item5[1], counts.count5[1])
                              doPlayerAddItem(cid, items.item5[2], counts.count5[2])
                              selfSay('You just swap '.. counts.count5[1] ..' '.. getItemName(items.item5[1]) ..' for '.. counts.count5[2] ..' '.. getItemName(items.item5[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count5[1] ..' '.. getItemName(items.item5[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'fireheart cuirass') then
                    if getPlayerItemCount(cid, items.item6[1]) >= counts.count6[1] then
                              doPlayerRemoveItem(cid, items.item6[1], counts.count6[1])
                              doPlayerAddItem(cid, items.item6[2], counts.count6[2])
                              selfSay('You just swap '.. counts.count6[1] ..' '.. getItemName(items.item6[1]) ..' for '.. counts.count6[2] ..' '.. getItemName(items.item6[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count6[1] ..' '.. getItemName(items.item6[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'fireheart hauberk') then
                    if getPlayerItemCount(cid, items.item7[1]) >= counts.count7[1] then
                              doPlayerRemoveItem(cid, items.item7[1], counts.count7[1])
                              doPlayerAddItem(cid, items.item7[2], counts.count7[2])
                              selfSay('You just swap '.. counts.count7[1] ..' '.. getItemName(items.item7[1]) ..' for '.. counts.count7[2] ..' '.. getItemName(items.item7[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count7[1] ..' '.. getItemName(items.item7[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'fireheart platemail') then
                    if getPlayerItemCount(cid, items.item8[1]) >= counts.count8[1] then
                              doPlayerRemoveItem(cid, items.item8[1], counts.count8[1])
                              doPlayerAddItem(cid, items.item8[2], counts.count8[2])
                              selfSay('You just swap '.. counts.count8[1] ..' '.. getItemName(items.item8[1]) ..' for '.. counts.count8[2] ..' '.. getItemName(items.item8[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count8[1] ..' '.. getItemName(items.item8[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'firemind raiment') then
                    if getPlayerItemCount(cid, items.item9[1]) >= counts.count9[1] then
                              doPlayerRemoveItem(cid, items.item9[1], counts.count9[1])
                              doPlayerAddItem(cid, items.item9[2], counts.count9[2])
                              selfSay('You just swap '.. counts.count9[1] ..' '.. getItemName(items.item9[1]) ..' for '.. counts.count9[2] ..' '.. getItemName(items.item9[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count9[1] ..' '.. getItemName(items.item9[1]) ..'.', cid)
                    end
					
					-- Dolls 
					elseif msgcontains(msg, 'firesoul tabard') then
                    if getPlayerItemCount(cid, items.item10[1]) >= counts.count10[1] then
                              doPlayerRemoveItem(cid, items.item10[1], counts.count10[1])
                              doPlayerAddItem(cid, items.item10[2], counts.count10[2])
                              selfSay('You just swap '.. counts.count10[1] ..' '.. getItemName(items.item10[1]) ..' for '.. counts.count10[2] ..' '.. getItemName(items.item10[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count10[1] ..' '.. getItemName(items.item10[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostheart cuirass') then
                    if getPlayerItemCount(cid, items.item11[1]) >= counts.count11[1] then
                              doPlayerRemoveItem(cid, items.item11[1], counts.count11[1])
                              doPlayerAddItem(cid, items.item11[2], counts.count11[2])
                              selfSay('You just swap '.. counts.count11[1] ..' '.. getItemName(items.item11[1]) ..' for '.. counts.count11[2] ..' '.. getItemName(items.item11[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count11[1] ..' '.. getItemName(items.item11[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostheart hauberk') then
                    if getPlayerItemCount(cid, items.item12[1]) >= counts.count12[1] then
                              doPlayerRemoveItem(cid, items.item12[1], counts.count12[1])
                              doPlayerAddItem(cid, items.item12[2], counts.count12[2])
                              selfSay('You just swap '.. counts.count12[1] ..' '.. getItemName(items.item12[1]) ..' for '.. counts.count12[2] ..' '.. getItemName(items.item12[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count12[1] ..' '.. getItemName(items.item12[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostheart platemail') then
                    if getPlayerItemCount(cid, items.item13[1]) >= counts.count13[1] then
                              doPlayerRemoveItem(cid, items.item13[1], counts.count13[1])
                              doPlayerAddItem(cid, items.item13[2], counts.count13[2])
                              selfSay('You just swap '.. counts.count13[1] ..' '.. getItemName(items.item13[1]) ..' for '.. counts.count13[2] ..' '.. getItemName(items.item13[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count13[1] ..' '.. getItemName(items.item13[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostsoul tabard') then
                    if getPlayerItemCount(cid, items.item14[1]) >= counts.count14[1] then
                              doPlayerRemoveItem(cid, items.item14[1], counts.count14[1])
                              doPlayerAddItem(cid, items.item14[2], counts.count14[2])
                              selfSay('You just swap '.. counts.count14[1] ..' '.. getItemName(items.item14[1]) ..' for '.. counts.count14[2] ..' '.. getItemName(items.item14[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count14[1] ..' '.. getItemName(items.item14[1]) ..'.', cid)
                    end
					elseif msgcontains(msg, 'thundersoul tabard') then
                    if getPlayerItemCount(cid, items.item15[1]) >= counts.count15[1] then
                              doPlayerRemoveItem(cid, items.item15[1], counts.count15[1])
                              doPlayerAddItem(cid, items.item15[2], counts.count15[2])
                              selfSay('You just swap '.. counts.count15[1] ..' '.. getItemName(items.item15[1]) ..' for '.. counts.count15[2] ..' '.. getItemName(items.item15[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count15[1] ..' '.. getItemName(items.item15[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'thundermind raiment') then
                    if getPlayerItemCount(cid, items.item16[1]) >= counts.count16[1] then
                              doPlayerRemoveItem(cid, items.item16[1], counts.count16[1])
                              doPlayerAddItem(cid, items.item16[2], counts.count16[2])
                              selfSay('You just swap '.. counts.count16[1] ..' '.. getItemName(items.item16[1]) ..' for '.. counts.count16[2] ..' '.. getItemName(items.item16[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count16[1] ..' '.. getItemName(items.item16[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'thunderheart platemail') then
                    if getPlayerItemCount(cid, items.item17[1]) >= counts.count17[1] then
                              doPlayerRemoveItem(cid, items.item17[1], counts.count17[1])
                              doPlayerAddItem(cid, items.item17[2], counts.count17[2])
                              selfSay('You just swap '.. counts.count17[1] ..' '.. getItemName(items.item17[1]) ..' for '.. counts.count17[2] ..' '.. getItemName(items.item17[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count17[1] ..' '.. getItemName(items.item17[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'thunderheart hauberk') then
                    if getPlayerItemCount(cid, items.item18[1]) >= counts.count18[1] then
                              doPlayerRemoveItem(cid, items.item18[1], counts.count18[1])
                              doPlayerAddItem(cid, items.item18[2], counts.count18[2])
                              selfSay('You just swap '.. counts.count18[1] ..' '.. getItemName(items.item18[1]) ..' for '.. counts.count18[2] ..' '.. getItemName(items.item18[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count18[1] ..' '.. getItemName(items.item18[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'thunderheart cuirass') then
                    if getPlayerItemCount(cid, items.item19[1]) >= counts.count19[1] then
                              doPlayerRemoveItem(cid, items.item19[1], counts.count19[1])
                              doPlayerAddItem(cid, items.item19[2], counts.count19[2])
                              selfSay('You just swap '.. counts.count19[1] ..' '.. getItemName(items.item19[1]) ..' for '.. counts.count19[2] ..' '.. getItemName(items.item19[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count19[1] ..' '.. getItemName(items.item19[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostmind raiment') then
                    if getPlayerItemCount(cid, items.item20[1]) >= counts.count20[1] then
                              doPlayerRemoveItem(cid, items.item20[1], counts.count20[1])
                              doPlayerAddItem(cid, items.item20[2], counts.count20[2])
                              selfSay('You just swap '.. counts.count20[1] ..' '.. getItemName(items.item20[1]) ..' for '.. counts.count20[2] ..' '.. getItemName(items.item20[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count20[1] ..' '.. getItemName(items.item20[1]) ..'.', cid)
                    end					
          end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())