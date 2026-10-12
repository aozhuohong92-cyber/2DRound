NewPartnersummonController = NewPartnersummonController or BaseClass(BaseController)

function NewPartnersummonController.config(slot0)
	slot0.model = NewPartnersummonModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function NewPartnersummonController.getModel(slot0)
	return slot0.model
end

function NewPartnersummonController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)
			uv0:send23200()
		end)
	end

	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			if GuideController:getInstance():isInGuide() == false then
				uv0:openNewPartnerSummonWindow(false)
			end

			uv0.req_flag = false
		end)
	end
end

function NewPartnersummonController.registerProtocals(slot0)
	slot0:RegisterProtocal(23200, "handle23200")
	slot0:RegisterProtocal(23201, "handle23201")
	slot0:RegisterProtocal(23202, "handle23202")
end

function NewPartnersummonController.send23200(slot0)
	slot0:SendProtocal(23200)
end

function NewPartnersummonController.handle23200(slot0, slot1)
	slot2 = {}

	if slot1 then
		slot0.model:setSummonItemData(slot1.recruit_list)
		PartnersummonController:getInstance():getModel():setFiveStarHeroIsOut(slot1.must_five_num)
	end
end

function NewPartnersummonController.send23201(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(23201, {
		group_id = slot1,
		times = slot2,
		recruit_type = slot3
	})
end

function NewPartnersummonController.handle23201(slot0, slot1)
	if slot1 then
		report_draw(slot1.group_id, slot1.times)
		PartnersummonController:getInstance():getModel():setFiveStarHeroIsOut(slot1.must_five_num)
		slot0.dispather:Fire(PartnersummonEvent.updateSummonFiveStarEvent)
		slot0.dispather:Fire(PartnersummonEvent.updateSummonItemEvent, slot1)
		PartnersummonController:getInstance():openSummonGainWindow(false)
		PartnersummonController:getInstance():openSummonGainWindow(true, slot1, TRUE)
	end
end

function NewPartnersummonController.send23202(slot0)
	slot0:SendProtocal(23202)
end

function NewPartnersummonController.handle23202(slot0, slot1)
	if slot1 then
		slot0.model:updataSummonItemData(slot1)
		slot0.dispather:Fire(PartnersummonEvent.updateSummonItemEvent, slot1)
	end
end

function NewPartnersummonController.openNewPartnerSummonWindow(slot0, slot1)
	if slot1 == false then
		if slot0.new_partner_summon_window ~= nil then
			slot0.new_partner_summon_window:close()

			slot0.new_partner_summon_window = nil
		end
	else
		if MainSceneController:getInstance():getBuildVo(CenterSceneBuild.summon) and slot2.is_lock then
			message(slot2.desc)

			return
		end

		if slot0.new_partner_summon_window == nil then
			slot0.new_partner_summon_window = NewPartnerSummonWindow.New()
		end

		if slot0.new_partner_summon_window:isOpen() == false then
			slot0.new_partner_summon_window:open()
		end
	end
end

function NewPartnersummonController.getSummonRoot(slot0)
	if slot0.new_partner_summon_window ~= nil then
		return slot0.new_partner_summon_window.root_wnd
	end
end

function NewPartnersummonController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
