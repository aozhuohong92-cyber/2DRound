ResourcePanel = class("ResourcePanel", function ()
	return ccui.Widget:create()
end)
slot0 = 5

function ResourcePanel.ctor(slot0)
	slot0.ctrl = StrongerController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.item_list = {}

	slot0:configUI()
	slot0:register_event()
end

function ResourcePanel.configUI(slot0)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(cc.size(620, 770))
	slot0.root_wnd:setAnchorPoint(0, 0)
	slot0:addChild(slot0.root_wnd)

	slot0.bg = createScale9Sprite(PathTool.getResFrame("common", "common_1034"), slot0.root_wnd:getContentSize().width / 2, slot0.root_wnd:getContentSize().height / 2, LOADTEXT_TYPE_PLIST, slot0.root_wnd)

	slot0.bg:setContentSize(cc.size(617, 772))
	slot0.bg:setAnchorPoint(0.5, 0.5)

	slot0.scroll = createScrollView(slot0.bg:getContentSize().width, slot0.bg:getContentSize().height - 15, 1, 10, slot0.bg, ccui.ScrollViewDir.vertical)

	slot0:createItemList()
end

function ResourcePanel.createItemList(slot0)
	if Config.StrongerData.data_resource_one == nil then
		return
	end

	for slot5, slot6 in ipairs(slot1) do
		if slot6.final_sub_list == nil then
			slot6.final_sub_list = {}

			for slot10, slot11 in ipairs(slot6.sub_list) do
				table.insert(slot6.final_sub_list, slot11)
			end
		end
	end

	table.sort(slot1, SortTools.KeyLowerSorter("sort"))

	slot0.max_height = math.max((133 + uv0) * #slot1, slot0.scroll:getContentSize().height)
	slot5 = cc.size

	slot0.scroll:setInnerContainerSize(slot5(slot0.scroll:getContentSize().width, slot0.max_height))

	for slot5, slot6 in pairs(slot1) do
		delayRun(slot0.scroll, 0.05 * slot5, function ()
			slot0 = StrongerItem.new(2)

			slot0:setData(uv0)
			uv1.scroll:addChild(slot0)
			slot0:hideBg()
			slot0:setPosition(5, uv1.max_height - 3 - (133 + uv2) * (uv3 - 1))

			uv1.item_list[uv3] = slot0

			slot0:setBtnCallBack(function (slot0)
				if uv0.cur_select ~= nil and uv0.cur_index and uv0.cur_index ~= uv1 then
					uv0.cur_select:setSelect(false)
					uv0.cur_select:showMessagePanel(false)
				end

				uv0.cur_select = slot0
				uv0.cur_index = uv1

				if uv0.cur_select:getIsShow() then
					slot5 = cc.size

					uv0.scroll:setInnerContainerSize(slot5(uv0.scroll:getContentSize().width, uv0.max_height))

					for slot5, slot6 in pairs(uv0.item_list) do
						slot6:setPosition(5, uv0.max_height - 3 - (133 + uv2) * (slot5 - 1))
					end

					uv0.cur_select:setSelect(false)
					uv0.cur_select:showMessagePanel(false)
				else
					uv0.cur_select:setSelect(true)
					uv0.cur_select:showMessagePanel(true)
					uv0.cur_select:hideBgII()

					uv0.height = uv0.cur_select:getMsgPanleSize().height

					uv0:adjustPos()
				end

				slot2 = 0
				slot3 = uv0.max_height

				if uv0.height then
					slot3 = uv0.max_height + uv0.height
				end

				if uv0.cur_select then
					slot2 = uv0.cur_select:getPositionY() / slot3 * 100
					slot5 = (uv0.cur_index - 1) * 136 / uv0.max_height * 100

					if uv0.height then
						slot5 = (uv0.cur_index - 1) * 190 / slot3 * 100
					end

					uv0.scroll:jumpToPercentVertical(math.ceil(slot5))
				end
			end)
		end)
	end
end

function ResourcePanel.adjustPos(slot0)
	if slot0.cur_select ~= nil then
		slot6 = slot0.scroll:getContentSize().width

		slot0.scroll:setInnerContainerSize(cc.size(slot6, slot0.max_height + slot0.height))

		for slot5, slot6 in pairs(slot0.item_list) do
			if slot5 <= slot0.cur_index then
				slot6:setPosition(5, slot0.max_height + slot0.height - 3 - (133 + uv0) * (slot5 - 1))
			else
				slot6:setPosition(5, slot1 - slot0.height - 3 - (133 + uv0) * (slot5 - 1))
			end
		end
	end
end

function ResourcePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ResourcePanel.register_event(slot0)
end

function ResourcePanel.DeleteMe(slot0)
	doStopAllActions(slot0.scroll)

	if slot0.item_list and slot0.item_list ~= nil then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end
end
