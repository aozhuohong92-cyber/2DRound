SacreEquipTips = SacreEquipTips or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = RoleController:getInstance():getRoleVo()
slot6 = math.floor

function SacreEquipTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "hero/sacre_equip_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.base_list = {}
	slot0.suit_item_list = {}
	slot0.random_item_list = {}
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.ohter_list = {}
	slot0.cloth_type = 1
	slot0.is_need = true
	slot0.item_config = nil
	slot0.suit_config = nil
end

function SacreEquipTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
		slot0.background:setSwallowTouches(false)
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.container_init_size = slot0.container:getContentSize()
	slot0.base_panel = slot0.container:getChildByName("base_panel")
	slot0.score_title = slot0.base_panel:getChildByName("score_title")

	slot0.score_title:setString(TI18N("评分："))

	slot0.equip_item = BackPackItem.new(true, true, nil, 1, false)

	slot0.equip_item:setPosition(cc.p(72, 68))
	slot0.base_panel:addChild(slot0.equip_item)

	slot0.name = slot0.base_panel:getChildByName("name")
	slot0.equip_type = slot0.base_panel:getChildByName("equip_type")
	slot0.power_label = CommonNum.new(1, slot0.base_panel, 1, -2, cc.p(0, 0))

	slot0.power_label:setPosition(cc.p(210, 32))
	slot0.power_label:setNum(0)
	slot0.power_label:setScale(0.8)

	slot0.look_btn = slot0.base_panel:getChildByName("look_btn")

	slot0.look_btn:setVisible(false)

	slot0.suit_icon = slot0.base_panel:getChildByName("suit_icon")
	slot0.suit_name = slot0.base_panel:getChildByName("suit_name")
	slot0.baseattr_panel = slot0.container:getChildByName("baseattr_panel")

	slot0.baseattr_panel:getChildByName("label"):setString(TI18N("基础属性"))

	slot0.randomattr_panel = slot0.container:getChildByName("randomattr_panel")
	slot0.randomattr_panel_height = slot0.randomattr_panel:getContentSize().height
	slot0.randomattr_name = slot0.randomattr_panel:getChildByName("label")
	slot0.pre_btn = slot0.randomattr_panel:getChildByName("pre_btn")

	slot0.pre_btn:getChildByName("label"):setString(TI18N("类型预览"))

	slot0.suitattr_panel = slot0.container:getChildByName("suitattr_panel")
	slot0.suitattr_panel_height = slot0.suitattr_panel:getContentSize().height
	slot0.suitattr_name = slot0.suitattr_panel:getChildByName("label")
	slot0.skill_panel = slot0.container:getChildByName("skill_panel")
	slot0.skill_panel_height = slot0.skill_panel:getContentSize().height
	slot0.tab_panel = slot0.container:getChildByName("tab_panel")
	slot0.tab_panel_height = slot0.tab_panel:getContentSize().height
	slot0.tab_btn_3 = slot0.tab_panel:getChildByName("tab_btn_3")

	slot0.tab_btn_3:setTitleText(TI18N("穿戴"))

	slot0.tab_btn_2 = slot0.tab_panel:getChildByName("tab_btn_2")

	slot0.tab_btn_2:setTitleText(TI18N("洗练"))

	slot0.tab_btn_2.need_str = ""
	slot0.tab_btn_1 = slot0.tab_panel:getChildByName("tab_btn_1")

	slot0.tab_btn_1:setTitleText(TI18N("卸下"))

	slot0.tab_btn_1.need_str = ""
	slot0.desc_panel = slot0.container:getChildByName("desc_panel")
	slot0.scroll_view = slot0.desc_panel:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)

	slot0.scroll_size = slot0.scroll_view:getContentSize()
	slot0.desc_label = createRichLabel(22, cc.c4b(161, 151, 139, 255), cc.p(0, 1), cc.p(20, 64), 8, nil, 380)

	slot0.scroll_view:addChild(slot0.desc_label)

	slot0.close_btn = slot0.container:getChildByName("close_btn")
end

function SacreEquipTips.register_event(slot0)
	slot0.tab_btn_3:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:onTabBtn3()
		end
	end)
	slot0.tab_btn_2:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:onTabBtn2()
		end
	end)
	slot0.tab_btn_1:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:onTabBtn1()
		end
	end)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClickCloseBtn()
	end, true, 1)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClickCloseBtn()
	end, false, 0)
	registerButtonEventListener(slot0.pre_btn, function (slot0, slot1, slot2)
		if Config.PartnerHolyEqmData.data_base_info(14100204) then
			TipsManager:getInstance():showCommonTips(slot3.tips_info, slot1:getTouchBeganPosition())
		end
	end, true, 2)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		if Config.PartnerHolyEqmData.data_const.game_rule_1 then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true, 2, nil, 0.8)
	slot0:addGlobalEvent(HeroEvent.Holy_Equipment_Update_Event, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.data or not uv0.item_config then
			return
		end

		if slot0.partner_id and slot0.partner_id == uv0.partner_id then
			uv0:initData()
		end
	end)
end

function SacreEquipTips.addDataBindEvent(slot0)
	if (slot0.partner_id == nil or slot0.partner_id == 0) and slot0.data and slot0.data.Bind and slot0.item_update_event == nil then
		slot0.item_update_event = slot0.data:Bind(GoodsVo.UPDATE_GOODS_ATTR, function (slot0, slot1)
			if slot0 == "holy_eqm_attr" then
				uv0:initData()
			end
		end)
	end
end

function SacreEquipTips.onClickCloseBtn(slot0)
	uv0:openSacreEquipTips(false)
end

function SacreEquipTips.onTabBtn2(slot0)
	if not slot0.data then
		return
	end

	if not slot0.item_config then
		return
	end

	if slot0.item_config.sub_type == BackPackConst.item_tab_type.HOLYEQUIPMENT then
		HeroController:getInstance():openHolyequipmentRefreshAttPanel(true, slot0.data, slot0.partner_id)
	end
end

function SacreEquipTips.onTabBtn1(slot0)
	if not slot0.data or not slot0.data.id or not slot0.item_config then
		return
	end

	if slot0.cloth_type == PartnerConst.EqmTips.backpack then
		if slot0.item_config.sub_type == BackPackConst.item_tab_type.HOLYEQUIPMENT then
			uv0:openHeroResetOfferPanel(true, {
				{
					item_id = slot0.data.id
				}
			}, false, function ()
				if HeroController:getInstance():getModel():checkHolyEquipmentPalnByItemID(uv0.data.id) then
					CommonAlert.show(TI18N("该神装已装配在方案中，继续出售将会清除其在方案中的配置，是否继续？"), TI18N("确定"), function ()
						uv0:sender11089({
							{
								item_id = uv1.data.id
							}
						})
					end, TI18N("取消"), nil, CommonAlert.type.common)
				else
					uv1:sender11089({
						{
							item_id = uv0.data.id
						}
					})
				end
			end, HeroConst.ResetType.eHolyEquipSell, string.format(TI18N("出售 <div fontcolor=%s>【%s】</div>可获得以下资源（已包含返还的60%%的洗练消耗），是否确定出售？"), BackPackConst.getWhiteQualityColorStr(slot0.item_config.quality), slot0.item_config.name))
		else
			BackpackController:getInstance():openItemSellPanel(true, slot0.data, BackPackConst.Bag_Code.EQUIPS)
		end

		uv0:openSacreEquipTips(false)
	elseif slot0.cloth_type == PartnerConst.EqmTips.partner then
		if slot0.item_config.sub_type == BackPackConst.item_tab_type.HOLYEQUIPMENT then
			if slot0.holy_data and slot0.holy_data.list then
				slot1 = slot0.holy_data.partner_id or 0
				slot2 = {}

				if slot0.holy_data.list and next(slot0.holy_data.list) ~= 0 then
					for slot6, slot7 in ipairs(slot0.holy_data.list) do
						if slot7 and slot7.item_id then
							table.insert(slot2, {
								partner_id = slot7.partner_id,
								item_id = slot7.item_id
							})
						end
					end
				end

				for slot6 = #slot2, 1, -1 do
					if slot2[slot6] and slot2[slot6].item_id == slot0.data.id then
						table.remove(slot2, slot6)
					end
				end

				uv0:sender25221(slot0.holy_data.id, slot1, slot0.holy_data.name, slot2)
			else
				if HeroController:getInstance():getModel():isOpenHolyEquipMentByHerovo(slot0.partner) == false then
					CommonAlert.show(TI18N("因版本调整，当前该英雄尚未达到开启神装所需星级条件，卸下后将无法立即穿戴，是否确认卸下？"), TI18N("确定"), function ()
						uv0:sender11093(uv1.partner_id, uv1.data.id, 0)
						uv0:openSacreEquipTips(false)
					end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , , true)

					return
				end

				uv0:sender11093(slot0.partner_id, slot0.data.id, 0)
			end
		else
			uv0:sender11011(slot0.partner_id, slot0.data.id)
		end

		uv0:openSacreEquipTips(false)
	end
end

function SacreEquipTips.onTabBtn3(slot0)
	if not slot0.data then
		return
	end

	if not slot0.item_config then
		return
	end

	slot2 = slot0.data.id or 0
	slot3 = slot0.item_config.type or 0

	if slot0.cloth_type == PartnerConst.EqmTips.backpack then
		if (slot0.partner_id or 0) == 0 then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner, 1)
		else
			uv0:sender11010(slot1, slot2)
		end
	elseif slot0.cloth_type == PartnerConst.EqmTips.partner then
		if slot0.holy_data and slot0.holy_data.list then
			uv0:openHeroHolyEquipClothPanel(true, slot3, 0, slot0.data, slot0.holy_data, HeroConst.EnterType.eHolyPlan, nil, slot0.holy_data.equip_list)
		elseif BackPackConst.checkIsHolyEquipment(slot3) then
			if not HeroController:getInstance():getModel():isOpenHolyEquipMentByHerovo(slot0.partner) then
				message(TI18N("因版本调整，当前该英雄尚未达到穿戴或更换神装条件，请努力提升至9星~"))

				return
			end

			uv0:openHeroHolyEquipClothPanel(true, slot3, slot0.partner_id, slot0.data, nil, , slot0.partner)
		else
			uv0:openEquipPanel(true, slot3, slot0.partner_id, slot0.data)
		end
	end

	uv0:openSacreEquipTips(false)
end

function SacreEquipTips.openRootWnd(slot0, slot1)
	slot0.data = slot1.data
	slot0.cloth_type = slot1.open_type or PartnerConst.EqmTips.normal
	slot0.partner = slot1.partner

	if slot0.partner then
		slot0.partner_id = slot0.partner.partner_id
	end

	slot0.holy_data = slot1.holy_data
	slot3 = nil
	slot0.item_config = (type(slot1.data) ~= "number" or Config.ItemData.data_get_data(slot2)) and (not slot2.config or slot2.config) and (not slot2.bid or Config.ItemData.data_get_data(slot2.bid)) and (not slot2.id or Config.ItemData.data_get_data(slot2.id)) and slot2

	if slot0.item_config == nil then
		return
	end

	slot0:initData()
	slot0:addDataBindEvent()
end

function SacreEquipTips.initLimitBuyInfo(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.limit_day then
		slot2 = slot0:getLimitBuytLabel()

		if lable then
			lable:setString(uv0(TI18N("每日限购<div fontcolor=#249003>%s/%s</div>个"), slot0.data.limit_day, slot0.data.limit_total_num or 0))
		end
	end
end

function SacreEquipTips.getLimitBuytLabel(slot0)
	if slot0.limit_buy_label == nil then
		slot0.limit_buy_label = createRichLabel(22, cc.c4b(255, 238, 221, 255), cc.p(0, 0.5), cc.p(0, 36), nil, , 1000)

		slot0.main_container:addChild(slot0.limit_buy_label)
	end

	return slot0.limit_buy_label
end

function SacreEquipTips.initData(slot0)
	slot2 = 0

	if slot0:setRandomAttrInfo(false) > 0 then
		print("randomattr_height----------------:", slot2)

		slot1 = slot0.container_init_size.height + slot2
	else
		slot2 = 0

		slot0.randomattr_panel:setVisible(false)

		need_show_randomattr = false
	end

	slot0.suitattr_panel:setVisible(false)

	if slot0.item_config.sub_type ~= BackPackConst.item_tab_type.HOLYEQUIPMENT then
		need_show_skill = nil
	end

	if need_show_skill ~= nil then
		if Config.SkillData.data_get_skill(need_show_skill) then
			slot1 = slot1 + slot0.skill_panel_height

			if slot0.skill_item == nil then
				slot0.skill_item = slot0:createSkillItem(slot0.skill_panel)
			end

			slot0.skill_item.skill:showLockIcon(false)
			slot0.skill_item.skill:setData(slot3)
			slot0.skill_item.desc:setString(slot3.des)
		else
			need_show_skill = false
		end
	end

	if slot0.cloth_type == PartnerConst.EqmTips.backpack or slot0.cloth_type == PartnerConst.EqmTips.partner then
		slot0:updateBtnList()
	else
		slot1 = slot1 - slot0.tab_panel_height

		slot0.tab_panel:setVisible(false)
	end

	if slot0.data and slot0.data.is_market_place and next(slot0.data.end_time) ~= nil then
		slot0.market_time_label = createRichLabel(24, cc.c4b(255, 155, 30, 255), cc.p(0, 1), cc.p(17, -10000), 8, nil, 1000)

		slot0.container:addChild(slot0.market_time_label)

		slot5 = slot0.data.end_time[1].end_num or 1
		slot6 = nil

		if (slot0.data.end_time[1].end_unixtime or 0) - GameNet:getInstance():getTime() < 0 then
			slot7 = 0
		end

		slot0.market_time_label:setString((slot7 > 0 or string.format(TI18N("%s个物品已过期"), slot5)) and string.format(TI18N("%s个物品于<div fontcolor=#249003>%s</div>后过期"), slot5, TimeTool.GetTimeFormatDayIIIIII(slot7)))

		slot1 = slot1 + slot0.market_time_label:getContentSize().height
	end

	if slot1 ~= slot0.container_init_size.height then
		slot0.container:setContentSize(cc.size(slot0.container_init_size.width, slot1))

		slot4 = slot1 - 4

		slot0.base_panel:setPositionY(slot4)
		slot0.close_btn:setPositionY(slot4 - 11)

		slot4 = slot4 - slot0.base_panel:getContentSize().height

		slot0.baseattr_panel:setPositionY(slot4)

		slot4 = slot4 - slot0.baseattr_panel:getContentSize().height

		slot0.randomattr_panel:setPositionY(slot4)

		slot4 = slot4 - slot2

		if need_show_skill then
			slot0.skill_panel:setPositionY(slot4)

			slot4 = slot4 - slot0.skill_panel_height
		end

		slot0.desc_panel:setPositionY(slot4)

		if slot3 then
			slot0.tab_panel:setPositionY(slot4 - slot0.desc_panel:getContentSize().height)
		end

		if slot0.data and slot0.data.is_market_place then
			slot0.market_time_label:setPositionY(slot4 - slot0.desc_panel:getContentSize().height)
		end
	end

	slot0:setBaseInfo()
	slot0:setBaseAttrInfo()
end

function SacreEquipTips.updateBtnList(slot0)
	slot0.tab_btn_3:setVisible(true)
	slot0.tab_btn_2:setVisible(false)

	if slot0.cloth_type == PartnerConst.EqmTips.backpack then
		slot0.tab_btn_3:setTitleText(TI18N("穿戴"))
		slot0.tab_btn_1:setTitleText(TI18N("出售"))
	elseif slot0.cloth_type == PartnerConst.EqmTips.partner then
		if slot0.item_config and slot0.item_config.sub_type ~= BackPackConst.item_tab_type.HOLYEQUIPMENT then
			addRedPointToNodeByStatus(slot0.tab_btn_3, HeroCalculate.checkSingleHeroEachPosEquipRedPoint(slot0.item_config.type, slot0.data), 5, 5)
		end

		slot0.tab_btn_3:setTitleText(TI18N("更换"))
		slot0.tab_btn_1:setTitleText(TI18N("卸下"))
	else
		slot0.tab_btn_3:setVisible(false)
	end

	if slot0.item_config and slot0.item_config.sub_type == BackPackConst.item_tab_type.HOLYEQUIPMENT then
		slot0.tab_btn_2:setVisible(true)
		slot0.look_btn:setVisible(true)

		if slot0.item_config.eqm_jie <= 0 then
			setChildUnEnabled(true, slot0.tab_btn_2)
			slot0.tab_btn_2:setTitleText(TI18N("无法洗练"))
			slot0.tab_btn_2:setTouchEnabled(false)
		end
	end

	if slot0.cloth_type ~= PartnerConst.EqmTips.partner then
		-- Nothing
	end
end

function SacreEquipTips.setBaseInfo(slot0)
	if slot0.data == nil or slot0.item_config == nil then
		return
	end

	slot0.equip_item:setBaseData(slot0.item_config.id)

	if (slot0.data.enchant or 0) > 0 then
		slot3 = (slot0.item_config.name or "") .. "+" .. slot4
	end

	slot0.name:setString(slot3)

	slot5 = 0

	if slot0.item_config.quality and slot0.item_config.quality >= 0 and slot0.item_config.quality <= 5 then
		slot5 = slot0.item_config.quality
	end

	slot6 = PathTool.getResFrame("tips", "tips_" .. slot5)

	if slot0.record_background_res == nil or slot0.record_background_res ~= slot6 then
		slot0.record_background_res = slot6

		loadSpriteTexture(slot0.base_panel, slot6, LOADTEXT_TYPE_PLIST)
	end

	slot0.name:setTextColor(BackPackConst.getEquipTipsColor(slot5))

	if slot0.item_config.type_desc then
		slot0.equip_type:setString(TI18N("类型：") .. slot0.item_config.type_desc)
	end

	slot0.score_title:setVisible(true)
	slot0.power_label:setVisible(true)

	if (slot1.score or 0) <= 0 then
		slot8 = slot0:getBaseScore() or 0
	end

	slot0.power_label:setNum(math.max(slot1.all_score or 0, slot8))
	slot0.desc_label:setString(slot0.item_config.desc)

	slot11 = math.max(slot0.desc_label:getContentSize().height, slot0.scroll_size.height)

	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_size.width, slot11))
	slot0.desc_label:setPositionY(slot11 - 10)
end

function SacreEquipTips.setBaseAttrInfo(slot0)
	if not slot0.item_config or not slot0.item_config.ext or not slot0.item_config.ext[1] then
		return
	end

	for slot6, slot7 in ipairs(slot0.item_config.ext[1][2] or {}) do
		if 1 > 2 then
			return
		end

		slot9 = slot7[2]

		if Config.AttrData.data_key_to_name[slot7[1]] then
			if not slot0.base_list[slot2] then
				slot0.base_list[slot2] = createRichLabel(22, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), cc.p(4, 28), nil, , 380)

				slot0.baseattr_panel:addChild(slot0.base_list[slot2])
			end

			slot0.base_list[slot2]:setPositionX(24 + (slot6 - 1) * 200)

			slot13 = PathTool.getAttrIconByStr(slot8)

			if PartnerCalculate.isShowPerByStr(slot8) == true then
				slot9 = slot9 * 0.1 .. "%"
			end

			slot11:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#c1b7ab> %s：</div><div fontcolor=#ffeedd>%s</div>", PathTool.getResFrame("common", slot13), slot10, slot9))

			slot2 = slot2 + 1
		end
	end
end

function SacreEquipTips.setLustrAtt(slot0)
	if slot0.item_config.eqm_jie then
		slot1 = Config.PartnerHolyEqmData.data_const

		if slot0.item_config.eqm_jie == 0 then
			for slot6 = 1, 2 do
				slot0.randomattr_panel:addChild(createRichLabel(22, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), cc.p(24, ({
					29,
					-9
				})[slot6]), nil, , 500))

				slot8 = ""

				slot7:setString((slot6 ~= 1 or slot1.text_show_1.desc) and slot1.text_show_2.desc)
			end

			slot0.pre_btn:setVisible(false)
		elseif slot0.item_config.eqm_jie == 1 then
			slot2 = createRichLabel(22, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), cc.p(24, 33), nil, , 200)

			slot0.randomattr_panel:addChild(slot2)
			slot2:setString(string.format(TI18N("<img src=%s visible=true scale=1 /> ？？？"), PathTool.getResFrame("common", PathTool.getAttrIconByStr("random"))))

			slot5 = createRichLabel(22, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), cc.p(24, -9), nil, , 500)

			slot0.randomattr_panel:addChild(slot5)
			slot5:setString(slot1.text_show_2.desc)
			slot0.pre_btn:setVisible(true)
		elseif slot0.item_config.eqm_jie == 2 then
			for slot6 = 1, 2 do
				slot7 = createRichLabel(22, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), cc.p(24, ({
					29,
					-9
				})[slot6]), nil, , 200)

				slot0.randomattr_panel:addChild(slot7)
				slot7:setString(string.format(TI18N("<img src=%s visible=true scale=1 /> ？？？"), PathTool.getResFrame("common", PathTool.getAttrIconByStr("random"))))
			end

			slot0.pre_btn:setVisible(true)
		end
	end
end

function SacreEquipTips.setRandomAttrInfo(slot0, slot1)
	if not slot0.data then
		return -1
	end

	if slot1 == true then
		slot0:setLustrAtt()
	else
		printLuaTable(slot0.data)

		for slot7, slot8 in ipairs(slot0.data.attr or {}) do
			-- Nothing
		end

		if next({
			[slot7] = slot8
		}) == nil then
			slot0.pre_btn:setVisible(false)
		else
			slot0.pre_btn:setVisible(true)
		end

		for slot7 = 1, 4 do
			if slot0.random_item_list[slot7] == nil then
				slot0.random_item_list[slot7] = slot0:createattrItem(slot7, slot0.randomattr_panel)
			end

			if slot3[slot7] then
				slot8 = Config.AttrData.data_id_to_key[slot3[slot7].attr_id]
				slot10 = Config.AttrData.data_key_to_name[slot8]

				if PartnerCalculate.isShowPerByStr(slot8) == true then
					slot9 = (slot3[slot7].attr_val or 0) / 1000 * 0.1 .. "%"
				end

				slot0.random_item_list[slot7].attr:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#%s> %s：</div><div fontcolor=#%s>%s%s</div>", PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot8)), "c1b7ab", slot10, "ffeedd", slot9, ""))
			else
				slot8 = nil

				slot0.random_item_list[slot7].attr:setString((slot7 ~= 1 or Config.PartnerHolyEqmData.data_const.text_show_1.desc) and Config.PartnerHolyEqmData.data_const.text_show_2.desc)
			end
		end
	end

	return slot0.randomattr_panel_height + 180
end

function SacreEquipTips.getEquipActiveCount(slot0)
	if not slot0.partner_id or slot0.partner_id == 0 then
		return 0
	end

	slot1 = 0
	slot2 = {}

	if slot0.item_config.sub_type == BackPackConst.item_tab_type.HOLYEQUIPMENT then
		if slot0.partner.holy_eqm ~= nil then
			for slot6, slot7 in ipairs(slot0.partner.holy_eqm) do
				slot2[slot7.type] = GoodsVo.New(slot7.base_id)
			end
		elseif slot0.partner.holy_eqm_list ~= nil then
			for slot6, slot7 in pairs(slot0.partner.holy_eqm_list) do
				slot2[slot6] = slot7
			end
		end

		slot3 = {}
		slot5 = {}

		for slot9, slot10 in pairs(slot2) do
			if slot10.config and uv0(slot0.item_config.eqm_set / 100) == uv0(slot10.config.eqm_set / 100) then
				uv1(slot5, slot10.config.eqm_set)

				slot1 = slot1 + 1
			end
		end

		table.sort(slot5, function (slot0, slot1)
			return slot1 < slot0
		end)

		if slot1 > 1 then
			for slot11, slot12 in ipairs(slot5) do
				if nil == nil then
					slot6 = slot12

					uv2(Config.PartnerHolyEqmData.data_suit_info[slot12], function (slot0, slot1)
						return slot0.num < slot1.num
					end)
				else
					if slot6 ~= slot12 then
						uv2(Config.PartnerHolyEqmData.data_suit_info[slot12], function (slot0, slot1)
							return slot0.num < slot1.num
						end)
					end

					for slot16, slot17 in ipairs(slot7) do
						if slot17.num == slot11 then
							uv1(slot3, slot17)

							break
						end
					end
				end
			end
		end

		return slot1, slot3
	elseif slot0.item_config.sub_type == BackPackConst.item_tab_type.EQUIPS then
		if slot0.partner.eqms ~= nil then
			for slot6, slot7 in ipairs(slot0.partner.eqms) do
				slot2[slot7.type] = GoodsVo.New(slot7.base_id)
			end
		elseif slot0.partner.eqm_list ~= nil then
			for slot6, slot7 in pairs(slot0.partner.eqm_list) do
				slot2[slot6] = slot7
			end
		end

		slot3 = {}

		for slot7, slot8 in pairs(slot2) do
			if slot8.config and slot8.config.eqm_set > 0 then
				slot1 = slot1 + 1

				if Config.PartnerEqmData.data_eqm_suit[slot8.config.eqm_set] ~= nil then
					uv1(slot3, slot9)
				end
			end
		end

		uv2(slot3, function (slot0, slot1)
			if slot0[1] and slot1[1] and slot0[1].id and slot1[1].id then
				return slot1[1].id < slot0[1].id
			else
				return false
			end
		end)

		return slot1, slot3
	end
end

function SacreEquipTips.createattrItem(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	slot3 = {
		node = ccui.Layout:create()
	}

	slot3.node:setAnchorPoint(cc.p(0, 0.5))
	slot3.node:setContentSize(cc.size(360, 28))
	slot3.node:setPosition(20, 26 - (slot1 - 1) * 40)
	slot2:addChild(slot3.node)

	slot3.attr = createRichLabel(22, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), cc.p(4, 14), nil, , 380)

	slot3.node:addChild(slot3.attr)

	slot3.act_info = createRichLabel(22, cc.c4b(255, 238, 221, 255), cc.p(1, 0.5), cc.p(360, 14), nil, , 380)

	slot3.node:addChild(slot3.act_info)

	return slot3
end

function SacreEquipTips.createSkillItem(slot0, slot1)
	slot3 = SkillItem.new(true, true, true, 0.8)

	slot1:addChild(slot3)
	slot3:setPosition(70, 62)

	slot4 = createRichLabel(18, cc.c4b(255, 238, 221, 255), cc.p(0, 1), cc.p(138, 105), 4, nil, 260)

	slot1:addChild(slot4)

	return {
		skill = slot3,
		desc = slot4
	}
end

function SacreEquipTips.getBaseScore(slot0)
	if not slot0.item_config or not slot0.item_config.ext or not slot0.item_config.ext[1] then
		return 0
	end

	return PartnerCalculate.calculatePower(slot0.item_config.ext[1][2] or {})
end

function SacreEquipTips.getHolyEquipScore(slot0)
	if not slot0.item_config or not slot0.item_config.ext or not slot0.item_config.ext[1] then
		return 0
	end

	slot1 = 0
	slot2 = 0
	slot3 = 0

	if Config.PartnerHolyEqmData.data_base_info(slot0.item_config.id) then
		slot1 = slot4.score
	end

	if slot0.item_config and slot0.item_config.ext and slot0.item_config.ext[1] then
		slot2 = HeroCalculate.holyEquipMentPower(slot0.item_config.ext[1][2] or {})
	end

	if slot0.data and slot0.data.attr then
		slot5 = {}
		slot6 = {
			[slot11.pos] = slot11
		}

		for slot10, slot11 in pairs(slot0.data.attr) do
			-- Nothing
		end

		for slot10 = 1, 2 do
			if slot6[slot10] then
				uv0(slot5, {
					Config.AttrData.data_id_to_key[slot6[slot10].attr_id],
					slot6[slot10].attr_val
				})
			end
		end

		slot3 = HeroCalculate.holyEquipMentPower(slot5)
	end

	return slot1 + slot2 + slot3
end

function SacreEquipTips.close_callback(slot0)
	if slot0.equip_item then
		slot0.equip_item:DeleteMe()

		slot0.equip_item = nil
	end

	if slot0.power_label then
		slot0.power_label:DeleteMe()

		slot0.power_label = nil
	end

	if slot0.item_update_event ~= nil then
		slot0.data:UnBind(slot0.item_update_event)

		slot0.item_update_event = nil
	end

	uv0:openSacreEquipTips(false)
end
