slot1 = PlanesController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
PlanesFirstAwardWindow = PlanesFirstAwardWindow or BaseClass(BaseView)

function PlanesFirstAwardWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "planes/planes_first_award_window"
end

function PlanesFirstAwardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot1:getChildByName("win_title"):setString(TI18N("首通奖励"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot2 = slot1:getChildByName("item_list")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 601,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 147,
		space_y = 5,
		col = 1,
		need_dynamic = true,
		item_class = PlanesFirstAwardItem
	})
end

function PlanesFirstAwardWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	slot0:addGlobalEvent(PlanesEvent.Get_First_Award_Event, function ()
		if uv0.click_dun_id and uv0.item_scrollview then
			for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
				if slot5:getDunId() == uv0.click_dun_id then
					slot5:updateBtnStatus()

					uv0.click_dun_id = nil

					break
				end
			end
		end
	end)
end

function PlanesFirstAwardWindow.onClickCloseBtn(slot0)
	uv0:openPlanesFirstAwardWindow(false)
end

function PlanesFirstAwardWindow.openRootWnd(slot0)
	slot0:setData()
end

function PlanesFirstAwardWindow.setData(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(Config.SecretDunData.data_customs) do
		uv0(slot1, {
			dun_id = slot5,
			award = slot6.first_reward or {}
		})
	end

	uv1(slot1, SortTools.KeyLowerSorter("dun_id"))
	slot0.item_scrollview:setData(slot1, handler(slot0, slot0.onClickItemCallBack))
end

function PlanesFirstAwardWindow.onClickItemCallBack(slot0, slot1)
	slot0.click_dun_id = slot1
end

function PlanesFirstAwardWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openPlanesFirstAwardWindow(false)
end

PlanesFirstAwardItem = class("PlanesFirstAwardItem", function ()
	return ccui.Widget:create()
end)

function PlanesFirstAwardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function PlanesFirstAwardItem.configUI(slot0)
	slot0.size = cc.size(601, 147)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("planes/planes_first_award_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")

	slot2:getChildByName("first_title"):setString(TI18N("首次通过"))

	slot0.dun_name_txt = slot2:getChildByName("dun_name_txt")

	slot0.dun_name_txt:setPositionX(111)

	slot0.get_btn = slot2:getChildByName("get_btn")
	slot0.get_btn_label = slot0.get_btn:getChildByName("label")

	slot0.get_btn_label:setString(TI18N("领取"))

	slot0.got_sp = slot2:getChildByName("got_sp")
	slot3 = slot2:getChildByName("item_list")
	slot0.award_item_scrollview = CommonScrollViewLayout.new(slot3, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.award_item_scrollview:setSwallowTouches(false)
end

function PlanesFirstAwardItem.register_event(slot0)
	registerButtonEventListener(slot0.get_btn, handler(slot0, slot0.onClickGetBtn), true)
end

function PlanesFirstAwardItem.onClickGetBtn(slot0)
	if not slot0.data then
		return
	end

	if uv0:checkIsCanGetAwardByDunId(slot0.data.dun_id) then
		if slot0.callback then
			slot0.callback(slot0.data.dun_id)
		end

		uv1:sender23117(slot0.data.dun_id)
	end
end

function PlanesFirstAwardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if Config.SecretDunData.data_dun_info[slot1.dun_id] then
		slot0.dun_name_txt:setString(slot2.name or "")
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot1.award or {}) do
		uv0(slot3, {
			bid = slot8[1],
			quantity = slot8[2]
		})
	end

	slot0.award_item_scrollview:setData(slot3)
	slot0.award_item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.award_item_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)
	slot0:updateBtnStatus()
end

function PlanesFirstAwardItem.updateBtnStatus(slot0)
	if not slot0.data then
		return
	end

	slot1 = uv0:checkIsCanGetAwardByDunId(slot0.data.dun_id)

	if uv0:checkIsGetAwardByDunId(slot0.data.dun_id) then
		slot0.got_sp:setVisible(true)
		slot0.get_btn:setVisible(false)
	elseif not slot1 then
		slot0.got_sp:setVisible(false)
		slot0.get_btn:setVisible(true)
		slot0.get_btn:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.get_btn)
		slot0.get_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	else
		slot0.got_sp:setVisible(false)
		slot0.get_btn:setVisible(true)
		slot0.get_btn:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.get_btn)
		slot0.get_btn_label:enableOutline(Config.ColorData.data_color4[278], 2)
	end
end

function PlanesFirstAwardItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function PlanesFirstAwardItem.getDunId(slot0)
	if slot0.data then
		return slot0.data.dun_id
	end
end

function PlanesFirstAwardItem.DeleteMe(slot0)
	if slot0.award_item_scrollview then
		slot0.award_item_scrollview:DeleteMe()

		slot0.award_item_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
