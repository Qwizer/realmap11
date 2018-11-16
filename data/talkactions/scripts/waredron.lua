function onSay(cid, words, param)
	local config = {
		cstorage = 97877,
		gstorage = 97878,
		gistorage = 97879,
		usando = 97880,
		rejectsto = 97881,
		tempo = 97882,
		playerstorage = 97883,
		osplayerstorage = 97884,
		osminstorage = 97885,
		hplayerstorage = 85598,
		acc1storage = 97886,
		acc2storage = 97887
	}
	local status = {
		MESSAGE_STATUS_CONSOLE_BLUE,
		MESSAGE_INFO_DESCR,
	}
	local p = Player(cid)
	local players = Game.getPlayers()
	local gid = getPlayerGuildId(cid)
	local guildone = getGlobalStorageValue(config.gstorage)
	local guildtwo = getGlobalStorageValue(config.gistorage)
	
	function limpar()
		setGlobalStorageValue(config.gstorage, -1)
		setGlobalStorageValue(config.gistorage, -1)
		setGlobalStorageValue(config.usando, -1)
		setGlobalStorageValue(config.cstorage, -1)
		setGlobalStorageValue(config.rejectsto, -1)
		setGlobalStorageValue(config.tempo, -1)
		setGlobalStorageValue(config.playerstorage, -1)
		setGlobalStorageValue(config.osplayerstorage, -1)
		setGlobalStorageValue(config.osminstorage, -1)
		setGlobalStorageValue(config.hplayerstorage, -1)
		setGlobalStorageValue(config.acc1storage, -1)
		setGlobalStorageValue(config.acc2storage, -1)
	end
	function titleCase( first, rest )
	   return first:upper()..rest:lower()
	end
	
	if gid == false then
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Voce nao tem uma guild, nao pode usar este comando!") 
		return false
	end
	
	if param:find('invite') == 1 and 3 then
		local _,_,player,minutos = param:find('invite (.+) (.+)')
		player = player or ""
		minutos = minutos or 0
		if player == nil or tonumber(minutos) == nil or player == '' or tonumber(minutos) == 0 then
			for i = 1, #status do
				doPlayerSendTextMessage(cid,status[i],"[WAR AREA] Use: !waredron \"invite NOME_DE_UM_MEMBRO_INIMIGO MINUTOS_DE_WAR (EX: !waredron \"invite String 40 - invitar para uma war de 40 minutos)") 
			end
			return false
		end
		player = string.gsub(player, "(%a)([%w_']*)", titleCase)
		local tid = getPlayerByName(player)
		if (getPlayerGuildLevel(cid) < 3) then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Voce precisa ser o lider de sua guild para poder usar este comando!")
			return false
		elseif tid == false then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Jogador nao esta online ou nao existe!") 
			return false
		elseif getPlayerGuildId(tid) == false then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Este jogador nao possui uma guild!") 
			return false
		elseif getGlobalStorageValue(config.usando) == 2 then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Ja estao usando a area, e irao acabar as "..os.date("%X ", getGlobalStorageValue(config.osminstorage)).."") 
			return false
		elseif tonumber(minutos) < 40 or tonumber(minutos) > 120 then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Voce deve escolher entre 40 a 120 minutos!") 
			return false
		elseif getGlobalStorageValue(config.usando) == 1 then
			if gid == guildone then 
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Voce ja mandou um convite, espere o outro lider aceitar!")
				return false
			else
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Ja existe um convite pendente, tente novamente mais tarde!")
				return false
			end
		end
		guild = getPlayerGuildName(tid)
		inguild = getPlayerGuildName(cid)
		if getPlayerGuildId(tid) == gid then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"[WAR AREA] Voce nao pode convidar a sua propria guild!")
			return false
		elseif getPlayerGuildId(tid) == false then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Este player nao tem uma guild!") 
			return false
		end
		limpar();
		for i, tid in ipairs(players) do
			if gid == guildone or gid == guildtwo then
				setPlayerStorageValue(tid, config.hplayerstorage, -1)
			end
		end
		for i = 1, #status do
			doPlayerSendTextMessage(cid, status[i],"[WAR AREA] Voce invitou a guild "..guild.." para "..tonumber(minutos).." minutos, o lider da "..guild.." tem 1 minuto para aceitar seu pedido!.")
			if (getPlayerGuildLevel(tid) == 3) then
				doPlayerSendTextMessage(tid, status[i],"[WAR AREA] Sua guild recebeu um convite da guild "..inguild.." para "..tonumber(minutos).." minutos na Area de Edron x Cormaya, voce tem 1 minuto para usar !waredron \"accept para aceitar ou !waredron \"reject para rejeitar!.")
			else
				doPlayerSendTextMessage(tid, status[i],"[WAR AREA] Sua guild recebeu um convite de war da guild "..inguild.." para "..tonumber(minutos).." minutos na Area de Edron x Cormaya!.")
			end
		end
		setGlobalStorageValue(config.tempo, minutos)
		setGlobalStorageValue(config.gistorage, getPlayerGuildId(tid))
		setGlobalStorageValue(config.gstorage, getPlayerGuildId(cid))
		setGlobalStorageValue(config.usando, 1)
		setGlobalStorageValue(config.cstorage,os.time()+60)
	elseif param:lower():find('accept') == 1 then
		if (getPlayerGuildLevel(cid) < 3) then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Voce precisa ser o lider de sua guild!")
			return false
		end
		if gid == guildtwo then
			if getGlobalStorageValue(config.usando) == 2 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"[WAR AREA] Voce ja aceitou o convite e a war comeceu, para entrar na area basta usar !waredron \"join")
			elseif getGlobalStorageValue(config.usando) == 1 then
				setGlobalStorageValue(config.osminstorage,os.time()+getGlobalStorageValue(config.tempo)*60)
				setGlobalStorageValue(config.playerstorage,1)
				setGlobalStorageValue(config.osplayerstorage,os.time()+10*60)
				setGlobalStorageValue(config.usando, 2)
				for i, tid in ipairs(players) do
					if getPlayerGuildId(tid) == guildtwo or getPlayerGuildId(tid) == guildone then
						for i = 1, #status do
							doPlayerSendTextMessage(tid, status[i],"[WAR AREA] O acesso para sua guild foi liberado, voce tem 10 minutos para usar !waredron \"join")
						end
					end
				end
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"[WAR AREA] Voce nao recebeu nenhum convite!")
		end
	elseif param:lower():find('reject') == 1 then
		if (getPlayerGuildLevel(cid) < 3) then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Voce precisa ser o lider de sua guild!")
			return false
		end
		if gid == guildtwo then
			if getGlobalStorageValue(config.usando) == 2 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"[WAR AREA] Voce ja aceitou o convite!")
			elseif getGlobalStorageValue(config.usando) == 1 then
				setGlobalStorageValue(config.rejectsto, 1)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"[WAR AREA] Voce rejeitou o pedido de war, aguarde que em instantes tudo sera automaticamente cancelado!")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"[WAR AREA] Voce nao recebeu nenhum convite!")
		end
	elseif param:lower():find('stop') == 1 then
		if (getPlayerGuildLevel(cid) < 3) then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Voce precisa ser o lider de sua guild para poder pedir um stop!")
			return false
		elseif gid == guildtwo then
			if getGlobalStorageValue(config.acc2storage) ~= 1 and getGlobalStorageValue(config.acc1storage) == 1 then
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Voce ja pediu um stop, porem o outro lider ainda nao aceitou usando !waredron \"stop")
			elseif getGlobalStorageValue(config.acc1storage) < 1 then
				setGlobalStorageValue(config.acc1storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Voce acaba de pedir stop, fale para o outro guild fazer o mesmo!")
			elseif getGlobalStorageValue(config.acc2storage) == 1 then
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] O outro lider ja aceitou, aguarde alguns instantes!")
			end
		elseif gid == guildone then
			if getGlobalStorageValue(config.acc1storage) ~= 1 and getGlobalStorageValue(config.acc2storage) == 1 then
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Voce ja pediu um stop, porem o outro lider ainda nao aceitou usando !waredron \"stop")
			elseif getGlobalStorageValue(config.acc2storage) < 1 then
				setGlobalStorageValue(config.acc2storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] Voce acaba de pedir stop, fale para o outro guild fazer o mesmo!")
			elseif getGlobalStorageValue(config.acc1storage) == 1 and getGlobalStorageValue(config.acc2storage) == 1 then
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"[WAR AREA] O outro lider ja aceitou, aguarde alguns instantes!")
			end
		end
	elseif param:lower():find('join') == 1 then
		if (getGlobalStorageValue(config.playerstorage) == 1 and getGlobalStorageValue(config.osplayerstorage) > os.time() and getPlayerStorageValue(cid, config.hplayerstorage)~= 2) and (gid == guildone or gid == guildtwo) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[WAR AREA] Voce sera teleportado para area em breve, aguarde!")
			setPlayerStorageValue(cid, config.hplayerstorage, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"[WAR AREA] Voce nao pode usar este comando!")
		end
	end
return false
end
