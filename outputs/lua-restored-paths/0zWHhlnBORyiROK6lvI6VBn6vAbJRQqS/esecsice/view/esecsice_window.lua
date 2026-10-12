EsecsiceWindow = EsecsiceWindow or BaseClass(BaseView)
slot0 = EsecsiceController:getInstance()

function EsecsiceWindow.__init(slot0)
	slot0._activityRoot = nil
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "esercise/esercise_window"
	slot0.ctrl = ActivityController:getInstance()
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("activity", "activity"),
			type = ResourcesType.plist
		}
	}
end

function EsecsiceWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot0.root_wnd:getChildByName("bg"):setScale(display.getMaxScale())

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_63", true), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.main_container:getChildByName("Text_1"):setString(TI18N("海贼试炼"))

	slot0.scoreView = slot0.main_container:getChildByName("scoreView")
	slot0.itemScrollview = CommonScrollViewLayout.new(slot0.scoreView, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scoreView:getContentSize(), {
		start_y = 20,
		item_width = 658,
		start_x = 29,
		delay = 4,
		space_x = 0,
		row = 0,
		item_height = 305,
		space_y = 18,
		col = 1,
		item_class = EsecsiceItem
	})

	if GuideController:getInstance():isInGuide() then
		slot0.itemScrollview:setClickEnabled(false)
	end
end

function EsecsiceWindow.register_event(slot0)
	slot0:addGlobalEvent(Stone_dungeonEvent.Updata_StoneDungeon_Data, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(Endless_trailEvent.UPDATA_ESECSICE_ENDLESS_REDPOINT, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Update_Planes_Red_Event, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(PrimusEvent.Updata_Primus_RedPoint, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(GuideEvent.Update_Guide_Status_Event, function (slot0)
		if slot0 then
			uv0.itemScrollview:setClickEnabled(false)
		else
			uv0.itemScrollview:setClickEnabled(true)
		end
	end)
end

function EsecsiceWindow.openRootWnd(slot0)
	slot0.itemScrollview:setData(Config.DailyplayData.data_exerciseactivity, function (slot0)
		uv0:switchEcersiceActivityView(slot0:getData().goto_id)
	end)

	if slot0.itemScrollview then
		slot0.itemScrollview:addEndCallBack(function ()
			uv0:updateItemListRedStatus()
		end)
	end
end

function EsecsiceWindow.updateItemListRedStatus(slot0)
	if slot0.itemScrollview:getItemList() then
		for slot5, slot6 in pairs(slot1) do
			slot6:updateRedStatus()
		end
	end
end

function EsecsiceWindow.close_callback(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.itemScrollview then
		slot0.itemScrollview:DeleteMe()

		slot0.itemScrollview = nil
	end

	uv0:openEsecsiceView(false)
end

EsecsiceItem = class("EsecsiceItem", function ()
	return ccui.Widget:create()
end)

function EsecsiceItem.ctor(slot0)
	slot0.listReward = {}

	slot0:createRootWnd()
	slot0:registerEvent()
end

function EsecsiceItem.createRootWnd(slot0)
	slot0.rootWnd = createCSBNote(PathTool.getTargetCSB("esercise/esercise_item"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.rootWnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(690, 235))

	slot0.mainContainer = slot0.rootWnd:getChildByName("main_container")
	slot0.itemBG = slot0.mainContainer:getChildByName("itemBG")
	slot0.redPoint = slot0.mainContainer:getChildByName("redPoint")

	slot0.redPoint:setVisible(false)

	slot0.limitMask = slot0.mainContainer:getChildByName("limitMask")
	slot0.textLimitLev = slot0.mainContainer:getChildByName("textLimitLev")

	slot0.textLimitLev:setString("")
	slot0.textLimitLev:setLocalZOrder(11)

	slot0.textTimeStart = slot0.mainContainer:getChildByName("textTimeStart")

	slot0.textTimeStart:setString("")
	slot0.textTimeStart:setVisible(false)
	UITool.SetTitleColor(slot0.textTimeStart)
	slot0.mainContainer:getChildByName("Image_1"):setPositionX(75)
end

function EsecsiceItem.setData(slot0, slot1)
	slot0.escesiceData = slot1

	if slot1.pic_name then
		slot0.bg_load = loadSpriteTextureFromCDN(slot0.itemBG, PathTool.getPlistImgForDownLoad("activity/activity_big", slot1.pic_name), ResourcesType.single, slot0.bg_load)
	end

	if slot1.val[1] then
		for slot5, slot6 in pairs(slot1.val[1]) do
			if not slot0.listReward[slot5] then
				slot7 = BackPackItem.new(nil, true, nil, 0.7)

				if slot0.mainContainer then
					slot0.mainContainer:addChild(slot7, 1)
				end

				slot0.listReward[slot5] = slot7
			end

			if slot0.listReward[slot5] then
				slot0.listReward[slot5]:setPosition(cc.p(68 * slot5 + 30 * (slot5 - 1) + 40, 59))
				slot0.listReward[slot5]:setBaseData(slot6)
				slot0.listReward[slot5]:setDefaultTip()
			end
		end
	end

	if slot1.desc and slot0.textTimeStart then
		slot0.textTimeStart:setPositionX(80)
		slot0.textTimeStart:setString(slot1.desc)
		slot0.textTimeStart:setVisible(true)
	end

	if slot1.is_open == 1 then
		if MainuiController:getInstance():checkIsOpenByActivate(slot1.activate) == true then
			slot0:setTouchEnabled(true)
			slot0:handleEffect(true)
			slot0.limitMask:setVisible(false)
			slot0.textLimitLev:setVisible(false)
		else
			slot0:handleEffect(false)
			slot0.limitMask:setVisible(true)
			slot0.textLimitLev:setString(slot1.lock_desc)
			slot0.textLimitLev:setVisible(true)
		end
	else
		slot0.limitMask:setVisible(true)
		slot0.textLimitLev:setVisible(true)
		slot0:handleEffect(false)
		slot0:setTouchEnabled(false)
	end

	if slot1 and slot1.id then
		slot0:setName("guide_activity_item_" .. slot1.id)
	end
end

function EsecsiceItem.getData(slot0)
	return slot0.escesiceData
end

function EsecsiceItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function EsecsiceItem.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					uv0:callback()
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function EsecsiceItem.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0._mainContainer) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(505), cc.p(slot0._itemBG:getContentSize().width - 106, 28), cc.p(1, 0), true, PlayerAction.action)

		slot0._mainContainer:addChild(slot0.play_effect, 1)
	end
end

function EsecsiceItem.updateRedStatus(slot0)
	if slot0.escesiceData then
		slot1 = false

		if slot0.escesiceData.id == EsecsiceConst.exercise_index.endless then
			slot1 = Stone_dungeonController:getInstance():getModel():checkRedStatus()
		elseif slot0.escesiceData.id == EsecsiceConst.exercise_index.stonedungeon then
			slot1 = Endless_trailController:getInstance():getModel():checkRedStatus()
		elseif slot0.escesiceData.id == EsecsiceConst.exercise_index.honourfane then
			slot1 = PrimusController:getInstance():getModel():checkPrimusRedStatus()
		elseif slot0.escesiceData.id == EsecsiceConst.exercise_index.heroexpedit then
			slot1 = PlanesafkController:getInstance():getModel():getPlanesAfkRedStatus()
		end

		slot0.redPoint:setVisible(slot1)
	end
end

function EsecsiceItem.DeleteMe(slot0)
	if slot0.listReward and next(slot0.listReward) ~= nil then
		for slot4, slot5 in ipairs(slot0.listReward) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.listReward = {}

	slot0:handleEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
