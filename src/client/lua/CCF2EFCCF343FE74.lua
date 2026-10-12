BackPackBatchView = BackPackBatchView or BaseClass(BaseView)

function BackPackBatchView.__init(slot0, slot1)
	slot0.ctrl = slot1
	slot0.layout_name = "backpack/batchuse_panel_view"
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.cur_selected_sum = 0
	slot0.select_goods = nil
end

function BackPackBatchView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.item = BackPackItem.new(slot0.ctrl, true, false)

	slot0.item:setPosition(116, 384)
	slot0.main_container:addChild(slot0.item)

	slot0.use_btn = slot0.main_container:getChildByName("use_btn")

	slot0.use_btn:setTitleText(TI18N("使用"))

	slot0.use_btn.label = slot0.use_btn:getTitleRenderer()

	if slot0.use_btn.label ~= nil then
		slot0.use_btn.label:enableOutline(Config.ColorData.data_color4[264], 2)
	end

	slot0.handle_container = slot0.main_container:getChildByName("handle_container")
	slot0.handle_container_cy = slot0.handle_container:getContentSize().height * 0.5
	slot0.container = slot0.handle_container:getChildByName("container")
	slot0.container_y = slot0.container:getPositionY()
	slot0.sub_btn = slot0.container:getChildByName("sub_btn")
	slot0.add_btn = slot0.container:getChildByName("add_btn")
	slot0.max_btn = slot0.container:getChildByName("max_btn")
	slot0.slider = slot0.container:getChildByName("slider")

	slot0.slider:setBarPercent(20, 80)

	slot0.value = slot0.container:getChildByName("value")
	slot0.use_title = slot0.container:getChildByName("title")

	slot0.use_title:setString(TI18N("使用数量："))

	slot0.extend_container = slot0.handle_container:getChildByName("extend_container")
	slot0.use_item_title = slot0.extend_container:getChildByName("use_item_title")

	slot0.use_item_title:setString("")

	slot0.use_effect = slot0.extend_container:getChildByName("use_effect")
	slot0.title_label = slot0.main_container:getChildByName("title_label")

	slot0.title_label:setString(TI18N("批量使用"))

	slot0.item_name = slot0.main_container:getChildByName("item_name")
	slot0.item_own = slot0.main_container:getChildByName("item_own")
end

function BackPackBatchView.register_event(slot0)
	if slot0.slider ~= nil then
		slot0.slider:addEventListener(function (slot0, slot1)
			if slot1 == ccui.SliderEventType.percentChanged then
				uv0:setCurUseItemInfoByPercent(uv0.slider:getPercent())
			end
		end)
	end

	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.ctrl:openBatchUseItemView(false)
		end
	end)
	slot0.use_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if uv0.item_vo == nil or uv0.item_vo.config == nil then
				return
			end

			uv0.cur_selected_sum = math.min(uv0.cur_selected_sum, uv0.item_vo.quantity)

			if uv0.cur_selected_sum == 0 then
				message(TI18N("当前数量不能为0"))

				return
			end

			if uv0.type == ItemConsumeType.use then
				if uv0.cur_selected_sum >= 1 and uv0.item_vo.config.name == "精英召唤卷" then
					slot4 = CommonAlert.show(string.format(TI18N("是否批量将%d个%s兑换成<div fontcolor=##FF0000>限定招募券</div>"), uv0.cur_selected_sum, uv0.item_vo.config.name), TI18N("确定"), function ()
						uv0.ctrl:sender10515(uv0.item_vo.id, uv0.cur_selected_sum, uv0.select_goods)
					end, TI18N("取消"), nil, CommonAlert.type.rich, nil)
				else
					uv0.ctrl:sender10515(uv0.item_vo.id, uv0.cur_selected_sum, uv0.select_goods)
				end
			else
				if uv0.select_goods and uv0.select_goods.type and uv0.select_goods.type == 1 then
					MarketController:getInstance():sender23502(uv0.item_vo.id, uv0.cur_selected_sum)
					uv0.ctrl:openBatchUseItemView(false)

					return
				end

				uv0.ctrl:sender10522(BackPackConst.Bag_Code.BACKPACK, {
					{
						id = uv0.item_vo.id,
						bid = uv0.item_vo.base_id,
						num = uv0.cur_selected_sum
					}
				})
			end
		end
	end)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			-- Nothing
		end
	end)
	slot0.sub_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if uv0.item_vo == nil then
				return
			end

			if uv0.slider:getPercent() == 0 then
				return
			end

			if uv0.cur_selected_sum == 0 then
				return
			end

			uv0.cur_selected_sum = uv0.cur_selected_sum - 1

			uv0:setCurUseItemInfoByNum(uv0.cur_selected_sum)
		end
	end)
	slot0.add_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if uv0.item_vo == nil then
				return
			end

			if uv0.slider:getPercent() == 100 then
				return
			end

			if uv0.item_vo.quantity <= uv0.cur_selected_sum then
				return
			end

			uv0.cur_selected_sum = uv0.cur_selected_sum + 1

			uv0:setCurUseItemInfoByNum(uv0.cur_selected_sum)
		end
	end)
	slot0.max_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if uv0.item_vo == nil then
				return
			end

			if uv0.slider:getPercent() == 100 then
				return
			end

			if uv0.item_vo.quantity <= uv0.cur_selected_sum then
				return
			end

			uv0.cur_selected_sum = uv0.item_vo.quantity

			uv0:setCurUseItemInfoByNum(uv0.cur_selected_sum)
		end
	end)
end

function BackPackBatchView.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.type = slot2 or ItemConsumeType.use
	slot0.item_vo = slot1
	slot0.select_goods = slot3

	if slot0.item_vo == nil or slot0.item_vo.config == nil then
		slot0.ctrl:openBatchUseItemView(false)

		return
	end

	if slot0.type == ItemConsumeType.use then
		slot0.title_label:setString(TI18N("批量使用"))
		slot0.use_title:setString(TI18N("使用数量："))
		slot0.use_btn:setTitleText(TI18N("使用"))
		slot0:updateItem()
	elseif slot0.type == ItemConsumeType.resolve then
		slot0.title_label:setString(TI18N("批量分解"))
		slot0.use_title:setString(TI18N("分解数量："))
		slot0.use_btn:setTitleText(TI18N("分解"))
		slot0:updateCellItem()
	else
		slot0.title_label:setString(TI18N("物品出售"))
		slot0.use_title:setString(TI18N("出售数量："))
		slot0.use_btn:setTitleText(TI18N("出售"))
		slot0:updateCellItem()
	end
end

function BackPackBatchView.updateCellItem(slot0)
	if slot0.item_vo == nil or slot0.item_vo.config == nil then
		return
	end

	slot0.item:setData(slot0.item_vo.config)
	slot0.item_name:setString(slot0.item_vo.config.name)
	slot0.item_own:setString(string.format(TI18N("拥有 %s 个"), slot0.item_vo.quantity))

	slot0.cur_selected_sum = 1

	slot0.value:setString(1)
	slot0.slider:setPercent(1)

	if slot0.item_vo.config.value ~= nil and next(slot1) ~= nil then
		slot0.value_config = slot1[1]

		if slot0.value_config == nil or slot0.value_config[1] == nil or type(slot0.value_config[1]) ~= "number" then
			return
		end

		slot3 = 0

		if Config.ItemData.data_get_data(slot0.value_config[1]) == nil then
			return
		end

		if slot0.value_config[1] == Config.ItemData.data_assets_label2id.coin then
			slot3 = slot0.role_vo.coin
		elseif slot0.value_config[1] == Config.ItemData.data_assets_label2id.hero_soul then
			slot3 = slot0.role_vo.hero_soul
		end

		slot0:setCurUseItemInfoByPercent(100)
	end

	if slot0.select_goods and slot0.select_goods.type and slot0.select_goods.type == 1 then
		slot0.value_config = slot0.select_goods.value_list or {}

		slot0:setCurUseItemInfoByPercent(100)
	end
end

function BackPackBatchView.updateItem(slot0)
	if slot0.item_vo == nil or slot0.item_vo.config == nil then
		return
	end

	slot0.item:setData(slot0.item_vo.config)
	slot0.item_name:setString(slot0.item_vo.config.name)
	slot0.item_own:setString(string.format(TI18N("拥有 %s 个"), slot0.item_vo.quantity))

	slot0.cur_selected_sum = 1

	slot0.value:setString(1)
	slot0.slider:setPercent(1)

	if slot0:isAssetsItem(slot0.item_vo.config) == true then
		slot0.container:setPositionY(slot0.container_y)
		slot0.extend_container:setVisible(true)

		if slot0.item_vo.config.effect and next(slot0.item_vo.config.effect) ~= nil and slot0.item_vo.config.effect[1] ~= nil and slot0.role_vo ~= nil then
			slot2 = 0

			if slot1.effect_type == BackPackConst.item_effect_type.GOLD then
				slot2 = slot0.role_vo.gold
			elseif slot1.effect_type == BackPackConst.item_effect_type.COIN then
				slot2 = slot0.role_vo.coin
			elseif slot1.effect_type == BackPackConst.item_effect_type.PARTNER_EXP then
				slot2 = slot0.role_vo.partner_exp_all
			end
		end

		slot0:setCurUseItemInfoByPercent(100)
	else
		slot0.container:setPositionY(slot0.handle_container_cy)
		slot0.extend_container:setVisible(false)
	end
end

function BackPackBatchView.setCurUseItemInfoByPercent(slot0, slot1)
	if slot0.item_vo == nil then
		return
	end

	slot0.cur_selected_sum = math.max(1, math.floor(slot1 * slot0.item_vo.quantity * 0.01))

	slot0:setUseInfo(slot0.cur_selected_sum)
end

function BackPackBatchView.setCurUseItemInfoByNum(slot0, slot1)
	if slot0.item_vo == nil then
		return
	end

	slot0.cur_selected_sum = math.max(1, slot1)

	slot0.slider:setPercent((slot0.cur_selected_sum - 1) / math.max(1, slot0.item_vo.quantity - 1) * 100)
	slot0:setUseInfo(slot0.cur_selected_sum)
end

function BackPackBatchView.setUseInfo(slot0, slot1)
	slot0.value:setString(math.min(slot0.item_vo.quantity, slot1))

	if slot0.type == ItemConsumeType.sell and slot0.value_config ~= nil then
		slot2 = slot0.value_config[2] or 0

		if slot0.value_config[1] == nil then
			return
		end

		if Config.ItemData.data_get_data(slot3) == nil then
			return
		end

		slot0.use_item_title:setString(string.format(TI18N("出售后可获得%s："), slot4.name))
		slot0.use_effect:setString(slot2 * slot1)
		slot0.use_effect:setPositionX(slot0.use_item_title:getContentSize().width + slot0.use_item_title:getPositionX())
	elseif slot0.type == ItemConsumeType.resolve and slot0.value_config ~= nil then
		slot2 = slot0.value_config[2] or 0

		if slot0.value_config[1] == nil then
			return
		end

		if Config.ItemData.data_get_data(slot3) == nil then
			return
		end

		slot0.use_item_title:setString(string.format(TI18N("分解后可获得%s："), slot4.name))
		slot0.use_effect:setString(slot2 * slot1)
		slot0.use_effect:setPositionX(slot0.use_item_title:getContentSize().width + slot0.use_item_title:getPositionX())
	else
		if slot0.item_vo == nil or slot0.item_vo.config == nil or slot0.item_vo.config.effect == nil or next(slot0.item_vo.config.effect) == nil then
			return
		end

		if slot0:isAssetsItem(slot0.item_vo.config) == false then
			return
		end

		if slot0.item_vo.config.effect[1] ~= nil then
			slot0.use_item_title:setString(string.format(TI18N("使用后可获得%s："), Config.ItemData.data_item_effect_type[slot2.effect_type]))
			slot0.use_effect:setString(slot2.val * slot1)
			slot0.use_effect:setPositionX(slot0.use_item_title:getContentSize().width + slot0.use_item_title:getPositionX())
		end
	end
end

function BackPackBatchView.isAssetsItem(slot0, slot1)
	if slot1 == nil then
		return false
	end

	if slot1.effect == nil or next(slot1.effect) == nil then
		return false
	end

	slot2 = false

	for slot6, slot7 in ipairs(slot1.effect) do
		if slot7.effect_type == BackPackConst.item_effect_type.GOLD or slot7.effect_type == BackPackConst.item_effect_type.COIN or slot7.effect_type == BackPackConst.item_effect_type.PARTNER_EXP then
			slot2 = true

			break
		end
	end

	return slot2
end

function BackPackBatchView.close_callback(slot0)
	slot0.ctrl:openBatchUseItemView(false)
end
