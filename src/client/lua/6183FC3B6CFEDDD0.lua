ProtoMgr = ProtoMgr or BaseClass()

function ProtoMgr.getInstance(slot0)
	if not slot0.is_init then
		slot0.cmd_callback_table = {}
		slot0.net_manager = cc.SmartSocket:getInstance()

		slot0:LoadMate()

		slot0.is_init = true
	end

	return slot0
end

function ProtoMgr.LoadMate(slot0)
	slot1 = require("mmtZgQAwkKz4pG9sW05wVoadNxAlGKg9.net.proto_mate")

	slot0.net_manager:loadSendMateData(slot1.send)
	slot0.net_manager:loadRecvMateData(slot1.recv)
end

function ProtoMgr.hasReg(slot0, slot1)
	return slot0.cmd_callback_table[slot1] ~= nil
end

function ProtoMgr.RegisterCmdCallback(slot0, slot1, slot2, slot3)
	slot2 = slot2 or "handle_" .. slot1
	slot4 = nil

	if type(slot3) == "function" then
		slot4 = slot3
	elseif slot3 then
		if not slot3[slot2] then
			Debug.error("注册协议出错,不存在的函数调用", slot1, slot2)

			return false
		end

		function slot4(slot0)
			uv0[uv1](uv0, slot0)
		end
	else
		slot5 = _G[slot2] or slot2

		function slot4(slot0)
			uv0(slot0)
		end
	end

	if not slot0.cmd_callback_table[slot1] then
		slot0.cmd_callback_table[slot1] = {}
	end

	slot0.cmd_callback_table[slot1][slot2] = slot4
end

function ProtoMgr.UnRegisterCmdCallback(slot0, slot1, slot2)
	if not slot0.cmd_callback_table[slot1] then
		return
	end

	if not slot0.cmd_callback_table[slot1][slot2 or "handle_" .. slot1] then
		return
	end

	slot0.cmd_callback_table[slot1][slot2] = nil
end

function ProtoMgr.cmd_callback(slot0, slot1, slot2)
	if not slot0.cmd_callback_table[slot1] then
		return
	end

	for slot7, slot8 in pairs(slot0.cmd_callback_table[slot1]) do
		slot8(slot2)
	end

	slot2 = nil
end
