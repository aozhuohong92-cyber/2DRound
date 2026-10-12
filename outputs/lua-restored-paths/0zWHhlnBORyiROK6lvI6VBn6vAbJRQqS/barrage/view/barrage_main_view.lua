BarrageMainView = BarrageMainView or BaseClass(BaseView)
slot0 = BarrageController:getInstance()
slot1 = table.sort
slot2 = table.insert

function BarrageMainView.__init(slot0, slot1)
	slot0.win_type = WinType.Tips
	slot0.auto_id = 1
	slot0.view_tag = ViewMgrTag.WIN_TAG
	slot0.layout_name = "barrage/barrage_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("barrage", "barrage"),
			type = ResourcesType.plist
		}
	}
	slot0.type = slot1 or 1
	slot0.barrage_list = {}
	slot0.container_index = 1
	slot0.cache_pool = {}
	slot0.cache_list = {}
	slot0.barrage_pool_list = {}
	slot0.shrink_status = true
	slot0.list_step = 1
	slot0.loop_step = 1
	slot0.list_interval = 2
	slot0.loop_interval = 3
end

function BarrageMainView.open_callback(slot0)
	slot0.btn_container = slot0.root_wnd:getChildByName("btn_container")
	slot0.btn_layout = slot0.btn_container:getChildByName("btn_layout")
	slot0.send_btn = slot0.btn_layout:getChildByName("send_btn")
	slot0.close_btn = slot0.btn_layout:getChildByName("close_btn")
	slot0.shrink_btn = slot0.btn_container:getChildByName("shrink_btn")
	slot0.shrink = slot0.shrink_btn:getChildByName("shrink")
	slot0.btn_layout_width = slot0.btn_layout:getContentSize().width
	slot0.wirte_btn = slot0.root_wnd:getChildByName("wirte_btn")

	slot0.wirte_btn:getChildByName("label"):setString(TI18N("发送弹幕"))

	slot0.info_btn = slot0.root_wnd:getChildByName("info_btn")
	slot0.info_btn_lable = slot0.info_btn:getChildByName("label")

	slot0.info_btn_lable:setString(TI18N("开启弹幕"))

	slot0.look_btn = slot0.root_wnd:getChildByName("look_btn")

	slot0.look_btn:getChildByName("label"):setString(TI18N("规则说明"))

	slot0.record_btn = slot0.root_wnd:getChildByName("record_btn")

	slot0.record_btn:getChildByName("label"):setString(TI18N("竞猜记录"))

	if slot0.type == BarrageConst.type.arenapeakchampion then
		slot0.btn_container:setVisible(false)
		slot0.wirte_btn:setVisible(true)
		slot0.info_btn:setVisible(true)
		slot0.look_btn:setVisible(true)
		slot0.record_btn:setVisible(true)
	end

	slot0.list_container = {}
	slot1 = nil

	for slot5 = 1, 4 do
		if slot0.root_wnd:getChildByName("list_container_" .. slot5) ~= nil then
			slot0.list_container[slot5] = slot1
		end
	end
end

function BarrageMainView.showBtn(slot0, slot1)
	if slot1 then
		slot0.wirte_btn:setVisible(true)
		slot0.info_btn:setVisible(true)
		slot0.look_btn:setVisible(true)
		slot0.record_btn:setVisible(true)
	else
		slot0.wirte_btn:setVisible(false)
		slot0.info_btn:setVisible(false)
		slot0.look_btn:setVisible(false)
		slot0.record_btn:setVisible(false)
	end
end

function BarrageMainView.register_event(slot0)
	registerButtonEventListener(slot0.wirte_btn, function ()
		uv0:onClickWirteBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.info_btn, function ()
		uv0:onClickInfoBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.look_btn, function ()
		uv0:onClickLookBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.record_btn, function ()
		uv0:onClickRecordBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	slot0.shrink_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:shrinkRightContainer()
		end
	end)
	slot0.send_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if isQingmingShield and isQingmingShield() then
				return
			end

			uv0:openEditView(true, uv1.type)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			if isQingmingShield and isQingmingShield() then
				return
			end

			if uv0.type ~= nil then
				uv0.open_status = not uv0.open_status

				uv1:setBarrageOpen(uv0.type, uv0.open_status)
				uv0:setScheduleUpdate(uv0.open_status)

				if uv0.open_status == true then
					uv0.close_btn:loadTexture(PathTool.getResFrame("barrage", "barrage_2"), LOADTEXT_TYPE_PLIST)
				else
					slot5 = PathTool.getResFrame("barrage", "barrage_1")
					slot6 = LOADTEXT_TYPE_PLIST

					uv0.close_btn:loadTexture(slot5, slot6)

					for slot5, slot6 in pairs(uv0.cache_list) do
						if slot6.clearInfo then
							slot6:clearInfo()
						end

						uv2(uv0.cache_pool, slot6)

						uv0.cache_list[slot6.id] = nil
					end

					uv0.cache_list = {}
				end
			end
		end
	end)

	if slot0.update_barrage_event == nil then
		slot0.update_barrage_event = GlobalEvent:getInstance():Bind(BarrageEvent.UpdateBarrageData, function (slot0)
			if slot0 == nil or slot0.type == nil then
				return
			end

			uv0:updateCacheBarrageList(slot0)
		end)
	end

	if slot0.update_barrage_status == nil then
		slot0.update_barrage_status = GlobalEvent:getInstance():Bind(BarrageEvent.SetVisibleStatus, function (slot0)
			if not tolua.isnull(uv0.root_wnd) then
				uv0.root_wnd:setVisible(slot0)
			end
		end)
	end

	slot0:addGlobalEvent(SceneEvent.ENTER_FIGHT, function ()
		if uv0.type == BarrageConst.type.arenapeakchampion then
			uv0.wirte_btn:setPosition(473, 1124)
			uv0.info_btn:setPosition(563, 1124)
			uv0.look_btn:setVisible(false)
			uv0.record_btn:setVisible(false)
		end
	end)
	slot0:addGlobalEvent(SceneEvent.EXIT_FIGHT, function ()
		if uv0.type == BarrageConst.type.arenapeakchampion then
			uv0.wirte_btn:setPosition(347, 247)
			uv0.info_btn:setPosition(454, 247)

			if ArenapeakchampionController:getInstance():getArenapeakchampionGuessingWindow() and slot0.cur_tab_index and slot0.cur_tab_index == ArenapeakchampionConstants.guessing_tab.eGuessing then
				uv0.look_btn:setVisible(true)
				uv0.record_btn:setVisible(true)
			end
		end
	end)
end

function BarrageMainView.onClickLookBtn(slot0)
	MainuiController:getInstance():openCommonExplainView(true, Config.ArenaPeakChampionData.data_explain_guess)
end

function BarrageMainView.onClickRecordBtn(slot0)
	ArenapeakchampionController:getInstance():openArenapeakchampionGuessInfoPanel(true)
end

function BarrageMainView.onClickWirteBtn(slot0)
	if isQingmingShield and isQingmingShield() then
		return
	end

	uv0:openEditView(true, slot0.type)
end

function BarrageMainView.onClickInfoBtn(slot0)
	if isQingmingShield and isQingmingShield() then
		return
	end

	if slot0.type ~= nil then
		slot0.open_status = not slot0.open_status

		uv0:setBarrageOpen(slot0.type, slot0.open_status)
		slot0:setScheduleUpdate(slot0.open_status)

		if slot0.open_status == true then
			slot0.info_btn:loadTexture(PathTool.getResFrame("barrage", "barrage_5", false), LOADTEXT_TYPE_PLIST)
			slot0.info_btn_lable:setString(TI18N("开启弹幕"))
		else
			slot5 = LOADTEXT_TYPE_PLIST

			slot0.info_btn:loadTexture(PathTool.getResFrame("barrage", "barrage_6", false), slot5)

			slot4 = TI18N

			slot0.info_btn_lable:setString(slot4("关闭弹幕"))

			for slot4, slot5 in pairs(slot0.cache_list) do
				if slot5.clearInfo then
					slot5:clearInfo()
				end

				uv1(slot0.cache_pool, slot5)

				slot0.cache_list[slot5.id] = nil
			end

			slot0.cache_list = {}
		end
	end
end

function BarrageMainView.openRootWnd(slot0, slot1, slot2)
	slot0.type = slot1 or 1
	slot0.open_type = slot2 or 1

	if Config.SubtitleData.data_const.sub_space ~= nil then
		slot0.list_interval = Config.SubtitleData.data_const.sub_space.val or 2
	end

	if Config.SubtitleData.data_const.subcircle_space ~= nil then
		slot0.loop_interval = Config.SubtitleData.data_const.subcircle_space.val or 3
	end

	if Config.SubtitleData.data_system[slot0.type] ~= nil then
		slot0.barrage_list = deepCopy(slot3)
	end

	slot0.open_status = uv0:getBarrageOpen(slot0.type)

	if isQingmingShield and isQingmingShield(true) then
		slot0.open_status = false
	end

	slot0:setScheduleUpdate(slot0.open_status)

	if slot0.type == BarrageConst.type.arenapeakchampion then
		if slot0.open_status == true then
			slot0.info_btn:loadTexture(PathTool.getResFrame("barrage", "barrage_5", false), LOADTEXT_TYPE_PLIST)
			slot0.info_btn_lable:setString(TI18N("开启弹幕"))
		else
			slot0.info_btn:loadTexture(PathTool.getResFrame("barrage", "barrage_6", false), LOADTEXT_TYPE_PLIST)
			slot0.info_btn_lable:setString(TI18N("关闭弹幕"))
		end
	elseif slot0.open_status == true then
		slot0.close_btn:loadTexture(PathTool.getResFrame("barrage", "barrage_2"), LOADTEXT_TYPE_PLIST)
	else
		slot0.close_btn:loadTexture(PathTool.getResFrame("barrage", "barrage_1"), LOADTEXT_TYPE_PLIST)
	end

	uv0:requestEnterBarrage(slot0.type)
end

function BarrageMainView.setScheduleUpdate(slot0, slot1)
	if slot1 == true then
		if slot0.queue_timer == nil then
			slot0.queue_timer = GlobalTimeTicket:getInstance():add(function ()
				if uv0.barrage_list ~= nil and next(uv0.barrage_list) ~= nil then
					if uv0.list_interval <= uv0.list_step then
						uv0:updateBarrage(table.remove(uv0.barrage_list, 1))

						uv0.list_step = 1
					else
						uv0.list_step = uv0.list_step + 1
					end
				elseif uv0.cache_list == nil or next(uv0.cache_list) == nil then
					if uv0.loop_interval <= uv0.loop_step then
						uv0.barrage_list = deepCopy(uv0.barrage_pool_list)
						uv0.barrage_pool_list = {}
						uv0.loop_step = 1
					else
						uv0.loop_step = uv0.loop_step + 1
					end
				end
			end, 1)
		end
	elseif slot0.queue_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.queue_timer)

		slot0.queue_timer = nil
	end
end

function BarrageMainView.updateCacheBarrageList(slot0, slot1)
	if slot1 == nil or slot1.list == nil or next(slot1.list) == nil then
		return
	end

	for slot5, slot6 in ipairs(slot1.list) do
		uv0(slot0.barrage_list, slot6)
	end

	if slot0.barrage_list ~= nil and next(slot0.barrage_list) then
		if slot0.open_type == 1 then
			uv1(slot0.barrage_list, function (slot0, slot1)
				slot0.time = slot0.time or 0
				slot1.time = slot1.time or 0

				return slot1.time < slot0.time
			end)
		else
			uv1(slot0.barrage_list, function (slot0, slot1)
				slot0.time = slot0.time or 0
				slot1.time = slot1.time or 0

				return slot0.time < slot1.time
			end)
		end
	end
end

function BarrageMainView.updateBarrage(slot0, slot1)
	if slot1 == nil or slot1.msg == "" then
		return
	end

	function slot2(slot0)
		if slot0 ~= nil and slot0.clearInfo then
			slot0:clearInfo()
		end

		uv0(uv1.cache_pool, slot0)

		uv1.cache_list[slot0.id] = nil
	end

	slot3 = nil

	if slot0.cache_pool == nil or next(slot0.cache_pool) == nil then
		slot0.cache_list[slot0.auto_id] = BarrageItemList.new(slot0.auto_id)
		slot0.auto_id = slot0.auto_id + 1
	else
		slot3 = table.remove(slot0.cache_pool, 1)
		slot0.cache_list[slot3.id] = slot3
	end

	slot0.list_container[slot0.container_index]:addChild(slot3)

	if slot3 ~= nil then
		slot3:setPosition(display.width + 10, 15)
		slot3:actionFinishCallBack(slot2)
		slot3:update(slot1)
	end

	slot0.container_index = slot0.container_index + 1

	if slot0.container_index > 4 then
		slot0.container_index = 1
	end
end

function BarrageMainView.close_callback(slot0)
	uv0:openMainView(false)

	if slot0.type == BarrageConst.type.arenapeakchampion then
		uv0:requestArenaPeakExitBarrage()
	else
		uv0:requestExitBarrage()
	end

	slot4 = false

	slot0:setScheduleUpdate(slot4)

	for slot4, slot5 in pairs(slot0.cache_pool) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.cache_pool = nil

	for slot4, slot5 in pairs(slot0.cache_list) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.cache_list = nil

	if slot0.update_barrage_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_barrage_event)

		slot0.update_barrage_event = nil
	end

	if slot0.update_barrage_status then
		GlobalEvent:getInstance():UnBind(slot0.update_barrage_status)

		slot0.update_barrage_status = nil
	end
end

function BarrageMainView.shrinkRightContainer(slot0, slot1)
	if slot0.is_shrink_ing == true then
		return
	end

	slot0.is_shrink_ing = true
	slot0.shrink_status = not slot0.shrink_status

	slot0.btn_layout:setVisible(true)

	slot2, slot3 = nil

	if slot0.shrink_status == true then
		slot3 = cc.MoveTo:create(0.1, cc.p(0, 0))
		slot2 = cc.FadeIn:create(0.1)
	else
		slot3 = cc.MoveTo:create(0.1, cc.p(slot0.btn_layout_width, 0))
		slot2 = cc.FadeOut:create(0.1)
	end

	slot0.btn_layout:runAction(cc.Sequence:create(cc.Spawn:create(slot2, slot3), cc.CallFunc:create(function ()
		uv0.is_shrink_ing = false

		if uv0.shrink_status == false then
			uv0.btn_layout:setVisible(false)
			uv0.shrink:setScaleX(1)
		else
			uv0.shrink:setScaleX(-1)
		end
	end)))
end
