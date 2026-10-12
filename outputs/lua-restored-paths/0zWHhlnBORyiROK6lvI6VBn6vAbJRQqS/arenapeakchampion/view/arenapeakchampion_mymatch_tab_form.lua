ArenapeakchampionMymatchTabForm = class("ArenapeakchampionMymatchTabForm", function ()
	return ccui.Widget:create()
end)
slot1 = ArenapeakchampionController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
slot4 = table.sort

function ArenapeakchampionMymatchTabForm.ctor(slot0, slot1)
	slot0.parent = slot1
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ArenapeakchampionMymatchTabForm.config(slot0)
end

function ArenapeakchampionMymatchTabForm.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenapeakchampion/arenapeakchampion_mymatch_tab_form"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.empty_panel = slot0.root_wnd:getChildByName("empty_panel")
	slot0.centre_img = slot0.container:getChildByName("bg"):getChildByName("centre_img")
	slot0.vs_img = slot0.container:getChildByName("vs_img")

	loadSpriteTexture(slot0.centre_img, PathTool.getPlistImgForDownLoad("bigbg/arenapeakchampion", "arenapeakchampion_guessing_centre", false), LOADTEXT_TYPE)

	slot0.centre_panel = slot0.container:getChildByName("centre_panel")
	slot0.win_img = slot0.centre_panel:getChildByName("win_img")
	slot0.left_fight_label = CommonNum.new(20, slot0.centre_panel:getChildByName("left_power_click"), 0, -2, cc.p(0.5, 0.5))

	slot0.left_fight_label:setPosition(103, 28)

	slot0.left_play_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.left_play_head:setHeadLayerScale(0.9)
	slot0.left_play_head:setLev(99)
	slot0.centre_panel:getChildByName("left_play_node"):addChild(slot0.left_play_head)

	slot0.right_fight_label = CommonNum.new(20, slot0.centre_panel:getChildByName("right_power_click"), 0, -2, cc.p(0.5, 0.5))

	slot0.right_fight_label:setPosition(103, 28)

	slot0.right_play_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.right_play_head:setHeadLayerScale(0.9)
	slot0.right_play_head:setLev(99)
	slot0.centre_panel:getChildByName("right_play_node"):addChild(slot0.right_play_head)

	slot0.left_name = slot0.centre_panel:getChildByName("left_name")
	slot0.left_srv_name = slot0.centre_panel:getChildByName("left_srv_name")
	slot0.right_name = slot0.centre_panel:getChildByName("right_name")
	slot0.right_srv_name = slot0.centre_panel:getChildByName("right_srv_name")
	slot0.time_val = slot0.centre_panel:getChildByName("time_val")
	slot0.match_value = createRichLabel(22, cc.c4b(255, 215, 107, 255), cc.p(0.5, 0.5), cc.p(305, 327), nil, nil, 1000)

	slot0.centre_panel:addChild(slot0.match_value)

	slot0.fight_btn = slot0.centre_panel:getChildByName("fight_btn")

	slot0.fight_btn:getChildByName("label"):setString(TI18N("观战"))

	slot0.from_btn = slot0.centre_panel:getChildByName("from_btn")

	slot0.from_btn:getChildByName("label"):setString(TI18N("调整布阵"))

	slot0.scroll_container = slot0.container:getChildByName("scroll_container")
end

function ArenapeakchampionMymatchTabForm.registerEvents(slot0)
	registerButtonEventListener(slot0.fight_btn, function ()
		uv0:onClickFightBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.from_btn, function ()
		uv0:onClickFromBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	if slot0.arenapeakchampion_my_match_info_event == nil then
		slot0.arenapeakchampion_my_match_info_event = GlobalEvent:getInstance():Bind(ArenapeakchampionEvent.ARENAPEAKCHAMPION_MY_MATCH_INFO_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:setData(slot0)
		end)
	end
end

function ArenapeakchampionMymatchTabForm.onClickFromBtn(slot0)
	HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.ArenapeakchampionDef, {}, HeroConst.FormShowType.eFormSave)
end

function ArenapeakchampionMymatchTabForm.onClickFightBtn(slot0)
	if not slot0.scdata then
		return
	end

	uv0:openLookFightVedioPanel(slot0.scdata)
end

function ArenapeakchampionMymatchTabForm.setData(slot0, slot1)
	slot0.scdata = slot1

	if slot1.step == 0 then
		slot0.container:setVisible(false)
		slot0.empty_panel:setVisible(true)
		slot0:showEmptyInfo()

		if slot0.parent then
			slot0.parent:setTabBtnVisible(false)
		end

		return
	end

	slot0.container:setVisible(true)
	slot0.empty_panel:setVisible(false)
	slot0:updateCentrePanel()

	slot0.show_list = uv0:getSecondData(slot1, nil, 3).arena_replay_infos or {}

	uv1(slot0.show_list, function (slot0, slot1)
		return slot0.order < slot1.order
	end)
	slot0:updateList()
end

function ArenapeakchampionMymatchTabForm.showEmptyInfo(slot0)
	commonShowEmptyIcon(slot0.empty_panel, true, {
		text = TI18N("")
	})

	slot0.fuse_btn_label = createRichLabel(26, cc.c4b(100, 50, 35, 255), cc.p(0.5, 1), cc.p(360, 555), nil, nil, 550)

	slot0.fuse_btn_label:setString("您未能参加本次冠军赛可<div fontColor=#1a9222 href=xxx>前往竞猜</div>界面参与竞猜")
	slot0.empty_panel:addChild(slot0.fuse_btn_label)
	slot0.fuse_btn_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		uv0:openArenapeakchampionGuessingWindow(true)
	end, {
		"click",
		"href"
	})
end

function ArenapeakchampionMymatchTabForm.updateCentrePanel(slot0)
	if not slot0.scdata then
		return
	end

	slot0:setHeadInfo(slot0.left_play_head, slot0.scdata.a_lev, slot0.scdata.a_face, slot0.scdata.a_avatar_id, slot0.scdata.a_face_file, slot0.scdata.a_face_update_time)
	slot0:setHeadInfo(slot0.right_play_head, slot0.scdata.b_lev, slot0.scdata.b_face, slot0.scdata.b_avatar_id, slot0.scdata.b_face_file, slot0.scdata.b_face_update_time)
	slot0.left_name:setString(slot0.scdata.a_name)
	slot0.right_name:setString(slot0.scdata.b_name)

	if getServerName(slot0.scdata.a_srv_id) == "" then
		slot1 = TI18N("异域")
	end

	slot0.left_srv_name:setString(uv0("[%s]", slot1))

	if getServerName(slot0.scdata.b_srv_id) == "" then
		slot1 = TI18N("异域")
	end

	slot0.right_srv_name:setString(uv0("[%s]", slot1))
	slot0.left_fight_label:setNum(slot0.scdata.a_power)
	slot0.right_fight_label:setNum(slot0.scdata.b_power)

	if slot0.scdata.ret == 0 then
		slot0.win_img:setVisible(false)

		if uv1:getMainData() and slot2.round_status == 2 then
			slot0.fight_btn:setVisible(false)
			slot0.vs_img:setVisible(true)
		else
			slot0.fight_btn:loadTexture(PathTool.getResFrame("arenapeakchampion", "arenapeakchampion_guessing_19", false, "arenapeak_guessing"), LOADTEXT_TYPE_PLIST)
			slot0.fight_btn:getChildByName("label"):setString(TI18N("观战"))
			slot0.fight_btn:setVisible(true)
			slot0.vs_img:setVisible(false)
		end
	else
		slot0.fight_btn:loadTexture(PathTool.getResFrame("arenapeakchampion", "arenapeakchampion_guessing_19_1", false, "arenapeak_guessing"), LOADTEXT_TYPE_PLIST)
		slot0.fight_btn:getChildByName("label"):setString(TI18N("查看"))
		slot0.vs_img:setVisible(false)
		slot0.fight_btn:setVisible(true)
		slot0.win_img:setVisible(true)

		if slot0.scdata.ret == 1 then
			slot0.win_img:setPositionX(60)
		else
			slot0.win_img:setPositionX(564)
		end
	end

	slot2, slot3 = uv1:getMacthText(slot0.scdata.step, slot0.scdata.round)

	slot0.match_value:setString(slot2 or "")
end

function ArenapeakchampionMymatchTabForm.setHeadInfo(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot1:setHeadRes(slot3 or 1001, false, LOADTEXT_TYPE, slot5, slot6)
	slot1:setLev(slot2 or 1)

	if slot4 and slot1.record_res_bid == nil or slot1.record_res_bid ~= slot4 then
		slot1.record_res_bid = slot4

		if Config.AvatarData.data_avatar[slot4] then
			slot1:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot7.res_id or 1), false, false), nil, false, slot7.offy)
		end
	end
end

function ArenapeakchampionMymatchTabForm.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 606,
			item_height = 280,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			text = TI18N("暂无数据")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end

	slot0.item_scrollview:reloadData()
end

function ArenapeakchampionMymatchTabForm.createNewCell(slot0, slot1, slot2)
	return ArenapeakchampionFightInfoItem.new(slot1, slot2)
end

function ArenapeakchampionMymatchTabForm.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenapeakchampionMymatchTabForm.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	if slot2 == 3 then
		slot1:setData(slot3, false, true)
	else
		slot1:setData(slot3)
	end
end

function ArenapeakchampionMymatchTabForm.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 and not slot0.is_init then
		slot0.is_init = true

		uv0:sender27702()
	end
end

function ArenapeakchampionMymatchTabForm.DeleteMe(slot0)
	if slot0.arenapeakchampion_my_match_info_event then
		GlobalEvent:getInstance():UnBind(slot0.arenapeakchampion_my_match_info_event)

		slot0.arenapeakchampion_my_match_info_event = nil
	end

	if slot0.left_fight_label then
		slot0.left_fight_label:DeleteMe()

		slot0.left_fight_label = nil
	end

	if slot0.right_fight_label then
		slot0.right_fight_label:DeleteMe()

		slot0.right_fight_label = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil
end
