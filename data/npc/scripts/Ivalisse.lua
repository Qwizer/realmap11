local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
function creatureSayCallback(cid, type, msg)
		if(not npcHandler:isFocused(cid)) then
			return false
		end
		local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
		local player = Player(cid)

		if player:getStorageValue(50730) < 1 then
			if msgcontains(msg, 'temple') then
				npcHandler:say({"I can't tell you much right now, but you can contribute to our rebuilding by talking about the shaper's temple to Albinius first."}, cid)
			end

		elseif player:getStorageValue(50734) <= 0 then 
			if msgcontains(msg, 'temple') then
				npcHandler:say({"Well, I hope you like it here. We tried to rebuild in the Shaper's will. I am a bit preoccupied at the moment because of the absence of my {father}. I may not be the best of help currently."}, cid)
				npcHandler.topic[cid] = 1	
		 
			elseif msgcontains(msg, 'father') and npcHandler.topic[cid] == 1 then
				npcHandler:say({
					"Papa - my father has recently started an adventure on his own. His name is Silus, he is a member of the Edron Academy. ...",
					"Ever since he has joined what he called a 'special' research division, he went on and on about Zao and how venturing there would help him get ahead. ...",
					"You must know he lives for science, especially concerning far-away lands and culture. He talked about the importance of practical field studies but, frankly, he isn't particularly cut out for that. ...",
					"I know he has to focus to get his research done right now and I simply cannot leave my duties in the temple. You seem like a person who travels a lot, would you be willing to help me?"}, cid)
			npcHandler.topic[cid] = 2

			elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 2 then
				npcHandler:say({
					"Thank you! He told me the other researchers in his team discovered a bridge leading to a cave with a dragon sculpture somewhere in a muggy, grassy area. ...",
					"The cave is said to lead to a temple complex underground which is ued as a gathering place for a race called 'draken'. He left right away and tried to enter Zao on his own. ...",
					"I was even more worried when he explained the route he chose. he wanted to head straight through a giant steppe and through a massive mountainous ridge to reach the grassy plains of lower Zao. ...",
					"If you're interested: I know that the Shapers where active in all corners of Tibia. If you happen to find Shaper ruins there, you may even be able to gather some of their lost knowledge. ...",
					"I may have been a bit stubborn and angry the day he left, I even refused to say farewell. And now I worry if he is safe. ...",
					"I can not do much to help you but I can open a portal to get you quite close to his last known location in Zao. What do you say, will you help me find my father?"}, cid)
				npcHandler.topic[cid] = 3

			elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 3 then
				player:setStorageValue(50734, 1)
				npcHandler:say({"You would? That's great! Thank you! If you can find my father, tell him I understand and that I really miss him!"}, cid)
			end
		elseif player:getStorageValue(50734) == 1 then
				npcHandler:say({"You can pass through the fire teleport now, try to find my father to me please."}, cid)
				npcHandler.topic[cid] = 0
		end
	return TRUE
end

-- Basic
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Besides my various {duties} in the temple, I also take care of visitors. Well, I would but right now I can't get my mind of how my father's doing. I am sorry."})
keywordHandler:addKeyword({'duties'}, StdModule.say, {npcHandler = npcHandler, text = "I help linking the portals of this temple to other ancient sites of the Astral Shapers."})
keywordHandler:addKeyword({'astral shapers'}, StdModule.say, {npcHandler = npcHandler, text = "As far as we know today, the Astral Shapers are an ancient, very advanced race of master artisans."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Ivalisse."})
keywordHandler:addKeyword({'silus'}, StdModule.say, {npcHandler = npcHandler, text = "My father, can you tell me if he's alright?"})
keywordHandler:addKeyword({'albinius'}, StdModule.say, {npcHandler = npcHandler, text = "Me and him are rebuilding the shaper's temple. He's a great person, very intelligent. He'll help you through our rebuilding process."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = "Alright then, you are very welcome to explore the temple!"})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())