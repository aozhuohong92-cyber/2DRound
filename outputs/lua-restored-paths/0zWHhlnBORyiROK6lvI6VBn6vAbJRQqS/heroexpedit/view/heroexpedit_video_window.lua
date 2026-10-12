HeroexpeditVideoWindow = HeroexpeditVideoWindow or BaseClass(BaseView)
slot0 = HeroExpeditController:getInstance()
slot1 = Config.ExpeditionData.data_sign_info

function HeroexpeditVideoWindow.__init(slot0)
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
end

function HeroexpeditVideoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("main_panel")

	slot2:getChildByName("win_title"):setString(TI18N("录像列表"))
	slot2:getChildByName("centre_label"):setVisible(false)

	slot0.left_name = slot2:getChildByName("left_label")

	slot0.left_name:setString("")

	slot0.right_name = slot2:getChildByName("right_label")

	slot0.right_name:setString("")

	slot0.scroll_container = slot2:getChildByName("scroll_container")
	slot0.close_btn = slot2:getChildByName("close_btn")

	slot0:creatVideoItemList()
end

function HeroexpeditVideoWindow.creatVideoItemList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 628,
			item_height = 335,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end
end

function HeroexpeditVideoWindow.createNewCell(slot0, slot1, slot2)
	return HeroexpeditVideoItem.new()
end

function HeroexpeditVideoWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function HeroexpeditVideoWindow.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function HeroexpeditVideoWindow.setVideoData(slot0, slot1)
	if slot0.item_scrollview then
		slot0.show_list = {}

		if next(slot1.replay_infos) ~= nil then
			for slot6, slot7 in pairs(slot1.replay_infos) do
				if uv0:getModel():getDifferentChoose() == slot7.difficulty then
					table.insert(slot0.show_list, slot7)
				end
			end

			if next(slot0.show_list) ~= nil then
				table.sort(slot0.show_list, function (slot0, slot1)
					return slot1.time < slot0.time
				end)
				slot0.item_scrollview:reloadData()
			else
				commonShowEmptyIcon(slot0.scroll_container, true, {
					text = TI18N("暂无录像，努力通关吧")
				})
			end
		else
			commonShowEmptyIcon(slot0.scroll_container, true, {
				text = TI18N("暂无录像，努力通关吧")
			})
		end
	end
end

function HeroexpeditVideoWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHeroexpeditVideoView(false)
	end, false, 1)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHeroexpeditVideoView(false)
	end, true, 2)
	slot0:addGlobalEvent(HeroExpeditEvent.Expedit_Video_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:setVideoData(slot0)
	end)
end

function HeroexpeditVideoWindow.openRootWnd(slot0, slot1)
	uv0:sender24415(slot1)
end

function HeroexpeditVideoWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openHeroexpeditVideoView(false)
end

HeroexpeditVideoItem = class("HeroexpeditVideoItem", function ()
	return ccui.Widget:create()
end)

function HeroexpeditVideoItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HeroexpeditVideoItem.configUI(slot0)
	slot0:setContentSize(cc.size(628, 335))

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("elitematch/elitematch_fight_vedio_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.left_name = slot0.container:getChildByName("left_name")

	slot0.left_name:setString("")

	slot0.left_team_name = slot0.container:getChildByName("left_team_name")

	slot0.left_team_name:setString("")

	slot0.left_fight_count = slot0.container:getChildByName("left_fight_count")

	slot0.left_fight_count:setString("")

	slot0.right_name = slot0.container:getChildByName("right_name")

	slot0.right_name:setString("")

	slot0.right_team_name = slot0.container:getChildByName("right_team_name")

	slot0.right_team_name:setString("")

	slot0.right_fight_count = slot0.container:getChildByName("right_fight_count")

	slot0.right_fight_count:setString("")

	slot0.play_btn = slot0.container:getChildByName("play_btn")

	slot0.play_btn:setPositionY(167)
	slot0.container:getChildByName("info_btn"):setVisible(false)

	slot0.diff_text = createRichLabel(18, cc.c4b(152, 85, 33, 255), cc.p(0.5, 0.5), cc.p(313, 127), nil, nil, 250)

	slot0.container:addChild(slot0.diff_text)

	slot0.centre_war_name = slot0.container:getChildByName("centre_war_name")

	slot0.centre_war_name:setString("")

	slot0.centre_time = slot0.container:getChildByName("centre_time")

	slot0.centre_time:setString("")

	slot0.result_win = slot0.container:getChildByName("result_win")

	slot0.result_win:setVisible(false)

	slot0.win_posX = slot0.result_win:getPositionX()
	slot0.result_loss = slot0.container:getChildByName("result_loss")

	slot0.result_loss:setVisible(false)

	slot0.loss_posX = slot0.result_loss:getPositionX()

	function slot2(slot0)
		slot1 = {
			pos_list = {},
			hero_item_list = {}
		}

		for slot5 = 1, 9 do
			slot7, slot8 = uv0.container:getChildByName(slot0 .. "hero_bg_" .. slot5):getPosition()
			slot1.pos_list[slot5] = cc.p(slot7, slot8)
		end

		return slot1
	end

	slot0.left_item = slot2("left_")
	slot0.right_item = slot2("right_")
end

slot2 = {
	TI18N("(普通)"),
	TI18N("(困难)"),
	TI18N("(地狱)")
}

function HeroexpeditVideoItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.diff_text:setString(string.format(TI18N("英雄远征%s-%d关"), uv0[slot1.difficulty], uv1[slot1.guard_id].floor))
	slot0.left_name:setString(slot1.a_name)
	slot0.left_fight_count:setString(slot1.a_power)
	slot0.right_name:setString(slot1.b_name)
	slot0.right_fight_count:setString(slot1.b_power)

	if slot1.ret == 1 then
		slot0.result_win:setPositionX(slot0.win_posX)
		slot0.result_loss:setPositionX(slot0.loss_posX)
	elseif slot1.ret == 2 then
		slot0.result_win:setPositionX(slot0.loss_posX)
		slot0.result_loss:setPositionX(slot0.win_posX)
	end

	slot0.result_win:setVisible(true)
	slot0.result_loss:setVisible(true)
	slot0.centre_war_name:setString(slot1.round .. "/20" .. TI18N("回合"))
	slot0.centre_time:setString(TimeTool.getYMDHM(slot1.time))

	slot3 = slot1.rid
	slot4 = slot1.srv_id

	slot0:updateHeroInfo(slot0.left_item, slot1.a_plist, slot1.a_formation_type, slot3, slot4)
	slot0:updateHeroInfo(slot0.right_item, slot1.b_plist, slot1.b_formation_type, slot3, slot4)
end

function HeroexpeditVideoItem.updateHeroInfo(slot0, slot1, slot2, slot3, slot4, slot5)
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

function HeroexpeditVideoItem.register_event(slot0)
	registerButtonEventListener(slot0.play_btn, function ()
		if uv0.data then
			BattleController:getInstance():csRecordBattle(uv0.data.id, uv0.data.srv_id)
		end
	end, true)
end

function HeroexpeditVideoItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
