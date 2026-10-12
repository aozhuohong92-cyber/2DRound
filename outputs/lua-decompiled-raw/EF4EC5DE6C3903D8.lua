ArenateamFightVedioPanel = ArenateamFightVedioPanel or BaseClass(BaseView)
slot0 = ArenateamController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ArenateamFightVedioPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "elitematch/elitematch_fight_vedio_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("vedio", "vedio"),
			type = ResourcesType.plist
		}
	}
	slot0.show_list = {}
end

function ArenateamFightVedioPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("录像列表"))

	slot0.scroll_container = slot0.main_panel:getChildByName("scroll_container")
	slot1 = slot0.scroll_container:getContentSize()

	slot0.scroll_container:setContentSize(cc.size(slot1.width, slot1.height - 26))
	slot0.scroll_container:setPositionY(slot0.scroll_container:getPositionY() - 26)

	slot2 = slot0.main_panel:getChildByName("panel_bg_0")
	slot3 = slot2:getContentSize()

	slot2:setContentSize(cc.size(slot3.width, slot3.height - 26))
	slot2:setPositionY(slot2:getPositionY() - 13)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.left_label = slot0.main_panel:getChildByName("left_label")

	slot0.left_label:setPositionY(882)

	slot0.left_name = createLabel(24, cc.c4b(100, 50, 35, 255), nil, 20.5, 848, "", slot0.main_panel, nil, cc.p(0, 0.5))
	slot0.right_label = slot0.main_panel:getChildByName("right_label")

	slot0.right_label:setPositionY(882)

	slot0.right_name = createLabel(24, cc.c4b(100, 50, 35, 255), nil, 653, 848, "", slot0.main_panel, nil, cc.p(1, 0.5))
	slot0.centre_label = slot0.main_panel:getChildByName("centre_label")
end

function ArenateamFightVedioPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_SINGLE_REPORT_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
end

function ArenateamFightVedioPanel.onClickBtnClose(slot0)
	uv0:openArenateamFightVedioPanel(false)
end

function ArenateamFightVedioPanel.openRootWnd(slot0, slot1)
	if not (slot1 or {}).data then
		return
	end

	slot0.max_action_count = 0

	if Config.CombatTypeData.data_fight_list[BattleConst.Fight_Type.Arean_Team] then
		slot0.max_action_count = slot5.max_action_count
	end

	slot0.data = slot3

	uv0:sender27256(slot3.id)
	slot0.left_label:setString(TI18N("我方队伍名:"))
	slot0.left_name:setString(transformNameByServ(slot3.atk_name, slot3.a_srv_id))
	slot0.right_label:setString(TI18N("敌方队伍名:"))
	slot0.right_name:setString(transformNameByServ(slot3.b_team_name, slot3.b_srv_id))
	slot0.centre_label:setString(uv1("%s:%s", slot3.win_count, slot3.lose_count))
end

function ArenateamFightVedioPanel.setData(slot0, slot1)
	slot0.show_list = slot1.arena_replay_infos

	uv0(slot0.show_list, function (slot0, slot1)
		return slot0.order < slot1.order
	end)
	slot0:updateList()
end

function ArenateamFightVedioPanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 628,
			item_height = 310,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.item_scrollview:reloadData()
end

function ArenateamFightVedioPanel.createNewCell(slot0, slot1, slot2)
	return ArenateamFightVedioItem.new()
end

function ArenateamFightVedioPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenateamFightVedioPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3, slot0.max_action_count, slot0.data)
end

function ArenateamFightVedioPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	GlobalEvent:getInstance():Fire(VedioEvent.OpenCollectViewEvent, false)
	uv0:openArenateamFightVedioPanel(false)
end

ArenateamFightVedioItem = class("ArenateamFightVedioItem", function ()
	return ccui.Widget:create()
end)

function ArenateamFightVedioItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ArenateamFightVedioItem.configUI(slot0)
	slot0.size = cc.size(628, 335)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenateam/arenateam_fight_vedio_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.result_win = slot2:getChildByName("result_win")
	slot0.result_loss = slot2:getChildByName("result_loss")
	slot0.result_win_x = slot0.result_win:getPositionX()
	slot0.result_loss_x = slot0.result_loss:getPositionX()
	slot0.play_btn = slot2:getChildByName("play_btn")
	slot0.info_btn = slot2:getChildByName("info_btn")
	slot0.centre_war_name = slot2:getChildByName("centre_war_name")
	slot0.centre_time = slot2:getChildByName("centre_time")

	function slot3(slot0)
		slot1 = {
			team_name = uv0:getChildByName(slot0 .. "team_name"),
			name = uv0:getChildByName(slot0 .. "name"),
			fight_count = uv0:getChildByName(slot5),
			pos_list = {},
			hero_item_list = {}
		}
		slot5 = slot0 .. "fight_count"

		for slot5 = 1, 9 do
			slot7, slot8 = uv0:getChildByName(slot0 .. "hero_bg_" .. slot5):getPosition()
			slot1.pos_list[slot5] = cc.p(slot7, slot8)
		end

		return slot1
	end

	slot0.left_item = slot3("left_")
	slot0.right_item = slot3("right_")
end

function ArenateamFightVedioItem.register_event(slot0)
	registerButtonEventListener(slot0.play_btn, handler(slot0, slot0.onClickPlayBtn), true, 2)
	registerButtonEventListener(slot0.info_btn, handler(slot0, slot0.onClickInfoBtn), true, 2)
end

function ArenateamFightVedioItem.onClickPlayBtn(slot0)
	if not slot0.data then
		return
	end

	BattleController:getInstance():csRecordBattle(slot0.data.id, slot0.parent_data.a_srv_id)
end

function ArenateamFightVedioItem.onClickInfoBtn(slot0)
	if not slot0.data then
		return
	end

	BattleController:getInstance():openBattleHarmInfoView(true, {
		atk_name = slot0.atk_name or "",
		target_role_name = slot0.def_name or "",
		hurt_statistics = slot0.data.hurt_statistics
	})
end

function ArenateamFightVedioItem.setData(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	if not slot3 then
		return
	end

	slot0.data = slot1
	slot0.parent_data = slot3

	if slot2 < (slot1.round or 1) then
		slot4 = slot2
	end

	slot0.centre_war_name:setString(uv0("%s/%s %s", slot4, slot2, TI18N("回合")))
	slot0.centre_time:setString(TimeTool.getYMDHM(slot1.time))

	if slot1.ret == 1 then
		slot0.result_win:setPositionX(slot0.result_win_x)
		slot0.result_loss:setPositionX(slot0.result_loss_x)
	else
		slot0.result_loss:setPositionX(slot0.result_win_x)
		slot0.result_win:setPositionX(slot0.result_loss_x)
	end

	slot7 = slot1.a_order
	slot8 = ""

	for slot12, slot13 in ipairs(slot3.a_team_members) do
		if slot13.pos == slot7 then
			slot8 = slot13.name
		end
	end

	slot0.atk_name = slot8
	slot20 = slot8
	slot21 = slot1.a_power

	slot0:initItemInfo(slot0.left_item, slot7, slot20, slot21, slot1.a_plist, slot1.a_formation_type, slot1.rid, slot1.srv_id, slot1.a_end_hp)

	slot15 = slot1.b_order
	slot16 = ""

	for slot20, slot21 in ipairs(slot3.b_team_members) do
		if slot21.pos == slot15 then
			slot16 = slot21.name
		end
	end

	slot0.def_name = slot16

	slot0:initItemInfo(slot0.right_item, slot15, slot16, slot1.b_power, slot1.b_plist, slot1.b_formation_type, slot1.b_rid, slot1.b_srv_id, slot1.b_end_hp)
end

function ArenateamFightVedioItem.initItemInfo(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot1.team_name:setString("")
	slot1.name:setString(slot3)
	slot1.fight_count:setString(slot4)
	slot0:updateHeroInfo(slot1, slot5, slot6, slot7, slot8)
end

function ArenateamFightVedioItem.updateHeroInfo(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot1 then
		return
	end

	if Config.FormationData.data_form_data[slot3] then
		slot7 = {
			[slot12.pos] = slot12
		}

		for slot11, slot12 in pairs(slot2) do
			-- Nothing
		end

		for slot11, slot12 in pairs(slot1.hero_item_list) do
			slot12:setVisible(false)
		end

		for slot11, slot12 in ipairs(slot6.pos) do
			slot13 = slot12[1]

			if slot7[slot12[2]] and slot15.ext then
				for slot19, slot20 in ipairs(slot15.ext) do
					if slot20.key == 5 then
						slot15.use_skin = slot20.val
					end
				end
			end

			if slot1.hero_item_list[slot13] == nil then
				slot1.hero_item_list[slot13] = HeroExhibitionItem.new(0.5, false)

				slot0.container:addChild(slot1.hero_item_list[slot13])
			else
				slot1.hero_item_list[slot13]:setVisible(true)
			end

			slot1.hero_item_list[slot13]:setPosition(slot1.pos_list[slot14])

			if slot15 then
				slot1.hero_item_list[slot13]:setData(slot15)
				slot1.hero_item_list[slot13]:addCallBack(function ()
					if uv0 and uv1 then
						ArenaController:getInstance():requestRabotInfo(uv0, uv1, uv2)
					end
				end)
			else
				slot1.hero_item_list[slot13]:setData(nil)
			end
		end
	end
end

function ArenateamFightVedioItem.showProgressbar(slot0, slot1, slot2, slot3)
	if not slot0.container then
		return
	end

	if not slot1.comp_bar then
		slot6 = PathTool.getResFrame("common", "common_90006")
		slot1.camp_bar_record_res = slot6
		slot7, slot1.comp_bar = createLoadingBar(PathTool.getResFrame("common", "common_90005"), slot6, cc.size(180, 20), slot0.container, cc.p(0.5, 0.5), slot1.progressbar_pos.x, slot1.progressbar_pos.y, true, true)
	end

	if not slot1.comp_bar_label then
		slot1.comp_bar_label = createLabel(18, cc.c3b(255, 255, 255), cc.c3b(0, 0, 0), slot4.width / 2, slot4.height / 2, "", slot1.comp_bar, 2, cc.p(0.5, 0.5))
	end

	slot1.comp_bar:setVisible(true)
	slot1.comp_bar:setPercent(slot2)
	slot1.comp_bar_label:setString(slot3)
end

function ArenateamFightVedioItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
