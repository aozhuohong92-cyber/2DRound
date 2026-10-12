HeroResetPanel = class("HeroResetPanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()
slot2 = HeroController:getInstance():getModel()
slot3 = string.format
slot4 = table.insert
slot5 = table.merge
slot6 = table.sort

function HeroResetPanel.ctor(slot0)
	slot0.data = nil
	slot0.hero_retrun_items = {}
	slot0.is_send_items = false

	slot0:loadResources()
end

function HeroResetPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionheroreset", "actionheroreset"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_return_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:configUI()
		uv0:register_event()
		uv0:initData()
	end)
end

function HeroResetPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("hero/hero_reset_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.background = slot0.root_wnd:getChildByName("background")

	if not slot0.bg_load then
		slot0.bg_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_return_bg", true), ResourcesType.single, function ()
			if not tolua.isnull(uv0.background) then
				loadSpriteTexture(uv0.background, uv1, LOADTEXT_TYPE)
			end
		end, slot0.bg_load)
	end

	slot0.lay_scrollview = slot0.main_container:getChildByName("lay_scrollview")
	slot0.reset_btn = slot0.main_container:getChildByName("reset_btn")
	slot0.item_buy_panel = slot0.main_container:getChildByName("item_buy_panel")
	slot0.cost_icon = slot0.item_buy_panel:getChildByName("cost_icon")
	slot0.cost_label = slot0.item_buy_panel:getChildByName("label")
	slot0.add_btn = slot0.item_buy_panel:getChildByName("add_btn")
	slot0.change_btn = slot0.main_container:getChildByName("change_btn")
	slot2 = slot0.change_btn:getContentSize()
	slot0.change_btn_label = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(slot2.width * 0.5, slot2.height * 0.5), nil, nil, 900)

	slot0.change_btn:addChild(slot0.change_btn_label)

	slot0.reset_layout = slot0.main_container:getChildByName("reset_layout")
	slot0.time_title_0 = slot0.reset_layout:getChildByName("time_title_0")

	slot0.time_title_0:setString(TI18N([[
获
得
预
览]]))

	slot0.lay_hero = slot0.main_container:getChildByName("lay_hero")
	slot0.item_scrollview = slot0.main_container:getChildByName("item_scrollview")

	slot0.main_container:addChild(createRichLabel(20, cc.c4b(255, 255, 255, 255), cc.p(0, 0.5), cc.p(75, 400), nil, nil, 9000))

	if Config.PartnerData.data_partner_const.return_desc1 then
		slot3:setString(slot4.desc)
	end

	slot0.look_btn = slot0.main_container:getChildByName("look_btn")
	slot0.lay_hero = slot0.main_container:getChildByName("lay_hero")
	slot0.hero_info_panel = slot0.lay_hero:getChildByName("hero_info_panel")
	slot0.bg_img = slot0.lay_hero:getChildByName("bg_img")
	slot0.mode_node = slot0.lay_hero:getChildByName("mode_node")

	slot0.mode_node:setZOrder(2)

	slot0.star_node = slot0.hero_info_panel:getChildByName("star_node")
	slot0.star_node_2 = slot0.hero_info_panel:getChildByName("star_node_2")
	slot0.camp_icon = slot0.hero_info_panel:getChildByName("camp_icon")
	slot0.lv_lab_1 = slot0.hero_info_panel:getChildByName("lv_lab_1")
	slot0.lv_lab_2 = slot0.hero_info_panel:getChildByName("lv_lab_2")
	slot0.info_btn = slot0.hero_info_panel:getChildByName("info_btn")
	slot0.name = slot0.hero_info_panel:getChildByName("name")

	slot0:updateCostInfo()
end

function HeroResetPanel.register_event(slot0)
	registerButtonEventListener(slot0.add_btn, function ()
		uv0:onAddBtn()
	end, true, 1)
	registerButtonEventListener(slot0.change_btn, function ()
		uv0:onChangeBtn()
	end, true, 1)
	registerButtonEventListener(slot0.reset_btn, function ()
		uv0:onResetBtn()
	end, true, 1)
	registerButtonEventListener(slot0.lay_hero, function ()
		uv0:onResetBtn()
	end, false, 1)
	registerButtonEventListener(slot0.info_btn, function ()
		uv0:onInfoBtn()
	end, true, 1)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		if Config.PartnerData.data_partner_const.return_desc2 then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end

		slot4 = Config.PartnerData.data_partner_const.game_rule1
	end, true, 1)

	if not slot0.action_hero_reset_event then
		slot0.action_hero_reset_event = GlobalEvent:getInstance():Bind(HeroEvent.HERO_RESET_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0.is_reseting = false

			if slot0.result == TRUE then
				uv0.select_hero_vo = nil

				uv0:initData()
			end
		end)
	end

	if not slot0.hero_return_select_event then
		slot0.hero_return_select_event = GlobalEvent:getInstance():Bind(HeroEvent.HERO_RETURN_SELECT_EVENT, function (slot0)
			uv0.select_hero_vo = slot0

			uv0:initData()
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
		slot0.hero_reset_star_event = GlobalEvent:getInstance():Bind(HeroEvent.HERO_RESET_ITEM_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if not uv0.select_hero_vo then
				return
			end

			if uv0.is_send_items == true then
				uv0.hero_retrun_items[uv0.select_hero_vo.partner_id] = slot0.list

				uv0:updateItemList(slot0.list)
			elseif #slot0.list == 0 then
				uv0:checkSender11066()
			else
				uv1:openHeroResetOfferPanel(true, slot0.list, is_show_tip, function ()
					uv0:checkSender11066()
				end, HeroConst.ResetType.eHeroReturn)
			end

			uv0.is_send_items = false
		end)
	end
end

function HeroResetPanel.checkSender11066(slot0)
	if not slot0.select_hero_vo then
		return
	end

	slot1 = slot0.item_id
	slot2 = 10

	if Config.PartnerData.data_partner_const.return_cost and slot3.val[1] then
		slot1 = slot3.val[1][1] or 1
		slot2 = slot3.val[1][2] or 0
	end

	if not Config.ItemData.data_get_data(slot1) then
		return
	end

	CommonAlert.show(uv0(TI18N("是否消耗<img src='%s' scale=0.3 /><div fontcolor=#%s> %s x %s </div>对英雄进行回退？\n               操作无法撤回，请谨慎选择。"), PathTool.getItemRes(slot4.icon), BackPackConst.getWhiteQualityColorStr(slot4.quality), slot4.name, slot2), TI18N("确定"), function ()
		if tolua.isnull(uv0.root_wnd) then
			return
		end

		uv0.is_reseting = true

		if uv0.reset_btn then
			uv0.reset_btn:setVisible(false)
		end

		uv0:playResetEffect(true)
		delayRun(uv0.main_container, 1, function ()
			uv0:sender11065(uv1.select_hero_vo.partner_id)
		end)
	end, TI18N("取消"), nil, CommonAlert.type.rich)
end

function HeroResetPanel.onInfoBtn(slot0)
	if not slot0.select_hero_vo then
		return
	end

	uv0:openHeroTipsPanel(true, slot0.select_hero_vo)
end

function HeroResetPanel.onAddBtn(slot0)
	if Config.PartnerData.data_partner_const.return_cost and slot1.val[1] and Config.ItemData.data_get_data(slot1.val[1][1]) then
		BackpackController:getInstance():openTipsSource(true, slot2)
	end
end

function HeroResetPanel.onChangeBtn(slot0)
	if not slot0.select_hero_vo then
		message(TI18N("请选择回退的英雄"))

		return
	end

	if slot0.is_reseting then
		message(TI18N("英雄回退中"))

		return
	end

	slot1 = slot0.item_id
	slot2 = 10

	if Config.PartnerData.data_partner_const.return_cost and slot3.val[1] then
		slot1 = slot3.val[1][1] or 1
		slot2 = slot3.val[1][2] or 0
	end

	if BackpackController:getInstance():getModel():getItemNumByBid(slot1) < slot2 then
		slot0:onAddBtn()

		return
	end

	uv0:sender11066(slot0.select_hero_vo.partner_id)
end

function HeroResetPanel.onResetBtn(slot0)
	if slot0.is_reseting then
		return
	end

	uv0:openActionHeroResetSelectPanel(true, {
		is_hero_return = true,
		select_hero_vo = slot0.select_hero_vo
	})
end

function HeroResetPanel.updateSpine(slot0, slot1, slot2, slot3)
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
				uv0.spine:setScale(0.8)
				uv0.spine:setPositionY(50)
				uv0.spine:setAnchorPoint(cc.p(0, 0))
				uv0:addChild(uv0.spine, 2)
				uv0.spine:setOpacity(0)
				uv0.spine:runAction(cc.FadeIn:create(0.2))
			end
		end)()
	else
		slot4()
	end
end

function HeroResetPanel.updateItemInfo(slot0)
	if not slot0.item_id then
		return
	end

	slot0.cost_label:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.item_id))
end

function HeroResetPanel.updateCostInfo(slot0, slot1)
	if Config.PartnerData.data_partner_const.return_cost and slot2.val[1] then
		slot0.item_id = slot2.val[1][1]

		if Config.ItemData.data_get_data(slot0.item_id) then
			slot0.change_btn_label:setString(string.format("<img src=%s visible=true scale=0.3 /><div fontColor=#ffffff fontsize=26 outline=2,#020019>%d %s</div>", PathTool.getItemRes(slot3.icon), slot2.val[1][2], TI18N("回退")))
			slot0.cost_icon:loadTexture(PathTool.getItemRes(slot3.icon), LOADTEXT_TYPE)
		end

		slot0:updateItemInfo()
	end
end

function HeroResetPanel.initData(slot0)
	slot1 = {}
	slot2 = {
		scale = 0.9,
		max_count = 4,
		is_center = true,
		space_x = 20
	}

	if slot0.select_hero_vo == nil then
		slot0.bg_img:setVisible(true)
		slot0:initStar(0, 0)
		slot0.hero_info_panel:setVisible(false)
		slot0.mode_node:setVisible(false)
		slot0.reset_btn:setVisible(false)
		slot0:playCommonEffect(false)

		if Config.PartnerData.data_partner_const.return_pre_reward then
			slot1 = Config.PartnerData.data_partner_const.return_pre_reward.val
		end

		slot0.item_list = uv0:showSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot1, slot2)
	else
		slot0.bg_img:setVisible(false)

		slot3 = slot0.select_hero_vo.star or 0
		slot5 = 10

		if Config.PartnerData.data_partner_const.return_star then
			slot5 = slot4.val
		end

		slot0:initStar(slot3, slot5)
		slot0.name:setString(slot0.select_hero_vo.name)
		slot0.lv_lab_1:setString("lv." .. slot0.select_hero_vo.lev)

		slot6 = slot0.select_hero_vo.lev

		if Config.PartnerData.data_partner_const.return_lv then
			if slot7.val < slot0.select_hero_vo.lev then
				slot6 = slot7.val
			end

			slot0.lv_lab_2:setString("lv." .. slot6)
		end

		slot0.hero_info_panel:setVisible(true)

		slot8 = slot0.select_hero_vo.camp_type or 1
		slot9 = PathTool.getHeroCampTypeIcon(slot0.select_hero_vo.camp_type)

		if slot0.record_camp_type_res == nil or slot0.record_camp_type_res ~= slot9 then
			slot0.record_camp_type_res = slot9

			loadSpriteTexture(slot0.camp_icon, slot9, LOADTEXT_TYPE_PLIST)
		end

		slot0.mode_node:setVisible(true)
		slot0:updateSpine(slot0.mode_node, slot0.select_hero_vo, true)
		slot0.reset_btn:setVisible(true)
		slot0:playCommonEffect(true)

		if slot0.hero_retrun_items and slot0.hero_retrun_items[slot0.select_hero_vo.partner_id] then
			slot0:updateItemList(slot0.hero_retrun_items[slot0.select_hero_vo.partner_id])
		else
			slot0.is_send_items = true

			uv0:sender11066(slot0.select_hero_vo.partner_id)
		end
	end
end

function HeroResetPanel.updateItemList(slot0, slot1)
	if tolua.isnull(slot0.root_wnd) then
		return
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		if slot7.is_partner == 1 then
			uv0(slot2, {
				bid = slot7.id,
				star = slot7.star,
				lev = slot7.lev,
				show_type = MainuiConst.item_exhibition_type.partner_type
			})
		else
			uv0(slot2, {
				slot7.id,
				slot7.num
			})
		end
	end

	slot0.item_list = uv1:showSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot2, {
		scale = 0.9,
		max_count = 4,
		is_center = true,
		space_x = 20
	})
end

function HeroResetPanel.initStar(slot0, slot1, slot2)
	slot5 = 26
	slot0.star_setting = uv0:getModel():createStar(slot1 or 0, slot0.star_node, slot0.star_setting, slot5)
	slot0.star_setting_2 = uv0:getModel():createStar(slot2 or 0, slot0.star_node_2, slot0.star_setting_2, slot5)
end

function HeroResetPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		-- Nothing
	end
end

function HeroResetPanel.playCommonEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine("E24702", cc.p(75, 13), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.play_effect:setScale(0.8)
		slot0.lay_hero:addChild(slot0.play_effect, 1)
	else
		slot0.play_effect:setAnimation(0, PlayerAction.action, true)
	end
end

function HeroResetPanel.playResetEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect2 then
			slot0.play_effect2:clearTracks()
			slot0.play_effect2:removeFromParent()

			slot0.play_effect2 = nil
		end
	elseif slot0.play_effect2 == nil then
		slot0.play_effect2 = createEffectSpine("E24701", cc.p(83, 143), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.lay_hero:addChild(slot0.play_effect2, 3)
	else
		slot0.play_effect2:setAnimation(0, PlayerAction.action, false)
	end
end

function HeroResetPanel.DeleteMe(slot0)
	CommonAlert.closeAllWin()
	slot0:playCommonEffect(false)
	slot0:playResetEffect(false)

	if slot0.item_list ~= nil then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end

	slot0.item_list = nil

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

	if slot0.limin_common_event then
		GlobalEvent:getInstance():UnBind(slot0.limin_common_event)

		slot0.limin_common_event = nil
	end

	if slot0.action_hero_reset_event then
		GlobalEvent:getInstance():UnBind(slot0.action_hero_reset_event)

		slot0.action_hero_reset_event = nil
	end

	if slot0.hero_return_select_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_return_select_event)

		slot0.hero_return_select_event = nil
	end

	if slot0.resources_load ~= nil then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.bg_load ~= nil then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	doStopAllActions(slot0.main_container)
end
