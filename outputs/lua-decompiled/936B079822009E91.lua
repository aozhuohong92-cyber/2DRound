SacreEquipWindow = SacreEquipWindow or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format

function SacreEquipWindow.__init(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.is_full_screen = false
	slot0.enter_type = slot5 or HeroConst.EnterType.eOhter
	slot0.sacre_data = slot4
	slot0.cloth_data = slot3 or {}
	slot0.empty_res = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3")
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		},
		{
			path = slot0.empty_res,
			type = ResourcesType.single
		}
	}
	slot0.title_str = TI18N("圣器更换")
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_init = true
	slot0.click_pos = slot1 or 1
	slot0.click_partner = slot2 or 0
	slot0.is_put_off = false
end

function SacreEquipWindow.open_callback(slot0)
	slot2 = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/sacre_equip_panel"))

	slot0.container:addChild(slot2)

	slot0.main_panel = slot2:getChildByName("main_panel")
end

function SacreEquipWindow.register_event(slot0)
	slot0:addGlobalEvent(HeroEvent.Del_Hero_Event, function (slot0)
		if uv0.click_partner then
			for slot4, slot5 in ipairs(slot0) do
				if uv0.click_partner == slot5.partner_id and uv0.close then
					uv0:close()
				end
			end
		end
	end)
end

function SacreEquipWindow.showEmptyIcon(slot0, slot1)
	if not slot0.empty_con and slot1 == false then
		return
	end

	slot2 = cc.size(200, 200)
	slot0.empty_con = ccui.Widget:create()

	slot0.empty_con:setContentSize(slot2)
	slot0.empty_con:setPosition(cc.p(335, 370))
	slot0.main_panel:addChild(slot0.empty_con, 100)

	slot3 = createImage(slot0.empty_con, slot0.empty_res, slot2.width / 2, slot2.height / 2, cc.p(0.5, 0.5), false)
	slot0.empty_label = createLabel(24, cc.c4b(118, 69, 25, 255), nil, slot2.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))

	slot0.empty_label:setString(TI18N("背包中无可穿戴圣器"))
	slot0.empty_con:setVisible(slot1)
end

function SacreEquipWindow.openRootWnd(slot0)
	slot0:updateEquipList()
end

function SacreEquipWindow.updateEquipList(slot0)
	slot1 = cc.size(620, 712)

	print("SacreEquipWindow:updateEquipList-----------------------------")
	print(debug.traceback())

	if slot0.cloth_data and next(slot0.cloth_data) ~= nil then
		if not slot0.cloth_item then
			slot0.cloth_item = SacreEquipClothItem.new(2)

			slot0.main_panel:addChild(slot0.cloth_item)
			slot0.cloth_item:setPosition(cc.p(slot0.main_panel:getContentSize().width / 2, 680))
			slot0.cloth_item:addCallBack(function (slot0, slot1)
				uv0.is_put_off = true

				uv1:sender11501(uv0.click_partner, slot1.id, 0)
				uv1:openEquipPanel(false)
			end)
		end

		slot0.cloth_item:setData(slot0.cloth_data)

		if slot0.cloth_item.holy_equip_bg then
			slot0.cloth_item.holy_equip_bg:setVisible(false)
		end

		slot1 = cc.size(620, 555)
	end

	if slot0.list_view == nil then
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.main_panel, cc.p(12, 46), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1, {
			start_y = -6,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 620,
			item_height = 150,
			space_y = 0,
			col = 1
		})

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	for slot7, slot8 in pairs(BackpackController:getInstance():getModel():getBagItemList(BackPackConst.Bag_Code.EQUIPS) or {}) do
		if slot8 and slot8.config and slot8.config.type and slot8.config.type == slot0.click_pos and slot0.cloth_data and slot0.cloth_data.id ~= slot8.id then
			uv1({}, slot8)
		end
	end

	if slot0.sacre_data and next(slot0.sacre_data) ~= nil and BackPackConst.checkIsHolyEquipment(slot0.click_pos) then
		for slot8, slot9 in pairs(uv2:getAllHeroHolyEquipList()) do
			if slot9.config and slot9.config.type and slot0.click_pos == slot9.config.type and slot0.cloth_data and slot0.cloth_data.id ~= slot9.id then
				uv1(slot3, slot9)
			end
		end
	end

	if #slot3 > 0 then
		if slot3[1].sub_type == BackPackConst.item_tab_type.EQUIPS then
			uv3(slot3, SortTools.tableUpperSorter({
				"eqm_star",
				"eqm_jie",
				"base_id"
			}))
		else
			uv3(slot3, SortTools.KeyUpperSorter("all_score"))
		end
	end

	if not slot3 or next(slot3) == nil then
		slot0:showEmptyIcon(true)
	else
		slot0:showEmptyIcon(false)
	end

	print("show_list---------------------------------")
	print(debug.traceback())

	slot0.show_list = slot3

	slot0.list_view:reloadData()
end

function SacreEquipWindow.createNewCell(slot0, slot1, slot2)
	slot3 = SacreEquipClothItem.new()

	slot3:setExtendData({
		my_equip_score = slot0.cloth_data.all_score,
		enter_type = slot0.enter_type
	})
	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function SacreEquipWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function SacreEquipWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function SacreEquipWindow.onCellTouched(slot0, slot1)
	slot0:clickFun(slot0.show_list[slot1.index])
end

function SacreEquipWindow.clickFun(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.click_pos == 110 then
		uv0:sender11501(slot0.click_partner, slot1.id, 1)
	end

	uv0:openSacreEquipPanel(false)
end

function SacreEquipWindow.setPanelData(slot0)
end

function SacreEquipWindow.close_callback(slot0)
	uv0:openEquipPanel(false)

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.cloth_item then
		slot0.cloth_item:DeleteMe()

		slot0.cloth_item = nil
	end

	if slot0.put_equip_event then
		GlobalEvent:getInstance():UnBind(slot0.put_equip_event)

		slot0.put_equip_event = nil
	end
end

SacreEquipClothItem = class("SacreEquipClothItem", function ()
	return ccui.Widget:create()
end)

function SacreEquipClothItem.ctor(slot0, slot1)
	slot0.open_type = slot1 or 1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function SacreEquipClothItem.setExtendData(slot0, slot1)
	slot0.my_equip_score = slot1.my_equip_score or 0
	slot0.enter_type = slot1.enter_type
end

function SacreEquipClothItem.config(slot0)
	slot0.size = cc.size(620, 150)

	slot0:setContentSize(slot0.size)

	slot0.attr_list = {}
	slot0.star_list = {}
end

function SacreEquipClothItem.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/equip_sacre_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.equip_item = BackPackItem.new(false, true, 0.9)

	slot0.equip_item:setPosition(cc.p(75, 80))
	slot0.main_panel:addChild(slot0.equip_item)
	slot0.equip_item:addCallBack(function ()
		uv0:openSacreEquipTips(true, uv1.data, PartnerConst.EqmTips.other)
	end)

	slot0.bg = slot0.main_panel:getChildByName("bg")
	slot0.cloth_btn = slot0.main_panel:getChildByName("lev_btn")

	slot0.cloth_btn:setTitleText(TI18N("穿戴"))
	slot0.cloth_btn:getTitleRenderer():enableOutline(Config.ColorData.data_color4[264], 2)

	slot3 = PathTool.getResFrame("common", "common_1029")

	slot0.cloth_btn:setBright(true)

	if slot0.open_type == 2 then
		slot3 = PathTool.getResFrame("common", "common_1020")

		slot0.cloth_btn:setBright(false)
		slot0.cloth_btn:setTitleText(TI18N("卸下"))
		slot2:enableOutline(Config.ColorData.data_color4[263], 2)
	end

	slot0.bg:loadTexture(slot3, LOADTEXT_TYPE_PLIST)

	slot0.equip_name = createLabel(24, Config.ColorData.data_color4[156], nil, 150, 102, "", slot0.main_panel, 0, cc.p(0, 0))
	slot0.plan_eqm_name = createRichLabel(22, cc.c4b(217, 80, 20, 255), cc.p(1, 0.5), cc.p(601, 118), nil, nil, 380)

	slot0.main_panel:addChild(slot0.plan_eqm_name)
end

function SacreEquipClothItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot1.config then
		return
	end

	if slot1._index then
		slot0.cloth_btn:setName("guildsign_equip_list_item_" .. slot1._index)
	end

	slot2, slot3 = uv0:checkHolyEquipmentPalnByItemID(slot1.id)

	if slot2 then
		slot0.plan_eqm_name:setString(uv1(TI18N("【%s】方案"), slot3.name))
	else
		slot0.plan_eqm_name:setString("")
	end

	if slot0.enter_type == HeroConst.EnterType.eHolyPlan and slot0.open_type ~= 2 then
		slot0.cloth_btn:setTitleText(TI18N("装配"))
	end

	slot0.data = slot1

	slot0.equip_item:setData(slot1)
	slot0.equip_item:setEnchantLev(slot1.enchant)

	slot5 = slot1.config.name or ""

	if (slot1.enchant or 0) > 0 then
		slot5 = slot4 .. "+" .. slot6
	end

	slot0.equip_name:setString(slot5)
	slot0:updateHolyEquipInfo()
end

function SacreEquipClothItem.updateAttrList(slot0)
	slot1 = slot0.data.main_attr or {}
	slot3 = {
		[slot8.attr_id] = slot8
	}

	for slot7, slot8 in pairs(slot0.data.attr or {}) do
		-- Nothing
	end

	slot4 = 1

	for slot8, slot9 in pairs(slot1) do
		if not slot0.attr_list[slot4] then
			slot10 = createRichLabel(22, Config.ColorData.data_color4[156], cc.p(0, 0), cc.p(150 * slot4 + 27, 30), 0, 0, 400)
			slot0.attr_list[slot4] = slot10

			slot0.main_panel:addChild(slot10)

			slot11 = createImage(slot0.main_panel, nil, 150 * slot4 + 5, 30, cc.p(0, 0), true, 0, false)

			slot11:setScale(0.8)

			slot0.attr_list[slot4].icon = slot11
		end

		slot10 = Config.AttrData.data_id_to_name[slot9.attr_id] or ""

		slot0.attr_list[slot4].icon:loadTexture(PathTool.getResFrame("common", PathTool.getAttrIconByStr(Config.AttrData.data_id_to_key[slot9.attr_id])), LOADTEXT_TYPE_PLIST)

		if slot3[slot9.attr_id] then
			slot11 = slot9.attr_val + math.ceil(slot3[slot9.attr_id].attr_val / 100) / 10
		end

		if PartnerCalculate.isShowPer(slot9.attr_id) == true then
			slot11 = slot11 / 1000 * 100 .. "%"
		end

		slot0.attr_list[slot4]:setString(uv0("%s：%s", slot10, slot11))

		slot4 = slot4 + 1
	end
end

function SacreEquipClothItem.updateHolyEquipInfo(slot0)
	slot0.equip_name:setPositionY(106)

	slot1 = 150
	slot2 = 76
	slot3 = 44
	slot4 = 200
	slot5 = 320

	if slot0.holy_equip_bg == nil then
		slot0.holy_equip_bg = createImage(slot0.main_panel, PathTool.getResFrame("common", "common_2008"), 312, 58, cc.p(0.5, 0.5), true, 0, true)

		slot0.holy_equip_bg:setContentSize(cc.size(330, 90))
		slot0.holy_equip_bg:setOpacity(180)
		slot0.holy_equip_bg:setCapInsets(cc.rect(8, 5, 1, 1))
	end

	if slot0.holy_base_label == nil then
		slot0.holy_base_label = createLabel(20, Config.ColorData.data_color4[156], nil, slot1, slot2, "", slot0.main_panel, 0, cc.p(0, 0.5))

		slot0.holy_base_label:setString(TI18N("基础:"))
	end

	if (slot0.data.main_attr or {}) and next(slot6) ~= nil then
		slot7 = slot6[1] or {}
		slot8, slot9, slot10 = commonGetAttrInfoByIDValue(slot7.attr_id, slot7.attr_val)

		if slot8 then
			if slot0.base_attr_label == nil then
				slot0.base_attr_label = createRichLabel(20, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(slot4, slot2), nil, nil, 380)

				slot0.main_panel:addChild(slot0.base_attr_label)
			end

			slot0.base_attr_label:setString(uv0("<div fontcolor=#955322> %s %s </div>", slot9, slot10))
		end
	end

	if slot0.holy_random_label == nil then
		slot0.holy_random_label = createLabel(20, Config.ColorData.data_color4[156], nil, slot1, slot3, "", slot0.main_panel, 0, cc.p(0, 0.5))

		slot0.holy_random_label:setString(TI18N("随机:"))
	end

	slot7 = {
		[slot12.pos] = slot12
	}

	for slot11, slot12 in ipairs(slot0.data.holy_eqm_attr) do
		-- Nothing
	end

	if slot0.random_holy_equip_attr == nil then
		slot0.random_holy_equip_attr = {}
	end

	for slot11 = 1, 2 do
		if slot0.random_holy_equip_attr[slot11] == nil then
			slot12 = slot4

			if slot11 >= 2 then
				slot12 = slot5
			end

			slot0.random_holy_equip_attr[slot11] = createRichLabel(20, cc.c4b(149, 83, 34, 255), cc.p(0, 0.5), cc.p(slot12, slot3), nil, nil, 380)

			slot0.main_panel:addChild(slot0.random_holy_equip_attr[slot11])
		end

		if slot7[slot11] then
			slot13, slot14, slot15 = commonGetAttrInfoByIDValue(slot12.attr_id, slot12.attr_val)

			if slot13 then
				slot0.random_holy_equip_attr[slot11]:setString(uv0("<div fontcolor=#955322> %s </div><div fontcolor=%s>%s</div>", slot14, uv1:getHolyEquipmentColorByItemIdAttrKey(slot0.data.config.id, Config.AttrData.data_id_to_key[slot12.attr_id], slot12.attr_val, 1, 2), slot15))
			end
		elseif slot11 == 1 then
			slot0.random_holy_equip_attr[slot11]:setString(TI18N("无"))
		else
			slot0.random_holy_equip_attr[slot11]:setString("")
		end
	end
end

function SacreEquipClothItem.registerEvents(slot0)
	slot0.cloth_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.call_fun then
				uv0:call_fun(uv0.data)
			end
		end
	end)
end

function SacreEquipClothItem.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.data)
	end
end

function SacreEquipClothItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function SacreEquipClothItem.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function SacreEquipClothItem.DeleteMe(slot0)
	if slot0.equip_item then
		slot0.equip_item:DeleteMe()

		slot0.equip_item = nil
	end

	slot0.data = nil

	slot0:removeFromParent()
end
