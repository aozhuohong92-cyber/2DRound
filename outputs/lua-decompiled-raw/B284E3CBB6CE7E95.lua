HeroResonateSelectExpPanel = HeroResonateSelectExpPanel or BaseClass(BaseView)
slot0 = HeroController:getInstance()

function HeroResonateSelectExpPanel.__init(slot0)
	slot0.ctrl = BackpackController:getInstance()
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "hero/hero_resonate_select_exp_panel"
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

function HeroResonateSelectExpPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.text_name = slot0.main_panel:getChildByName("text_name")

	slot0.text_name:setString("")

	slot0.btn_redu = slot0.main_panel:getChildByName("btn_redu")
	slot0.btn_add = slot0.main_panel:getChildByName("btn_add")
	slot0.comp_num = slot0.main_panel:getChildByName("Image_2"):getChildByName("comp_num")

	slot0.comp_num:setString("")

	slot0.btn_comp = slot0.main_panel:getChildByName("btn_comp")

	slot0.btn_comp:getChildByName("Text_1"):setString(TI18N("放入"))

	slot0.goods_item = BackPackItem.new(true, true, nil, 1, false)

	slot0.goods_item:setPosition(cc.p(slot0.main_panel:getContentSize().width / 2, 342))
	slot0.main_panel:addChild(slot0.goods_item)

	slot2, slot3 = slot0.main_panel:getChildByName("cost_bg_2014"):getPosition()
	slot0.cost_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(slot2, slot3))

	slot0.cost_label:setString("")
	slot0.main_panel:addChild(slot0.cost_label)

	slot0.tips1 = slot0.main_panel:getChildByName("tips1")
	slot0.tips2 = slot0.main_panel:getChildByName("tips2")

	slot0.tips2:setString(TI18N("点击数字框编辑本次提炼的材料个数"))

	slot5 = createEditBox(slot0.main_panel, PathTool.getResFrame("common", "common_99998"), cc.size(194, 40), nil, 22, nil, 22, "", nil, , LOADTEXT_TYPE_PLIST)
	slot0.edit_content = slot5

	slot5:setAnchorPoint(cc.p(0.5, 0.5))
	slot5:setPlaceholderFontColor(cc.c4b(255, 246, 228, 255))
	slot5:setFontColor(cc.c4b(255, 246, 228, 255))
	slot5:setPosition(cc.p(299, 239))

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
						uv1:checkShowNum(uv1.init_number)
						message(TI18N("请输入数字"))
					end
				else
					uv1:checkShowNum(uv1.init_number)
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

function HeroResonateSelectExpPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHeroResonateSelectExpPanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_redu, function ()
		uv0.cur_number = uv0.cur_number - 1

		if uv0.cur_number < 1 then
			uv0.cur_number = 1
		end

		uv0:checkShowNum()
	end, true, 1)
	registerButtonEventListener(slot0.btn_add, function ()
		uv0.cur_number = uv0.cur_number + 1

		if uv0.init_number < uv0.cur_number then
			uv0.cur_number = uv0.init_number
		end

		uv0:checkShowNum()
	end, true, 1)
	registerButtonEventListener(slot0.btn_comp, function ()
		if uv0.cur_number then
			uv1:sender26411(uv0.cur_number)
			uv1:openHeroResonateSelectExpPanel(false)
		end
	end, true, 1)
end

function HeroResonateSelectExpPanel.checkShowNum(slot0, slot1)
	if slot1 then
		slot0.cur_number = slot1

		if slot0.init_number < slot0.cur_number then
			slot0.cur_number = slot0.init_number
		end
	end

	slot0:setBtnStatus()
	slot0.comp_num:setString(slot0.cur_number)
	slot0:setCostInfo(slot0.cur_number)
end

function HeroResonateSelectExpPanel.setBtnStatus(slot0)
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

function HeroResonateSelectExpPanel.setTouchEnable_Add(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_add)
	slot0.btn_add:setTouchEnabled(not slot1)
end

function HeroResonateSelectExpPanel.setTouchEnable_Redu(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_redu)
	slot0.btn_redu:setTouchEnabled(not slot1)
end

function HeroResonateSelectExpPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.limit_count = slot2.limit_count
	slot0.target_item_id = slot2.target_item_id or 1
	slot0.cost_item_id = slot2.cost_item_id or Config.ItemData.data_assets_label2id.hero_exp
	slot0.price = slot2.price or 1
	slot0.item_config = Config.ItemData.data_get_data(slot0.target_item_id)
	slot0.cost_item_config = Config.ItemData.data_get_data(slot0.cost_item_id)
	slot0.bag_type = slot2.bag_type or BackPackConst.Bag_Code.BACKPACK

	slot0:setBaseInfo()
end

function HeroResonateSelectExpPanel.setBaseInfo(slot0)
	if not slot0.item_config then
		return
	end

	if not slot0.cost_item_config then
		return
	end

	slot0.goods_item:setBaseData(slot0.item_config.id, 1)
	slot0.text_name:setString(slot0.item_config.name)

	if slot0.limit_count then
		slot0.init_number = slot0.limit_count

		if slot0.limit_count < math.floor(slot0.ctrl:getModel():getItemNumByBid(slot0.cost_item_config.id, slot0.bag_type) / slot0.price) then
			slot0.cur_number = slot0.limit_count
		else
			slot0.cur_number = slot2
		end
	else
		slot0.init_number = slot2
		slot0.cur_number = slot2
	end

	if slot0.cur_number == 0 then
		slot0.cur_number = 1
	end

	if slot0.init_number == 0 then
		slot0.init_number = 1
	end

	slot0.tips1:setString(string.format(TI18N("本次提炼上限:%s个"), slot0.init_number))
	slot0.comp_num:setString(slot0.cur_number)
	slot0:setBtnStatus()
	slot0:setCostInfo(slot0.cur_number)
end

function HeroResonateSelectExpPanel.setCostInfo(slot0, slot1)
	if not slot0.cost_item_config then
		return
	end

	slot4 = PathTool.getItemRes(slot0.cost_item_config.icon)
	slot5 = nil

	slot0.cost_label:setString((slot0.ctrl:getModel():getItemNumByBid(slot0.cost_item_config.id, slot0.bag_type) >= slot1 * slot0.price or string.format("<img src=%s scale=0.35 visible=true /><div fontColor=#FF0000>%s</div>", slot4, slot2)) and string.format("<img src=%s scale=0.35 visible=true /><div fontColor=#FFF6DD>%s</div>", slot4, slot2))
end

function HeroResonateSelectExpPanel.close_callback(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0.goods_item = nil

	uv0:openHeroResonateSelectExpPanel(false)
end
