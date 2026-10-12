CompChooseTips = CompChooseTips or BaseClass(BaseView)
slot0 = Config.PartnerData.data_get_compound_info

function CompChooseTips.__init(slot0)
	slot0.ctrl = BackpackController:getInstance()
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "tips/comp_choose_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.cur_number = nil
	slot0.init_number = 1
end

slot1 = 500

function CompChooseTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_panel")
	slot0.text_name = slot1:getChildByName("text_name")

	slot0.text_name:setString("")

	slot0.btn_redu = slot1:getChildByName("btn_redu")
	slot0.btn_add = slot1:getChildByName("btn_add")
	slot0.comp_num_text = slot1:getChildByName("comp_num")

	slot0.comp_num_text:setString("")

	slot0.btn_comp = slot1:getChildByName("btn_comp")
	slot0.btn_comp_label = slot0.btn_comp:getChildByName("Text_1")

	slot0.btn_comp_label:setString(TI18N("合成"))
	slot0.btn_comp_label:enableOutline(Config.ColorData.data_color4[264], 2)
	slot1:getChildByName("Text_2"):setString(TI18N("点击数字框可输入数字"))

	slot0.comp_number_edit = createEditBox(slot1:getChildByName("comp_node"), PathTool.getResFrame("common", "common_1021"), cc.size(194, 41), cc.c4b(0, 0, 0, 255), 26, cc.c4b(0, 0, 0, 255), 26, "", nil, 6, LOADTEXT_TYPE_PLIST)

	slot0.comp_number_edit:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)
	slot0.comp_number_edit:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "ended" then
			slot1:setText("")
			uv0.comp_num_text:setVisible(true)

			if slot1:getText() ~= "" then
				if tonumber(slot2) == nil then
					slot3 = 0
				end

				if slot3 <= 0 then
					slot3 = 1

					uv0:setTouchEnable_Add(false)
					uv0:setTouchEnable_Redu(true)
				elseif uv0.init_number <= slot3 then
					uv0:setTouchEnable_Add(true)
					uv0:setTouchEnable_Redu(false)
				else
					uv0:setTouchEnable_Add(false)
					uv0:setTouchEnable_Redu(false)
				end

				if uv1 <= slot3 then
					slot3 = uv1
				end

				uv0.comp_num_text:setString(slot3)

				uv0.cur_number = slot3
			else
				message(TI18N("需写入合成数量哦~~"))
				uv0.comp_num_text:setString("")

				uv0.cur_number = nil

				return
			end
		elseif slot0 == "began" then
			uv0.comp_num_text:setVisible(false)
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)

	slot0.goods_item = BackPackItem.new(true, true, nil, 1, false)

	slot0.goods_item:setPosition(cc.p(slot1:getContentSize().width / 2, 279))
	slot1:addChild(slot0.goods_item)
end

function CompChooseTips.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:close()
		TipsManager:getInstance():showCompChooseTips(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_redu, function ()
		if uv0.cur_number then
			uv0:touch_redu()
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_add, function ()
		if uv0.cur_number then
			uv0:touch_add()
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_comp, function ()
		if not uv0.cur_number then
			return
		end

		if uv0.cur_number < 1 then
			if uv0.view_type == 2 or uv0.view_type == 3 then
				message(TI18N("使用数量不能少于1"))
			else
				message(TI18N("合成数量不能少于1"))
			end

			return
		end

		if uv0.init_number < uv0.cur_number then
			if uv0.view_type == 2 or uv0.view_type == 3 then
				message(TI18N("背包物品数量不足"))
			else
				message(TI18N("背包碎片数量不足"))
			end

			return
		end

		if uv0.item_config then
			if uv0.view_type == 2 then
				if Config.HolidayPetardData.data_const.firework_bid and slot0.val == uv0.item_config.id then
					PetardActionController:getInstance():openAffirmWindow(true, uv0.item_config.id, uv0.cur_number)
				else
					PetardActionController:getInstance():sender27001(uv0.item_config.id, uv0.cur_number)
				end

				TipsManager:getInstance():showCompChooseTips(false)
			elseif uv0.view_type == 3 then
				ActionController:getInstance():sender28502(uv0.item_config.id, uv0.cur_number)
				TipsManager:getInstance():showCompChooseTips(false)
			elseif uv1[uv0.item_config.id] then
				BackpackController:getInstance():sender11008(uv0.item_config.id, uv0.cur_number)
			end
		end
	end, true, 1)
end

function CompChooseTips.touch_redu(slot0)
	slot0.cur_number = slot0.cur_number - 1

	if slot0.cur_number < slot0.init_number then
		slot0:setTouchEnable_Add(false)
		slot0:setTouchEnable_Redu(false)
	end

	if slot0.cur_number <= 1 then
		slot0:setTouchEnable_Add(false)
		slot0:setTouchEnable_Redu(true)
	end

	slot0.comp_num_text:setString(slot0.cur_number)
end

function CompChooseTips.touch_add(slot0)
	slot0.cur_number = slot0.cur_number + 1

	if slot0.cur_number > 1 then
		slot0:setTouchEnable_Add(false)
		slot0:setTouchEnable_Redu(false)
	end

	if slot0.init_number <= slot0.cur_number then
		slot0:setTouchEnable_Add(true)
		slot0:setTouchEnable_Redu(false)
	end

	slot0.comp_num_text:setString(slot0.cur_number)
end

function CompChooseTips.setTouchEnable_Add(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_add)
	slot0.btn_add:setTouchEnabled(not slot1)
end

function CompChooseTips.setTouchEnable_Redu(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_redu)
	slot0.btn_redu:setTouchEnabled(not slot1)
end

function CompChooseTips.openRootWnd(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.view_type = slot2 or 1
	slot0.item_config = Config.ItemData.data_get_data(slot1)

	slot0:setBaseInfo()
end

function CompChooseTips.setBaseInfo(slot0)
	if slot0.item_config == nil then
		return
	end

	slot0.goods_item:setBaseData(slot0.item_config.id)
	slot0.text_name:setString(slot0.item_config.name)

	if slot0.view_type == 2 or slot0.view_type == 3 then
		slot0.btn_comp_label:setString(TI18N("使用"))

		slot0.cur_number = BackpackController:getModel():getBackPackItemNumByBid(slot0.item_config.id)
		slot0.init_number = slot0.cur_number
	else
		slot2 = 1
		slot0.cur_number = math.floor(slot1 / ((not uv0[slot0.item_config.id] or uv0[slot0.item_config.id].num) and BackpackController:getModel():getHallowsCompData(slot0.item_config.id).num))
		slot0.init_number = slot0.cur_number
	end

	slot0.comp_num_text:setString(slot0.cur_number)
	slot0:setTouchEnable_Add(true)
end

function CompChooseTips.close_callback(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0.goods_item = nil

	TipsManager:getInstance():showCompChooseTips(false)
end
