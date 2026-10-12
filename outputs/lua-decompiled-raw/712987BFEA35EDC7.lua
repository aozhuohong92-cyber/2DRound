ActivitySignWindow = ActivitySignWindow or BaseClass(BaseView)
slot0 = ActivityController:getInstance()

function ActivitySignWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.item_list = {}
	slot0.layout_name = "activity/activity_sign_window"
end

function ActivitySignWindow.open_callback(slot0)
	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setTouchEnabled(true)
	slot0.background:setScale(display.getMaxScale())
	UITool.SetTitleColor(slot0.main_panel:getChildByName("title_container"):getChildByName("title_label"))

	slot0.main_container = slot0.main_panel:getChildByName("main_container")
	slot0.label = createRichLabel(24, 175, cc.p(0, 0.5), cc.p(30, 60), nil, , 500)

	slot0.main_container:addChild(slot0.label)

	slot0.item_container = slot0.main_panel:getChildByName("item_container")
	slot0.item_view = slot0.item_container:getChildByName("item_view")

	slot0.item_view:setScrollBarEnabled(false)
	slot0.item_view:setSwallowTouches(false)

	slot0.ok_btn = slot0.main_panel:getChildByName("ok_btn")
	slot0.cancel_btn = slot0.main_panel:getChildByName("cancel_btn")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")

	if slot0.cancel_btn:getTitleRenderer() ~= nil then
		slot1:enableOutline(Config.ColorData.data_color4[278], 2)
	end

	if slot0.ok_btn:getTitleRenderer() ~= nil then
		slot1:enableOutline(Config.ColorData.data_color4[277], 2)
	end
end

function ActivitySignWindow.openRootWnd(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	if Config.ActivityData.data_sign_info[slot1] == nil then
		return
	end

	slot0.id = slot1
	slot0.time = slot3.time

	slot0.label:setString(slot3.desc)
	slot0:createItemList(slot3.items)
	slot0.cancel_btn:setTitleText(slot3.cancel)
	slot0.ok_btn:setTitleText(slot3.ok)

	if slot2 and slot2.timer then
		slot0:setTimer(slot3)
	end
end

function ActivitySignWindow.createItemList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	if not slot0.item_list then
		return
	end

	if slot0.item_list then
		for slot5, slot6 in ipairs(slot0.item_list) do
			slot6:suspendAllActions()
			slot6:setVisible(false)
		end
	end

	if slot0.item_list == nil then
		return
	end

	slot2 = nil
	slot5 = 0
	slot6 = 2
	slot7 = #slot1
	slot8 = nil
	slot10 = 0
	slot11 = 1
	slot16 = cc.size

	slot0.item_view:setInnerContainerSize(slot16(math.max(slot0.item_view:getContentSize().width, slot7 * BackPackItem.Width * 0.8 + (slot7 - 1) * 6), slot0.item_view:getContentSize().height))

	for slot16, slot17 in ipairs(slot1) do
		slot19 = 1

		if Config.ItemData.data_get_data(slot17) then
			if slot0.item_list[slot11] == nil then
				slot2 = BackPackItem.new(false, true, false, slot3, false, true)

				table.insert(slot0.item_list, slot2)
				slot0.item_view:addChild(slot2)
			end

			slot2:setBaseData(slot18, slot19)
			slot2:setDefaultTip(true, false)
			slot2:setAnchorPoint(cc.p(0.5, 0))
			slot2:setPosition(slot10 + (BackPackItem.Width * slot3 + slot4) * (slot11 - 1) + BackPackItem.Width * slot3 * 0.5, slot6)
			slot2:setVisible(true)

			slot11 = slot11 + 1
		end
	end
end

function ActivitySignWindow.setTimer(slot0)
	slot1 = Config.ActivityData.data_sign_info[slot0.id]

	if slot0.time == nil or slot0.time < 1 then
		return
	end

	if slot0.timer_id then
		GlobalTimeTicket:getInstance():remove(slot0.timer_id)
	end

	slot0.timer_id = GlobalTimeTicket:getInstance():add(function ()
		uv0.time = uv0.time - 1

		if uv0.time == 0 then
			uv1:openSignView(false)
		elseif not tolua.isnull(uv0.cancel_btn) then
			uv0.cancel_btn:setTitleText(string.format("%s(%s)", uv2.cancel, uv0.time))
		end
	end, 1, slot0.time)

	slot0.cancel_btn:setTitleText(string.format("%s(%s)", slot1.cancel, slot0.time))
end

function ActivitySignWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openSignView(false)
			end
		end)
	end

	if slot0.cancel_btn then
		slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openSignView(false)
			end
		end)
	end

	if slot0.ok_btn then
		slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:clickHandle()
				uv1:openSignView(false)
			end
		end)
	end
end

function ActivitySignWindow.clickHandle(slot0)
	if slot0.id == ActivitySignType.arena_champion then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.champion_call)
	elseif slot0.id == ActivitySignType.arena_champion_guess then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.champion_call)
	elseif slot0.id == ActivitySignType.godbattle or slot0.id == ActivitySignType.godbattle_sign then
		if GodbattleController:getInstance():getModel():getApplyStatus() == GodBattleConstants.apply_status.un_apply then
			GodbattleController:getInstance():requestApplyGodBattle()
		else
			GodbattleController:getInstance():requestEnterGodBattle()
		end
	elseif slot0.id == ActivitySignType.cross_champion or slot0.id == ActivitySignType.cross_champion_guess then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.crosschampion)
	elseif slot0.id == ActivitySignType.peak_champion or slot0.id == ActivitySignType.peak_champion_guess then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.peakchampion)
	end
end

function ActivitySignWindow.close_callback(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end

	if slot0.timer_id then
		GlobalTimeTicket:getInstance():remove(slot0.timer_id)
	end

	slot0.item_list = nil
end
