HallowsTaskWindow = HallowsTaskWindow or BaseClass(BaseView)
slot0 = HallowsController:getInstance()
slot1 = HallowsController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = Config.HallowsData.data_info
slot6 = Config.HallowsData.data_skill_up
slot7 = Config.HallowsData.data_task

function HallowsTaskWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hallows", "hallows"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_68", true),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "hallows/hallows_task_window"
	slot0.is_have = false
	slot0.attr_bgs = {}
	slot0.base_attr_list = {}
	slot0.all_hallows_id = {}
	slot0.cur_index = 1
end

function HallowsTaskWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_68", true), LOADTEXT_TYPE)

	slot1 = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.task_panel = slot1:getChildByName("task_panel")
	slot0.attr_panel = slot1:getChildByName("attr_panel")

	slot0.attr_panel:setVisible(false)
	slot0.attr_panel:getChildByName("desc_label"):setString(TI18N("出战界面选择穿戴激活神技技能和主属性"))

	slot0.go_battle_btn = slot0.attr_panel:getChildByName("go_battle_btn")
	slot2 = slot0.go_battle_btn:getChildByName("label")

	slot2:enableOutline(Config.ColorData.data_color4[263], 2)
	slot2:setString(TI18N("去探险"))

	slot0.hallows_name = slot1:getChildByName("title_bg"):getChildByName("hallows_name")
	slot0.explain_btn = slot1:getChildByName("explain_btn")
	slot0.artifact_btn = slot1:getChildByName("artifact_btn")

	slot0.artifact_btn:getChildByName("label"):setString(TI18N("终结技"))

	slot0.touch_layout = slot1:getChildByName("touch_layout")
	slot5 = slot1:getChildByName("progress_container")

	slot5:getChildByName("title"):setString(TI18N("当前进度"))

	slot0.progress = slot5:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)

	slot0.progress_value = slot5:getChildByName("value")
	slot0.left_btn = slot1:getChildByName("left_btn")
	slot0.right_btn = slot1:getChildByName("right_btn")
	slot0.skill_bg = slot1:getChildByName("skill_bg")
	slot9 = "list_view"
	slot0.list_view = slot0.task_panel:getChildByName(slot9)

	for slot9 = 1, 2 do
		slot0.attr_bgs[slot9] = slot0.attr_panel:getChildByName("attr_bg_" .. slot9)
	end

	slot0.item = slot1:getChildByName("item")

	slot0.item:setVisible(false)

	slot0.main_panel = slot1
	slot6 = display.getTop(slot1)

	slot3:setPositionY(slot6 - 113)
	slot0.explain_btn:setPositionY(slot6 - 113)
end

function HallowsTaskWindow.register_event(slot0)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.HallowsData.data_const.game_rule.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
	end, true, 1)
	registerButtonEventListener(slot0.artifact_btn, handler(slot0, slot0._onClickBtnArtifact), true)
	registerButtonEventListener(slot0.go_battle_btn, handler(slot0, slot0._onClickBtnGoBattle), true)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0._onClickBtnLeft))
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0._onClickBtnRight))
	registerButtonEventListener(slot0.touch_layout, handler(slot0, slot0._onClickTouchLayout))
	slot0:addGlobalEvent(HallowsEvent.UpdateHallowsTaskEvent, function ()
		uv0:updateHallowsTaskInfo()
	end)
	slot0:addGlobalEvent(HallowsEvent.HallowsUpdateEvent, function (slot0)
		if slot0 == uv0.hallows_id then
			uv0:refreshView()
		end
	end)
	slot0:addGlobalEvent(HallowsEvent.HallowsActivityEvent, function ()
		if uv0:getCurActivityHallowsId() then
			uv1.hallows_id = slot0

			uv1:initUnlockHallowsData(slot0)
			uv1:refreshView()
		end
	end)
	slot0:addGlobalEvent(HallowsEvent.UndateHallowsInfoEvent, function (slot0)
		if slot0 and uv0.hallows_id ~= slot0 then
			uv0.hallows_id = slot0

			uv0:initUnlockHallowsData(slot0)
			uv0:refreshView()
		end
	end)
end

function HallowsTaskWindow._onClickBtnArtifact(slot0)
	uv0:openHallowsPreviewWindow(true)
end

function HallowsTaskWindow._onClickBtnGoBattle(slot0)
	MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.drama_scene)
	uv0:openHallowsMainWindow(false)
end

function HallowsTaskWindow._onClickBtnLeft(slot0)
	slot0.cur_index = slot0.cur_index - 1

	if slot0.cur_index < 1 then
		slot0.cur_index = #slot0.all_hallows_id
	end

	slot0.hallows_id = slot0.all_hallows_id[slot0.cur_index]

	slot0:refreshView()
end

function HallowsTaskWindow._onClickBtnRight(slot0)
	slot0.cur_index = slot0.cur_index + 1

	if slot0.cur_index > #slot0.all_hallows_id then
		slot0.cur_index = 1
	end

	slot0.hallows_id = slot0.all_hallows_id[slot0.cur_index]

	slot0:refreshView()
end

function HallowsTaskWindow._onClickTouchLayout(slot0)
	if slot0.hallows_id then
		uv1:getInstance():openHallowsTips(true, uv0:makeHighestHallowVo(slot0.hallows_id))
	end
end

function HallowsTaskWindow.initUnlockHallowsData(slot0, slot1)
	slot0.all_hallows_id = {}

	for slot6, slot7 in ipairs(Config.HallowsData.data_base) do
		if uv0:getHallowsById(slot7.id) or slot7.id == uv0:getCurActivityHallowsId() then
			uv1(slot0.all_hallows_id, slot7.id)

			if slot1 and slot7.id == slot1 then
				slot0.cur_index = #slot0.all_hallows_id
			end
		end
	end

	slot0.left_btn:setVisible(#slot0.all_hallows_id > 1)
	slot0.right_btn:setVisible(#slot0.all_hallows_id > 1)
end

function HallowsTaskWindow.openRootWnd(slot0, slot1)
	if slot1 or uv0:getCurActivityHallowsId() then
		slot0.hallows_id = slot1

		slot0:initUnlockHallowsData(slot1)
		slot0:refreshView()
	end
end

function HallowsTaskWindow.refreshView(slot0)
	slot0:updateHallowsBaseInfo()
	slot0:updateHallowsTaskInfo()
	slot0:updateHallowsSkillInfo()
end

function HallowsTaskWindow.updateHallowsBaseInfo(slot0)
	if slot0.hallows_id == nil then
		return
	end

	if Config.HallowsData.data_base[slot0.hallows_id] == nil then
		return
	end

	if slot0.hallows_model_id ~= slot1.effect then
		slot0.hallows_model_id = slot1.effect

		if slot0.hallows_model then
			slot0.hallows_model:removeFromParent()

			slot0.hallows_model = nil
		end

		slot2 = 0.66796875 * display.height
		slot0.hallows_model = createEffectSpine(slot0.hallows_model_id, cc.p(354, 855), cc.p(0, 0), true, PlayerAction.action_1)

		slot0.hallows_model:setScale(slot0.hallows_model:getScale() * 1)
		slot0.hallows_model:setLocalZOrder(-1)
		slot0.main_panel:addChild(slot0.hallows_model)
	end

	slot0.hallows_name:setString(slot1.name)

	if uv0:getHallowsById(slot0.hallows_id) then
		setChildUnEnabled(false, slot0.hallows_model)
		slot0.hallows_model:setAnimation(0, PlayerAction.action_2, true)
	else
		setChildUnEnabled(true, slot0.hallows_model)
		slot0.hallows_model:setAnimation(0, PlayerAction.action_1, true)
	end
end

function HallowsTaskWindow.updateHallowsTaskInfo(slot0)
	if slot0.hallows_id == nil then
		return
	end

	if uv0:getHallowsById(slot0.hallows_id) then
		slot0.attr_panel:setVisible(true)
		slot0.task_panel:setVisible(false)
		slot0.progress:setPercent(100)

		slot4 = TI18N

		slot0.progress_value:setString(slot4("已完成"))

		for slot4, slot5 in pairs(slot0.base_attr_list) do
			slot5:setVisible(false)
		end

		if uv1(getNorKey(slot0.hallows_id, 1)) then
			for slot5, slot6 in ipairs(slot1.attr) do
				if slot5 > 2 then
					break
				end

				slot8 = slot6[2] or 0

				if Config.AttrData.data_key_to_name[slot6[1]] then
					if slot0.base_attr_list[slot5] == nil then
						slot10 = createRichLabel(24, cc.c4b(71, 44, 30, 255), cc.p(0, 0.5), cc.p(20, 28), nil, nil, 380)

						slot10:setPosition(cc.p(20, 20))
						slot0.attr_bgs[slot5]:addChild(slot10)

						slot0.base_attr_list[slot5] = slot10
					end

					slot10:setVisible(true)

					slot11 = PathTool.getAttrIconByStr(slot7)

					if PartnerCalculate.isShowPerByStr(slot7) == true then
						slot8 = slot8 / 10 .. "%"
					end

					slot10:setString(uv2("<img src='%s' scale=1 /> <div fontcolor=#023656> %s%s：</div><div fontcolor=#023656>%s</div>", PathTool.getResFrame("common", slot11), TI18N("全队"), slot9, tostring(slot8)))
				end
			end
		end
	else
		slot0.attr_panel:setVisible(false)
		slot0.task_panel:setVisible(true)

		if uv0:getHallowsTaskList(slot0.hallows_id) then
			slot2 = tableLen(slot1)

			for slot7, slot8 in pairs(slot1) do
				if slot8.finish == 2 then
					slot3 = 0 + 1
				end
			end

			slot0.progress:setPercent(100 * slot3 / slot2)
			slot0.progress_value:setString(slot3 .. "/" .. slot2)
		end

		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_view, nil, nil, nil, slot0.list_view:getContentSize(), {
				start_y = 5,
				item_width = 337,
				start_x = 1.5,
				space_x = 1,
				row = 0,
				item_height = 139,
				space_y = 1,
				col = 2,
				need_dynamic = true,
				item_class = HallowsTaskItem
			})
		end

		slot0.scroll_view:setData(slot1, nil, nil, slot0.item)
	end
end

function HallowsTaskWindow.updateHallowsSkillInfo(slot0)
	if slot0.hallows_id == nil then
		return
	end

	if uv0(getNorKey(slot0.hallows_id, 1)) and slot1.skill_bid ~= 0 then
		slot2 = Config.SkillData.data_get_skill(slot1.skill_bid) or {}

		if not slot0.skill_icon then
			slot0.skill_icon = SkillItem.new(true, true, true, 0.9)

			slot0.skill_icon:setPosition(cc.p(75, 70))
			slot0.skill_bg:addChild(slot0.skill_icon)
		end

		slot0.skill_icon:setData(slot2)
		slot0.skill_icon:setHallowsAtkVal(0)

		if not slot0.skill_name then
			slot0.skill_name = createLabel(24, cc.c4b(255, 238, 194, 255), nil, 135, 92, "", slot0.skill_bg, 1, cc.p(0, 0))
		end

		slot0.skill_name:setString(slot2.name)

		if not slot0.skill_desc then
			slot0.skill_desc = createRichLabel(20, cc.c4b(255, 238, 194, 255), cc.p(0, 1), cc.p(135, 75), 10, nil, 550)

			slot0.skill_bg:addChild(slot0.skill_desc)
		end

		slot0.skill_desc:setString(uv1(slot2.des, slot2.hallows_atk, 0))
	end
end

function HallowsTaskWindow.close_callback(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	if slot0.skill_icon then
		slot0.skill_icon:DeleteMe()

		slot0.skill_icon = nil
	end

	if slot0.hallows_model then
		slot0.hallows_model:clearTracks()
		slot0.hallows_model:removeFromParent()

		slot0.hallows_model = nil
	end

	uv0:openHallowsMainWindow(false)
end

HallowsTaskItem = class("HallowsTaskItem", function ()
	return ccui.Layout:create()
end)

function HallowsTaskItem.ctor(slot0)
	slot0.is_completed = false
end

function HallowsTaskItem.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)

		slot0.get_btn = slot0.root_wnd:getChildByName("get_btn")

		slot0.get_btn:getChildByName("label"):setString(TI18N("领取"))

		slot0.goto_btn = slot0.root_wnd:getChildByName("goto_btn")

		slot0.goto_btn:getChildByName("label"):setString(TI18N("前往"))

		slot0.finish_icon = slot0.root_wnd:getChildByName("finish_icon")
		slot0.backpack_item = BackPackItem.new(false, true, false, 0.7, false, true)

		slot0.backpack_item:setPosition(62, 53)
		slot0.root_wnd:addChild(slot0.backpack_item)

		slot0.task_desc = createRichLabel(22, 175, cc.p(0, 0.5), cc.p(15, 114), nil, nil, 300)

		slot0.root_wnd:addChild(slot0.task_desc)
		slot0:registerEvent()
	end
end

function HallowsTaskItem.registerEvent(slot0)
	slot0.get_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.config then
				uv1:requestSubmitHallowsTask(uv0.data.id)
			end
		end
	end)
	slot0.goto_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.config then
				TaskController:getInstance():gotoTagertFun(uv0.config.progress[1], uv0.config.extra)
			end
		end
	end)
end

function HallowsTaskItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		slot0.get_btn:setName("get_btn_" .. slot1.id)
		slot0.goto_btn:setName("goto_btn_" .. slot1.id)

		if uv0[slot1.id] then
			slot0.task_desc:setString(uv1("%s(%s/%s)", slot2.desc, slot1.value or 0, slot1.target_val or 0))

			if slot2.items and slot3[1] then
				slot0.backpack_item:setBaseData(slot3[1][1], slot3[1][2])
			end

			slot0.config = slot2
		end

		slot0.goto_btn:setVisible(false)
		slot0.get_btn:setVisible(false)
		slot0.finish_icon:setVisible(false)

		if slot1.finish == 0 then
			slot0.goto_btn:setVisible(true)
		elseif slot1.finish == 1 then
			slot0.get_btn:setVisible(true)
			addRedPointToNodeByStatus(slot0.get_btn, true, 5, 5)
		elseif slot1.finish == 2 then
			slot0.finish_icon:setVisible(true)
		end
	end
end

function HallowsTaskItem.suspendAllActions(slot0)
end

function HallowsTaskItem.DeleteMe(slot0)
	if slot0.backpack_item then
		slot0.backpack_item:DeleteMe()
	end

	slot0.backpack_item = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
