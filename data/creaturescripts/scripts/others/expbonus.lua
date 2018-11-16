function onLogin(cid)
    local player = Player(cid)
    if player:getPremiumDays() < 1 then
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Voce nao possui premium account. Torne-se Premium agora e ganhe 20% a mais de Experiencia. #SejaSexy')
    else
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Ola meu amigo, voce ainda possui '..player:getPremiumDays()..' dias de premium account. Aproveite... Voce esta recebendo 20% a mais de Experiencia. Ualll realmente isso e Sexy!')
    end
return true
end