InviteCodeController = InviteCodeController or BaseClass(BaseController)

function InviteCodeController.config(slot0)
	slot0.model = InviteCodeModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function InviteCodeController.getModel(slot0)
	return slot0.model
end

function InviteCodeController.registerEvents(slot0)
end

function InviteCodeController.registerProtocals(slot0)
	slot0:RegisterProtocal(19800, "handle19800")
	slot0:RegisterProtocal(19801, "handle19801")
	slot0:RegisterProtocal(19802, "handle19802")
	slot0:RegisterProtocal(19803, "handle19803")
	slot0:RegisterProtocal(19804, "handle19804")
	slot0:RegisterProtocal(19805, "handle19805")
	slot0:RegisterProtocal(19807, "handle19807")
	slot0:RegisterProtocal(19811, "handle19811")
	slot0:RegisterProtocal(19812, "handle19812")
	slot0:RegisterProtocal(10929, "handle10929")
	slot0:RegisterProtocal(10930, "handle10930")
end

function InviteCodeController.requestProto(slot0)
	slot0:sender19800()
	slot0:sender19804()
	slot0:sender19802()
	slot0:sender19811()
end

function InviteCodeController.sender19800(slot0)
	slot0:SendProtocal(19800, {})
end

function InviteCodeController.handle19800(slot0, slot1)
	slot0.model:setInviteCode(slot1.code)
	GlobalEvent:getInstance():Fire(InviteCodeEvent.Get_InviteCode_Event)
end

function InviteCodeController.sender19801(slot0, slot1)
	slot0:SendProtocal(19801, {
		code = slot1
	})
end

function InviteCodeController.handle19801(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(InviteCodeEvent.BindCode_Invite_Event, slot1)
end

function InviteCodeController.sender19804(slot0)
	slot0:SendProtocal(19804, {})
end

function InviteCodeController.handle19804(slot0, slot1)
	slot0.model:setInviteCodeTeskData(slot1.list)
	GlobalEvent:getInstance():Fire(InviteCodeEvent.InviteCode_My_Event)
end

function InviteCodeController.sender19805(slot0, slot1)
	slot0:SendProtocal(19805, {
		id = slot1
	})
end

function InviteCodeController.handle19805(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0.model:setUpdataInviteCodeTeskData(slot1)
		GlobalEvent:getInstance():Fire(InviteCodeEvent.InviteCode_My_Event)
	end
end

function InviteCodeController.sender19802(slot0)
	slot0:SendProtocal(19802, {})
end

function InviteCodeController.handle19802(slot0, slot1)
	slot0.model:setAlreadyFriendData(slot1.list)
	GlobalEvent:getInstance():Fire(InviteCodeEvent.InviteCode_BindRole_Event)
end

function InviteCodeController.handle19803(slot0, slot1)
	slot0.model:setUpdataAlreadyFriendData(slot1)
	GlobalEvent:getInstance():Fire(InviteCodeEvent.InviteCode_BindRole_Updata_Event)
end

function InviteCodeController.sender19807(slot0)
	slot0:SendProtocal(19807, {})
end

function InviteCodeController.handle19807(slot0, slot1)
	slot0.model:addFriendChatData(slot1)
end

function InviteCodeController.sender19811(slot0)
	slot0:SendProtocal(19811, {})
end

function InviteCodeController.handle19811(slot0, slot1)
	slot0.model:setReturnReawrdList(slot1)
	GlobalEvent:getInstance():Fire(InviteCodeEvent.Return_InviteCode_Event)
end

function InviteCodeController.sender19812(slot0, slot1)
	slot0:SendProtocal(19812, {
		id = slot1
	})
end

function InviteCodeController.handle19812(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0.model:setUpdataReturnReawrdList(slot1)
		GlobalEvent:getInstance():Fire(InviteCodeEvent.Return_InviteCode_Event)
	end
end

function InviteCodeController.sender10929(slot0)
	slot0:SendProtocal(10929)
end

function InviteCodeController.handle10929(slot0, slot1)
	message(slot1.msg)
end

function InviteCodeController.handle10930(slot0, slot1)
	slot0.model:setOpenServerTime(slot1)
end

function InviteCodeController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
