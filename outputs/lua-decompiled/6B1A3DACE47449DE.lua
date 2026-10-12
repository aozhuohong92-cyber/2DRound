GoodsTips = GoodsTips or BaseClass(GoodsBaseTips)

function GoodsTips.__init(slot0)
	slot0:initMainContainer()
end

function GoodsTips.initMainContainer(slot0)
	slot1 = cc.size(SCREEN_WIDTH, display.height)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(slot1)
	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setSwallowTouches(false)

	slot0.main_container = ccui.Widget:create()

	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.main_container:setContentSize(cc.size(slot0.WIDHT, slot0.WIDTH))
	slot0.main_container:setPosition(cc.p(slot1.width / 2, slot1.height / 2))
	slot0:getRootWnd():addChild(slot0.main_container)
end

function GoodsTips.setDataVo(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot1 == nil or slot1.base_id == nil or Config.ItemData.data_get_data(slot1.base_id) == nil then
		return
	end

	slot0.goods_vo = slot1
	slot0.is_tabBar = slot2 or false
	slot0.is_role = slot3
	slot0.roleVo = slot4
	slot0.get_num = slot5
	slot0.is_pack_num = slot6 or true

	GoodsBaseTips.setDataVo(slot0, slot1, slot0.is_tabBar, slot5, slot0.is_pack_num, slot7)
	slot0:registerEvents()
	slot0:open()
	slot0:setCascadeOpacityEnabled(slot0.root_wnd, true)
end

function GoodsTips.setDataByBid(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot4 = Config.ItemData.data_get_data(slot1)
	slot4.base_id = slot4.id

	slot0:setDataVo(slot4, false, nil, nil, slot2, nil, slot3)
end

function GoodsTips.registerEvents(slot0)
	slot0.use_success_event = GlobalEvent:getInstance():Bind(BackpackEvent.USE_GOODS_SUCCESS, function (slot0)
		if uv0.goods_vo and slot0 == uv0.goods_vo.bid then
			if BackPackCtrl:getInstance():getData():getBackPackItemById(uv0.goods_vo.id) and slot1.quantity > 0 then
				uv0:updateGoodsNum(slot1)
			else
				uv0:close()
			end
		end
	end)

	slot0.root_wnd:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:close()
		end
	end)
end

function GoodsTips.getRootWnd(slot0)
	return slot0.root_wnd
end

function GoodsTips.open(slot0)
	doRemoveFromParent(slot0:getRootWnd())

	if not slot0:getRootWnd():getParent() then
		ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0:getRootWnd())
		slot0:setCommonUIZOrder(slot0:getRootWnd())
	end
end

function GoodsTips.unRegisterEvent(slot0)
	if slot0.use_success_event then
		GlobalEvent:getInstance():UnBind(slot0.use_success_event)

		slot0.use_success_event = nil
	end
end

function GoodsTips.__close(slot0)
	doRemoveFromParent(slot0:getRootWnd())

	slot0.use_btn = nil
	slot0.change_desc_label = nil
end

function GoodsTips.close(slot0)
	if tolua.isnull(slot0:getRootWnd()) then
		return
	end

	slot0:unRegisterEvent()
	slot0:__close()
end

function GoodsTips.setCascadeOpacityEnabled(slot0, slot1, slot2)
	slot3, slot4 = nil

	function slot4(slot0, slot1)
		if string.find(slot0:getDescription(), "Layout") or string.find(slot2, "Widget") then
			slot0:setCascadeOpacityEnabled(slot1)
		end
	end

	;(function (slot0, slot1)
		if slot0:getChildrenCount() > 0 then
			uv0(slot0, slot1)

			for slot6, slot7 in pairs(slot0:getChildren()) do
				uv1(slot7, slot1)
			end
		else
			uv0(slot0, slot1)
		end
	end)(slot1, slot2)
end

function GoodsTips.setTouchEnabled(slot0, slot1)
end
