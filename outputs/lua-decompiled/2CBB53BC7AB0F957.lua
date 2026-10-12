FruitTreasureTips = FruitTreasureTips or BaseClass(BaseView)
slot0 = string.format
slot1 = table.insert
slot2 = FruitTreasureController:getInstance()
slot3 = FruitTreasureController:getInstance():getModel()

function FruitTreasureTips.__init(slot0)
	slot0.ctrl = BackpackController:getInstance()
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "fruit_treasure/fruit_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.btn_list = {}
	slot0.base_list = {}
	slot0.node_list = {}
	slot0.ex_list = {}
end

function FruitTreasureTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.container_init_size = slot0.container:getContentSize()
	slot0.base_panel = slot0.container:getChildByName("base_panel")
	slot0.goods_item = BackPackItem.new(true, true, nil, 1, false)

	slot0.goods_item:setPosition(cc.p(72, 68))
	slot0.base_panel:addChild(slot0.goods_item)

	slot0.name = slot0.base_panel:getChildByName("name")
	slot0.equip_type = slot0.base_panel:getChildByName("equip_type")
	slot0.score_title = slot0.base_panel:getChildByName("score_title")

	slot0.score_title:setVisible(false)

	slot0.extend_desc = createRichLabel(22, cc.c4b(255, 238, 221, 255), cc.p(0, 0), cc.p(146, 10), nil, nil, 500)

	slot0.base_panel:addChild(slot0.extend_desc)

	slot0.base_panel_height = slot0.base_panel:getContentSize().height
	slot0.attr_panel = slot0.container:getChildByName("baseattr_panel")

	slot0.attr_panel:getChildByName("label"):setString(TI18N("基础属性"))

	slot0.attr_panel_height = slot0.attr_panel:getContentSize().height
	slot0.growup_panel = slot0.container:getChildByName("growup_panel")

	slot0.growup_panel:getChildByName("label"):setString(TI18N("养成情况"))

	slot0.growup_panel_height = slot0.growup_panel:getContentSize().height
	slot0.node_panel = slot0.container:getChildByName("node_panel")

	slot0.node_panel:getChildByName("label"):setString(TI18N("节点效果"))

	slot0.node_panel_height = slot0.node_panel:getContentSize().height
	slot0.ex_panel = slot0.container:getChildByName("ex_panel")

	slot0.ex_panel:getChildByName("label"):setString(TI18N("阎浮神通"))

	slot0.ex_panel_height = slot0.ex_panel:getContentSize().height
	slot0.unlock_panel = slot0.container:getChildByName("unlock_panel")
	slot0.unlock_txt = slot0.unlock_panel:getChildByName("label")
	slot0.unlock_panel_height = slot0.unlock_panel:getContentSize().height
	slot0.desc_panel = slot0.container:getChildByName("desc_panel")
	slot0.desc_panel_size = slot0.desc_panel:getContentSize()
	slot0.desc_panel_height = slot0.desc_panel:getContentSize().height
	slot0.scroll_view = slot0.desc_panel:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)
	slot0.scroll_view:setTouchEnabled(true)

	slot0.scroll_size = slot0.scroll_view:getContentSize()
	slot0.desc_label = createRichLabel(22, cc.c4b(161, 151, 139, 255), cc.p(0, 1), cc.p(20, 100), 8, nil, 380)

	slot0.scroll_view:addChild(slot0.desc_label)

	slot4 = "tab_panel"
	slot0.tab_panel = slot0.container:getChildByName(slot4)
	slot0.tab_panel_height = slot0.tab_panel:getContentSize().height

	for slot4 = 1, 3 do
		if slot0.tab_panel:getChildByName("b_" .. slot4) then
			slot0.btn_list[slot4] = {
				btn = slot5,
				label = slot5:getTitleRenderer()
			}
		end
	end

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
end

function FruitTreasureTips.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:close()
			end
		end)
	end

	if slot0.close_btn then
		registerButtonEventListener(slot0.close_btn, function ()
			uv0:close()
		end, true, 2)
	end
end

function FruitTreasureTips.clickBtn(slot0, slot1)
	if not slot0.item_config then
		return
	end

	if slot1 == BackPackConst.tips_btn_type.source then
		slot2 = slot0.item_config.source or slot0.data.source
		slot3 = slot0.data

		if slot0.is_show_attr then
			slot3 = Config.ItemData.data_get_data(slot0.item_config.piece_id)
		end

		if slot0.is_show_unlock then
			slot2 = Config.ItemData.data_get_data(slot0.item_config.piece_id).source
		end

		if slot2 and #slot2 > 0 then
			slot0.ctrl:openTipsSource(true, slot3)
		else
			message(TI18N("暂时没有来源"))
		end
	elseif slot1 == BackPackConst.tips_btn_type.fruit_active then
		if slot0.item_config.id then
			uv0:send29600(slot2)
		end
	elseif slot1 == BackPackConst.tips_btn_type.fenjie then
		BackpackController:getInstance():openItemSellPanel(true, slot0.data, BackPackConst.Bag_Code.Fruit)
	elseif slot1 == BackPackConst.tips_btn_type.fruit_lvup then
		uv0:setFruitTreasureCultivateData(slot0.data, FruitTreasureConst.CultivateType.Lv)
		uv0:openFruitTreasureCultivateView(true)
	elseif slot1 == BackPackConst.tips_btn_type.fruit_starup then
		uv0:setFruitTreasureCultivateData(slot0.data, FruitTreasureConst.CultivateType.Star)
		uv0:openFruitTreasureCultivateView(true)
	end

	slot0:close()
end

function FruitTreasureTips.openRootWnd(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if not slot1 then
		return
	end

	slot0.setting = slot7 or {}
	slot0.is_show_btn = slot2 or false
	slot0.is_show_gropup = slot3 or false
	slot0.is_show_attr = slot4 or false
	slot0.is_show_unlock = slot5 or false
	slot0.is_show_fenjie = slot6 or false

	slot0.growup_panel:setVisible(slot0.is_show_gropup)
	slot0.attr_panel:setVisible(slot0.is_show_attr)
	slot0.node_panel:setVisible(slot0.is_show_attr)
	slot0.ex_panel:setVisible(slot0.is_show_attr)
	slot0.unlock_panel:setVisible(slot0.is_show_unlock)

	if type(slot1) == "number" then
		if not Config.ItemData.data_get_data(slot1) then
			return
		end

		slot0.data = slot8
		slot0.item_config = slot8
	else
		slot0.data = slot1

		if slot0.data.config then
			slot0.item_config = slot0.data.config
		else
			slot0.item_config = slot1
		end
	end

	if slot2 == true then
		slot0:updateBtnList()
	end

	slot0:setBaseInfo()
end

function FruitTreasureTips.adjustContentSizeAndPos(slot0)
	if not slot0.is_show_btn then
		slot0.tab_panel:setVisible(false)

		slot1 = slot0.attr_panel_height + slot0.tab_panel_height + slot0.node_panel_height + slot0.ex_panel_height + slot0.growup_panel_height + slot0.unlock_panel_height + slot0.desc_panel_height + slot0.base_panel_height - slot0.tab_panel_height
	end

	if not slot0.is_show_gropup then
		slot0.growup_panel:setVisible(false)

		slot1 = slot1 - slot0.growup_panel_height
	end

	if not slot0.is_show_attr then
		slot0.attr_panel:setVisible(false)
		slot0.node_panel:setVisible(false)
		slot0.ex_panel:setVisible(false)

		slot1 = slot1 - slot0.attr_panel_height - slot0.node_panel_height - slot0.ex_panel_height
	end

	if not slot0.is_show_unlock then
		slot0.unlock_panel:setVisible(false)

		slot1 = slot1 - slot0.unlock_panel_height
	end

	slot0.container:setContentSize(cc.size(slot0.container_init_size.width, slot1))
	slot0.base_panel:setPositionY(slot1 + 10)
	slot0.growup_panel:setPositionY(slot1 - slot0.base_panel_height - 10)
	slot0.attr_panel:setPositionY(slot1 - slot0.base_panel_height)
	slot0.node_panel:setPositionY(slot1 - slot0.base_panel_height - slot0.attr_panel_height)
	slot0.ex_panel:setPositionY(slot1 - slot0.node_panel_height - slot0.base_panel_height - slot0.attr_panel_height)

	slot6 = slot1 - slot0.node_panel_height - slot0.base_panel_height - slot0.attr_panel_height - slot0.ex_panel_height

	if slot0.is_show_gropup then
		slot6 = slot1 - slot0.base_panel_height - slot0.growup_panel_height
	end

	slot0.desc_panel:setPositionY(slot6)
	slot0.scroll_view:setPositionY(slot0.desc_panel:getContentSize().height - 16)

	if slot0.is_show_unlock then
		slot0.unlock_panel:setPositionY(slot0.unlock_panel_height + slot0.tab_panel_height)
	end
end

function FruitTreasureTips.updateBtnList(slot0)
	if not slot0.item_config then
		return
	end

	slot1 = slot0.item_config.type or 0

	for slot5, slot6 in pairs(slot0.btn_list) do
		if slot6.btn then
			slot6.btn:setVisible(false)
		end
	end

	if slot0.is_show_fenjie then
		uv0({}, BackPackConst.tips_btn_type.fenjie)
	end

	if slot0.is_show_gropup and not slot0.is_show_unlock then
		uv0(slot2, BackPackConst.tips_btn_type.source)
	elseif not slot0.is_show_gropup and slot0.is_show_unlock then
		if uv1:checkCanActive(slot0.item_config.id) then
			uv0(slot2, BackPackConst.tips_btn_type.fruit_active)
		else
			uv0(slot2, BackPackConst.tips_btn_type.source)
		end
	else
		uv0(slot2, BackPackConst.tips_btn_type.fruit_lvup)
		uv0(slot2, BackPackConst.tips_btn_type.fruit_starup)
	end

	if tableLen(slot2) == 1 then
		slot5 = slot0.btn_list[3]

		if slot0.btn_list[1].btn and slot5.btn then
			slot4.btn:setPositionX(slot5.btn:getPositionX())
		end
	end

	slot4 = 1

	for slot8, slot9 in ipairs(slot2) do
		if slot4 > 3 then
			break
		end

		if slot0.btn_list[slot8] and slot10.btn then
			slot10.label:setString(BackPackConst.tips_btn_title[slot9] or "")
			slot10.btn:setVisible(true)
			slot10.btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					uv0:clickBtn(uv1)
				end
			end)
		end

		slot4 = slot4 + 1
	end

	slot0:checkRedPoint()
end

function FruitTreasureTips.checkRedPoint(slot0)
	if slot0.is_show_gropup and not slot0.is_show_unlock then
		slot0.btn_list[1].btn:getChildByName("tips"):setVisible(false)
		slot0.btn_list[2].btn:getChildByName("tips"):setVisible(false)
	elseif not slot0.is_show_gropup and slot0.is_show_unlock then
		if uv0:checkCanActive(slot0.item_config.id) then
			slot0.btn_list[1].btn:getChildByName("tips"):setVisible(true)
		else
			slot0.btn_list[1].btn:getChildByName("tips"):setVisible(false)
		end
	else
		slot0.btn_list[1].btn:getChildByName("tips"):setVisible(uv0:getFruitTreasureRedStatus(slot0.item_config.id, FruitTreasureConst.RedType.Lv))
		slot0.btn_list[2].btn:getChildByName("tips"):setVisible(uv0:getFruitTreasureRedStatus(slot0.item_config.id, FruitTreasureConst.RedType.Star))
	end
end

function FruitTreasureTips.setBaseInfo(slot0)
	if slot0.data == nil or slot0.item_config == nil then
		return
	end

	slot1 = slot0.data

	if slot0.is_show_attr then
		slot0.goods_item:setBaseData(slot0.item_config.piece_id)
	else
		slot0.goods_item:setBaseData(slot0.item_config.id)
	end

	slot0.goods_item:isChipSprite({
		type = BackPackConst.item_type.NORMAL
	})

	slot3 = 0

	if slot0.item_config.quality >= 0 and slot0.item_config.quality <= 5 then
		slot3 = slot0.item_config.quality
	end

	loadSpriteTexture(slot0.base_panel, PathTool.getResFrame("tips", "tips_" .. slot3), LOADTEXT_TYPE_PLIST)
	slot0.name:setTextColor(BackPackConst.getEquipTipsColor(slot3))

	if slot0.is_show_gropup then
		slot0.name:setString(slot0.item_config.name)
	else
		slot0.name:setString(slot0.item_config.name .. " Lv." .. slot0.data.lev)
	end

	slot0.desc_label:setString(slot0.item_config.desc)

	if not slot0.item_config.desc or #slot0.item_config.desc == 0 then
		slot0.desc_label:setString(slot0.data.desc)
	end

	slot7 = math.max(slot0.desc_label:getContentSize().height, slot0.scroll_size.height)

	slot0.scroll_view:setContentSize(cc.size(slot0.scroll_size.width, math.min(slot7, 320)))
	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_size.width, slot7))
	slot0.desc_label:setPositionY(slot7)

	slot0.desc_panel_height = slot7 + 30

	slot0.extend_desc:setString("")
	slot0.equip_type:setString(TI18N("类型：") .. (slot0.item_config.type_desc or "阎浮果实"))

	if slot0.data.star then
		uv0:createStar(slot0.data.star, slot0.goods_item, uv0:getStarMax(slot0.data.type))
	end

	if slot0.is_show_gropup then
		slot10 = createRichLabel(22, cc.c4b(255, 238, 221, 255), cc.p(0, 0.5), cc.p(34, -5), nil, nil, 500)
		slot11 = createRichLabel(22, cc.c4b(255, 238, 221, 255), cc.p(0, 0.5), cc.p(34, 45), nil, nil, 500)
		slot12 = createRichLabel(22, cc.c4b(255, 238, 221, 255), cc.p(0, 0.5), cc.p(34, 95), nil, nil, 500)
		slot13 = uv1("<div fontcolor=#feeeba>%s</div><div fontcolor=#14ff32>%s</div>", TI18N("碎片："), BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot1.base_id))
		slot14 = "未解锁"
		slot15 = "未解锁"
		slot16 = uv1("<div fontcolor=#feeeba>%s</div><div fontcolor=#ff0000>%s</div>", TI18N("星级："), "未解锁")
		slot17 = uv1("<div fontcolor=#feeeba>%s</div><div fontcolor=#ff0000>%s</div>", TI18N("等级："), "未解锁")

		if uv0:getInfoBychip(slot0.data.base_id).isActive then
			slot16 = uv1("<div fontcolor=#feeeba>%s</div><div fontcolor=#feeeba>%s</div>", TI18N("星级："), slot18.star)
			slot17 = uv1("<div fontcolor=#feeeba>%s</div><div fontcolor=#feeeba>%s</div>", TI18N("等级："), slot18.lev)
		end

		slot10:setString(slot13)
		slot11:setString(slot16)
		slot12:setString(slot17)
		slot0.growup_panel:addChild(slot12)
		slot0.growup_panel:addChild(slot11)
		slot0.growup_panel:addChild(slot10)

		slot0.growup_panel_height = 200
	end

	if slot0.is_show_attr then
		slot9 = 2
		slot10 = 1

		if slot0.data:getAttr() then
			for slot15, slot16 in ipairs(slot11) do
				if slot9 < slot10 then
					break
				end

				slot19 = slot16.attr_val

				if Config.AttrData.data_key_to_name[Config.AttrData.data_id_to_key[slot16.attr_id]] then
					if not slot0.base_list[slot10] then
						slot0.base_list[slot10] = createRichLabel(22, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), cc.p(20, 28), nil, nil, 380)

						slot0.attr_panel:addChild(slot0.base_list[slot10])
					end

					slot0.base_list[slot10]:setPositionX(30 + (slot15 - 1) * 200)

					slot23 = PathTool.getAttrIconByStr(slot18)

					if PartnerCalculate.isShowPerByStr(slot18) == true then
						slot19 = slot19 / 10 .. "%"
					end

					slot21:setString(uv1("<img src='%s' scale=1 /> <div fontcolor=#c1b7ab> %s：</div><div fontcolor=#ffeedd>%s</div>", PathTool.getResFrame("common", slot23), slot20, slot19))

					slot10 = slot10 + 1
				end
			end
		end

		if slot0.data.nodelist then
			slot12 = 1

			if #slot0.data.nodelist == 0 then
				table.insert(slot13, {
					desc = "        无节点增幅效果",
					lev = 100
				})
			end

			for slot17, slot18 in ipairs(slot13) do
				if slot18.desc then
					if not slot0.node_list[slot12] then
						slot0.node_list[slot12] = createRichLabel(22, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), cc.p(0, 70), nil, nil, 380)

						slot0.node_panel:addChild(slot0.node_list[slot12])
					end

					slot0.node_list[slot12]:setPositionY(70 - (slot17 - 1) * 40)

					slot22 = "#646464"

					if slot18.lev <= slot0.data.lev then
						slot22 = "#08ff00"
					end

					slot20:setString(uv1("<div fontcolor=%s> %s</div>", slot22, slot19))

					slot12 = slot12 + 1
				end
			end

			slot0.node_panel_height = 45 * (#slot13 + 1)
		end

		if slot0.data.exclusive then
			slot12 = 1
			slot14 = slot0.data:getExRate()

			for slot18, slot19 in ipairs(slot0.data:getExValue()) do
				slot20 = slot19

				if slot18 == 2 then
					slot21 = slot0.data.eff_times
					slot22 = slot0.data.eff_add

					if slot0.data.eff_add > 0 then
						slot22 = slot0.data.eff_add / slot14
					end

					if slot14 == 1000 then
						slot22 = slot22 * 100
					end

					if slot14 == 1000 then
						slot20 = uv1(slot20, slot21, slot22) .. "%"
					end
				end

				if slot20 then
					if not slot0.ex_list[slot12] then
						slot0.ex_list[slot12] = createRichLabel(22, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), cc.p(15, 60), nil, nil, 380)

						slot0.ex_panel:addChild(slot0.ex_list[slot12])
					end

					slot0.ex_list[slot12]:setPositionY(60 - (slot18 - 1) * 60)

					slot23 = "#646464"

					if slot0.is_show_attr and not slot0.is_show_unlock then
						slot23 = "#08ff00"
					end

					slot21:setString(uv1("<div fontcolor=%s> %s</div>", slot23, slot20))

					slot12 = slot12 + 1
				end
			end

			slot0.ex_panel_height = 55 * (#slot13 + 1)
		end
	end

	if slot0.is_show_unlock then
		slot0.unlock_txt:setString(StringFormat(TI18N("收集该果实碎片解锁进度：{0}"), uv0:getActive(slot0.item_config.id)))

		if uv0:checkCanActive(slot0.item_config.id) then
			slot0.unlock_txt:setTextColor(nx.gui.GREEN)
		else
			slot0.unlock_txt:setTextColor(nx.gui.RED)
		end
	end

	slot0:adjustContentSizeAndPos()
end

function FruitTreasureTips.setPanelData(slot0)
end

function FruitTreasureTips.close_callback(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0.goods_item = nil

	if slot0.less_timer then
		GlobalTimeTicket:getInstance():remove(slot0.less_timer)

		slot0.less_timer = nil
	end
end
