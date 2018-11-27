local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Area Anti Entrosa para combate de Guilds.'} }
npcHandler:addModule(VoiceModule:new(voices))
 
-- Travel
local function addTravelKeyword(keyword, cost, destination, action)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Voce gostaria de ir para ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination}, nil, action)
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})
end

addTravelKeyword('cave war', 0, Position(32402, 32448, 7))

-- Basic
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, text = 'Escolha uma arena {Cave War}?'})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, text = 'Escolha uma arena {Cave War}?'})
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, text = 'Escolha uma arena {Cave War}?'})
keywordHandler:addKeyword({'area'}, StdModule.say, {npcHandler = npcHandler, text = 'Escolha uma arena {Cave War}?'})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, text = 'Escolha uma arena {Cave War}?'})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, text = 'Escolha uma arena {Cave War}?'})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, text = 'Escolha uma arena {Cave War}?'})

npcHandler:setMessage(MESSAGE_GREET, 'Bem vindo |PLAYERNAME|. estou aqui para te levar para uma Area Privada de War, Qual {area} voce gostaria de ir??')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Xau, divulgue nossos services, ate uma proxima.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Xau.')

npcHandler:addModule(FocusModule:new())
