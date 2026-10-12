AdventureActivityWindow = AdventureActivityWindow or BaseClass(BaseView)
slot0 = AdventureActivityController:getInstance()
slot1 = table.insert

function AdventureActivityWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventureactivity", "adventureactivity"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_83", true),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "adventureactivity/adventureactivity_window"
end

function AdventureActivityWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_83", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot2 = slot1:getChildByName("scroll_list")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 687,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 214,
		space_y = 23,
		col = 1,
		need_dynamic = true,
		item_class = AdventureActivityItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function AdventureActivityWindow.openRootWnd(slot0)
	if slot0.item_scrollview then
		slot2 = {}

		for slot6, slot7 in pairs(Config.CrossGroundData.data_adventure_activity) do
			table.insert(slot2, slot7)
		end

		table.sort(slot2, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
		slot0.item_scrollview:setData(slot2)
	end
end

function AdventureActivityWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openAdventureActivityMainWindow(false)
	end, false, 2)
	slot0:addGlobalEvent(AdventureEvent.UpdateAdventureForm, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_RECORD_RED_POINT_EVENT, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_LOGIN_RED_POINT_EVENT, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_BOX_LIST_EVENT, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_RECEIVE_BOX_EVENT, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_CHALLEAGE_RED_POINT_EVENT, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(ElementEvent.Update_Element_Red_Status, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(HeavenEvent.Update_Heaven_Red_Status, function ()
		uv0:updateItemListRedStatus()
	end)
	slot0:addGlobalEvent(AdventureEvent.Update_Room_Base_Info, function ()
		uv0:updateItemListLockInfo()
	end)
end

function AdventureActivityWindow.updateItemListRedStatus(slot0)
	if not slot0.item_scrollview then
		return
	end

	if slot0.item_scrollview:getItemList() then
		for slot5, slot6 in pairs(slot1) do
			slot6:updateRedStatus()
		end
	end
end

function AdventureActivityWindow.updateItemListLockInfo(slot0)
	if not slot0.item_scrollview then
		return
	end

	if slot0.item_scrollview:getItemList() then
		for slot5, slot6 in pairs(slot1) do
			slot6:updateDesc()
		end
	end
end

function AdventureActivityWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openAdventureActivityMainWindow(false)
end

AdventureActivityItem = class("AdventureActivityItem", function ()
	return ccui.Widget:create()
end)

function AdventureActivityItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function AdventureActivityItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("adventureactivity/adventureactivity_item"))

	slot0:setContentSize(cc.size(687, 214))
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setSwallowTouches(false)

	slot0.item_bg = slot0.main_container:getChildByName("item_bg")
	slot0.open_desc = slot0.main_container:getChildByName("open_desc")

	slot0.open_desc:setVisible(false)

	slot0.open_desc2 = slot0.main_container:getChildByName("open_desc_2")

	slot0.open_desc2:setVisible(false)

	slot0.join_bg = slot0.main_container:getChildByName("join_bg")
	slot0.join_desc = slot0.main_container:getChildByName("join_desc")

	slot0.join_desc:setString("")

	slot0.lock_layer = slot0.main_container:getChildByName("lock_layer")
	slot0.award_list = slot0.main_container:getChildByName("award_list")

	slot0.award_list:setVisible(false)
	slot0.award_list:setPositionY(slot0.award_list:getPositionY() - 10)

	slot0.award_scrollview = CommonScrollViewLayout.new(slot0.award_list, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.award_list:getContentSize(), {
		start_y = 0,
		start_x = 0,
		scale = 0.7,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		need_dynamic = true,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.award_scrollview:setSwallowTouches(false)
end

function AdventureActivityItem.register_event(slot0)
	slot0.main_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 then
				playButtonSound2()

				if uv0.data then
					if AdventureActivityController:getInstance():isOpenActivity(uv0.data.id) == true then
						uv1:onClickGotoAdvenTureAcivity(uv0.data.id)
					else
						message(TI18N("暂未满足开启条件"))
					end
				end
			end
		end
	end)
end

function AdventureActivityItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot1._index then
		slot0.main_container:setName("guildadventure_activity_item_" .. slot1._index)
	end

	slot0.bg_load = loadImageTextureFromCDN(slot0.item_bg, PathTool.getPlistImgForDownLoad("bigbg/adventrueactivity", string.format("txt_cn_adventrueactivity_%d", slot1.res_id)), ResourcesType.single, slot0.bg_load)

	slot0.join_desc:setString(slot1.item_desc)

	if slot0.join_desc:getContentSize().width < 250 then
		slot3.width = 250
	end

	slot9 = slot3.width + 60

	slot0.join_bg:setContentSize(cc.size(slot9, slot3.height))

	slot4 = {}

	for slot8, slot9 in pairs(slot1.award) do
		uv0(slot4, {
			id = slot9[1],
			quantity = slot9[2]
		})
	end

	slot0.award_scrollview:setData(slot4)
	slot0.award_scrollview:addEndCallBack(function ()
		slot1 = Config.DungeonHeavenData.data_const.heaven_handbook

		for slot5, slot6 in pairs(uv0.award_scrollview:getItemList()) do
			slot8 = nil

			if uv0.data.id == AdventureActivityConst.Ground_Type.heaven and slot1 and slot6:getData() then
				for slot12, slot13 in pairs(slot1.val) do
					if slot13 == slot7.id then
						slot8 = 2

						break
					end
				end
			end

			slot6:setDefaultTip(true, nil, , slot8)
		end
	end)

	if slot0:updateDesc() then
		if AdventureActivityController:getInstance():isOpenActivity(slot1.id) == true then
			slot0.lock_layer:setVisible(false)
			slot0.open_desc:setVisible(false)
			slot0.award_list:setVisible(true)
		else
			slot0.lock_layer:setVisible(true)
			slot0.open_desc:setString(slot1.desc)
			slot0.open_desc:setVisible(true)

			if slot1.desc2 ~= "" then
				slot0.open_desc2:setString(slot1.desc2)
				slot0.open_desc2:setVisible(true)
			end

			slot0.award_list:setVisible(false)
		end
	end

	slot0:updateRedStatus()
end

function AdventureActivityItem.updateDesc(slot0)
	if slot0.data and slot0.data.id == AdventureActivityConst.Ground_Type.adventure_mine then
		slot0.is_adventure_mine_lock = false

		if not AdventureController:getInstance():getUiModel():getAdventureBaseData() then
			return false
		end

		slot4 = (slot1.pass_id or 1) >= 10

		if not AdventureActivityController:getInstance():isOpenActivity(slot0.data.id) then
			uv0({}, slot0.data.desc)
		end

		if not slot4 then
			uv0(slot5, TI18N("通关空岛冒险前九层开启"))
		end

		if next(slot5) == nil then
			slot0.lock_layer:setVisible(false)
			slot0.open_desc:setVisible(false)
			slot0.award_list:setVisible(true)
		else
			slot0.is_adventure_mine_lock = true

			slot0.lock_layer:setVisible(true)
			slot0.award_list:setVisible(false)
			slot0.open_desc:setString(slot5[1])
			slot0.open_desc:setVisible(true)

			if slot5[2] then
				slot0.open_desc2:setString(slot5[2])
				slot0.open_desc2:setVisible(true)
			end
		end

		return false
	else
		return true
	end
end

function AdventureActivityItem.updateRedStatus(slot0)
	if slot0.data then
		slot1 = false

		if slot0.data.id == AdventureActivityConst.Ground_Type.adventure then
			slot1 = AdventureController:getInstance():getUiModel():getAdventureRedPoint()
		elseif slot0.data.id == AdventureActivityConst.Ground_Type.element then
			slot1 = ElementController:getInstance():getModel():checkElementRedStatus()
		elseif slot0.data.id == AdventureActivityConst.Ground_Type.heaven then
			slot1 = HeavenController:getInstance():getModel():getHeavenRedStatus()
		elseif slot0.data.id == AdventureActivityConst.Ground_Type.adventure_mine then
			slot1 = AdventureController:getInstance():getUiModel():checkRedPoint(true)
		end

		if AdventureActivityController:getInstance():isOpenActivity(slot0.data.id) == false then
			slot1 = false
		end

		addRedPointToNodeByStatus(slot0.main_container, slot1, nil, , 99, 2)
	end
end

function AdventureActivityItem.DeleteMe(slot0)
	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	if slot0.award_scrollview then
		slot0.award_scrollview:DeleteMe()

		slot0.award_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
