VedioMyselfWindow = VedioMyselfWindow or BaseClass(BaseView)
slot1 = VedioController:getInstance():getModel()

function VedioMyselfWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "vedio/vedio_collect_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("vedio", "vedio"),
			type = ResourcesType.plist
		}
	}
end

function VedioMyselfWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.share_panel = slot0.root_wnd:getChildByName("share_panel")

	slot0.share_panel:setVisible(false)
	slot0.share_panel:setSwallowTouches(false)

	slot0.share_bg = slot0.share_panel:getChildByName("share_bg")
	slot0.btn_guild = slot0.share_bg:getChildByName("btn_guild")
	slot0.btn_world = slot0.share_bg:getChildByName("btn_world")
	slot0.btn_cross = slot0.share_bg:getChildByName("btn_cross")

	slot0.share_bg:getChildByName("guild_label"):setString(TI18N("分享到公会频道"))
	slot0.share_bg:getChildByName("world_label"):setString(TI18N("分享到世界频道"))
	slot0.share_bg:getChildByName("cross_label"):setString(TI18N("分享到跨服频道"))
	slot1:getChildByName("win_title"):setString(TI18N("个人记录"))

	slot0.num_txt = slot1:getChildByName("num_txt")

	slot0.num_txt:setFontSize(22)
	slot0.num_txt:setString(TI18N("记录自己前30条PVP挑战记录"))

	slot0.no_vedio_image = slot1:getChildByName("no_vedio_image")

	slot0.no_vedio_image:getChildByName("label"):setString(TI18N("暂无个人录像"))

	slot3 = slot1:getChildByName("vedio_list")
	slot0.vedio_scrollview = CommonScrollViewSingleLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 620,
		item_height = 452,
		space_y = 5,
		col = 1,
		need_dynamic = true
	})

	slot0.vedio_scrollview:setSwallowTouches(false)
	slot0.vedio_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.vedio_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.vedio_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function VedioMyselfWindow._createNewCell(slot0)
	slot1 = VedioMainItem.new()

	slot1:addCallBack(handler(slot0, slot0._onClickShareBtn))

	return slot1
end

function VedioMyselfWindow._numberOfCells(slot0)
	if not slot0.data then
		return 0
	end

	return #slot0.data
end

function VedioMyselfWindow._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.data then
		return
	end

	slot1.index = slot2

	if not slot0.data[slot2] then
		return
	end

	slot1:setExtendData({
		is_myself = true
	})
	slot1:setData(slot3, slot2)

	slot0.vedio_cell_index = slot2
end

function VedioMyselfWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openVedioMyselfWindow(false)
	end)
	registerButtonEventListener(slot0.btn_guild, function ()
		if RoleController:getInstance():getRoleVo():isHasGuild() == false then
			message(TI18N("您暂未加入公会"))

			return
		end

		if uv0.replay_id then
			uv1:requestShareVedio(uv0.replay_id, ChatConst.Channel.Gang, uv0.srv_id, uv0.combat_type)
			uv2:updateVedioData(nil, uv0.replay_id, "share", uv0.share_num)
			GlobalEvent:getInstance():Fire(VedioEvent.UpdateVedioDataEvent, uv0:updateVedioDataById(uv0.replay_id, "share", uv0.share_num))
		end

		uv0.replay_id = nil
		uv0.srv_id = nil
		uv0.combat_type = nil

		uv0.share_panel:setVisible(false)
	end, false, 1)
	registerButtonEventListener(slot0.btn_world, function ()
		if uv0.replay_id then
			uv1:requestShareVedio(uv0.replay_id, ChatConst.Channel.World, uv0.srv_id, uv0.combat_type)
			uv2:updateVedioData(nil, uv0.replay_id, "share", uv0.share_num)
			GlobalEvent:getInstance():Fire(VedioEvent.UpdateVedioDataEvent, uv0:updateVedioDataById(uv0.replay_id, "share", uv0.share_num))
		end

		uv0.replay_id = nil
		uv0.srv_id = nil
		uv0.combat_type = nil

		uv0.share_panel:setVisible(false)
	end, false, 1)
	registerButtonEventListener(slot0.btn_cross, function ()
		if RoleController:getInstance():getRoleVo().lev < Config.MiscData.data_const.cross_level.val then
			message(string.format(TI18N("%d级开启跨服频道"), slot0.val))

			return
		end

		if uv0.replay_id then
			uv1:requestShareVedio(uv0.replay_id, ChatConst.Channel.Cross, uv0.srv_id, uv0.combat_type)
			uv2:updateVedioData(nil, uv0.replay_id, "share", uv0.share_num)
			GlobalEvent:getInstance():Fire(VedioEvent.UpdateVedioDataEvent, uv0:updateVedioDataById(uv0.replay_id, "share", uv0.share_num))
		end

		uv0.replay_id = nil
		uv0.srv_id = nil
		uv0.combat_type = nil

		uv0.share_panel:setVisible(false)
	end, false, 1)
	slot0.share_panel:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.share_panel:setVisible(false)
		end
	end)
	slot0:addGlobalEvent(VedioEvent.UpdateMyselfVedioEvent, function (slot0)
		uv0:setData(slot0)
	end)
	slot0:addGlobalEvent(VedioEvent.CollectSuccessVedioEvent, function (slot0)
		if uv0.data then
			uv1:updateVedioData(nil, slot0, "is_collect", 1)
			GlobalEvent:getInstance():Fire(VedioEvent.UpdateVedioDataEvent, uv0:updateVedioDataById(slot0, "is_collect", 1))
		end
	end)
end

function VedioMyselfWindow._onClickShareBtn(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.replay_id = slot2
	slot0.share_num = slot3
	slot0.srv_id = slot4
	slot0.combat_type = slot5

	if slot0.share_panel:convertToNodeSpace(slot1) then
		slot0.share_bg:setPosition(cc.p(slot6.x - 38, slot6.y + 70))
		slot0.share_panel:setVisible(true)
	end
end

function VedioMyselfWindow.updateVedioDataById(slot0, slot1, slot2, slot3)
	if not slot0.data then
		return
	end

	slot4 = {}

	for slot8, slot9 in pairs(slot0.data) do
		if slot9.id == slot1 then
			slot9[slot2] = slot3
			slot4 = slot9
		end
	end

	return slot4
end

function VedioMyselfWindow.openRootWnd(slot0)
	uv0:requestMyVedioByType(VedioConst.MyVedio_Type.Myself)
	GlobalEvent:getInstance():Fire(VedioEvent.OpenCollectViewEvent, true)
end

function VedioMyselfWindow.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		slot0.no_vedio_image:setVisible(true)
	else
		slot0.data = slot1

		slot0.no_vedio_image:setVisible(false)
		slot0.vedio_scrollview:reloadData()
	end
end

function VedioMyselfWindow.close_callback(slot0)
	if slot0.vedio_scrollview then
		slot0.vedio_scrollview:DeleteMe()

		slot0.vedio_scrollview = nil
	end

	GlobalEvent:getInstance():Fire(VedioEvent.OpenCollectViewEvent, false)
	uv0:openVedioMyselfWindow(false)
end
