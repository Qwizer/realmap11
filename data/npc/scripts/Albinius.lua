local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

local items = {
          item1 = {12437, 50731}, -- item1 e storage dado
          item2 = {19742, 50732}, -- item1 e storage dado
          item3 = {11213, 50733}, -- item1 e storage dado
          item4 = {2667, 50735}, -- item1 e storage dado
          item5 = {21246, 50736}, -- item1 e storage dado
		  item6 = {26654} -- item1 e storage dado
}

local counts = {
          count1 = {50, 1},
          count6 = {5, 1}		  
}

local voices = {
	{ text = 'Walk in the light of Shaper wisdom!'},
	{ text = 'Welcome, my child.' },
	{ text = 'Our ways are the ways of the Shapers.' }
}

npcHandler:addModule(VoiceModule:new(voices))



local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	end

       if msgcontains(msg, "shaper") then
				npcHandler:say({
				"The {Shapers} were an advanced civilisation, well versed in art, construction, language and exploration of our world in their time. ...",
				"The foundations of this temple are testament to their genius and advanced understanding of complex problems. They were master craftsmen and excelled in magic."
			}, cid)
			end

	if msgcontains(msg, "tomes") then
		npcHandler:say("If you have some old shaper tomes I would {buy} them.", cid)
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
		

		
	    if msgcontains(msg, 'death portal') then
		if player:getStorageValue(50730) == 1 then
		if player:getStorageValue(items.item1[2]) <= 0 and getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
                              selfSay('Excellent! Now you can pass in the teleport.', cid)
							 player:setStorageValue(items.item1[2], counts.count1[2])
                    else
                              selfSay('You may pass this portal if you have 50 pelvis bones as offering. Do you have the bones with you?', cid)
        end
		else
                              selfSay('Sorry, first you need to bring my Heavy Old Tomes.', cid)
		end
		
					elseif msgcontains(msg, 'energy portal') then
					if player:getStorageValue(50730) == 1 then
		  if player:getStorageValue(items.item2[2]) <= 0 and getPlayerItemCount(cid, items.item2[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item2[1], counts.count1[1])
                              selfSay('Excellent! Now you can pass in the teleport.', cid)
							 player:setStorageValue(items.item2[2], counts.count1[2])
                    else
                              selfSay('You may pass this portal if you have 50 marsh stalker feathers as offering. Do you have the feathers with you?', cid)
                    end
		else
                              selfSay('Sorry, first you need to bring my Heavy Old Tomes.', cid)
		end
		elseif msgcontains(msg, 'temple') then
		  if player:getStorageValue(50730) <= 0 and  player:getItemCount(26654) > 4 then
							  doPlayerRemoveItem(cid, 26654, 5)
                              selfSay('Thank you very much for your contribution, child. Your first step in the ways of the Shapers has been taken.', cid)
							 player:setStorageValue(50730, 1)
          else
                              selfSay('You need 5 Heavy Old Tomes', cid)
          end

		elseif msgcontains(msg, 'earth portal') then
					if player:getStorageValue(50730) == 1 then
		  if player:getStorageValue(items.item3[2]) <= 0 and getPlayerItemCount(cid, items.item3[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item3[1], counts.count1[1])
                              selfSay('Excellent! Now you can pass in the teleport.', cid)
							 player:setStorageValue(items.item3[2], counts.count1[2])
                    else
                              selfSay('You may pass this portal if you have 50 acorns as offering. Do you have the acorns with you?', cid)
                    end
		else
                              selfSay('Sorry, first you need to bring my Heavy Old Tomes.', cid)
		end
		elseif msgcontains(msg, 'last portal') then
			if player:getStorageValue(50730) == 1 then
				if player:getStorageValue(Storage.BossHoH.Progresso) >= 7 then
					selfSay('Be careful child, great dangers are ahead of you.', cid)
					player:setStorageValue(50737, 1)
				elseif player:getStorageValue(50737) >= 1 then
					selfSay('You can already visit the new shapers ruins. Be careful.', cid) 
				else
					selfSay("You don't have enough knowledge to enter the dimensional portal.", cid)
				end
			else
					selfSay('Sorry, first you need to bring my Heavy Old Tomes.', cid)
			end
					elseif msgcontains(msg, 'ice portal') then
		if player:getStorageValue(50730) == 1 then
		  if player:getStorageValue(items.item4[2]) <= 0 and getPlayerItemCount(cid, items.item4[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item4[1], counts.count1[1])
                              selfSay('Excellent! Now you can pass in the teleport.', cid)
							  player:setStorageValue(50735, 1)
                    else
                              selfSay('You may pass this portal if you have 50 fishes as offering. Do you have the fishes with you?', cid)
                    end
		else
                              selfSay('Sorry, first you need to bring my Heavy Old Tomes.', cid)
		end
					elseif msgcontains(msg, 'holy portal') then
					if player:getStorageValue(50730) == 1 then
		  if player:getStorageValue(items.item5[2]) <= 0 and getPlayerItemCount(cid, items.item5[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item5[1], counts.count1[1])
                              selfSay('Excellent! Now you can pass in the teleport.', cid)
							 player:setStorageValue(items.item5[2], counts.count1[2])
                    else
                              selfSay('You may pass this portal if you have 50 incantation notes as offering. Do you have the notes with you?', cid)
                    end
		else
                              selfSay('Sorry, first you need to bring my Heavy Old Tomes.', cid)
		end
					
end
          return TRUE
end  


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I find ways to unveil the secrets of the stars. Judging by this question, I doubt you follow my weekly publications concerning this research."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Albinius, a worshipper of the {Astral Shapers}."})


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Greetings, pilgrim. Welcome to the halls of hope. We are the keepers of this {temple} and welcome everyone willing to contribute.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, my child")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell, my child")
npcHandler:addModule(FocusModule:new())