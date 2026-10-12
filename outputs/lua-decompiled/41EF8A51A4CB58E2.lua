ItemSellPanel = ItemSellPanel or BaseClass(BaseView)
slot0 = BackpackController:getInstance()

function ItemSellPanel.__init(slot0)
	slot0.ctrl = BackpackController:getInstance()
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "backpack/item_sell_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.cur_number = 1
	slot0.init_number = 1
end

function ItemSellPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.text_name = slot0.main_panel:getChildByName("text_name")

	slot0.text_name:enableOutline(Config.ColorData.data_color4[2], 1)
	slot0.text_name:setString("")

	slot0.btn_redu = slot0.main_panel:getChildByName("btn_redu")
	slot0.btn_add = slot0.main_panel:getChildByName("btn_add")
	slot0.comp_num = slot0.main_panel:getChildByName("Image_2"):getChildByName("comp_num")

	slot0.comp_num:setString("")

	slot0.btn_comp = slot0.main_panel:getChildByName("btn_comp")
	slot0.btn_comp_label = slot0.btn_comp:getChildByName("Text_1")

	slot0.btn_comp_label:setString(TI18N("出售"))

	slot0.goods_item = BackPackItem.new(true, true, nil, 1, false)

	slot0.goods_item:setPosition(cc.p(slot0.main_panel:getContentSize().width / 2, 276))
	slot0.main_panel:addChild(slot0.goods_item)

	slot2, slot3 = slot0.main_panel:getChildByName("cost_bg_2014"):getPosition()
	slot0.cost_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(slot2, slot3))

	slot0.cost_label:setString("")
	slot0.main_panel:addChild(slot0.cost_label)

	slot0.sell_tips = slot0.main_panel:getChildByName("sell_tips")

	slot0.sell_tips:setVisible(false)

	slot5 = createEditBox(slot0.main_panel, PathTool.getResFrame("common", "common_99998"), cc.size(200, 40), nil, 22, nil, 22, "", nil, nil, LOADTEXT_TYPE_PLIST)
	slot0.edit_content = slot5

	slot5:setAnchorPoint(cc.p(0.5, 0.5))
	slot5:setPlaceholderFontColor(cc.c4b(255, 246, 228, 255))
	slot5:setFontColor(cc.c4b(255, 246, 228, 255))
	slot5:setPosition(cc.p(299, 188))

	slot6 = false

	slot5:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0 then
				uv0 = false

				uv1.comp_num:setVisible(true)
				slot1:setText("")

				if slot1:getText() ~= "" and slot2 ~= uv1.input_text then
					if tonumber(slot2) ~= nil and slot3 > 0 then
						uv1:checkShowNum(slot3)
					else
						uv1:checkShowNum(0)
						message(TI18N("请输入数字"))
					end
				else
					uv1:checkShowNum(0)
				end
			end
		elseif slot0 == "began" then
			if not uv0 then
				uv1.comp_num:setVisible(false)

				uv0 = true
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)
end

function ItemSellPanel.checkShowNum(slot0, slot1)
	slot0.cur_number = slot1

	if slot0.cur_number <= 0 then
		slot0.cur_number = 1
	elseif slot0.init_number <= slot0.cur_number then
		slot0.cur_number = slot0.init_number
	end

	slot0:setBtnStatus()
	slot0.comp_num:setString(slot0.cur_number)
	slot0:setCostInfo(slot0.cur_number)
end

function ItemSellPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openItemSellPanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_redu, function ()
		uv0.cur_number = uv0.cur_number - 1

		if uv0.cur_number < 1 then
			uv0.cur_number = 1
		end

		uv0:setBtnStatus()
		uv0.comp_num:setString(uv0.cur_number)
		uv0:setCostInfo(uv0.cur_number)
	end, true, 1)
	registerButtonEventListener(slot0.btn_add, function ()
		uv0.cur_number = uv0.cur_number + 1

		if uv0.init_number < uv0.cur_number then
			uv0.cur_number = uv0.init_number
		end

		uv0:setBtnStatus()
		uv0.comp_num:setString(uv0.cur_number)
		uv0:setCostInfo(uv0.cur_number)
	end, true, 1)
	registerButtonEventListener(slot0.btn_comp, function ()
		if not uv0.goods_vo then
			return
		end

		if uv0.cur_number < 0 then
			return
		end

		if uv0.open_type == 2 then
			if uv0.item_config and uv0.item_config.value and next(uv0.item_config.value) ~= nil then
				slot0 = {}

				for slot4, slot5 in ipairs(uv0.item_config.value) do
					table.insert(slot0, {
						id = slot5[1],
						num = slot5[2] * uv0.cur_number
					})
				end

				HeroController:getInstance():openHeroResetOfferPanel(true, slot0, false, function ()
					uv0:sender10522(uv1.bag_type, {
						{
							id = uv1.goods_vo.id,
							bid = uv1.goods_vo.base_id,
							num = uv1.cur_number
						}
					})
				end, HeroConst.ResetType.eFunriture, string.format(TI18N("出售家具<div fontcolor=%s>【%s*%d】</div>可获得以下资源："), BackPackConst.getWhiteQualityColorStr(uv0.item_config.quality), uv0.item_config.name, uv0.cur_number))
			end

			uv1:openItemSellPanel(false)
		elseif uv0.open_type == 4 then
			if uv0.setting and uv0.setting.btn_cb then
				uv0.setting.btn_cb(uv0.cur_number)
			end

			uv1:openItemSellPanel(false)
		else
			uv0:senderProto(true)
		end
	end, true, 1)

	if not slot0.elfin_plan_tips_event then
		slot0.elfin_plan_tips_event = GlobalEvent:getInstance():Bind(ElfinEvent.Elfin_Plan_Must_Tips_Event, function (slot0)
			if slot0 and slot0.flag == TRUE then
				uv0:showTips(slot0)
			else
				uv0:senderProto(false)
			end
		end)
	end
end

function ItemSellPanel.showTips(slot0, slot1)
	slot3 = nil

	CommonAlert.show((slot1.type ~= 0 or string.format(TI18N("<div fontcolor=%s>【%s】</div>幽灵已在玩法中上阵，放生后幽灵将被下阵，是否确认放生？"), BackPackConst.getWhiteQualityColorStr(slot0.item_config.quality), slot0.item_config.name)) and string.format(TI18N("<div fontcolor=%s>【%s】</div>幽灵已在方案【%s】中上阵，放生后幽灵将被下阵，是否确认放生？"), BackPackConst.getWhiteQualityColorStr(slot0.item_config.quality), slot0.item_config.name, slot1.name), TI18N("确定"), function ()
		uv0:senderProto(false)
	end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, nil, true)
end

function ItemSellPanel.senderProto(slot0, slot1)
	if slot1 then
		if slot0.item_config.sub_type == BackPackConst.item_tab_type.ELFIN then
			ElfinController:getInstance():send26563(slot0.goods_vo.base_id, slot0.cur_number)
		else
			uv0:sender10522(slot0.bag_type, {
				{
					id = slot0.goods_vo.id,
					bid = slot0.goods_vo.base_id,
					num = slot0.cur_number
				}
			})
			uv0:openItemSellPanel(false)
		end
	else
		uv0:sender10522(slot0.bag_type, {
			{
				id = slot0.goods_vo.id,
				bid = slot0.goods_vo.base_id,
				num = slot0.cur_number
			}
		})
		uv0:openItemSellPanel(false)
	end
end

function ItemSellPanel.setBtnStatus(slot0)
	if slot0.init_number == 1 then
		slot0:setTouchEnable_Redu(true)
		slot0:setTouchEnable_Add(true)
	elseif slot0.cur_number == 1 then
		slot0:setTouchEnable_Redu(true)
		slot0:setTouchEnable_Add(false)
	elseif slot0.cur_number == slot0.init_number then
		slot0:setTouchEnable_Redu(false)
		slot0:setTouchEnable_Add(true)
	else
		slot0:setTouchEnable_Redu(false)
		slot0:setTouchEnable_Add(false)
	end
end

function ItemSellPanel.setTouchEnable_Add(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_add)
	slot0.btn_add:setTouchEnabled(not slot1)
end

function ItemSellPanel.setTouchEnable_Redu(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_redu)
	slot0.btn_redu:setTouchEnabled(not slot1)
end

function ItemSellPanel.openRootWnd(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	slot0.open_type = slot3 or 1
	slot0.bag_type = slot2 or BackPackConst.Bag_Code.BACKPACK
	slot0.goods_vo = slot1
	slot0.item_config = slot1.config
	slot0.setting = slot4

	slot0:setBaseInfo(slot0.cur_number)

	if slot0.open_type == 3 then
		if Config.SpriteData.data_elfin_data(slot0.item_config.id) and slot5.step >= 4 or slot0.item_config.quality >= 4 then
			setChildUnEnabled(true, slot0.btn_comp)
			slot0.btn_comp_label:disableEffect(cc.LabelEffect.OUTLINE)
			slot0.btn_comp:setTouchEnabled(false)

			slot0.timer = 3

			slot0.btn_comp_label:setString(string.format("%s(%s)", TI18N("羽化"), slot0.timer))
			slot0:showAutoBtnTimer()
			slot0.sell_tips:setVisible(true)
		else
			slot0.btn_comp_label:setString(TI18N("羽化"))
		end

		if not slot0.elfin_tips then
			slot0.elfin_tips = createRichLabel(22, cc.c4b(224, 191, 152, 255), cc.p(0.5, 0.5), cc.p(299, 390), nil, nil, 590)

			slot0.main_panel:addChild(slot0.elfin_tips)
		end

		slot0.elfin_tips:setString(TI18N("珍兽羽化后将<div fontcolor=#ff0000>消失</div>，您将得到相应数量的珍兽之尘"))
	elseif slot0.open_type == 4 then
		if slot0.setting and slot0.setting.btn then
			slot0.btn_comp_label:setString(slot0.setting.btn)
		else
			slot0.btn_comp_label:setString(TI18N("拆分"))
		end
	else
		slot0.btn_comp_label:setString(TI18N("出售"))
	end
end

function ItemSellPanel.showAutoBtnTimer(slot0)
	if not slot0.timer then
		return
	end

	slot0.timer_id = GlobalTimeTicket:getInstance():add(function ()
		if uv0.timer > 1 then
			uv0.timer = uv0.timer - 1

			uv0.btn_comp_label:setString(string.format("%s(%s)", TI18N("放生"), uv0.timer))
		else
			uv0.btn_comp_label:setString(TI18N("放生"))
			uv0.sell_tips:setVisible(false)
			setChildUnEnabled(false, uv0.btn_comp)
			uv0.btn_comp:setTouchEnabled(true)
			uv0.btn_comp_label:enableOutline(Config.ColorData.data_color4[264], 2)
		end
	end, 1, slot0.timer)
end

function ItemSellPanel.setBaseInfo(slot0)
	if not slot0.item_config then
		return
	end

	slot0.goods_item:setData(slot0.goods_vo)
	slot0.text_name:setString(slot0.item_config.name)

	if BackPackConst.getEquipTipsColor(slot0.item_config.quality) then
		slot0.text_name:setTextColor(slot1)
	end

	if slot0.item_config.overlap > 1 then
		slot2 = BackpackController:getInstance():getModel():getPackItemNumByBid(slot0.bag_type, slot0.item_config.id)

		if slot0.open_type == 2 then
			if slot0.goods_vo.bag_num < slot0.goods_vo.have_num then
				slot0.init_number = slot0.goods_vo.bag_num
			else
				slot0.init_number = slot0.goods_vo.have_num
			end

			if slot0.init_number > 1 then
				slot0.cur_number = slot0.init_number - 1
			else
				slot0.cur_number = 1
			end
		else
			slot0.cur_number = slot2
			slot0.init_number = slot2
		end
	else
		slot0.cur_number = 1
		slot0.init_number = slot0.cur_number
	end

	slot0.comp_num:setString(slot0.cur_number)
	slot0:setBtnStatus()
	slot0:setCostInfo(slot0.cur_number)
end

function ItemSellPanel.setCostInfo(slot0, slot1)
	if slot0.open_type == 4 and slot0.setting and slot0.setting.cost_cb then
		slot0.cost_label:setString(slot0.setting.cost_cb(slot1))

		return
	end

	if not slot0.item_config then
		return
	end

	if slot0.item_config.value and next(slot0.item_config.value) ~= nil then
		if Config.ItemData.data_get_data(slot0.item_config.value[1][1]) then
			slot0.cost_label:setString(string.format("<img src=%s scale=0.35 visible=true /><div fontColor=#FFF6DD>%s</div>", PathTool.getItemRes(slot5.icon), slot0.cur_number * slot0.item_config.value[1][2]))
		end
	end
end

function ItemSellPanel.close_callback(slot0)
	if slot0.elfin_plan_tips_event then
		GlobalEvent:getInstance():UnBind(slot0.elfin_plan_tips_event)

		slot0.elfin_plan_tips_event = nil
	end

	if slot0.timer_id then
		GlobalTimeTicket:getInstance():remove(slot0.timer_id)
	end

	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0.goods_item = nil

	uv0:openItemSellPanel(false)
end
