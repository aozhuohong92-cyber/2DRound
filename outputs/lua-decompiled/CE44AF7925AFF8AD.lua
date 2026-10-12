VedioController = VedioController or BaseClass(BaseController)

function VedioController.config(slot0)
	slot0.model = VedioModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function VedioController.getModel(slot0)
	return slot0.model
end

function VedioController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
		end)
	end

	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
		end)
	end
end

function VedioController.registerProtocals(slot0)
	slot0:RegisterProtocal(19901, "handle19901")
	slot0:RegisterProtocal(19902, "handle19902")
	slot0:RegisterProtocal(19903, "handle19903")
	slot0:RegisterProtocal(19904, "handle19904")
	slot0:RegisterProtocal(19905, "handle19905")
	slot0:RegisterProtocal(19906, "handle19906")
	slot0:RegisterProtocal(19907, "handle19907")
	slot0:RegisterProtocal(19908, "handle19908")
end

function VedioController.requestMyVedioByType(slot0, slot1)
	slot0:SendProtocal(19901, {
		type = slot1
	})
end

function VedioController.handle19901(slot0, slot1)
	if slot1 then
		if slot1.type == VedioConst.MyVedio_Type.Myself then
			GlobalEvent:getInstance():Fire(VedioEvent.UpdateMyselfVedioEvent, slot1.replay_list)
		elseif slot1.type == VedioConst.MyVedio_Type.Collect then
			GlobalEvent:getInstance():Fire(VedioEvent.UpdateCollectVedioEvent, slot1.replay_list)
		end
	end
end

function VedioController.requestPublicVedioData(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(19902, {
		type = slot1,
		cond_type = slot2,
		start = slot3,
		num = slot4
	})
end

function VedioController.handle19902(slot0, slot1)
	if slot1 then
		slot0.model:setPublicVedioData(slot1)
		GlobalEvent:getInstance():Fire(VedioEvent.UpdatePublicVedioEvent, slot1.type)
	end
end

function VedioController.requestLikeVedio(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(19903, {
		id = slot1,
		srv_id = slot2,
		combat_type = slot3
	})
end

function VedioController.handle19903(slot0, slot1)
	message(slot1.msg)
end

function VedioController.requestCollectVedio(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.vedioType_flag = slot5

	slot0:SendProtocal(19904, {
		id = slot1,
		type = slot2,
		srv_id = slot3,
		combat_type = slot4
	})
end

function VedioController.handle19904(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 and slot1.type == 1 then
		GlobalEvent:getInstance():Fire(VedioEvent.UpdateVedioDataEvent, slot0.model:updateVedioData(slot0.vedioType_flag, slot1.id, "is_collect", 1))
		GlobalEvent:getInstance():Fire(VedioEvent.CollectSuccessVedioEvent, slot1.id)
	end

	if slot1.type == 0 then
		GlobalEvent:getInstance():Fire(VedioEvent.CancelCollectVedioEvent, slot1.id)
	end
end

function VedioController.requestShareVedio(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(19905, {
		id = slot1,
		channel = slot2,
		srv_id = slot3,
		combat_type = slot4
	})
end

function VedioController.handle19905(slot0, slot1)
	message(slot1.msg)
end

function VedioController.requestTodayLikeNum(slot0)
	slot0:SendProtocal(19906, {})
end

function VedioController.handle19906(slot0, slot1)
	if slot1.like then
		slot0.model:setTodayLikeNum(slot1.like)
		GlobalEvent:getInstance():Fire(VedioEvent.UpdateTodayLikeNum)
	end
end

function VedioController.requestVedioHeroData(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:SendProtocal(19907, {
		replay_id = slot1,
		partner_id = slot2,
		type = slot3,
		srv_id = slot4,
		combat_type = slot5
	})
end

function VedioController.handle19907(slot0, slot1)
	if slot1 then
		slot3 = 1

		if Config.PartnerData.data_partner_base[slot1.bid] then
			slot3 = slot2.camp_type
		end

		slot1.camp_type = slot3
		slot1.ext_data = slot1.ext

		for slot7, slot8 in ipairs(slot1.ext) do
			if slot8.key == 111 then
				slot1.hit_rate = slot8.val
			elseif slot8.key == 112 then
				slot1.dodge_rate = slot8.val
			elseif slot8.key == 117 then
				slot1.tenacity = slot8.val
			elseif slot8.key == 121 then
				slot1.dam = slot8.val
			elseif slot8.key == 122 then
				slot1.res = slot8.val
			elseif slot8.key == 123 then
				slot1.be_cure = slot8.val
			elseif slot8.key == 124 then
				slot1.cure = slot8.val
			elseif slot8.key == 125 then
				slot1.dam_p = slot8.val
			elseif slot8.key == 126 then
				slot1.dam_s = slot8.val
			elseif slot8.key == 127 then
				slot1.res_p = slot8.val
			elseif slot8.key == 128 then
				slot1.res_s = slot8.val
			end
		end

		slot1.holy_eqm = {}

		for slot7, slot8 in ipairs(slot1.artifacts) do
			if slot8.artifact_pos == BackPackConst.item_type.GOD_EARRING + 100 or slot8.artifact_pos == BackPackConst.item_type.GOD_RING + 100 or slot8.artifact_pos == BackPackConst.item_type.GOD_NECKLACE + 100 or slot8.artifact_pos == BackPackConst.item_type.GOD_BANGLE + 100 then
				for slot13, slot14 in ipairs(({
					id = slot8.id,
					base_id = slot8.base_id,
					main_attr = slot8.attr,
					holy_eqm_attr = slot8.extra_attr
				}).holy_eqm_attr) do
					slot14.pos = slot13
				end

				table.insert(slot1.holy_eqm, slot9)
			end
		end

		HeroController:getInstance():openHeroTipsPanel(true, slot1)
	end
end

function VedioController.send19908(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:SendProtocal(19908, {
		replay_id = slot1,
		srv_id = slot2,
		type = slot3,
		channel = slot4,
		hall_srv_id = slot5
	})
end

function VedioController.handle19908(slot0, slot1)
	slot0:openVedioLookPanel(true, slot1)
end

function VedioController.openVedioMainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot2 and SysEnv:getInstance():getBool(SysEnv.keys.video_first_open, true) then
			slot2 = VedioConst.Tab_Index.Newhero
		end

		if not slot0.vedio_main_wnd then
			slot0.vedio_main_wnd = VedioMainWindow.New()
		end

		if slot0.vedio_main_wnd:isOpen() == false then
			slot0.vedio_main_wnd:open(slot2)
		end
	elseif slot0.vedio_main_wnd then
		slot0.vedio_main_wnd:close()

		slot0.vedio_main_wnd = nil
	end
end

function VedioController.openVedioCollectWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.vedio_collect_win then
			slot0.vedio_collect_win = VedioCollectWindow.New()
		end

		if slot0.vedio_collect_win:isOpen() == false then
			slot0.vedio_collect_win:open()
		end
	elseif slot0.vedio_collect_win then
		slot0.vedio_collect_win:close()

		slot0.vedio_collect_win = nil
	end
end

function VedioController.openVedioMyselfWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.vedio_myself_win then
			slot0.vedio_myself_win = VedioMyselfWindow.New()
		end

		if slot0.vedio_myself_win:isOpen() == false then
			slot0.vedio_myself_win:open()
		end
	elseif slot0.vedio_myself_win then
		slot0.vedio_myself_win:close()

		slot0.vedio_myself_win = nil
	end
end

function VedioController.openVedioLookPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.vedio_look_panel then
			slot0.vedio_look_panel = VedioLookPanel.New()
		end

		if slot0.vedio_look_panel:isOpen() == false then
			slot0.vedio_look_panel:open(slot2)
		end
	elseif slot0.vedio_look_panel then
		slot0.vedio_look_panel:close()

		slot0.vedio_look_panel = nil
	end
end

function VedioController.openVedioSharePanel(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot1 == true then
		if not slot0.vedio_share_panel then
			slot0.vedio_share_panel = VedioSharePanel.New()
		end

		if slot0.vedio_share_panel:isOpen() == false then
			slot0.vedio_share_panel:open(slot2, slot3, slot4, slot5, slot6)
		end
	elseif slot0.vedio_share_panel then
		slot0.vedio_share_panel:close()

		slot0.vedio_share_panel = nil
	end
end

function VedioController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
