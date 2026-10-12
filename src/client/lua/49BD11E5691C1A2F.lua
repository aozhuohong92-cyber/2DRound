MailController = MailController or BaseClass(BaseController)

function MailController.config(slot0)
	slot0.model = MailModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.is_open = false
end

function MailController.getModel(slot0)
	return slot0.model
end

function MailController.registerEvents(slot0)
end

function MailController.registerProtocals(slot0)
	slot0:RegisterProtocal(10800, "mailListHandler")
	slot0:RegisterProtocal(10801, "getGoodsHandler")
	slot0:RegisterProtocal(10802, "getAllGoodsHandler")
	slot0:RegisterProtocal(10803, "handle10803")
	slot0:RegisterProtocal(10804, "delMailHandler")
	slot0:RegisterProtocal(10805, "readMailHandler")
	slot0:RegisterProtocal(10806, "on10806")
	slot0:RegisterProtocal(10950, "handle10950")
	slot0:RegisterProtocal(10951, "handle10951")
	slot0:RegisterProtocal(10952, "handle10952")
end

function MailController.mailListHandler(slot0, slot1)
	slot0.model:initMailList(slot1.mail)
end

function MailController.handle10950(slot0, slot1)
	slot0.model:initNoticeList(slot1.board_list, slot1.type)
end

function MailController.handle10803(slot0, slot1)
	slot0.model:addMailItem(slot1.mail)
end

function MailController.deletMailSend(slot0, slot1)
	slot0:SendProtocal(10804, {
		ids = slot1
	})
end

function MailController.delMailHandler(slot0, slot1)
	message(slot1.msg)
	slot0.model:delMailItem(slot1.ids)
end

function MailController.read(slot0, slot1, slot2)
	slot0:SendProtocal(10805, {
		id = slot1,
		srv_id = slot2
	})
end

function MailController.readMailHandler(slot0, slot1)
	if slot1.code == 1 then
		slot0.model:readMailItem(slot1)
	end
end

function MailController.getGoods(slot0, slot1, slot2)
	slot0:SendProtocal(10801, {
		id = slot1,
		srv_id = slot2
	})
end

function MailController.getGoodsHandler(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0.model:getMailGood(slot1)
	end
end

function MailController.getAllGoods(slot0)
	slot0:SendProtocal(10802, {})
end

function MailController.getAllGoodsHandler(slot0, slot1)
	message(slot1.msg)

	if slot1.ids == nil or next(slot1.ids) == nil then
		return
	end

	slot0.model:getAllMailGood(slot1.ids)
end

function MailController.getHasReadNonRewardList(slot0)
	return slot0.model:getHasReadNonRewardList()
end

function MailController.sender10950(slot0)
	slot0:SendProtocal(10950, {})
end

function MailController.handle10951(slot0, slot1)
	slot0.model:delNoticeItem(slot1.id)
end

function MailController.readNotice(slot0, slot1)
	slot0:SendProtocal(10952, {
		id = slot1
	})
end

function MailController.handle10952(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0.model:readNoticeItem(slot1.id)
	end
end

function MailController.openMailPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.mail_panel then
			slot0.mail_panel = MailWindow.New()
		end

		slot0.mail_panel:open(slot2)
	elseif slot0.mail_panel then
		slot0.mail_panel:close()

		slot0.mail_panel = nil
	end
end

function MailController.openMailInfo(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.mail_info then
			slot0.mail_info = MailInfoWindow.New()
		end

		if slot0.mail_info:isOpen() == false then
			slot0.mail_info:open(slot2)
		else
			slot0.mail_info:setData(slot2)
		end
	elseif slot0.mail_info then
		slot0.mail_info:close()

		slot0.mail_info = nil
	end
end

function MailController.getMailInfoView(slot0, ...)
	if slot0.mail_info then
		return slot0.mail_info
	end
end

function MailController.getData(slot0)
	return slot0.model
end

function MailController.requireMailItem(slot0, slot1, slot2)
	slot0:SendProtocal(10806, {
		id = slot1,
		srv_id = slot2
	})
end

function MailController.on10806(slot0, slot1)
	if slot1 then
		slot0:openMailInfo(true, slot1)
	end
end
