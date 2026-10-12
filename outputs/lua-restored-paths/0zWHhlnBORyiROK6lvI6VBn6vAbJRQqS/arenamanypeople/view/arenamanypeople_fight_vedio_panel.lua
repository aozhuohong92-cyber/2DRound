ArenaManyPeopleFightVedioPanel = ArenaManyPeopleFightVedioPanel or BaseClass(BaseView)
slot0 = ArenaManyPeopleController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ArenaManyPeopleFightVedioPanel.__init(slot0)
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

function ArenaManyPeopleFightVedioPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("录像列表"))

	slot0.scroll_container = slot0.main_panel:getChildByName("scroll_container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.left_label = slot0.main_panel:getChildByName("left_label")

	slot0.left_label:setTextColor(cc.c4b(36, 144, 3, 255))

	slot0.right_label = slot0.main_panel:getChildByName("right_label")

	slot0.right_label:setTextColor(cc.c4b(217, 80, 20, 255))

	slot0.centre_label = slot0.main_panel:getChildByName("centre_label")
end

function ArenaManyPeopleFightVedioPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	slot0:addGlobalEvent(ArenaManyPeopleEvent.ARENAMANYPOEPLE_SINGLE_REPORT_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
end

function ArenaManyPeopleFightVedioPanel.onClickBtnClose(slot0)
	uv0:openArenaManyPeopleFightVedioPanel(false)
end

function ArenaManyPeopleFightVedioPanel.openRootWnd(slot0, slot1)
	if not (slot1 or {}).data then
		return
	end

	slot0.max_action_count = 0

	if Config.CombatTypeData.data_fight_list[BattleConst.Fight_Type.AreanManyPeople] then
		slot0.max_action_count = slot5.max_action_count
	end

	slot0.data = slot3

	uv0:sender29027(slot3.id)
	slot0.left_label:setString(TI18N("我方队伍"))
	slot0.right_label:setString(TI18N("敌方队伍"))

	slot7 = uv1("%s:%s", slot3.win_count, slot3.lose_count)

	if (slot3.is_atk or 0) == 0 then
		slot7 = uv1("%s:%s", slot3.lose_count, slot3.win_count)
	end

	slot0.centre_label:setString(slot7)
end

function ArenaManyPeopleFightVedioPanel.setData(slot0, slot1)
	slot0.show_list = slot1.replay_infos

	uv0(slot0.show_list, function (slot0, slot1)
		return slot0.order < slot1.order
	end)
	slot0:updateList()
end

function ArenaManyPeopleFightVedioPanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 628,
			item_height = 403,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.item_scrollview:reloadData()
end

function ArenaManyPeopleFightVedioPanel.createNewCell(slot0, slot1, slot2)
	return ArenaManyPeopleFightVedioItem.new()
end

function ArenaManyPeopleFightVedioPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenaManyPeopleFightVedioPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3, slot0.max_action_count, slot0.data)
end

function ArenaManyPeopleFightVedioPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	GlobalEvent:getInstance():Fire(VedioEvent.OpenCollectViewEvent, false)
	uv0:openArenaManyPeopleFightVedioPanel(false)
end

ArenaManyPeopleFightVedioItem = class("ArenaManyPeopleFightVedioItem", function ()
	return ccui.Widget:create()
end)

function ArenaManyPeopleFightVedioItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ArenaManyPeopleFightVedioItem.configUI(slot0)
	slot0.size = cc.size(628, 403)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenamanypeople/amp_fight_vedio_item"))

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
end

function ArenaManyPeopleFightVedioItem.register_event(slot0)
	registerButtonEventListener(slot0.play_btn, handler(slot0, slot0.onClickPlayBtn), true, 2)
	registerButtonEventListener(slot0.info_btn, handler(slot0, slot0.onClickInfoBtn), true, 2)
end

function ArenaManyPeopleFightVedioItem.onClickPlayBtn(slot0)
	if not slot0.data then
		return
	end

	BattleController:getInstance():csRecordBattle(slot0.data.id, slot0.parent_data.a_srv_id)
end

function ArenaManyPeopleFightVedioItem.onClickInfoBtn(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.ret == 1 then
		-- Nothing
	elseif slot0.data.ret == 2 then
		slot1.result = 2
	end

	for slot5 = 1, 2 do
		slot6 = {
			type = slot5,
			partner_hurts = {}
		}

		if slot5 == 1 then
			for slot10, slot11 in ipairs(slot0.data.a_plist) do
				slot11.rid = slot0.data.rid
				slot11.srvid = slot0.data.srv_id
				slot11.dps = slot11.hurt
				slot11.cure = slot11.curt

				uv0(slot6.partner_hurts, slot11)
			end
		else
			for slot10, slot11 in ipairs(slot0.data.b_plist) do
				slot11.rid = slot0.data.b_rid
				slot11.srvid = slot0.data.b_srv_id
				slot11.dps = slot11.hurt
				slot11.cure = slot11.curt

				uv0(slot6.partner_hurts, slot11)
			end
		end

		uv0(slot1.hurt_statistics, slot6)
	end

	BattleController:getInstance():openBattleHarmInfoView(true, {
		atk_name = slot0.atk_name,
		target_role_name = slot0.def_name,
		hurt_statistics = {},
		result = 1
	})
end

function ArenaManyPeopleFightVedioItem.setData(slot0, slot1, slot2, slot3)
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

	if (slot0.parent_data.is_atk or 0) == 1 then
		if slot1.ret == 1 then
			slot0.result_win:setPositionX(slot0.result_win_x)
			slot0.result_loss:setPositionX(slot0.result_loss_x)
		else
			slot0.result_loss:setPositionX(slot0.result_win_x)
			slot0.result_win:setPositionX(slot0.result_loss_x)
		end
	elseif slot1.ret == 1 then
		slot0.result_loss:setPositionX(slot0.result_win_x)
		slot0.result_win:setPositionX(slot0.result_loss_x)
	else
		slot0.result_win:setPositionX(slot0.result_win_x)
		slot0.result_loss:setPositionX(slot0.result_loss_x)
	end

	slot0.atk_name = slot1.a_name

	if slot7 == 1 then
		slot0:initItemInfo(slot0.left_item, slot1.a_order, slot9, slot1.a_power, slot1.a_plist, slot1.a_formation_type, slot1.rid, slot1.srv_id, slot1.a_end_hp, slot1.a_sprite_lev or 0, slot1.a_sprites or {})
	else
		slot0:initItemInfo(slot0.right_item, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17)
	end

	slot0.def_name = slot1.b_name

	if slot7 == 1 then
		slot0:initItemInfo(slot0.right_item, slot1.b_order, slot19, slot1.b_power, slot1.b_plist, slot1.b_formation_type, slot1.b_rid, slot1.b_srv_id, slot1.b_end_hp, slot1.b_sprite_lev or 0, slot1.b_sprites or {})
	else
		slot0:initItemInfo(slot0.left_item, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27)
	end
end

function ArenaManyPeopleFightVedioItem.initItemInfo(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11)
	slot1.team_name:setString("")
	slot1.name:setString(slot3)
	slot1.fight_count:setString(slot4)
	slot0:updateHeroInfo(slot1, slot5, slot6, slot7, slot8)

	slot15 = uv0

	slot1.tree_lv:setString(slot15(TI18N("佩罗娜：%s级"), slot10))

	for slot15 = 1, 4 do
		if not slot1.elfin_list[slot15] then
			slot16 = SkillItem.new(true, true, true, 0.4, true)

			slot16:setPosition(cc.p(22 + (slot15 - 1) * 54, 24))
			slot1.panel_elfin:addChild(slot16)

			slot1.elfin_list[slot15] = slot16
		end

		slot0:setElfinSkillItemData(slot16, slot11, slot15)
	end
end

function ArenaManyPeopleFightVedioItem.getElfinBidByPos(slot0, slot1, slot2)
	if not slot1 or next(slot1) == nil then
		return
	end

	for slot6, slot7 in pairs(slot1) do
		if slot7.pos == slot2 then
			return slot7.item_bid
		end
	end
end

function ArenaManyPeopleFightVedioItem.setElfinSkillItemData(slot0, slot1, slot2, slot3)
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

function ArenaManyPeopleFightVedioItem.updateHeroInfo(slot0, slot1, slot2, slot3, slot4, slot5)
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

function ArenaManyPeopleFightVedioItem.DeleteMe(slot0)
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

	if slot0.left_item and slot0.left_item.hero_item_list and next(slot0.left_item.hero_item_list) ~= nil then
		for slot4, slot5 in pairs(slot0.left_item.hero_item_list) do
			slot5:DeleteMe()
		end

		slot0.left_item.hero_item_list = {}
	end

	if slot0.right_item and slot0.right_item.elfin_list and next(slot0.right_item.elfin_list) ~= nil then
		for slot4, slot5 in pairs(slot0.right_item.elfin_list) do
			slot5:DeleteMe()
		end

		slot0.right_item.elfin_list = {}
	end

	if slot0.right_item and slot0.right_item.hero_item_list and next(slot0.right_item.hero_item_list) ~= nil then
		for slot4, slot5 in pairs(slot0.right_item.hero_item_list) do
			slot5:DeleteMe()
		end

		slot0.right_item.hero_item_list = {}
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
