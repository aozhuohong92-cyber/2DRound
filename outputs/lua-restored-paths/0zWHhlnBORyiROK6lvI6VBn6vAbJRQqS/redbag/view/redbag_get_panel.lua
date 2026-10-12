RedBagGetPanel = class("RedBagGetPanel", function ()
	return ccui.Widget:create()
end)
slot0 = table.sort

function RedBagGetPanel.ctor(slot0, slot1)
	slot0:config()
	slot0:layoutUI()
end

function RedBagGetPanel.config(slot0)
	slot0.ctrl = RedbagController:getInstance()
	slot0.size = cc.size(644, 740)

	slot0:setContentSize(slot0.size)
	slot0:setTouchEnabled(false)
end

function RedBagGetPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("redbag/redbag_get"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
end

function RedBagGetPanel.setData(slot0, slot1)
end

function RedBagGetPanel.registerEvents(slot0, slot1)
	if not slot1 then
		if slot0.update_data_event then
			GlobalEvent:getInstance():UnBind(slot0.update_data_event)

			slot0.update_data_event = nil
		end
	elseif not slot0.update_data_event then
		slot0.update_data_event = GlobalEvent:getInstance():Bind(RedbagEvent.Get_Data_Event, function ()
			uv0:updateBagList(true)
		end)
	end
end

function RedBagGetPanel.updateBagList(slot0, slot1)
	if not clone(slot0.ctrl:getModel():getRedBagList() or {}) or next(slot3) == nil then
		slot0:showEmptyIcon(true)

		if slot0.list_view then
			slot0.list_view:setVisible(false)
		end
	else
		slot0:showEmptyIcon(false)
		uv0(slot3, SortTools.KeyUpperSorter("order"))

		if not slot0.list_view then
			slot0.list_view = CommonScrollViewLayout.new(slot0.main_panel, cc.p(38, 43), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(570, 790), {
				start_y = 5,
				item_width = 262,
				start_x = 10,
				space_x = 23,
				row = 2,
				item_height = 327,
				space_y = 10,
				col = 2,
				need_dynamic = true,
				item_class = RedBagItem
			})
		end

		if slot1 == true then
			slot0.list_view:resetAddPosition(slot3)
		else
			slot0.list_view:setData(slot3, function (slot0, slot1)
				if slot1 and next(slot1) ~= nil then
					if slot0:getIsCanGet() == true then
						uv0.ctrl:sender13536(slot1.id)
						uv0.ctrl:setRedBagVo(slot1)
					else
						uv0.ctrl:openLookWindow(true, slot1)
					end
				end
			end)
		end
	end
end

function RedBagGetPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:registerEvents(slot1)

	if slot1 == true then
		slot0:updateBagList()
	end
end

function RedBagGetPanel.updateListData(slot0, slot1)
	slot2 = slot0.list_view:getItemList()
	slot3 = 1

	for slot7, slot8 in pairs(slot1) do
		if slot2[slot3] then
			slot2[slot3]:setData(slot8)
		end

		slot3 = slot3 + 1
	end
end

function RedBagGetPanel.showEmptyIcon(slot0, slot1)
	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot3 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot3)
		slot0.empty_con:setAnchorPoint(cc.p(0.5, 0))
		slot0.empty_con:setPosition(cc.p(slot0.main_panel:getContentSize().width / 2, 440))
		slot0.main_panel:addChild(slot0.empty_con, 10)

		slot5 = createImage(slot0.empty_con, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), slot3.width / 2, slot3.height / 2, cc.p(0.5, 0.5), false)
		slot0.empty_label = createLabel(26, Config.ColorData.data_color4[175], nil, slot3.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))
	end

	slot0.empty_label:setString(TI18N("当前没有可以抢的红包，不来一发吗？"))
	slot0.empty_con:setVisible(slot1)
end

function RedBagGetPanel.DeleteMe(slot0)
	if slot0.update_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_data_event)

		slot0.update_data_event = nil
	end

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end
end
