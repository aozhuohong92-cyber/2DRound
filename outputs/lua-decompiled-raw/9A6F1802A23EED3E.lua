HallowsTraceWindow = HallowsTraceWindow or BaseClass(BaseView)
slot0 = HallowsController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = BackpackController:getInstance():getModel()

function HallowsTraceWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hallows", "hallows"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "hallows/hallows_trace_window"
	slot0.attr_list = {}
	slot0.cost_config = Config.HallowsData.data_const.id_stone
	slot0.attr_config = Config.HallowsData.data_const.stone_attribute
	slot0.this_use_num = 0
end

function HallowsTraceWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("霸气附着"))
	slot1:getChildByName("attr_title"):setString(TI18N("当前属性"))
	slot1:getChildByName("desc"):setString(TI18N("来源:充值活动"))

	slot0.cost_item = BackPackItem.new(false, true, false, 1, false, true)

	slot0.cost_item:setPosition(336, 290)
	slot1:addChild(slot0.cost_item)

	slot0.can_use_label = createRichLabel(24, 175, cc.p(0.5, 0), cc.p(338, 370), nil, , 400)

	slot1:addChild(slot0.can_use_label)

	slot0.max_btn = slot1:getChildByName("max_btn")
	slot0.plus_btn = slot1:getChildByName("plus_btn")
	slot0.min_btn = slot1:getChildByName("min_btn")
	slot0.slider = slot1:getChildByName("slider")

	slot0.slider:setBarPercent(10, 90)

	slot0.upgrade_btn = slot1:getChildByName("upgrade_btn")
	slot0.upgrade_btn_label = slot0.upgrade_btn:getChildByName("label")
	slot5 = TI18N

	slot0.upgrade_btn_label:setString(slot5("使用"))

	for slot5 = 1, 2 do
		if slot1:getChildByName("attr_" .. slot5) then
			slot0.attr_list[slot5] = {
				item = slot6,
				icon = slot6:getChildByName("icon"),
				label = slot6:getChildByName("label")
			}
		end
	end

	slot0.close_btn = slot1:getChildByName("close_btn")
end

function HallowsTraceWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openHallowsTraceWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openHallowsTraceWindow(false)
		end
	end)
	slot0.upgrade_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()

			if uv0.data then
				if uv0.this_use_num == 0 then
					uv1:openHallowsTraceWindow(false)
				elseif uv0.num == 0 then
					message(TI18N("使用数量不能为0"))
				else
					uv1:requestUseTraceItem(uv0.data.id, uv0.num)
				end
			end
		end
	end)

	if slot0.slider ~= nil then
		slot0.slider:addEventListener(function (slot0, slot1)
			if slot1 == ccui.SliderEventType.percentChanged then
				uv0:setComposeNumByPercent(uv0.slider:getPercent())
			end
		end)
	end

	slot0.min_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.slider:getPercent() == 0 then
				return
			end

			if uv0.num == 0 then
				return
			end

			if uv0.this_use_num == 0 then
				return
			end

			uv0.num = uv0.num - 1

			uv0:setComposeNum(uv0.num)
		end
	end)
	slot0.plus_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.slider:getPercent() == 100 then
				return
			end

			if uv0.this_use_num == 0 then
				return
			end

			if uv0.this_use_num <= uv0.num then
				return
			end

			uv0.num = uv0.num + 1

			uv0:setComposeNum(uv0.num)
		end
	end)
	slot0.max_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.slider:getPercent() == 100 then
				return
			end

			if uv0.this_use_num == 0 then
				return
			end

			uv0.num = uv0.this_use_num

			uv0:setComposeNum(uv0.num)
		end
	end)
end

function HallowsTraceWindow.setComposeNum(slot0, slot1)
	slot0.num = slot1

	slot0.slider:setPercent(100 * slot0.num / slot0.this_use_num)
	slot0:fileNum(slot1)
end

function HallowsTraceWindow.setComposeNumByPercent(slot0, slot1)
	slot0.num = math.floor(slot1 * slot0.this_use_num * 0.01)

	slot0:fileNum(slot0.num)
end

function HallowsTraceWindow.fileNum(slot0, slot1)
	if slot0.had_max_num == nil then
		return
	end

	slot0.cost_item:setNeedNum(slot1, slot0.had_max_num)
end

function HallowsTraceWindow.openRootWnd(slot0, slot1)
	slot0.data = slot1

	if slot1 and slot1.vo and slot0.cost_config then
		slot0.had_use_num = slot1.vo.seal
		slot0.use_max_num = slot0:getUseMaxNum()

		if slot0.use_max_num == 0 then
			return
		end

		if Config.HallowsData.data_max_lev[slot0.data.id] == nil then
			return
		end

		slot3 = slot0.data.vo.step

		if slot0.had_use_num < slot0.use_max_num then
			slot0.can_use_label:setString(uv0(TI18N("当前已使用:%s/%s"), slot0.had_use_num, slot0.use_max_num))
		elseif slot2 <= slot3 then
			slot0.can_use_label:setString(uv0(TI18N("已达最大使用数量:%s/%s"), slot0.had_use_num, slot0.use_max_num))
		elseif Config.HallowsData.data_trace_cost(getNorKey(slot0.data.id, slot3 + 1)) then
			slot0.can_use_label:setString(uv0(TI18N("圣器%s阶可增加使用数量:%s"), slot3 + 1, slot4.num - slot0.had_use_num))
		end

		slot0.can_use_num = slot0.use_max_num - slot0.had_use_num

		if slot0.can_use_num < 0 then
			slot0.can_use_num = 0
		end

		slot0.had_max_num = uv1:getBackPackItemNumByBid(slot0.cost_config.val)

		slot0.cost_item:setBaseData(slot0.cost_config.val, slot0.had_max_num)

		slot0.this_use_num = math.min(slot0.can_use_num, slot0.had_max_num)
		slot0.num = slot0.this_use_num

		slot0:setComposeNum(slot0.num)
		slot0:setBaseAttrList()
	end
end

function HallowsTraceWindow.setBaseAttrList(slot0)
	if slot0.cost_config == nil then
		return
	end

	if slot0.attr_config == nil then
		return
	end

	if slot0.had_use_num == nil then
		slot0.had_use_num = 0
	end

	for slot4, slot5 in ipairs(slot0.attr_list) do
		slot5.item:setVisible(false)
	end

	for slot4, slot5 in ipairs(slot0.attr_config.val) do
		if Config.AttrData.data_key_to_name[slot5[1]] then
			if slot0.attr_list[slot4] then
				slot11.item:setVisible(true)
				loadSpriteTexture(slot11.icon, PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot6)))
				slot11.label:setString(uv0(TI18N(" %s +%s"), slot8, slot5[2] * slot0.had_use_num))
			end
		end
	end
end

function HallowsTraceWindow.getUseMaxNum(slot0)
	if slot0.data == nil or slot0.data.vo == nil then
		return
	end

	if Config.HallowsData.data_trace_cost(getNorKey(slot0.data.id, slot0.data.vo.step)) then
		return slot1.num
	end

	return 0
end

function HallowsTraceWindow.close_callback(slot0)
	if slot0.cost_item then
		slot0.cost_item:DeleteMe()
	end

	slot0.cost_item = nil

	uv0:openHallowsTraceWindow(false)
end
