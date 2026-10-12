ActionHeroConvertPanel = class("ActionHeroConvertPanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()
slot2 = HeroController:getInstance():getModel()
slot3 = string.format
slot4 = table.insert
slot5 = table.sort

function ActionHeroConvertPanel.ctor(slot0, slot1)
	slot0.parent = slot1
	slot0.data = nil
	slot0.item_id = Config.HolidayConvertData.data_const.item_id.val
	slot0.conver_hero_list = {}

	slot0:loadResources()
end

function ActionHeroConvertPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_hero_convert_bg", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_hero_convert_stage", false),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:configUI()
		uv0:register_event()
		uv0:initConvertData()
		uv0:onClickBtnShowByIndex(0)
	end)
end

function ActionHeroConvertPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_hero_convert_panel"))

	slot0.root_wnd:setPosition(cc.p(0, 290))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot2 = slot0.main_container:getChildByName("role_layout"):getChildByName("camp_node")
	slot0.camp_btn_list = {}
	slot0.camp_btn_redpoint_list = {}
	slot0.camp_btn_list[0] = slot2:getChildByName("camp_btn0")
	slot0.camp_btn_list[HeroConst.CampType.eWater] = slot2:getChildByName("camp_btn1")
	slot0.camp_btn_list[HeroConst.CampType.eFire] = slot2:getChildByName("camp_btn2")
	slot0.camp_btn_list[HeroConst.CampType.eWind] = slot2:getChildByName("camp_btn3")
	slot0.camp_btn_list[HeroConst.CampType.eLight] = slot2:getChildByName("camp_btn4")
	slot0.camp_btn_list[HeroConst.CampType.eDark] = slot2:getChildByName("camp_btn5")
	slot0.img_select = slot2:getChildByName("img_select")
	slot3, slot4 = slot0.camp_btn_list[0]:getPosition()

	slot0.img_select:setPosition(slot3 - 0.5, slot4 + 1)

	slot0.lay_scrollview = slot0.main_container:getChildByName("lay_scrollview")
	slot0.left_panel = slot0.main_container:getChildByName("left_panel")
	slot0.img_left = slot0.main_container:getChildByName("img_left")

	if slot0.left_img_load == nil then
		slot0.left_img_load = loadSpriteTextureFromCDN(slot0.img_left, PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_hero_convert_stage", false), ResourcesType.single, slot0.left_img_load)
	end

	slot0.right_panel = slot0.main_container:getChildByName("right_panel")
	slot0.img_right = slot0.main_container:getChildByName("img_right")

	if slot0.right_img_load == nil then
		slot0.right_img_load = loadSpriteTextureFromCDN(slot0.img_right, PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_hero_convert_stage", false), ResourcesType.single, slot0.right_img_load)
	end

	slot0.title_img = slot0.main_container:getChildByName("title_img")

	slot0.title_img:setScale(display.getMaxScale())

	slot0.change_btn = slot0.main_container:getChildByName("change_btn")
	slot5 = slot0.change_btn:getContentSize()
	slot0.change_btn_label = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(slot5.width * 0.5, slot5.height * 0.5), nil, nil, 900)

	slot0.change_btn:addChild(slot0.change_btn_label)
	slot0:updateCostInfo()

	if slot0.item_load == nil then
		slot0.item_load = loadSpriteTextureFromCDN(slot0.title_img, PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_hero_convert_bg", true), ResourcesType.single, slot0.item_load)
	end

	slot0.item_node = slot0.main_container:getChildByName("item_node")
	slot0.hero_item = HeroExhibitionItem.new(0.9, true)

	slot0.hero_item:addCallBack(function ()
		uv0:onClickHeroItem()
	end)
	slot0.item_node:addChild(slot0.hero_item)
	slot0.hero_item.num_label:setZOrder(1)
	slot0:updateHeroItem()

	slot0.time_val = slot0.main_container:getChildByName("time_title")

	slot0.time_val:setVisible(false)

	slot0.item_buy_panel = slot0.main_container:getChildByName("item_buy_panel")

	if Config.ItemData.data_get_data(slot0.item_id) then
		slot0.item_buy_panel:getChildByName("cost_icon"):loadTexture(PathTool.getItemRes(slot7.icon), LOADTEXT_TYPE)
	end

	slot0.cost_label = slot0.item_buy_panel:getChildByName("label")
	slot0.add_btn = slot0.item_buy_panel:getChildByName("add_btn")

	if Config.HolidayConvertData.data_const.jump_to.val == 0 then
		slot0.add_btn:setVisible(false)
	end

	slot0.tips_label = slot0.main_container:getChildByName("tips_label")

	slot0.tips_label:setString(TI18N("可参与置换英雄:"))

	slot0.look_btn = slot0.main_container:getChildByName("look_btn")

	slot0:updateItemInfo()
end

function ActionHeroConvertPanel.register_event(slot0)
	registerButtonEventListener(slot0.add_btn, function ()
		uv0:onAddBtn()
	end, true, 2)
	registerButtonEventListener(slot0.change_btn, function ()
		uv0:onChangeBtn()
	end, true, 2)

	function slot4(slot0, slot1, slot2)
		if Config.HolidayConvertData.data_const.game_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end

		slot4 = Config.PartnerData.data_partner_const.game_rule1
	end

	slot5 = true

	registerButtonEventListener(slot0.look_btn, slot4, slot5, 1)

	for slot4, slot5 in pairs(slot0.camp_btn_list) do
		registerButtonEventListener(slot5, function ()
			uv0:onClickBtnShowByIndex(uv1)
		end, true, 2, nil, 0.8)
	end

	if not slot0.upgrade_star_select_event then
		slot0.upgrade_star_select_event = GlobalEvent:getInstance():Bind(HeroEvent.Upgrade_Star_Select_Event, function (slot0)
			if uv0.select_data then
				uv0:updateHeroItem(uv0.select_data)
			end
		end)
	end

	if not slot0.del_hero_event then
		slot0.del_hero_event = GlobalEvent:getInstance():Bind(HeroEvent.Del_Hero_Event, function (slot0)
			if uv0.parent.select_index == HeroConst.SacrificeType.eHeroReplace then
				if not uv0.select_camp then
					return
				end

				uv0.left_hero_vo = nil
				uv0.select_data = nil

				uv0.left_panel:setVisible(false)
				uv0.right_panel:setVisible(false)
				uv0:updateHeroItem()
				uv0:initConvertData()
				uv0:updateHeroList(uv0.select_camp, true)

				if uv0.select_cell ~= nil then
					uv0.select_cell:setSelected(false)
				end

				uv0.select_index = 0

				message(TI18N("置换成功!"))
			end
		end)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				uv0:updateItemInfo()
			end
		end)
	end

	if not slot0.del_goods_event then
		slot0.del_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				uv0:updateItemInfo()
			end
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				uv0:updateItemInfo()
			end
		end)
	end

	if not slot0.hero_reset_star_event then
		slot0.hero_reset_star_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Reset_Star_Event, function (slot0)
			if not slot0 then
				return
			end

			if not uv0.left_hero_vo then
				return
			end

			if #slot0.list == 0 then
				uv0:checkSender16686()
			else
				uv1:openHeroResetOfferPanel(true, slot0.list, is_show_tip, function ()
					if not uv0.left_hero_vo then
						return
					end

					uv0:checkSender16686()
				end, HeroConst.ResetType.eTenStarChang)
			end
		end)
	end
end

function ActionHeroConvertPanel.checkSender16686(slot0)
	if not slot0.record_bid then
		return
	end

	if not slot0.record_hero_list then
		return
	end

	slot2 = slot0.item_id
	slot3 = 10

	if slot0.dic_hero_star_camptype[slot0.left_hero_vo.star][slot0.left_hero_vo.camp_type] and slot1.loss and next(slot4) ~= nil then
		slot2 = slot4[1][1]
		slot3 = slot4[1][2]
	end

	if not Config.ItemData.data_get_data(slot2) then
		return
	end

	CommonAlert.show(uv0(TI18N("是否消耗<img src='%s' scale=0.3 /><div fontcolor=#%s> %s x %s </div>对英雄进行置换?将无法继承魂器功能,操作无法撤回,请谨慎选择."), PathTool.getItemRes(slot4.icon), BackPackConst.getWhiteQualityColorStr(slot4.quality), slot4.name, slot3), TI18N("确定"), function ()
		uv0:sender11098(uv1.left_hero_vo.id, 3)
		uv2:sender16686(uv1.left_hero_vo.partner_id, uv1.record_bid, uv1.record_hero_list)

		uv1.record_bid = nil
		uv1.record_hero_list = nil
	end, TI18N("取消"), nil, CommonAlert.type.rich)
end

function ActionHeroConvertPanel.onAddBtn(slot0)
	if slot0.item_id then
		BackpackController:getInstance():openTipsSource(true, slot0.item_id)
	end
end

function ActionHeroConvertPanel.onChangeBtn(slot0)
	if not slot0.left_hero_vo then
		message(TI18N("请选择要置换的英雄"))

		return
	end

	if not slot0.select_data or not slot0.select_data.dic_select_list then
		message(TI18N("请点击加号选择置换的英雄"))

		return
	end

	slot1 = {}

	for slot6, slot7 in pairs(slot0.select_data.dic_select_list) do
		if nil == nil then
			slot2 = slot7.bid
		end

		uv0(slot1, {
			partner_id = slot7.partner_id
		})
	end

	if #slot1 < slot0.dic_hero_star_camptype[slot0.left_hero_vo.star][slot0.left_hero_vo.camp_type].expend then
		message(TI18N("材料不足"))

		return
	end

	slot0.record_hero_list = slot1
	slot0.record_bid = slot2

	uv1:sender11087(slot1)
end

function ActionHeroConvertPanel.onClickHeroItem(slot0)
	if not slot0.left_hero_vo then
		message(TI18N("请选择要置换的英雄"))

		return
	end

	if not slot0.dic_hero_star_camptype or not slot0.dic_hero_star_camptype[slot0.left_hero_vo.star] then
		return
	end

	if not slot0.dic_hero_star_camptype[slot0.left_hero_vo.star][slot0.left_hero_vo.camp_type] then
		return
	end

	if Config.HolidayConvertData.data_target_hero_list[slot1.target_group] and next(slot2) ~= nil then
		if slot0.select_data == nil then
			slot0.select_data = {
				bid = 0,
				star = 5
			}
		end

		if slot0.select_data.left_hero_vo == nil or slot0.select_data.left_hero_vo.partner_id ~= slot0.left_hero_vo.partner_id then
			slot0.select_data.left_hero_vo = slot0.left_hero_vo
			slot0.select_data.dic_select_list = {}
			slot0.select_data.camp_type = slot0.left_hero_vo.camp_type
			slot0.select_data.count = slot1.expend
		end

		slot0.select_data.hero_list = {}

		for slot6, slot7 in pairs(slot2) do
			if slot0.left_hero_vo.bid ~= slot6 and uv0:getHeroInfoByBidStar(slot6, slot0.select_data.star) then
				for slot12, slot13 in ipairs(slot8) do
					if not slot13:isResonateHero() then
						uv1(slot0.select_data.hero_list, slot13)
					end
				end
			end
		end

		uv2:openHeroUpgradeStarSelectPanel(true, slot0.select_data, {}, HeroConst.SelectHeroType.eTenConvert)
	end
end

function ActionHeroConvertPanel.onClickBtnShowByIndex(slot0, slot1)
	if slot0.img_select and slot0.camp_btn_list[slot1] then
		slot2, slot3 = slot0.camp_btn_list[slot1]:getPosition()

		slot0.img_select:setPosition(slot2 - 0.5, slot3 + 1)
	end

	slot0:updateHeroList(slot1)
end

function ActionHeroConvertPanel.updateHeroList(slot0, slot1, slot2)
	if not slot2 and (slot1 or 0) == slot0.select_camp then
		return
	end

	slot0.left_hero_vo = nil
	slot0.select_data = nil

	slot0.left_panel:setVisible(false)
	slot0.right_panel:setVisible(false)
	slot0:updateHeroItem()

	slot0.select_index = 0

	if slot0.scroll_view == nil then
		slot0.scroll_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_scrollview:getContentSize(), {
			start_y = 0,
			row = 1,
			start_x = 20,
			space_x = 0,
			item_width = 120,
			item_height = 120,
			space_y = 0,
			col = 5,
			need_dynamic = true
		}, cc.p(0, 0))

		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.select_camp = slot3
	slot4 = {}

	if slot3 == 0 then
		slot4 = slot0.conver_hero_list
	else
		slot0.show_list = {}

		for slot8, slot9 in ipairs(slot0.conver_hero_list) do
			if slot9.camp_type == slot3 then
				uv0(slot4, slot9)
			end
		end
	end

	slot0.show_list = {}
	slot5 = {}

	for slot9, slot10 in pairs(slot4) do
		if slot3 == 0 or slot3 == slot10.camp_type then
			if slot10:isLock() or slot10.isInForm and slot10:isInForm() then
				uv0(slot5, slot10)
			else
				uv0(slot0.show_list, slot10)
			end

			slot10.is_ui_select = nil
		end
	end

	slot6 = SortTools.tableLowerSorter({
		"camp_type",
		"star",
		"bid"
	})

	uv1(slot5, slot6)

	slot10 = slot6

	uv1(slot0.show_list, slot10)

	for slot10, slot11 in ipairs(slot5) do
		uv0(slot0.show_list, slot11)
	end

	slot0.scroll_view:reloadData()

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.lay_scrollview, true, {
			font_size = 22,
			offset_y = 36,
			scale = 0.5,
			text = TI18N("暂无该类型英雄")
		})
	else
		commonShowEmptyIcon(slot0.lay_scrollview, false)
	end
end

function ActionHeroConvertPanel.createNewCell(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(0.9, true)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function ActionHeroConvertPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ActionHeroConvertPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)

	if slot0.select_index == slot2 then
		slot1:setSelected(true)
	else
		slot1:setSelected(false)
	end

	if slot3.isLock and slot3:isLock() or slot3.isInForm and slot3:isInForm() then
		slot1:showLockIcon(true)
	else
		slot1:showLockIcon(false)
	end
end

function ActionHeroConvertPanel.onCellTouched(slot0, slot1)
	if not slot1.index then
		return
	end

	if not slot0.show_list[slot1.index] then
		return
	end

	if slot2:checkHeroLockTips(true) then
		return
	end

	if slot0.select_cell ~= nil then
		slot0.select_cell:setSelected(false)
	end

	slot0.select_cell = slot1
	slot0.select_index = slot1.index

	if slot0.select_cell then
		slot0.select_cell:setSelected(true)
	end

	slot0.left_hero_vo = slot2

	slot0.left_panel:setVisible(true)
	slot0.right_panel:setVisible(false)
	slot0:updateSpine(slot0.left_panel, slot2, true)

	if slot0.dic_hero_star_camptype and slot0.dic_hero_star_camptype[slot0.left_hero_vo.star] then
		slot0:updateCostInfo(slot0.dic_hero_star_camptype[slot0.left_hero_vo.star][slot0.left_hero_vo.camp_type])
	end

	slot0:updateHeroItem()
end

function ActionHeroConvertPanel.updateSpine(slot0, slot1, slot2, slot3)
	if slot1.record_spine_bid and slot1.record_spine_bid == slot2.bid and slot1.record_spine_star and slot1.record_spine_star == slot2.star then
		if slot3 and slot1.spine then
			slot1.spine:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.FadeIn:create(0.2)))
		end

		return
	end

	slot1.record_spine_bid = slot2.bid
	slot1.record_spine_star = slot2.star

	if slot1.spine then
		doStopAllActions(slot1.spine)
		slot1.spine:removeFromParent()

		slot1.spine = nil

		;(function ()
			if not uv0.spine then
				uv0.spine = BaseRole.new(BaseRole.type.partner, uv1, nil, {
					scale = 1,
					skin_id = uv1.use_skin
				})

				uv0.spine:setAnimation(0, PlayerAction.show, true)
				uv0.spine:setCascade(true)
				uv0.spine:setScale(0.5)
				uv0.spine:setPosition(cc.p(100, 80))
				uv0.spine:setAnchorPoint(cc.p(0, 0))
				uv0:addChild(uv0.spine)
				uv0.spine:setOpacity(0)
				uv0.spine:runAction(cc.FadeIn:create(0.2))
			end
		end)()
	else
		slot4()
	end
end

function ActionHeroConvertPanel.updateHeroItem(slot0, slot1)
	if not slot0.hero_item then
		return
	end

	if not slot0.left_hero_vo then
		slot0.hero_item:setData()
		slot0.hero_item:setLev("0/5")
		slot0.hero_item:showAddIcon(true)

		return
	end

	if not slot0.dic_hero_star_camptype or not slot0.dic_hero_star_camptype[slot0.left_hero_vo.star] then
		return
	end

	if not slot0.dic_hero_star_camptype[slot0.left_hero_vo.star][slot0.left_hero_vo.camp_type] then
		return
	end

	if slot1 then
		slot3 = 0
		slot4 = nil

		if slot0.select_data.dic_select_list then
			for slot8, slot9 in pairs(slot0.select_data.dic_select_list) do
				if slot4 == nil then
					slot4 = slot9
				end

				slot3 = slot3 + 1
			end
		end

		if slot4 ~= nil then
			slot0.hero_item:setData(slot4)
			slot0.hero_item:showAddIcon(false)
			slot0.right_panel:setVisible(true)
			slot0:updateSpine(slot0.right_panel, {
				bid = slot4.bid,
				star = slot2.star
			}, false)
		else
			slot0.hero_item:setData()
			slot0.right_panel:setVisible(false)
			slot0.hero_item:showAddIcon(true)
		end

		slot0.hero_item:setLev(uv0("%s/%s", slot3, slot2.expend))
	else
		slot0.hero_item:setData()
		slot0.hero_item:setLev(uv0("0/%s", slot2.expend))
		slot0.hero_item:showAddIcon(true)
	end
end

function ActionHeroConvertPanel.updateItemInfo(slot0)
	slot0.cost_label:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.item_id))
end

function ActionHeroConvertPanel.updateCostInfo(slot0, slot1)
	slot2 = slot0.item_id
	slot3 = 10

	if slot1 and slot1.loss and next(slot4) ~= nil then
		slot2 = slot4[1][1]
		slot3 = slot4[1][2]
	end

	if Config.ItemData.data_get_data(slot2) then
		slot0.change_btn_label:setString(string.format("<img src=%s visible=true scale=0.3 /><div fontColor=#ffffff fontsize=26 outline=2,#020019>%d %s</div>", PathTool.getItemRes(slot4.icon), slot3, TI18N("置换")))
	end
end

function ActionHeroConvertPanel.initConvertData(slot0)
	if not Config.HolidayConvertData.data_convert_info then
		return
	end

	slot0.conver_hero_list = {}
	slot0.dic_hero_star_camptype = {}

	for slot5, slot6 in pairs(slot1) do
		if slot0.dic_hero_star_camptype[slot5] == nil then
			slot0.dic_hero_star_camptype[slot5] = {}
		end

		for slot10, slot11 in pairs(slot6) do
			slot0.dic_hero_star_camptype[slot5][slot10] = slot11

			for slot16, slot17 in pairs(Config.HolidayConvertData.data_hero_list[slot11.src_group]) do
				if uv0:getHeroInfoByBidStar(slot16, slot5) then
					for slot22, slot23 in ipairs(slot18) do
						uv1(slot0.conver_hero_list, slot23)
					end
				end
			end
		end
	end
end

function ActionHeroConvertPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionHeroConvertPanel.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.left_img_load then
		slot0.left_img_load:DeleteMe()

		slot0.left_img_load = nil
	end

	if slot0.right_img_load then
		slot0.right_img_load:DeleteMe()

		slot0.right_img_load = nil
	end

	if slot0.modify_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.modify_goods_event)

		slot0.modify_goods_event = nil
	end

	if slot0.add_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.add_goods_event)

		slot0.add_goods_event = nil
	end

	if slot0.del_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.del_goods_event)

		slot0.del_goods_event = nil
	end

	if slot0.hero_reset_star_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_reset_star_event)

		slot0.hero_reset_star_event = nil
	end

	if slot0.upgrade_star_select_event then
		GlobalEvent:getInstance():UnBind(slot0.upgrade_star_select_event)

		slot0.upgrade_star_select_event = nil
	end

	if slot0.limin_common_event then
		GlobalEvent:getInstance():UnBind(slot0.limin_common_event)

		slot0.limin_common_event = nil
	end

	if slot0.del_hero_event then
		GlobalEvent:getInstance():UnBind(slot0.del_hero_event)

		slot0.del_hero_event = nil
	end

	if slot0.resources_load ~= nil then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end
end
