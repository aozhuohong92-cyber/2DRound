BackPackSellWindow = BackPackSellWindow or BaseClass(BaseView)
slot0 = table.insert

function BackPackSellWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.ctrl = BackpackController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.win_type = WinType.Mini
	slot0.item_list = {}
	slot0.layout_name = "backpack/backpack_sell_window"
	slot0.wait_sell_list = {}
end

function BackPackSellWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.total_width = slot0.container:getContentSize().width
	slot0.cell_resoult = slot0.container:getChildByName("cell_resoult")

	slot0.cell_resoult:setVisible(false)
	slot0.container:addChild(slot0.cell_resoult:clone())

	slot0.cancel_btn = slot0.container:getChildByName("cancel_btn")
	slot0.confirm_btn = slot0.container:getChildByName("confirm_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取消"))

	slot0.cell_label = slot0.confirm_btn:getChildByName("label")
	slot0.win_title = slot0.container:getChildByName("win_title")
	slot0.sell_desc = slot0.container:getChildByName("sell_desc")
	slot0.sell_title = slot0.container:getChildByName("sell_title")
end

function BackPackSellWindow.register_event(slot0)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			BackpackController:getInstance():openSellWindow(false)
		end
	end)

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				BackpackController:getInstance():openSellWindow(false)
			end
		end)
	end

	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()

			if next(uv0.wait_sell_list) and uv0.bag_code then
				BackpackController:getInstance():sender10522(uv0.bag_code, uv0.wait_sell_list)
			end
		end
	end)
end

function BackPackSellWindow.openRootWnd(slot0, slot1, slot2)
	slot0.bag_code = slot1
	slot0.wait_sell_list = {}
	slot3 = {}

	for slot7, slot8 in ipairs(slot2) do
		if slot8.id ~= nil and slot8.config ~= nil and slot8.config.value and next(slot8.config.value) then
			slot12 = {
				id = slot8.id,
				bid = slot8.base_id,
				num = slot13
			}
			slot13 = slot8.quantity

			uv0(slot0.wait_sell_list, slot12)

			for slot12, slot13 in ipairs(slot8.config.value) do
				if slot3[slot13[1]] == nil then
					slot3[slot13[1]] = {
						num = 0,
						id = slot13[1]
					}
				end

				slot3[slot13[1]].num = slot3[slot13[1]].num + slot13[2] * slot8.quantity
			end

			if slot0.bag_code == BackPackConst.Bag_Code.EQUIPS then
				if slot8.enchant ~= 0 and Config.PartnerEqmData.data_partner_eqm(getNorKey(slot8.config.type, slot8.enchant)) ~= nil and slot9.sell ~= nil and next(slot9.sell) ~= nil then
					for slot13, slot14 in ipairs(slot9.sell) do
						if slot3[slot14[1]] == nil then
							slot3[slot14[1]] = {
								num = 0,
								id = slot14[1]
							}
						end

						slot3[slot14[1]].num = slot3[slot14[1]].num + slot14[2] * slot8.quantity
					end
				end

				slot9 = 0

				for slot14, slot15 in ipairs(slot8.gemstones) do
					if Config.PartnerGemstoneData.data_upgrade[getNorKey(slot8.config.type, slot15.lev)] and next(slot17.add) then
						slot9 = slot17.add[1][1]
						slot10 = 0 + slot17.add[1][2]
					end
				end

				if slot10 > 0 then
					if slot3[slot9] == nil then
						slot3[slot9] = {
							num = 0,
							id = slot9
						}
					end

					slot3[slot9].num = slot3[slot9].num + slot10
				end
			end
		end
	end

	slot0:showSellItemValue(slot3)

	slot4 = ""

	if slot1 == BackPackConst.Bag_Code.BACKPACK then
		slot4 = TI18N("分解")
	elseif slot1 == BackPackConst.Bag_Code.EQUIPS then
		slot4 = TI18N("熔炼")
	end

	slot0.win_title:setString(slot4)
	slot0.cell_label:setString(slot4)
	slot0.sell_desc:setString(string.format(TI18N("%s后物品将不可找回"), slot4))
	slot0.sell_title:setString(string.format(TI18N("%s后将获得下列物品："), slot4))
end

function BackPackSellWindow.showSellItemValue(slot0, slot1)
	if slot1 == nil then
		return
	end

	if tolua.isnull(slot0.cell_resoult) then
		return
	end

	slot3 = nil
	slot4 = {}
	slot5 = 3
	slot7 = slot0.cell_resoult:getPositionY()
	slot8 = slot0.cell_resoult:getContentSize().width
	slot9 = slot0.cell_resoult:getContentSize().height

	for slot13, slot14 in pairs(slot1) do
		if Config.ItemData.data_get_data(slot14.id) ~= nil then
			slot3 = slot0.cell_resoult:clone()

			slot3:setVisible(true)
			slot0.container:addChild(slot3)

			slot3.img = slot3:getChildByName("item_img")

			slot3.img:loadTexture(PathTool.getItemRes(slot15.icon), LOADTEXT_TYPE)

			slot3.value = slot3:getChildByName("value")

			slot3.value:setString(math.floor(slot14.num))
			table.insert(slot4, slot3)

			if 0 + 1 < 4 then
				slot6 = 0 + slot3:getContentSize().width
			end
		end
	end

	slot10 = math.floor((#slot4 - 1) / slot5) + 1
	slot11 = (slot0.total_width - (#slot4 - 1) * 18 - slot6) * 0.5

	if slot10 >= 2 then
		slot12 = slot7 + (slot10 - 1) * slot9 - 10
	end

	for slot16, slot17 in ipairs(slot4) do
		slot17:setPosition(slot11 + (slot16 - 1) % slot5 * (slot8 + 18), slot12 - math.floor((slot16 - 1) / slot5) * (slot9 + 10))
	end
end

function BackPackSellWindow.close_callback(slot0)
	BackpackController:getInstance():openSellWindow(false)
end
