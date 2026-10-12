HeroResetHorcruxPanel = HeroResetHorcruxPanel or BaseClass(BaseView)
slot0 = table.insert
slot2 = HeroController:getInstance():getModel()
slot3 = string.format

function HeroResetHorcruxPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "hero/hero_reset_comfirm_panel"
end

function HeroResetHorcruxPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.win_title = slot1:getChildByName("win_title")

	slot0.win_title:setString(TI18N("重生预览"))
	UITool.SetTitleColor(slot0.win_title)

	slot0.top_val = createRichLabel(26, cc.c4b(215, 226, 227, 255), cc.p(0.5, 1), cc.p(337, 385), 12, nil, 580)

	slot1:addChild(slot0.top_val)

	slot0.dec_val = createRichLabel(22, cc.c4b(215, 226, 227, 255), cc.p(0.5, 0.5), cc.p(337, 140), 12, nil, 580)

	slot1:addChild(slot0.dec_val)

	slot0.count_label = createRichLabel(22, cc.c4b(215, 226, 227, 255), cc.p(0, 1), cc.p(600, 88), 12, nil, 200)

	slot1:addChild(slot0.count_label)

	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.confirm_btn_label = slot0.confirm_btn:getChildByName("label")

	slot0.confirm_btn_label:setString(TI18N("回退"))

	slot0.list_view = slot1:getChildByName("list_view")

	slot0.list_view:setContentSize(600, 130)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.container = slot1
	slot2 = createImage(slot1, nil, 0, 0, cc.p(0, 0.5), false, 1)

	slot2:setAnchorPoint(0.5, 0)
	slot2:setScaleX(1.8)
	slot2:setPosition(cc.p(slot1:getContentSize().width / 2, 20))

	slot0.line_load = loadImageTextureFromCDN(slot2, PathTool.getPlistImgForDownLoad("bigbg/pattern", "pattern_1"), ResourcesType.single, slot0.line_load)
end

function HeroResetHorcruxPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHeroResetHorcruxPanel(false)
	end, true, 1)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHeroResetHorcruxPanel(false)
	end, false, 1)
	registerButtonEventListener(slot0.confirm_btn, function ()
		uv0:onConfirmButton()
	end, true, 2)
end

function HeroResetHorcruxPanel.upateShowList(slot0)
	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.list_view, true, {
			font_size = 22,
			scale = 1,
			text = TI18N("无返还资源")
		})

		return
	end

	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.list_view, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.list_view:getContentSize(), {
			start_y = 6,
			once_num = 4,
			start_x = 16,
			row = 4,
			space_x = 32,
			item_width = 110,
			item_height = 119,
			space_y = 10,
			col = 4,
			need_dynamic = true
		})

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.item_scrollview:reloadData()
end

function HeroResetHorcruxPanel.createNewCell(slot0, slot1, slot2)
	return HeroReturnIconItem1.new(slot1, slot2)
end

function HeroResetHorcruxPanel.numberOfCells(slot0)
	return #slot0.show_list
end

function HeroResetHorcruxPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.show_list[slot2] then
		slot1:setData(slot3)
	end
end

function HeroResetHorcruxPanel.onConfirmButton(slot0)
	if not slot0.horcrux then
		return
	end

	for slot6, slot7 in ipairs(Config.HorcruxData.data_fallback_reward[slot0.horcrux.horcrux_lev].loss) do
		if Config.ItemData.data_get_data(slot7[1]) then
			if slot6 ~= 1 then
				slot1 = "回退该魂器需要消耗" .. ", "
			end

			slot1 = slot1 .. uv0("<img src=%s visible=true scale=0.32 /><div fontColor=#289b14 fontsize= 24>%s</div>", PathTool.getItemRes(slot8.icon), slot7[2])
		end
	end

	CommonAlert.show(slot1, "确认", function ()
		uv0:sender11405(uv1.horcrux.partner_id)
		uv0:openHeroResetHorcruxPanel(false)
	end, "取消", nil, CommonAlert.type.rich, nil, nil, nil, true)
end

function HeroResetHorcruxPanel.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.horcrux = slot1
	slot2 = {}

	if Config.HorcruxData.data_fallback_reward[slot1.horcrux_lev] and slot3.reward then
		for slot7, slot8 in ipairs(slot3.reward) do
			if slot2[slot8[1]] == nil then
				slot2[slot8[1]] = slot8[2]
			else
				slot2[slot8[1]] = slot2[slot8[1]] + slot8[2]
			end
		end
	end

	slot0.show_list = {}

	for slot7, slot8 in pairs(slot2) do
		if slot8 > 0 then
			uv0(slot0.show_list, {
				id = slot7,
				quantity = slot8
			})
		end
	end

	slot0:upateShowList()
	slot0.top_val:setString(uv1("<div>魂器:</div><div fontcolor=#d95014>%s</div>回退,返还<div fontcolor=#25a720>70%%</div><div fontcolor=#25a720>进阶</div>耗材", Config.HorcruxData.data_partner_horcrux[slot1.bid].horcrux_name))
end

function HeroResetHorcruxPanel.updateBtnTime(slot0)
	if not slot0.hero_vo then
		return
	end

	if not slot0.confirm_btn_label then
		return
	end

	if (slot0.hero_vo:getAttrByKey("reset_time") or 0) ~= 0 then
		if slot1 - GameNet:getInstance():getTime() > 0 then
			commonCountDownTime(slot0.confirm_btn_label, slot2, {
				end_callback = function ()
					uv0:updateBtnTime()
				end
			})
			setChildUnEnabled(true, slot0.confirm_btn)
			slot0.confirm_btn_label:enableOutline(Config.ColorData.data_color4[2], 2)
		else
			slot0.confirm_btn_label:setString(TI18N("免费重生"))

			if slot0.count <= 0 then
				setChildUnEnabled(true, slot0.confirm_btn)
				slot0.confirm_btn_label:enableOutline(Config.ColorData.data_color4[2], 2)
			else
				setChildUnEnabled(false, slot0.confirm_btn)
				slot0.confirm_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
			end
		end
	else
		slot0.confirm_btn_label:setString(TI18N("免费重生"))

		if slot0.count <= 0 then
			setChildUnEnabled(true, slot0.confirm_btn)
			slot0.confirm_btn_label:enableOutline(Config.ColorData.data_color4[2], 2)
		else
			setChildUnEnabled(false, slot0.confirm_btn)
			slot0.confirm_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
		end
	end
end

function HeroResetHorcruxPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.line_load then
		slot0.line_load:DeleteMe()
	end

	slot0.line_load = nil

	uv0:openHeroResetHorcruxPanel(false)
end

HeroReturnIconItem1 = class("HeroReturnIconItem1", function ()
	return ccui.Widget:create()
end)

function HeroReturnIconItem1.ctor(slot0)
	slot0.size = cc.size(119, 119)

	slot0:setTouchEnabled(false)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(slot0.size)
	slot0:addChild(slot0.root_wnd)
	slot0:registerEvent()
end

function HeroReturnIconItem1.registerEvent(slot0)
end

function HeroReturnIconItem1.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.item then
		slot0.item:DeleteMe()

		slot0.item = nil
	end

	slot2 = nil

	if slot1.show_type ~= nil and slot1.show_type == MainuiConst.item_exhibition_type.partner_type then
		slot2 = HeroExhibitionItem.new(1, true)

		slot2:addCallBack(function ()
		end)
		slot2:setPosition(slot0.size.width / 2, slot0.size.height / 2)
		slot2:setData(slot1)
		slot0.root_wnd:addChild(slot2)
	else
		slot2 = BackPackItem.new(false, false)

		slot2:setPosition(slot0.size.width / 2, slot0.size.height / 2)
		slot2:setSwallowTouches(false)
		slot2:setData(slot1, true)
		slot0.root_wnd:addChild(slot2)
	end

	slot0.item = slot2
end

function HeroReturnIconItem1.DeleteMe(slot0)
	if slot0.item then
		slot0.item:DeleteMe()

		slot0.item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
