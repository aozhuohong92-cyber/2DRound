EmoguoshiBagView = EmoguoshiBagView or BaseClass(BaseView)
slot0 = EmoguoshiController:getInstance()

function EmoguoshiBagView.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.layout_name = "emoguoshitujian/emoguoshi_bag_panel"
	slot0.res_list = {}
end

function EmoguoshiBagView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("bg")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot1 = slot0.main_panel:getChildByName("title")

	slot1:setString(TI18N(slot1:getString()))

	slot2 = slot0.main_panel:getChildByName("tips")

	slot2:setString(TI18N(slot2:getString()))

	slot0.btn_close = slot0.main_panel:getChildByName("close_btn")
	slot3 = slot0.main_panel:getChildByName("Panel_4"):getChildByName("ListView_1")

	slot3:setScrollBarEnabled(false)
	slot3:setTouchEnabled(false)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		once_num = 5,
		start_x = 0,
		item_width = 119,
		space_x = 6.25,
		row = 5,
		item_height = 119,
		space_y = 10,
		col = 5,
		item_class = BackPackItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function EmoguoshiBagView.register_event(slot0)
	slot0.background:setTouchEnabled(true)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEmoguoBagView(false)
		end
	end)
	slot0.btn_close:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openEmoguoBagView(false)
	end, true)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		uv0:updateData()
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		uv0:updateData()
	end)
end

function EmoguoshiBagView.updateData(slot0, ...)
	slot1 = {}
	slot1 = BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.EMOGUOSHI, true)

	table.sort(slot1, function (slot0, slot1)
		if slot0.base_id ~= slot1.base_id then
			return slot0.base_id < slot1.base_id
		end

		return slot0.id < slot1.id
	end)
	slot0.item_scrollview:setSpace(10)
	slot0.item_scrollview:setData(slot1, function (slot0, slot1)
		uv0:selectedItem(slot0)
	end)
end

function EmoguoshiBagView.selectedItem(slot0, slot1, slot2)
	if slot1 and slot1:getData() then
		if slot1:getData() == nil or slot3.config == nil or slot3.config.type == nil then
			return
		end

		slot4 = {
			1
		}

		if uv0:isHadJueXing(uv0:getSuiPianToGuoShi(slot3.base_id)) then
			slot4 = {
				1,
				52
			}
		end

		TipsManager:getInstance():showGoodsTips(slot3, true, false, {
			btns = slot4,
			emoguoshi_fenjie_cb = function (...)
				if uv0.quantity > 1 then
					BackpackController:getInstance():openItemSellPanel(true, uv0, BackPackConst.Bag_Code.BACKPACK, 4, {
						btn = TI18N("分解"),
						btn_cb = function (slot0)
							EmoguoshiController:getInstance():reqFenJie(uv0.id, slot0)
						end,
						cost_cb = function (slot0)
							slot1 = nil
							slot1 = (uv0.quality ~= 3 or Config.EmoguoshitujianData.data_const.emo_fenjie_zi.val) and Config.EmoguoshitujianData.data_const.emo_fenjie_cheng.val

							if Config.ItemData.data_get_data(slot1[1]) then
								return string.format("<img src=%s scale=0.35 visible=true /><div fontColor=#FFF6DD>%s</div>", PathTool.getItemRes(slot5.icon), slot0 * slot1[2])
							end

							return ""
						end
					})
				else
					EmoguoshiController:getInstance():reqFenJie(uv0.id, uv0.quantity)
				end
			end
		})
	end
end

function EmoguoshiBagView.openRootWnd(slot0)
	slot0:updateData()
end

function EmoguoshiBagView.close_callback(slot0)
	uv0:openEmoguoBagView(false)
end
