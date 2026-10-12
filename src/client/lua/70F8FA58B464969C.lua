LimitExerciseRewardWindow = LimitExerciseRewardWindow or BaseClass(BaseView)
slot0 = LimitExerciseController:getInstance()
slot1 = Config.HolidayBossNewData.data_lev_reward_list
slot2 = Config.HolidayBossNewData.data_lev_reward_list_length
slot3 = string.format
slot4 = table.sort

function LimitExerciseRewardWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "limitexercise/reward_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("limitexercise", "limitexercise"),
			type = ResourcesType.plist
		}
	}
end

function LimitExerciseRewardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("Image_2"):getChildByName("Text_1"):setString(TI18N("奖励详情"))

	slot0.name = slot1:getChildByName("name")

	slot0.name:setString("")

	slot0.btn_left = slot1:getChildByName("btn_left")
	slot0.btn_right = slot1:getChildByName("btn_right")
	slot2 = slot1:getChildByName("Text_3")

	slot2:setString(TI18N("通关boss关卡即可升级结算奖励，完成所有关卡可直接获得\n当期奖励。若未完成所有关卡，奖励会在本期结束时邮件发放"))

	if slot2:getVirtualRenderer() then
		slot3:setLineSpacing(10)
	end

	slot4 = slot1:getChildByName("item_scrollview")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot4, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot4:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 598,
		item_height = 144,
		space_y = 0,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(true)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createAreaChangeCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfAreaChangeCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateAreaChangeCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot0.btn_close = slot1:getChildByName("btn_close")
end

function LimitExerciseRewardWindow.createAreaChangeCell(slot0)
	return LimitExerciseRewardItem.new()
end

function LimitExerciseRewardWindow.numberOfAreaChangeCells(slot0)
	if not slot0.item_list then
		return 0
	end

	return #slot0.item_list
end

function LimitExerciseRewardWindow.updateAreaChangeCellByIndex(slot0, slot1, slot2)
	if not slot0.item_list then
		return
	end

	if not slot0.item_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function LimitExerciseRewardWindow.openRootWnd(slot0)
	slot0.cur_index = uv0:getModel():getCurrentDiff()

	slot0:dropItem(slot0.cur_index)
end

function LimitExerciseRewardWindow.dropItem(slot0, slot1)
	if (slot1 or 1) >= uv0 + 1 then
		slot0.cur_index = uv0

		message(TI18N("已经是最大等级啦~~~~"))

		return
	end

	if slot1 <= 0 then
		slot0.cur_index = 1

		message(TI18N("已经是最小等级啦~~~~"))

		return
	end

	slot0.name:setString(TI18N("难度 ") .. slot1)

	if uv0 <= slot1 then
		slot1 = uv0
	end

	if slot1 <= 0 then
		slot1 = 1
	end

	if not uv1[slot1] then
		return
	end

	slot0.item_list = {}
	slot0.item_list = uv1[slot1]

	uv2(slot0.item_list, function (slot0, slot1)
		return slot0.order_id < slot1.order_id
	end)
	slot0.item_scrollview:reloadData()
end

function LimitExerciseRewardWindow.show_add(slot0)
	slot0.cur_index = slot0.cur_index + 1

	slot0:dropItem(slot0.cur_index)
end

function LimitExerciseRewardWindow.show_minus(slot0)
	slot0.cur_index = slot0.cur_index - 1

	slot0:dropItem(slot0.cur_index)
end

function LimitExerciseRewardWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openLimitExerciseRewardView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openLimitExerciseRewardView(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_left, function ()
		uv0:show_minus()
	end, true, 1)
	registerButtonEventListener(slot0.btn_right, function ()
		uv0:show_add()
	end, true, 1)
end

function LimitExerciseRewardWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openLimitExerciseRewardView(false)
end

LimitExerciseRewardItem = class("LimitExerciseRewardItem", function ()
	return ccui.Widget:create()
end)

function LimitExerciseRewardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function LimitExerciseRewardItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("limitexercise/reward_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(598, 144))

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.settle_text = slot1:getChildByName("Image_1_0"):getChildByName("Text_2")

	slot0.settle_text:setString("")
	slot1:getChildByName("Image_1"):getChildByName("Text_1"):setString(TI18N("额外可能掉落"))

	slot0.item_1 = slot1:getChildByName("item_1")

	slot0.item_1:setScrollBarEnabled(false)

	slot0.item_2 = slot1:getChildByName("item_2")

	slot0.item_2:setScrollBarEnabled(false)

	slot0.box_spr = slot1:getChildByName("box_spr")
end

function LimitExerciseRewardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	loadSpriteTexture(slot0.box_spr, PathTool.getResFrame("limitexercise", "limitexercise_box" .. (slot1.sort_id or 1)), LOADTEXT_TYPE_PLIST)
	slot0.settle_text:setString(uv0(TI18N("通关第%d关后结算奖励"), slot1.order_id))
	slot0:settleItem(slot1.reward)
	slot0:extraItem(slot1.show_reward)
end

function LimitExerciseRewardItem.settleItem(slot0, slot1)
	slot0.item_settle_list = commonShowSingleRowItemList(slot0.item_1, slot0.item_settle_list, slot1, {
		scale = 0.6,
		max_count = 3,
		is_center = true,
		show_effect_id = 263
	})
end

function LimitExerciseRewardItem.extraItem(slot0, slot1)
	slot0.item_extra_list = commonShowSingleRowItemList(slot0.item_2, slot0.item_extra_list, slot1, {
		scale = 0.6,
		max_count = 2,
		is_center = true,
		show_effect_id = 263
	})
end

function LimitExerciseRewardItem.register_event(slot0)
end

function LimitExerciseRewardItem.DeleteMe(slot0)
	if slot0.item_settle_list then
		for slot4, slot5 in pairs(slot0.item_settle_list) do
			slot5:DeleteMe()
		end

		slot0.item_settle_list = nil
	end

	if slot0.item_extra_list then
		for slot4, slot5 in pairs(slot0.item_extra_list) do
			slot5:DeleteMe()
		end

		slot0.item_extra_list = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
