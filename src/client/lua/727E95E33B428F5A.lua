BaseController = BaseController or BaseClass()

function BaseController.getInstance(slot0)
	if not slot0.is_init then
		slot0.is_init = true

		if slot0.config ~= nil then
			slot0:config()
		end

		if slot0.registerEvents ~= nil then
			slot0:registerEvents()
		end

		if slot0.registerProtocals ~= nil then
			slot0:registerProtocals()
		end
	end

	return slot0
end

function BaseController.RegisterProtocal(slot0, slot1, slot2)
	ProtoMgr:getInstance():RegisterCmdCallback(slot1, slot2, slot0)
end

function BaseController.SendProtocal(slot0, slot1, slot2)
	if slot1 == nil or slot1 == 0 then
		Debug.info("发送失败, 错误的协议号")

		return
	end

	if PLATFORM == cc.PLATFORM_OS_WINDOWS then
		print("sendprotocal*********", slot1)
	end

	Send(slot1, slot2 or {})
end
