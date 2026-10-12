function OnNetRecv(slot0, slot1, slot2)
	GameNet:getInstance():Recv(slot0, slot1, slot2)
end

function OnNetDisconnect(slot0)
	if GameNet:getInstance() and GameNet:getInstance():getGameNetid() > 0 and (GameNet:getInstance():getGameNetid() ~= slot0 or GameNet:getInstance():isServerDisconnet()) then
		return
	end

	GameNet:getInstance():Disconnect(slot0)
end

function OnNetAsyncConnected(slot0, slot1)
	if LoginController and LoginController:getInstance() then
		LoginController:getInstance():openReconnect(false)
	end

	GameNet:getInstance():Connected(slot0, slot1)
end

function Send(slot0, slot1, slot2, slot3)
	return GameNet:getInstance():Send(slot0, slot1, slot2, slot3)
end
