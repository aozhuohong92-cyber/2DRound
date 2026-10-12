ElitematchFightVedioPanel = ElitematchFightVedioPanel or BaseClass(BaseView)
slot0 = ElitematchController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ElitematchFightVedioPanel.__init(slot0)
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

function ElitematchFightVedioPanel.open_callback(slot0)
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
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.left_label = slot0.main_panel:getChildByName("left_label")
	slot0.right_label = slot0.main_panel:getChildByName("right_label")
	slot0.centre_label = slot0.main_panel:getChildByName("centre_label")
end

function ElitematchFightVedioPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	slot0:addGlobalEvent(ElitematchEvent.Elite_Challenge_Record_Info_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
end

function ElitematchFightVedioPanel.onClickBtnClose(slot0)
	uv0:openElitematchFightVedioPanel(false)
end

function ElitematchFightVedioPanel.openRootWnd(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	slot3 = slot3 or 1

	GlobalEvent:getInstance():Fire(VedioEvent.OpenCollectViewEvent, true)

	slot0.max_action_count = 0

	if Config.CombatTypeData.data_fight_list[slot1.combat_type] then
		slot0.max_action_count = slot5.max_action_count
	end

	slot0.data = slot1

	if slot3 == 1 then
		uv0:sender24931(slot2, slot1.id)

		slot0.fight_type = BattleConst.Fight_Type.EliteMatchWar
	elseif slot3 == 2 then
		CrossarenaController:getInstance():sender25617(slot2, slot1.id)
	elseif slot3 == 3 then
		if slot1.win_count == 0 and slot1.lose_count == 0 then
			commonShowEmptyIcon(slot0.scroll_container, true, {
				text = TI18N("服务器正在获取数据中，请耐心等候~")
			})
		else
			slot0:setData(slot4)
		end
	end

	if getServerName(slot1.srv_id) == "" then
		slot6 = TI18N("异域")
	end

	slot0.left_label:setString(uv1("[%s] %s", slot6, slot1.atk_name))

	if getServerName(slot1.def_srv_id) == "" then
		slot6 = TI18N("异域")
	end

	slot0.right_label:setString(uv1("[%s] %s", slot6, slot1.def_name))
	slot0.centre_label:setString(uv1("%s:%s", slot1.win_count, slot1.lose_count))
end

function ElitematchFightVedioPanel.setData(slot0, slot1)
	slot0.show_list = slot1.arena_replay_infos

	uv0(slot0.show_list, function (slot0, slot1)
		return slot0.order < slot1.order
	end)
	slot0:updateList()
end

function ElitematchFightVedioPanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 628,
			item_height = 435,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.item_scrollview:reloadData()

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			text = TI18N("暂无数据")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end
end

function ElitematchFightVedioPanel.createNewCell(slot0, slot1, slot2)
	return ElitematchFightVedioItem.new(slot1, slot2)
end

function ElitematchFightVedioPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ElitematchFightVedioPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3, slot0.max_action_count, slot0.data, slot0.fight_type)
end

function ElitematchFightVedioPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	GlobalEvent:getInstance():Fire(VedioEvent.OpenCollectViewEvent, false)
	uv0:openElitematchFightVedioPanel(false)
end

ElitematchFightVedioItem = class("ElitematchFightVedioItem", function ()
	return ccui.Widget:create()
end)

function ElitematchFightVedioItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ElitematchFightVedioItem.configUI(slot0)
	slot0.size = cc.size(628, 435)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("elitematch/elitematch_fight_vedio_item"))

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
			fight_count = uv0:getChildByName(slot0 .. "fight_count"),
			tree_lv = uv0:getChildByName(slot0 .. "tree_lv"),
			panel_elfin = uv0:getChildByName(slot5),
			elfin_list = {},
			pos_list = {},
			hero_item_list = {}
		}
		slot5 = slot0 .. "panel_elfin"

		for slot5 = 1, 9 do
			slot7, slot8 = uv0:getChildByName(slot0 .. "hero_bg_" .. slot5):getPosition()
			slot1.pos_list[slot5] = cc.p(slot7, slot8)
		end

		return slot1
	end

	slot0.left_item = slot3("left_")
	slot0.right_item = slot3("right_")
	slot0.left_item.progressbar_pos = cc.p(116.3, 28)
	slot0.right_item.progressbar_pos = cc.p(510.5, 28)
end

function ElitematchFightVedioItem.register_event(slot0)
	registerButtonEventListener(slot0.play_btn, handler(slot0, slot0.onClickPlayBtn), true, 2)
	registerButtonEventListener(slot0.info_btn, handler(slot0, slot0.onClickInfoBtn), true, 2)
end

function ElitematchFightVedioItem.onClickPlayBtn(slot0)
	if not slot0.data then
		return
	end

	if not slot0.data.id or slot0.data.id == 0 then
		message(TI18N("当前战斗无录像"))

		return
	end

	if slot0.data.replay_sid then
		BattleController:getInstance():csRecordBattle(slot0.data.id, slot0.data.replay_sid)
	else
		BattleController:getInstance():csRecordBattle(slot0.data.id, slot0.parent_data.srv_id)
	end
end

function ElitematchFightVedioItem.onClickInfoBtn(slot0)
	if not slot0.data then
		return
	end

	if not slot0.parent_data then
		return
	end

	if slot0.data.ret == 1 then
		-- Nothing
	elseif slot0.data.ret == 2 then
		slot1.result = 2
	end

	BattleController:getInstance():openBattleHarmInfoView(true, {
		atk_name = slot0.parent_data.atk_name,
		target_role_name = slot0.parent_data.def_name,
		hurt_statistics = slot0.data.hurt_statistics,
		replay_id = slot0.data.id,
		result = 1
	}, {
		fight_type = slot0.fight_type
	})
end

function ElitematchFightVedioItem.setData(slot0, slot1, slot2, slot3, slot4)
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
	slot0.fight_type = slot4

	if slot2 < (slot1.round or 1) then
		slot5 = slot2
	end

	slot0.centre_war_name:setString(uv0("%s/%s %s", slot5, slot2, TI18N("回合")))
	slot0.centre_time:setString(TimeTool.getYMDHM(slot1.time))

	if slot1.ret == 1 then
		slot0.result_win:setPositionX(slot0.result_win_x)
		slot0.result_loss:setPositionX(slot0.result_loss_x)
	else
		slot0.result_loss:setPositionX(slot0.result_win_x)
		slot0.result_win:setPositionX(slot0.result_loss_x)
	end

	slot0:initItemInfo(slot0.left_item, slot1.a_order, slot3.atk_name, slot1.a_power, slot1.a_add_power or 0, slot1.a_plist, slot1.a_formation_type, slot1.rid, slot1.srv_id, slot1.a_end_hp, slot1.a_tree_lv or slot1.a_sprite_lev or 0, slot1.a_sprite_data or slot1.a_sprites or {})
	slot0:initItemInfo(slot0.right_item, slot1.b_order, slot3.def_name, slot1.b_power, slot1.b_add_power or 0, slot1.b_plist, slot1.b_formation_type, slot1.b_rid, slot1.b_srv_id, slot1.b_end_hp, slot1.b_tree_lv or slot1.b_sprite_lev or 0, slot1.b_sprite_data or slot1.b_sprites or {})
end

function ElitematchFightVedioItem.initItemInfo(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12)
	slot1.team_name:setString(uv0("[%s%s]", TI18N("队伍"), slot2))
	slot1.name:setString(slot3)
	slot1.fight_count:setString(slot4)
	slot0:showPvpArrowUI(slot1, slot5)
	slot0:updateHeroInfo(slot1, slot6, slot7, slot8, slot9)

	if slot10 then
		slot0:showProgressbar(slot1, slot10, slot10 .. "%")
	end

	slot17 = uv0

	slot1.tree_lv:setString(slot17(TI18N("佩罗娜：%s级"), slot11))

	for slot17 = 1, 4 do
		if not slot1.elfin_list[slot17] then
			slot18 = SkillItem.new(true, true, true, 0.4, true)

			slot18:setPosition(cc.p(22 + (slot17 - 1) * 54, 24))
			slot1.panel_elfin:addChild(slot18)

			slot1.elfin_list[slot17] = slot18
		end

		slot0:setElfinSkillItemData(slot18, slot12, slot17)
	end
end

function ElitematchFightVedioItem.showPvpArrowUI(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if 10 and slot2 > 0 then
		if slot1.pvp_arrow == nil then
			slot1.pvp_arrow = createImage(slot0.container, PathTool.getResFrame("common", "common_1086"), 170, 62, cc.p(0.5, 0.5), true)

			slot1.pvp_arrow:setScale(0.7)
		else
			slot1.pvp_arrow:setVisible(true)
		end

		slot1.pvp_arrow:setPositionX(slot1.fight_count:getPositionX() + slot1.fight_count:getContentSize().width + 15)
	elseif slot1.pvp_arrow then
		slot1.pvp_arrow:setVisible(false)
	end
end

function ElitematchFightVedioItem.getElfinBidByPos(slot0, slot1, slot2)
	if not slot1 or next(slot1) == nil then
		return
	end

	for slot6, slot7 in pairs(slot1) do
		if slot7.pos == slot2 then
			return slot7.item_bid
		end
	end
end

function ElitematchFightVedioItem.setElfinSkillItemData(slot0, slot1, slot2, slot3)
	if slot0:getElfinBidByPos(slot2, slot3) then
		slot1:showLockIcon(false)

		if slot4 == 0 or not Config.SpriteData.data_elfin_data(slot4) then
			slot1:setData()
			slot1:showLevel(false)
		elseif Config.SkillData.data_get_skill(slot5.skill) then
			slot1:showLevel(true)
			slot1:setData(slot6)
		end
	else
		slot1:setData()
		slot1:showLevel(false)
		slot1:showLockIcon(true)
	end
end

function ElitematchFightVedioItem.updateHeroInfo(slot0, slot1, slot2, slot3, slot4, slot5)
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

function ElitematchFightVedioItem.showProgressbar(slot0, slot1, slot2, slot3)
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

function ElitematchFightVedioItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.left_item and slot0.left_item.elfin_list and next(slot0.left_item.elfin_list) ~= nil then
		for slot4, slot5 in pairs(slot0.left_item.elfin_list) do
			slot5:DeleteMe()
		end

		slot0.left_item.elfin_list = {}
	end

	if slot0.right_item and slot0.right_item.elfin_list and next(slot0.right_item.elfin_list) ~= nil then
		for slot4, slot5 in pairs(slot0.right_item.elfin_list) do
			slot5:DeleteMe()
		end

		slot0.right_item.elfin_list = {}
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
