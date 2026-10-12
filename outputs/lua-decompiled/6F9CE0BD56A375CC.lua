ReturnActionSigninPanel = class("ReturnActionSigninPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ReturnActionController:getInstance():getModel()
slot2 = string.format

function ReturnActionSigninPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()
end

function ReturnActionSigninPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("returnaction/returnaction_task_panel"))

	slot0.root_wnd:setPosition(-40, -66)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot2 = slot1:getChildByName("title_con")

	slot2:getChildByName("label_time_key"):setString(TI18N("剩余时间:"))

	slot0.label_time = slot2:getChildByName("label_time")

	slot0.label_time:setString("")

	slot0.desc_txt = slot2:getChildByName("desc_txt")

	slot0.desc_txt:setPosition(cc.p(100, 56))

	slot0.icon = slot2:getChildByName("icon")
	slot0.icon_count = slot2:getChildByName("icon_count")

	slot0.icon_count:setString("")

	slot0.banner_spr = slot2:getChildByName("title_img")

	slot2:getChildByName("btn_rule"):setVisible(false)

	slot4 = slot1:getChildByName("goods_item")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot4, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot4:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 4,
		space_x = 0,
		item_width = 688,
		item_height = 150,
		space_y = 6,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(true)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0:setLoadBanner()
	uv0:setSignConfigData()
	uv1:sender27908()
end

function ReturnActionSigninPanel.setLoadBanner(slot0)
	slot2 = "txt_cn_returnaction3"
	slot3 = ""

	if uv0:getReturnActionData(slot0.holiday_bid) then
		slot2 = slot1.panel_res
		slot3 = slot1.tips
	end

	slot0.desc_txt:setString(slot3)

	if not slot0.load_banner then
		slot0.load_banner = loadSpriteTextureFromCDN(slot0.banner_spr, PathTool.getReturnActionRes(slot2), ResourcesType.single, slot0.load_banner)
	end
end

function ReturnActionSigninPanel.createNewCell(slot0)
	return ReturnActionSigninItem.new()
end

function ReturnActionSigninPanel.numberOfCells(slot0)
	if not slot0.sign_data then
		return 0
	end

	return #slot0.sign_data
end

function ReturnActionSigninPanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.sign_data then
		return
	end

	slot1.index = slot2

	if not slot0.sign_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ReturnActionSigninPanel.register_event(slot0)
	if not slot0.sign_event then
		slot0.sign_event = GlobalEvent:getInstance():Bind(ReturnActionEvent.Sign_Event, function (slot0)
			if slot0 and uv0.label_time then
				setCountDownTime(uv0.label_time, slot0.endtime - GameNet:getInstance():getTime())
			end

			uv0:updateSigninServerList()
		end)
	end
end

function ReturnActionSigninPanel.updateSigninServerList(slot0)
	slot0.sign_data = uv0:getSignConfigData()

	if slot0.sign_data then
		for slot4, slot5 in pairs(slot0.sign_data) do
			slot5.status = 0

			if uv0:getServerSignData(slot5.day) then
				slot5.status = slot6.status
			end
		end

		slot0:sortItemList(slot0.sign_data)
		slot0.item_scrollview:reloadData()
	end
end

function ReturnActionSigninPanel.sortItemList(slot0, slot1)
	slot2 = {
		[0] = 2,
		1,
		3
	}

	table.sort(slot1, function (slot0, slot1)
		if slot0.status ~= slot1.status then
			if uv0[slot0.status] and uv0[slot1.status] then
				return uv0[slot0.status] < uv0[slot1.status]
			else
				return false
			end
		else
			return slot0.day < slot1.day
		end
	end)
end

function ReturnActionSigninPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ReturnActionSigninPanel.DeleteMe(slot0)
	doStopAllActions(slot0.label_time)

	if slot0.load_banner then
		slot0.load_banner:DeleteMe()

		slot0.load_banner = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.sign_event then
		GlobalEvent:getInstance():UnBind(slot0.sign_event)

		slot0.sign_event = nil
	end
end

ReturnActionSigninItem = class("ReturnActionSigninItem", function ()
	return ccui.Widget:create()
end)

function ReturnActionSigninItem.ctor(slot0)
	slot0.size = cc.size(688, 150)

	slot0:configUI()
	slot0:register_event()
end

function ReturnActionSigninItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("returnaction/returnaction_signin_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)
	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.btn_get = slot0.main_container:getChildByName("btn_get")

	slot0.btn_get:setVisible(false)

	slot0.btn_get_text = slot0.btn_get:getChildByName("Text_1")

	slot0.btn_get_text:setString(TI18N("领取"))

	slot0.spr_get = slot0.main_container:getChildByName("spr_get")

	slot0.spr_get:setVisible(false)

	slot0.txt_title = createRichLabel(24, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(20, 124), 0, 0, 400)

	slot0.main_container:addChild(slot0.txt_title)
	slot0.txt_title:setString("")

	slot0.txt_day = createLabel(24, cc.c4b(100, 50, 35, 255), nil, 596, 124, nil, slot0.main_container, nil, cc.p(0.5, 0.5))

	slot0.txt_day:setString("")

	slot0.goods_con = slot0.main_container:getChildByName("goods_con")

	slot0.goods_con:setScrollBarEnabled(false)
end

function ReturnActionSigninItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data and uv0.data.day then
			uv1:sender27909(uv0.data.day)
		end
	end, true, 1)
end

function ReturnActionSigninItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.txt_title:setString(uv0(TI18N("累计登陆<div fontcolor=#289b14>%d</div>天"), slot1.day))

	if slot1.day <= uv1:getActionSignCurDay() then
		slot2 = slot1.day
	end

	slot0.txt_day:setString(uv0(TI18N("(%d/%d)"), slot2, slot1.day))

	if slot1.status == 0 then
		slot0.btn_get:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.btn_get)
	elseif slot1.status == 1 then
		slot0.btn_get:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.btn_get)
	end

	slot0.btn_get:setVisible(slot1.status == 0 or slot1.status == 1)
	slot0.spr_get:setVisible(slot1.status == 2)

	slot0.change_item_list = commonShowSingleRowItemList(slot0.goods_con, slot0.change_item_list, slot1.rewards or {}, {
		scale = 0.8,
		max_count = 4,
		is_center = false,
		space_x = 10
	})
end

function ReturnActionSigninItem.DeleteMe(slot0)
	if slot0.change_item_list then
		for slot4, slot5 in pairs(slot0.change_item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end

		slot0.change_item_list = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
