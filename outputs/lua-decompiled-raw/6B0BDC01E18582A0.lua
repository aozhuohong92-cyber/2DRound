CrossshowMainWindow = CrossshowMainWindow or BaseClass(BaseView)
slot1 = CrossshowController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert

function CrossshowMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("crossshow", "crossshow"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/crossshow", "crossshow_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "crossshow/crossshow_main_window"
	slot0.cross_name_list = {}
end

function CrossshowMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/crossshow", "crossshow_bg", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.container_size = slot0.main_container:getContentSize()
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.top_panel = slot0.main_container:getChildByName("top_panel")
	slot0.title_name = slot0.top_panel:getChildByName("title_name")

	slot0.title_name:setString(TI18N("跨服时空"))
	UITool.SetTitleColor(slot0.title_name)

	slot0.lay_scrollview = slot0.main_container:getChildByName("lay_scrollview")
	slot0.bottom_panel = slot0.main_container:getChildByName("bottom_panel")
	slot0.icon_scrollview = slot0.bottom_panel:getChildByName("icon_scrollview")

	slot0.bottom_panel:getChildByName("label_cross"):setString(TI18N("当前跨服玩法"))

	slot2 = slot0.bottom_panel:getChildByName("label_tips")

	slot2:setString(TI18N("跨服时空每隔一段时间会重组"))
	slot2:setTextColor(cc.c4b(71, 44, 30, 255))

	slot0.rule_btn = slot0.main_container:getChildByName("rule_btn")
	slot0.rule_btn_label = slot0.rule_btn:getChildByName("label")

	slot0.rule_btn_label:setString(TI18N("规则说明"))
	UITool.SetTitleColor(slot0.rule_btn_label)

	slot0.rank_btn = slot0.main_container:getChildByName("rank_btn")
	slot0.rank_btn_label = slot0.rank_btn:getChildByName("label")

	slot0.rank_btn_label:setString(TI18N("排行榜"))
	UITool.SetTitleColor(slot0.rank_btn_label)
	slot0:adaptationScreen()
end

function CrossshowMainWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.main_container)
	slot2 = display.getBottom(slot0.main_container)
	slot3 = display.getLeft(slot0.main_container)
	slot4 = display.getRight(slot0.main_container)

	slot0.top_panel:setPositionY(slot1 - (slot0.container_size.height - slot0.top_panel:getPositionY()))

	slot6 = slot0.bottom_panel:getPositionY()

	slot0.bottom_panel:setPositionY(slot2 + slot6)
	slot0.close_btn:setPositionY(slot2 + slot0.close_btn:getPositionY())

	slot0.scrollview_y = slot2 + slot6 + slot0.bottom_panel:getContentSize().height
	slot0.scrollview_height = slot1 - MainuiController:getInstance():getMainUi():getTopViewHeight() - slot0.scrollview_y + 58
end

function CrossshowMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.rank_btn, handler(slot0, slot0.onClickRankBtn), true, 1)
	registerButtonEventListener(slot0.rule_btn, function (slot0, slot1, slot2)
		if Config.CrossShowData.data_const.game_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true, 2)
	slot0:addGlobalEvent(CrossshowEvent.Get_Cross_Show_Info_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
end

function CrossshowMainWindow.onClickCloseBtn(slot0)
	uv0:openCrossshowMainWindow(false)
end

function CrossshowMainWindow.onClickRankBtn(slot0)
	RankController:getInstance():openMainView(true, RankConstant.MainTabType.CrossRank)
end

function CrossshowMainWindow.openRootWnd(slot0)
	slot0.world_lev = RoleController:getInstance():getModel():getWorldLev() or 0
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	if slot0.role_vo then
		slot0.role_lev = slot0.role_vo.lev or 0
	else
		slot0.role_lev = 0
	end

	uv0:sender22150()
	slot0:addEffect()
end

function CrossshowMainWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot1.srv_list) do
		slot8, slot9 = getServerIndex(slot7.srv_id)
		slot10 = {
			sort_index = 1,
			srv_name = TI18N("异域"),
			srv_index = tonumber(slot8)
		}

		if slot8 == 0 then
			-- Nothing
		elseif slot9 then
			slot10.sort_index = 0
			slot10.srv_name = uv0(TI18N("本服%s服"), slot8)
		else
			slot10.sort_index = 1
			slot10.srv_name = uv0(TI18N("%s服"), slot8)
		end

		if slot10.srv_index == nil then
			slot10.srv_index = 0
		end

		slot10.world_name = uv0(TI18N("世界等级%s级"), slot7.world_lev)
		slot2[slot6] = slot10
	end

	uv1(slot2, SortTools.tableLowerSorter({
		"sort_index",
		"srv_index"
	}))

	slot0.show_list = {}

	for slot8 = 1, math.ceil(#slot2 / 2) do
		uv2(slot0.show_list, {
			left_data = slot2[slot8 * 2 - 1],
			right_data = slot2[slot8 * 2]
		})
	end

	if #slot0.show_list == 0 then
		slot0:showNoInfo()
	else
		slot0:updateNameList()
	end

	slot0:initCrossInfo()
end

function CrossshowMainWindow.addEffect(slot0)
	slot0.size = slot0.main_container:getSize()

	if slot0.scene_effect_1 == nil then
		slot0.scene_effect_1 = createEffectSpine(PathTool.getEffectRes(305), cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.background:addChild(slot0.scene_effect_1, 1)
	end

	if slot0.scene_effect_2 == nil then
		slot0.scene_effect_2 = createEffectSpine(PathTool.getEffectRes(306), cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.background:addChild(slot0.scene_effect_2, 1)
	end
end

function CrossshowMainWindow.showNoInfo(slot0)
	if not slot0.role_vo then
		return
	end

	if slot0.cross_icon ~= nil then
		return
	end

	slot1 = slot0.lay_scrollview:getContentSize()
	slot2 = slot1.width * 0.5
	slot3 = slot1.height * 0.5 + 200
	slot5 = slot0.lay_scrollview
	slot0.cross_icon = createSprite(PathTool.getResFrame("crossshow", "crossshow_06"), slot2, slot3, slot5, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot0.cross_effect = createEffectSpine(Config.EffectData.data_effect_info[376], cc.p(slot2, slot3), cc.p(0.5, 0.5), true, PlayerAction.action)

	slot5:addChild(slot0.cross_effect, 1)

	slot0.left_level_bg = createImage(slot5, PathTool.getResFrame("crossshow", "crossshow_02"), slot2, slot3 - 120, cc.p(0.5, 0.5), true, nil, true)

	slot0.left_level_bg:setContentSize(cc.size(156, 40))
	slot0.left_level_bg:setCapInsets(cc.rect(14, 20, 2, 0))

	slot8, slot9 = getServerIndex(slot0.role_vo.main_srv_id)
	slot0.left_name = createLabel(22, cc.c4b(124, 215, 93, 255), cc.c4b(0, 0, 0, 255), slot2, slot3 - 120, uv0(TI18N("本服%s服"), slot8), slot5, 2, cc.p(0.5, 0.5))
	slot0.left_world_lev = createLabel(22, cc.c4b(255, 255, 255, 255), cc.c4b(0, 0, 0, 255), slot2, slot3 - 156, uv0(TI18N("世界等级%s级"), slot0.world_lev), slot5, 2, cc.p(0.5, 0.5))
	slot0.cross_show_tips = createLabel(24, cc.c4b(255, 255, 255, 255), cc.c4b(0, 0, 0, 255), slot2, slot3 - 200, TI18N("该服尚未进行跨服分组(πvπ)"), slot5, 2, cc.p(0.5, 0.5))
end

function CrossshowMainWindow.updateNameList(slot0)
	if not slot0.show_list then
		return
	end

	if not slot0.scrollview_y then
		return
	end

	if not slot0.scrollview_height then
		return
	end

	if slot0.list_view == nil then
		slot7 = nil

		if slot0:numberOfCellsName() <= math.floor((slot0.scrollview_height - 135) / (250 + -10)) then
			slot7 = {
				[slot15] = cc.p(cc.size(slot0.lay_scrollview:getContentSize().width, slot0.scrollview_height).width * 0.5, slot6 - (slot6 - (slot5 + slot4) * slot9) * 0.5 - ((slot5 + slot4) * 0.5 + (slot15 - 1) * (slot5 + slot4)))
			}

			for slot15 = 1, slot9 do
			end
		end

		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(slot2.width * 0.5, slot0.scrollview_y), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2, {
			col = 1,
			start_x = 0,
			delay = 1,
			space_x = 0,
			end_y = 0,
			need_dynamic = true,
			start_y = slot3,
			space_y = slot4,
			item_width = slot2.width,
			item_height = slot5,
			position_data_list = slot7
		}, cc.p(0.5, 0))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCellName), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCellsName), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndexName), ScrollViewFuncType.UpdateCellByIndex)

		if slot9 <= slot8 then
			slot0.list_view:setClickEnabled(false)
		end
	end

	slot0.list_view:reloadData()
end

function CrossshowMainWindow.createNewCellName(slot0, slot1, slot2)
	slot3 = ccui.Layout:create()

	slot3:setCascadeOpacityEnabled(true)
	slot3:setTouchEnabled(false)
	slot3:setAnchorPoint(0, 0)
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.left_item = {}
	slot3.right_item = {}
	slot4 = PathTool.getResFrame("crossshow", "crossshow_06")
	slot3.left_item.icon = createSprite(slot4, 146, 164, slot3, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

	slot3.left_item.icon:setScale(0.66)

	slot3.right_item.icon = createSprite(slot4, 463, 133, slot3, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

	slot3.right_item.icon:setScale(0.66)

	slot5 = PathTool.getResFrame("crossshow", "crossshow_02")
	slot3.left_item.level_bg = createImage(slot3, slot5, 146, 76, cc.p(0.5, 0.5), true, nil, true)

	slot3.left_item.level_bg:setContentSize(cc.size(156, 40))
	slot3.left_item.level_bg:setCapInsets(cc.rect(14, 20, 2, 0))

	slot3.right_item.level_bg = createImage(slot3, slot5, 463, 47, cc.p(0.5, 0.5), true, nil, true)

	slot3.right_item.level_bg:setContentSize(cc.size(156, 40))
	slot3.right_item.level_bg:setCapInsets(cc.rect(14, 20, 2, 0))

	slot3.left_item.cross_effect = createEffectSpine(Config.EffectData.data_effect_info[377], cc.p(146, 164), cc.p(0.5, 0.5), true, PlayerAction.action)

	slot3.left_item.cross_effect:setScale(0.66)
	slot3:addChild(slot3.left_item.cross_effect, 1)

	slot3.right_item.cross_effect = createEffectSpine(Config.EffectData.data_effect_info[376], cc.p(463, 133), cc.p(0.5, 0.5), true, PlayerAction.action)

	slot3.right_item.cross_effect:setScale(0.66)
	slot3:addChild(slot3.right_item.cross_effect, 1)

	slot3.line_effect1 = createEffectSpine(Config.EffectData.data_effect_info[378], cc.p(slot1 * 0.5, 150), cc.p(0.5, 0.5), true, PlayerAction.action)

	slot3.line_effect1:setRotation(10)
	slot3:addChild(slot3.line_effect1, 1)

	slot3.line_effect2 = createEffectSpine(Config.EffectData.data_effect_info[378], cc.p(slot1 * 0.5, 24), cc.p(0.5, 0.5), true, PlayerAction.action)

	slot3.line_effect2:setRotation(130)
	slot3.line_effect2:setScaleX(1.3)
	slot3:addChild(slot3.line_effect2, 1)

	slot3.left_item.name = createLabel(22, cc.c4b(255, 230, 206, 255), cc.c4b(0, 0, 0, 255), 146, 76, "", slot3, 2, cc.p(0.5, 0.5))
	slot3.left_item.world_lev = createLabel(22, cc.c4b(255, 230, 206, 255), cc.c4b(0, 0, 0, 255), 146, 40, "", slot3, 2, cc.p(0.5, 0.5))
	slot3.right_item.name = createLabel(22, cc.c4b(255, 230, 206, 255), cc.c4b(0, 0, 0, 255), 463, 47, "", slot3, 2, cc.p(0.5, 0.5))
	slot3.right_item.world_lev = createLabel(22, cc.c4b(255, 230, 206, 255), cc.c4b(0, 0, 0, 255), 463, 11, "", slot3, 2, cc.p(0.5, 0.5))

	function slot3.DeleteMe()
		if uv0.left_item.cross_effect then
			uv0.left_item.cross_effect:clearTracks()
			uv0.left_item.cross_effect:removeFromParent()

			uv0.left_item.cross_effect = nil
		end

		if uv0.left_item.cross_effect then
			uv0.left_item.cross_effect:clearTracks()
			uv0.left_item.cross_effect:removeFromParent()

			uv0.left_item.cross_effect = nil
		end

		if uv0.line_effect1 then
			uv0.line_effect1:clearTracks()
			uv0.line_effect1:removeFromParent()

			uv0.line_effect1 = nil
		end

		if uv0.line_effect2 then
			uv0.line_effect2:clearTracks()
			uv0.line_effect2:removeFromParent()

			uv0.line_effect2 = nil
		end
	end

	return slot3
end

function CrossshowMainWindow.numberOfCellsName(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function CrossshowMainWindow.updateCellByIndexName(slot0, slot1, slot2)
	if slot0.show_list[slot2] then
		if slot3.left_data then
			if slot3.left_data.sort_index == 0 then
				slot1.left_item.name:setTextColor(cc.c4b(124, 215, 93, 255))
			else
				slot1.left_item.name:setTextColor(cc.c4b(255, 230, 206, 255))
			end

			slot1.left_item.name:setString(slot3.left_data.srv_name)
			slot1.left_item.world_lev:setString(slot3.left_data.world_name)
		end

		if slot3.right_data then
			if slot3.right_data.sort_index == 0 then
				slot1.right_item.name:setTextColor(cc.c4b(124, 215, 93, 255))
			else
				slot1.right_item.name:setTextColor(cc.c4b(255, 230, 206, 255))
			end

			slot1.right_item.name:setString(slot3.right_data.srv_name)

			slot7 = slot3.right_data.world_name

			slot1.right_item.world_lev:setString(slot7)

			for slot7, slot8 in pairs(slot1.right_item) do
				slot8:setVisible(true)
			end

			slot1.line_effect1:setVisible(true)
		else
			for slot7, slot8 in pairs(slot1.right_item) do
				slot8:setVisible(false)
			end

			slot1.line_effect1:setVisible(false)
		end

		if slot2 == slot0:numberOfCellsName() then
			slot1.line_effect2:setVisible(false)
		else
			slot1.line_effect2:setVisible(true)
		end
	end
end

function CrossshowMainWindow.initCrossInfo(slot0)
	slot0.cross_list = {}

	if Config.CrossShowData.data_base then
		for slot5, slot6 in pairs(slot1) do
			uv0(slot0.cross_list, slot6)
		end
	end

	uv1(slot0.cross_list, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0:updateCrossList()
end

function CrossshowMainWindow.updateCrossList(slot0)
	if not slot0.cross_list then
		return
	end

	if slot0.cross_list_view == nil then
		slot4 = nil

		if slot0:numberOfCells() <= math.floor(slot0.icon_scrollview:getContentSize().width / 150) then
			slot4 = {
				[slot12] = cc.p(50 + slot2 * 0.5 + (slot12 - 1) * slot2, 120 * 0.5)
			}

			for slot12 = 1, slot6 do
			end
		end

		slot0.cross_list_view = CommonScrollViewSingleLayout.new(slot0.icon_scrollview, cc.p(slot1.width * 0.5, slot1.height * 0.5), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot1, {
			start_y = 0,
			start_x = 0,
			delay = 1,
			space_x = 0,
			item_width = 128,
			space_y = 0,
			col = 1,
			need_dynamic = true,
			item_height = slot3,
			position_data_list = slot4
		}, cc.p(0.5, 0.5))

		slot0.cross_list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.cross_list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.cross_list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.cross_list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)

		if slot6 <= slot5 then
			slot0.cross_list_view:setClickEnabled(false)
		end
	end

	slot0.cross_list_view:reloadData()
end

function CrossshowMainWindow.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Layout:create()

	slot3:setCascadeOpacityEnabled(true)
	slot3:setTouchEnabled(true)
	slot3:setAnchorPoint(0, 0)
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.icon = createSprite(PathTool.getResFrame("common", "common_90083"), slot1 * 0.5, slot2 * 0.5, slot3, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot3.goto_info = createLabel(18, cc.c4b(124, 215, 93, 255), cc.c4b(0, 0, 0, 255), slot1 * 0.5 - 2, 36, "", slot3, 2, cc.p(0.5, 0.5))

	slot3:addTouchEventListener(function (slot0, slot1)
		if uv0.is_lock then
			return
		end

		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv1:onCellTouched(uv0)
		end
	end)

	function slot3.DeleteMe()
		if uv0.item_load ~= nil then
			uv0.item_load:DeleteMe()

			uv0.item_load = nil
		end
	end

	return slot3
end

function CrossshowMainWindow.numberOfCells(slot0)
	return #slot0.cross_list
end

function CrossshowMainWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.cross_list[slot2] then
		slot4, slot5 = slot0:checkIconLockInfo(slot3.open_limit)

		if slot4 then
			slot1.goto_info:disableEffect(cc.LabelEffect.OUTLINE)
			setChildUnEnabled(true, slot1)
			slot1.goto_info:setString(slot5)
		else
			setChildUnEnabled(false, slot1)
			slot1.goto_info:enableOutline(cc.c4b(0, 0, 0, 255), 2)
			slot1.goto_info:setString(TI18N("点击前往"))
		end

		slot1.is_lock = slot4

		if slot1.record_icon_res ~= PathTool.getPlistImgForDownLoad("crossshow/cross_icon", uv0("txt_cn_cross_icon_%s", slot3.icon), false) then
			slot1.record_icon_res = slot7
			slot1.item_load = createResourcesLoad(slot7, ResourcesType.single, function ()
				if not tolua.isnull(uv0.icon) then
					loadSpriteTexture(uv0.icon, uv1, LOADTEXT_TYPE)

					if uv2 then
						setChildUnEnabled(true, uv0)
					end
				end
			end, slot1.item_load)
		end
	end
end

function CrossshowMainWindow.onCellTouched(slot0, slot1)
	slot4, slot5 = slot0:checkIconLockInfo(slot0.cross_list[slot1.index].open_limit)

	if slot4 then
		message(slot5)

		return
	end

	if Config.SourceData.data_source_data[slot3.source_id] then
		BackpackController:getInstance():gotoItemSources(slot6.evt_type, slot6.extend)
	end
end

function CrossshowMainWindow.checkIconLockInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = false
	slot3 = nil

	for slot7, slot8 in ipairs(slot1) do
		if slot8[1] == "world_lev" then
			if slot0.world_lev < slot8[2] then
				slot2 = true
				slot3 = uv0(TI18N("%s世界等级解锁"), slot8[2])

				break
			end
		elseif slot8[1] == "lev" then
			if slot0.role_lev < slot8[2] then
				slot2 = true
				slot3 = uv0(TI18N("%s级解锁"), slot8[2])

				break
			end
		elseif slot8[1] == "guild_war" then
			slot9 = nil
		end
	end

	return slot2, slot3
end

function CrossshowMainWindow.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.cross_list_view then
		slot0.cross_list_view:DeleteMe()

		slot0.cross_list_view = nil
	end

	if slot0.cross_effect then
		slot0.cross_effect:clearTracks()
		slot0.cross_effect:removeFromParent()

		slot0.cross_effect = nil
	end

	if slot0.scene_effect_1 then
		slot0.scene_effect_1:clearTracks()
		slot0.scene_effect_1:removeFromParent()

		slot0.scene_effect_1 = nil
	end

	if slot0.scene_effect_2 then
		slot0.scene_effect_2:clearTracks()
		slot0.scene_effect_2:removeFromParent()

		slot0.scene_effect_2 = nil
	end

	uv0:openCrossshowMainWindow(false)
end
