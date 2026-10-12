HallowsMagicWindow = HallowsMagicWindow or BaseClass(BaseView)
slot0 = HallowsController:getInstance()
slot1 = HallowsController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function HallowsMagicWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "hallows/hallows_magic_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hallows", "hallows"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_81"),
			type = ResourcesType.single
		}
	}
	slot0.magic_status = HallowsConst.Magic_View_Status.Task
	slot0.base_attr_list = {}
	slot0.base_attr_bgs = {}
	slot0.cur_index = 1
	slot0.magic_id_list = {}

	slot0:initSortMagicIdList()
end

function HallowsMagicWindow.initSortMagicIdList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(Config.HallowsData.data_magic) do
		uv1(slot1, {
			id = slot6.id,
			sort = slot6.sort,
			status = uv0:getHallowsMagicStatus(slot6.id)
		})
	end

	function slot6(slot0, slot1)
		if slot0.status ~= slot1.status then
			return slot0.status < slot1.status
		else
			return slot0.sort < slot1.sort
		end
	end

	uv2(slot1, slot6)

	for slot6, slot7 in ipairs(slot1) do
		uv1(slot0.magic_id_list, slot7.id)
	end
end

function HallowsMagicWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_size = slot1:getContentSize()

	slot1:getChildByName("top_bg"):loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_81"), LOADTEXT_TYPE)
	slot1:getChildByName("win_title"):setString(TI18N("神技觉醒"))

	slot0.hallows_name = slot1:getChildByName("title_bg"):getChildByName("hallows_name")
	slot0.left_btn = slot1:getChildByName("left_btn")
	slot0.right_btn = slot1:getChildByName("right_btn")
	slot0.Panel_mask = slot1:getChildByName("Panel_15")

	slot1:getChildByName("lock_title"):setString(TI18N("解锁效果："))

	slot0.task_panel = slot1:getChildByName("task_panel")

	slot0.task_panel:setVisible(false)

	slot0.item_panel = slot1:getChildByName("item_panel")

	slot0.item_panel:setVisible(false)

	slot0.open_panel = slot1:getChildByName("open_panel")

	slot0.open_panel:setVisible(false)
	slot0.task_panel:getChildByName("progress_title"):setString(TI18N("当前进度"))
	UITool.SetLightColor(slot0.task_panel:getChildByName("progress_title"))

	slot0.progress = slot0.task_panel:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.progress_value = slot0.task_panel:getChildByName("progress_value")
	slot0.task_list = slot0.task_panel:getChildByName("task_list")
	slot0.unlock_btn = slot0.item_panel:getChildByName("unlock_btn")

	slot0.unlock_btn:getChildByName("label"):setString(TI18N("解 锁"))

	slot0.goto_btn = slot0.item_panel:getChildByName("goto_btn")

	slot0.goto_btn:setVisible(false)
	slot0.goto_btn:getChildByName("label"):setString(TI18N("前往获取"))

	slot0.item_tips = slot0.item_panel:getChildByName("item_tips")

	slot0.open_panel:getChildByName("open_title"):setString(TI18N("全神技基础属性"))

	slot0.magic_tips = slot0.open_panel:getChildByName("magic_tips")
	slot0.magic_btn = slot0.open_panel:getChildByName("magic_btn")

	slot0.magic_btn:getChildByName("label"):setString(TI18N("幻 化"))

	slot0.cancel_magic_btn = slot0.open_panel:getChildByName("cancel_magic_btn")

	slot0.cancel_magic_btn:getChildByName("label"):setString(TI18N("取消转换"))

	slot8 = "time_txt"
	slot0.time_txt = slot0.open_panel:getChildByName(slot8)
	slot0.base_attr_bgs = {}

	for slot8 = 1, 2 do
		if slot0.open_panel:getChildByName("attr_bg_" .. slot8) then
			uv0(slot0.base_attr_bgs, slot9)
		end
	end
end

function HallowsMagicWindow.createTaskScrollview(slot0)
	if slot0.task_scrollview or not slot0.task_list then
		return
	end

	slot1 = slot0.task_list:getContentSize()
	slot0.task_scrollview = CommonScrollViewLayout.new(slot0.task_list, cc.p(5, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot1.width - 10, slot1.height - 10), {
		start_y = 12,
		item_width = 319,
		start_x = 3,
		space_x = 5,
		row = 0,
		item_height = 135,
		space_y = 6,
		col = 2,
		need_dynamic = true,
		item_class = HallowsMagicTaskItem
	})
end

function HallowsMagicWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0._onClickLeftBtn), false)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0._onClickRightBtn), false)
	registerButtonEventListener(slot0.unlock_btn, handler(slot0, slot0._onClickUnlockBtn), true)
	registerButtonEventListener(slot0.goto_btn, handler(slot0, slot0._onClickGotoBtn), true)
	registerButtonEventListener(slot0.magic_btn, handler(slot0, slot0._onClickMagicBtn), true)
	registerButtonEventListener(slot0.cancel_magic_btn, handler(slot0, slot0._onClickCancelMagicBtn), true)
	slot0:addGlobalEvent(HallowsEvent.UpdateHallowsMagicDataEvent, function (slot0)
		if uv0.magic_config and uv0.magic_config.id == slot0 then
			uv0:setData(uv0.hallows_data, slot0)
		end
	end)
	slot0:addGlobalEvent(HallowsEvent.UpdateHallowsMagicTaskEvent, function ()
		if uv0.magic_status == HallowsConst.Magic_View_Status.Task then
			uv0:showHallowsMagicTaskInfo()
		end
	end)
end

function HallowsMagicWindow._onClickLeftBtn(slot0)
	slot0.cur_index = slot0.cur_index - 1

	if slot0.cur_index < 1 then
		slot0.cur_index = #slot0.magic_id_list
	end

	slot0:setData(slot0.hallows_data, slot0.magic_id_list[slot0.cur_index])
end

function HallowsMagicWindow._onClickRightBtn(slot0)
	slot0.cur_index = slot0.cur_index + 1

	if slot0.cur_index > #slot0.magic_id_list then
		slot0.cur_index = 1
	end

	slot0:setData(slot0.hallows_data, slot0.magic_id_list[slot0.cur_index])
end

function HallowsMagicWindow._onClickUnlockBtn(slot0)
	if slot0.magic_config then
		uv0:send24131(slot0.magic_config.id)
	end
end

function HallowsMagicWindow._onClickGotoBtn(slot0)
	if slot0.magic_config and Config.SourceData.data_source_data[slot0.magic_config.evt_id] then
		if slot0.magic_config.evt_id == 115 and not ElitematchController:getInstance():getModel():checkElitematchIsOpen() then
			return
		end

		BackpackController:getInstance():gotoItemSources(slot1.evt_type, slot1.extend)
		uv0:openHallowsMagicWindow(false)
		uv0:openHallowsMainWindow(false)
	end
end

function HallowsMagicWindow._onClickMagicBtn(slot0)
	if slot0.magic_config and slot0.hallows_data then
		uv0:send24132(slot0.magic_config.id, slot0.hallows_data.id, 1)
	end
end

function HallowsMagicWindow._onClickCancelMagicBtn(slot0)
	if slot0.magic_data then
		uv0:send24132(slot0.magic_data.id, slot0.magic_data.eqm_hallows, 2)
	end
end

function HallowsMagicWindow._onClickCloseBtn(slot0)
	uv0:openHallowsMagicWindow(false)
end

function HallowsMagicWindow.openRootWnd(slot0, slot1, slot2)
	slot0:setData(slot1)

	slot0.default_id = slot2
end

function HallowsMagicWindow.setData(slot0, slot1, slot2)
	slot0.hallows_data = slot1 or {}
	slot0.hallows_vo = slot0.hallows_data.vo
	slot3 = slot2 or slot0:getDefaultChosedMagicId()
	slot0.magic_config = Config.HallowsData.data_magic[slot3]
	slot0.magic_data = uv0:getHallowsMagicDataById(slot3)

	if slot0.hallows_vo and slot0.magic_config then
		slot0:showHallowsMagicBaseInfo()

		if not slot0.magic_data or next(slot0.magic_data) == nil then
			if slot0.magic_config.is_item == 0 then
				slot0.magic_status = HallowsConst.Magic_View_Status.Task
			else
				slot0.magic_status = HallowsConst.Magic_View_Status.Item
			end
		else
			slot0.magic_status = HallowsConst.Magic_View_Status.Open
		end

		slot0.task_panel:setVisible(slot0.magic_status == HallowsConst.Magic_View_Status.Task)
		slot0.item_panel:setVisible(slot0.magic_status == HallowsConst.Magic_View_Status.Item)
		slot0.open_panel:setVisible(slot0.magic_status == HallowsConst.Magic_View_Status.Open)

		if slot0.magic_status == HallowsConst.Magic_View_Status.Task then
			slot0:showHallowsMagicTaskInfo()
		elseif slot0.magic_status == HallowsConst.Magic_View_Status.Item then
			slot0:showHallowsMagicItemInfo()
		elseif slot0.magic_status == HallowsConst.Magic_View_Status.Open then
			slot0:showHallowsMagicOpenInfo()
		end
	end
end

function HallowsMagicWindow.getDefaultChosedMagicId(slot0)
	if slot0.default_id then
		return slot0.default_id
	end

	slot1 = slot0.magic_id_list[1] or 1
	slot2 = 0

	for slot6, slot7 in ipairs(slot0.magic_id_list) do
		slot9 = uv0:getHallowsMagicDataById(slot7)

		if uv0:checkHallowsMagicIsShowRed(slot7) then
			slot1 = slot7

			break
		elseif slot0.hallows_vo.look_id ~= 0 and slot9.eqm_hallows and slot9.eqm_hallows == slot0.hallows_vo.look_id then
			if slot2 < 4 then
				slot1 = slot7
				slot2 = 4
			end
		elseif next(slot9) ~= nil and slot9.eqm_hallows == 0 then
			if slot2 < 3 then
				slot1 = slot7
				slot2 = 3
			end
		elseif next(slot9) ~= nil and slot9.eqm_hallows ~= 0 then
			if slot2 < 2 then
				slot1 = slot7
				slot2 = 2
			end
		elseif slot2 < 1 then
			slot1 = slot7
			slot2 = 1
		end
	end

	for slot6, slot7 in ipairs(slot0.magic_id_list) do
		if slot7 == slot1 then
			slot0.cur_index = slot6
		end
	end

	return slot1
end

function HallowsMagicWindow.showHallowsMagicBaseInfo(slot0)
	if slot0.cur_magic_id and slot0.cur_magic_id == slot0.magic_config.id then
		return
	end

	slot0.cur_magic_id = slot0.magic_config.id

	slot0.hallows_name:setString(slot0.magic_config.name)

	if slot0.hallows_model then
		slot0.hallows_model:clearTracks()
		slot0.hallows_model:removeFromParent()

		slot0.hallows_model = nil
	end

	slot0.hallows_model = createEffectSpine(slot0.magic_config.effect, cc.p(slot0.main_size.width / 2, 135), cc.p(0.5, 0.5), true, PlayerAction.action_2)

	slot0.Panel_mask:addChild(slot0.hallows_model)

	if uv0:checkHallowsMagicIsHave(slot0.magic_config.id) then
		setChildUnEnabled(false, slot0.hallows_model)
		slot0.hallows_model:setAnimation(0, PlayerAction.action_2, true)
	else
		setChildUnEnabled(true, slot0.hallows_model)
		slot0.hallows_model:setAnimation(0, PlayerAction.action_1, true)
	end

	if not slot0.magic_desc then
		slot0.magic_desc = createRichLabel(20, cc.c3b(255, 238, 194), cc.p(0.5, 0.5), cc.p(slot0.main_size.width / 2, 445), 10, nil, 400)

		slot0.main_container:addChild(slot0.magic_desc)
	end

	slot0.magic_desc:setString(slot0.magic_config.desc or "")
end

function HallowsMagicWindow.showHallowsMagicTaskInfo(slot0)
	if not slot0.task_scrollview then
		slot0:createTaskScrollview()
	end

	if slot0.task_scrollview then
		if uv0:getMagicTaskListById(slot0.magic_config.id) then
			slot2 = tableLen(slot1)

			for slot7, slot8 in pairs(slot1) do
				if slot8.finish == 2 then
					slot3 = 0 + 1
				end
			end

			slot0.progress:setPercent(100 * slot3 / slot2)
			slot0.progress_value:setString(slot3 .. "/" .. slot2)
		end

		slot0.task_scrollview:setData(slot1)
	end
end

function HallowsMagicWindow.showHallowsMagicItemInfo(slot0)
	if not slot0.magic_config or not slot0.magic_config.loss[1] then
		return
	end

	if not slot0.magic_item then
		slot0.magic_item = BackPackItem.new(true, true)

		slot0.magic_item:setDefaultTip(true, true)
		slot0.magic_item:setPosition(cc.p(slot0.main_size.width / 2, 230))
		slot0.item_panel:addChild(slot0.magic_item)
	end

	slot1 = slot0.magic_config.loss[1][1]

	slot0.magic_item:setBaseData(slot1)
	slot0.magic_item:setNeedNum(slot0.magic_config.loss[1][2], BackpackController:getInstance():getModel():getItemNumByBid(slot1))

	if slot0.magic_config.is_item == 1 then
		slot0.unlock_btn:setVisible(true)
	elseif slot0.magic_config.is_item == 2 then
		slot0.unlock_btn:setVisible(false)
	end

	if not slot0.magic_config.get_des or slot0.magic_config.get_des == "" then
		slot0.item_tips:setVisible(false)
	else
		slot0.item_tips:setVisible(true)
		slot0.item_tips:setString(slot0.magic_config.get_des)
	end

	if slot0.magic_config.evt_id and slot0.magic_config.evt_id ~= 0 then
		slot0.goto_btn:setVisible(true)
	else
		slot0.goto_btn:setVisible(false)
	end
end

function HallowsMagicWindow.showHallowsMagicOpenInfo(slot0)
	if not slot0.magic_config then
		return
	end

	for slot4, slot5 in pairs(slot0.base_attr_list) do
		slot5:setVisible(false)
	end

	for slot4, slot5 in ipairs(slot0.magic_config.attr) do
		if slot5[1] and slot5[2] then
			slot8 = Config.AttrData.data_key_to_name[slot6]
			slot10 = slot0.base_attr_bgs[slot4]

			if slot0.base_attr_list[slot4] == nil and slot10 then
				slot9 = createRichLabel(24, cc.c4b(100, 50, 35, 255), cc.p(0.5, 0.5), cc.p(130, 19.5), nil, , 380)

				slot10:addChild(slot9)

				slot0.base_attr_list[slot4] = slot9
			end

			slot9:setVisible(true)

			slot11 = PathTool.getAttrIconByStr(slot6)

			if PartnerCalculate.isShowPerByStr(slot6) == true then
				slot7 = slot7 / 10 .. "%"
			end

			slot9:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#023656> %s：</div><div fontcolor=#023656>%s</div>", PathTool.getResFrame("common", slot11), slot8, tostring(slot7)))
		end
	end

	if slot0.magic_data.eqm_hallows ~= 0 then
		if Config.HallowsData.data_base[slot0.magic_data.eqm_hallows] then
			slot0.magic_tips:setString(uv0(TI18N("已转换:%s"), slot1.name))
			slot0.magic_tips:setVisible(true)
		end

		if slot0.magic_data.eqm_hallows == slot0.hallows_data.id then
			slot0.magic_btn:setVisible(false)
			slot0.cancel_magic_btn:setVisible(true)
		else
			slot0.magic_btn:setVisible(true)
			slot0.cancel_magic_btn:setVisible(false)
		end
	else
		slot0.magic_tips:setVisible(false)
		slot0.magic_btn:setVisible(true)
		slot0.cancel_magic_btn:setVisible(false)
	end

	if slot0.magic_data.endtime ~= 0 then
		slot0.time_txt:setVisible(true)

		if slot0.magic_data.endtime - GameNet:getInstance():getTime() < 0 then
			slot2 = 0
		end

		slot0.time_txt:setString(TimeTool.GetTimeFormatDayII(slot2) .. TI18N("后失效"))

		if slot2 <= 86400 then
			slot0:setLessTime(slot2)
		end
	else
		slot0.time_txt:setVisible(false)
	end
end

function HallowsMagicWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_txt) then
		return
	end

	slot0.time_txt:stopAllActions()

	if slot1 > 0 then
		slot0.time_txt:setString(TimeTool.GetTimeFormatDayII(slot1) .. TI18N("后失效"))
		slot0.time_txt:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.time_txt:stopAllActions()
			else
				uv1.time_txt:setString(TimeTool.GetTimeFormatDayII(uv0) .. TI18N("后失效"))
			end
		end))))
	else
		slot0.time_txt:setString(TimeTool.GetTimeFormatDayII(slot1) .. TI18N("后失效"))
	end
end

function HallowsMagicWindow.close_callback(slot0)
	if slot0.task_scrollview then
		slot0.task_scrollview:DeleteMe()

		slot0.task_scrollview = nil
	end

	if slot0.magic_item then
		slot0.magic_item:DeleteMe()

		slot0.magic_item = nil
	end

	if slot0.hallows_model then
		slot0.hallows_model:clearTracks()
		slot0.hallows_model:removeFromParent()

		slot0.hallows_model = nil
	end

	if not tolua.isnull(slot0.time_txt) then
		slot0.time_txt:stopAllActions()
	end

	uv0:openHallowsMagicWindow(false)
end

HallowsMagicTaskItem = class("HallowsMagicTaskItem", function ()
	return ccui.Widget:create()
end)

function HallowsMagicTaskItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HallowsMagicTaskItem.configUI(slot0)
	slot0.size = cc.size(319, 135)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hallows/hallows_magic_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.get_btn = slot2:getChildByName("get_btn")

	slot0.get_btn:getChildByName("label"):setString(TI18N("领取"))

	slot0.goto_btn = slot2:getChildByName("goto_btn")

	slot0.goto_btn:getChildByName("label"):setString(TI18N("前往"))

	slot0.finish_icon = slot2:getChildByName("finish_icon")
	slot0.task_desc = slot2:getChildByName("task_desc")
end

function HallowsMagicTaskItem.register_event(slot0)
	registerButtonEventListener(slot0.get_btn, handler(slot0, slot0._onClickGetBtn), true)
	registerButtonEventListener(slot0.goto_btn, handler(slot0, slot0._onClickGotoBtn), true)
end

function HallowsMagicTaskItem._onClickGetBtn(slot0)
	if slot0.config then
		uv0:send24130(slot0.config.id)
	end
end

function HallowsMagicTaskItem._onClickGotoBtn(slot0)
	if slot0.config then
		TaskController:getInstance():gotoTagertFun(slot0.config.progress[1], slot0.config.extra)
	end
end

function HallowsMagicTaskItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot1 then
		if Config.HallowsData.data_magic_task[slot1.id] then
			slot0.task_desc:setString(uv0("%s(%s/%s)", slot2.desc, slot1.value or 0, slot1.target_val or 0))

			if slot2.items and slot3[1] then
				if not slot0.award_item then
					slot0.award_item = BackPackItem.new(false, true, false, 0.7, false, true)

					slot0.award_item:setPosition(cc.p(62, 53))
					slot0.container:addChild(slot0.award_item)
				end

				slot0.award_item:setBaseData(slot3[1][1], slot3[1][2])
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

function HallowsMagicTaskItem.DeleteMe(slot0)
	if slot0.award_item then
		slot0.award_item:DeleteMe()

		slot0.award_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
