AdventureBoxRewardWindow = AdventureBoxRewardWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()
slot1 = table.insert
slot2 = table.sort
slot3 = string.format

function AdventureBoxRewardWindow.__init(slot0, slot1)
	slot0.kill_master = slot1 or 0
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "adventure/adventure_box_reward_window"
end

function AdventureBoxRewardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("bg")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot1:getChildByName("title"):setString(TI18N("目标奖励"))
	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.btn_close = slot1:getChildByName("btn_close")
	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 600,
		start_x = 10,
		space_x = 0,
		row = 0,
		item_height = 168,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = AdventureBoxRewardItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function AdventureBoxRewardWindow.openRootWnd(slot0)
	slot0:updataTeskRewardList()
end

function AdventureBoxRewardWindow.sortItemList(slot0, slot1)
	slot2 = {
		[0] = 2,
		1,
		3
	}

	uv0(slot1, function (slot0, slot1)
		if slot0.status ~= slot1.status then
			if uv0[slot0.status] and uv0[slot1.status] then
				return uv0[slot0.status] < uv0[slot1.status]
			else
				return false
			end
		else
			return slot0.id < slot1.id
		end
	end)
end

function AdventureBoxRewardWindow.updataTeskRewardList(slot0)
	slot1 = Config.AdventureData.data_round_reward_list

	if slot0.item_scrollview then
		slot2 = {}

		for slot6, slot7 in pairs(slot1) do
			slot7.status = 0

			if slot7.count <= slot0.kill_master then
				slot7.status = 1
			end

			if uv0:getUiModel():getAdventureBoxStatus(slot7.id) == 2 then
				slot7.status = 2
			end

			uv1(slot2, slot7)
		end

		slot0:sortItemList(slot2)
		slot0.item_scrollview:setData(slot2, nil, nil, slot0.kill_master)
	end
end

function AdventureBoxRewardWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openAdventureBoxRewardView(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openAdventureBoxRewardView(false)
	end, false, 2)
	slot0:addGlobalEvent(AdventureEvent.UpdateBoxTeskEvent, function (slot0)
		uv0:updataTeskRewardList()
	end)
end

function AdventureBoxRewardWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openAdventureBoxRewardView(false)
end

AdventureBoxRewardItem = class("AdventureBoxRewardItem", function ()
	return ccui.Widget:create()
end)

function AdventureBoxRewardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function AdventureBoxRewardItem.configUI(slot0)
	slot0.size = cc.size(600, 168)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("adventure/adventure_box_reward_item"))

	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.name_text = slot1:getChildByName("name_text")
	slot0.btn_goto = slot1:getChildByName("btn_goto")

	slot0.btn_goto:setVisible(false)
	slot0.btn_goto:getChildByName("Text_2"):setString(TI18N("前往"))

	slot0.btn_get = slot1:getChildByName("btn_get")

	slot0.btn_get:setVisible(false)
	slot0.btn_get:getChildByName("Text_2"):setString(TI18N("领取"))

	slot0.spr_has = slot1:getChildByName("spr_has")

	slot0.spr_has:setVisible(false)

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 5,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function AdventureBoxRewardItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_goto, function ()
		uv0:openAdventureBoxRewardView(false)
	end, true, 1)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data and uv0.data.id then
			uv1:send20635(uv0.data.id)
		end
	end, true, 1)
end

function AdventureBoxRewardItem.setExtendData(slot0, slot1)
	slot0.kill_index = slot1
end

function AdventureBoxRewardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.btn_goto:setVisible(slot1.status == 0)
	slot0.btn_get:setVisible(slot1.status == 1)
	slot0.spr_has:setVisible(slot1.status == 2)
	slot0.name_text:setString(uv0(TI18N("击杀%d个守卫  (%d/%d)"), slot1.count, slot0.kill_index, slot1.count))

	slot3 = {}

	for slot7, slot8 in pairs(slot1.items) do
		table.insert(slot3, {
			bid = slot8[1],
			quantity = slot8[2]
		})
	end

	slot0.item_scrollview:setData(slot3)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
end

function AdventureBoxRewardItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
