ActionHeroResetPanel = class("ActionHeroResetPanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()
slot2 = HeroController:getInstance():getModel()
slot3 = string.format
slot4 = table.insert
slot5 = table.sort

function ActionHeroResetPanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.type = slot2
	slot0.data = nil

	slot0:loadResources()
end

function ActionHeroResetPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionheroreset", "actionheroreset"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:configUI()
		uv0:register_event()
		uv0:initData()
	end)
end

function ActionHeroResetPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_hero_reset_panel"))

	slot0.root_wnd:setPosition(-40, -80)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_img = slot0.main_container:getChildByName("title_img")

	if slot0.item_load == nil then
		slot0.item_load = loadSpriteTextureFromCDN(slot0.title_img, PathTool.getPlistImgForDownLoad("bigbg/action", "action_hero_reset_bg", false), ResourcesType.single, slot0.item_load)
	end

	slot0.lay_scrollview = slot0.main_container:getChildByName("lay_scrollview")
	slot0.reset_btn = slot0.main_container:getChildByName("reset_btn")
	slot0.skin_btn = slot0.main_container:getChildByName("skin_btn")
	slot0.skin_btn_lab = slot0.skin_btn:getChildByName("lab")

	slot0.skin_btn_lab:setString(TI18N("皮肤置换"))
	slot0.skin_btn:setVisible(false)

	slot0.item_buy_panel = slot0.main_container:getChildByName("item_buy_panel")
	slot0.cost_icon = slot0.item_buy_panel:getChildByName("cost_icon")
	slot0.cost_label = slot0.item_buy_panel:getChildByName("label")
	slot0.add_btn = slot0.item_buy_panel:getChildByName("add_btn")

	slot0.add_btn:setVisible(false)

	slot0.change_btn = slot0.main_container:getChildByName("change_btn")
	slot1 = slot0.change_btn:getContentSize()
	slot0.change_btn_label = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(slot1.width * 0.5, slot1.height * 0.5), nil, , 900)

	slot0.change_btn:addChild(slot0.change_btn_label)

	slot0.reset_layout = slot0.main_container:getChildByName("reset_layout")
	slot0.time_title_0 = slot0.reset_layout:getChildByName("time_title_0")

	slot0.time_title_0:setString(TI18N([[
获
得
预
览]]))

	slot0.lay_hero = slot0.main_container:getChildByName("lay_hero")
	slot0.title_name = slot0.main_container:getChildByName("title_name")

	slot0.title_name:setString(TI18N("限时重生"))

	slot0.time_title = slot0.main_container:getChildByName("time_title")

	slot0.time_title:setString(TI18N("剩余时间:"))

	slot0.time_val = slot0.main_container:getChildByName("time_val")

	if uv0:getActionSubTabVo(slot0.holiday_bid) then
		slot0:setLessTime(slot2.remain_sec)
	end

	slot0.item_scrollview = slot0.main_container:getChildByName("item_scrollview")

	slot0.main_container:addChild(createRichLabel(20, cc.c4b(255, 255, 255, 255), cc.p(0, 0.5), cc.p(75, 272), nil, , 9000))

	if Config.PartnerData.data_partner_const.reborn_desc1 then
		slot3:setString(slot4.desc)
	end

	slot0.look_btn = slot0.main_container:getChildByName("look_btn")
	slot0.lay_hero = slot0.main_container:getChildByName("lay_hero")
	slot0.bg_img = slot0.lay_hero:getChildByName("bg_img")
	slot0.mode_node = slot0.lay_hero:getChildByName("mode_node")

	slot0.mode_node:setZOrder(2)

	slot0.star_node = slot0.lay_hero:getChildByName("star_node")
	slot0.camp_icon = slot0.lay_hero:getChildByName("camp_icon")
	slot0.name = slot0.lay_hero:getChildByName("name")

	slot0:updateCostInfo()

	if Config.PartnerData.data_partner_const.reborn_pre_reward then
		slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, Config.PartnerData.data_partner_const.reborn_pre_reward.val, {
			scale = 0.9,
			max_count = 4,
			is_center = true,
			space_x = 20
		})
	end
end

function ActionHeroResetPanel.register_event(slot0)
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
	registerButtonEventListener(slot0.skin_btn, function ()
		uv0:onSkinBtn()
	end, true, 1)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		if Config.PartnerData.data_partner_const.reborn_desc2 then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end

		slot4 = Config.PartnerData.data_partner_const.game_rule1
	end, true, 1)

	if not slot0.action_hero_reset_event then
		slot0.action_hero_reset_event = GlobalEvent:getInstance():Bind(ActionEvent.ACTION_HERO_RESET_EVENT, function (slot0)
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

	if not slot0.hero_reset_select_event then
		slot0.hero_reset_select_event = GlobalEvent:getInstance():Bind(ActionEvent.HERO_RESET_SELECT_EVENT, function (slot0)
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
		slot0.hero_reset_star_event = GlobalEvent:getInstance():Bind(ActionEvent.ACTION_HERO_RESET_ITEM_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if not uv0.select_hero_vo then
				return
			end

			if #slot0.list == 0 then
				uv0:checkSender11071()
			else
				uv1:openHeroResetOfferPanel(true, slot0.list, is_show_tip, function ()
					uv0:checkSender11071()
				end, HeroConst.ResetType.eActionHeroReset)
			end
		end)
	end
end

function ActionHeroResetPanel.checkSender11071(slot0)
	if not slot0.select_hero_vo then
		return
	end

	slot1 = slot0.item_id
	slot2 = 10

	if Config.PartnerData.data_partner_const.reborn_cost and slot3.val[1] then
		slot1 = slot3.val[1][1] or 1
		slot2 = slot3.val[1][2] or 0
	end

	if not Config.ItemData.data_get_data(slot1) then
		return
	end

	CommonAlert.show(uv0(TI18N("是否消耗<img src='%s' scale=0.3 /><div fontcolor=#%s> %s x %s </div>对英雄进行重生?操作无法撤回,请谨慎选择."), PathTool.getItemRes(slot4.icon), BackPackConst.getWhiteQualityColorStr(slot4.quality), slot4.name, slot2), TI18N("确定"), function ()
		uv0.is_reseting = true

		uv0.reset_btn:setVisible(false)
		uv0:playResetEffect(true)
		delayRun(uv0.main_container, 1, function ()
			uv0:sender11071(uv1.select_hero_vo.partner_id)
		end)
	end, TI18N("取消"), nil, CommonAlert.type.rich)
end

function ActionHeroResetPanel.onAddBtn(slot0)
end

function ActionHeroResetPanel.onChangeBtn(slot0)
	if not slot0.select_hero_vo then
		message(TI18N("请选择重生的英雄"))

		return
	end

	if slot0.is_reseting then
		message(TI18N("英雄重生中"))

		return
	end

	slot1 = slot0.item_id
	slot2 = 10

	if Config.PartnerData.data_partner_const.reborn_cost and slot3.val[1] then
		slot1 = slot3.val[1][1] or 1
		slot2 = slot3.val[1][2] or 0
	end

	if BackpackController:getInstance():getModel():getItemNumByBid(slot1) < slot2 then
		message(TI18N("道具不足!"))

		return
	end

	uv0:sender11072(slot0.select_hero_vo.partner_id)
end

function ActionHeroResetPanel.onSkinBtn(slot0)
	uv0:openActionHeroSkinResetPanel(true)
end

function ActionHeroResetPanel.onResetBtn(slot0)
	if slot0.is_reseting then
		return
	end

	uv0:openActionHeroResetSelectPanel(true, {
		select_hero_vo = slot0.select_hero_vo
	})
end

function ActionHeroResetPanel.updateSpine(slot0, slot1, slot2, slot3)
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

		function ()
			if not uv0.spine then
				uv0.spine = BaseRole.new(BaseRole.type.partner, uv1, nil, {
					scale = 1,
					skin_id = uv1.use_skin
				})

				uv0.spine:setAnimation(0, PlayerAction.show, true)
				uv0.spine:setCascade(true)
				uv0.spine:setPositionY(66)
				uv0.spine:setAnchorPoint(cc.p(0.5, 0.5))
				uv0:addChild(uv0.spine, 2)
				uv0.spine:setOpacity(0)
				uv0.spine:runAction(cc.FadeIn:create(0.2))
			end
		end()
	else
		slot4()
	end
end

function ActionHeroResetPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_val) then
		return
	end

	doStopAllActions(slot0.time_val)

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.time_val:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.time_val)
				uv1:setTimeFormatString(0)
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(0)
	end
end

function ActionHeroResetPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_val:setString(TimeTool.GetTimeFormatDayIIIIII(slot1))
	else
		slot0.time_val:setString(TI18N("00:00:00"))
	end
end

function ActionHeroResetPanel.updateItemInfo(slot0)
	if not slot0.item_id then
		return
	end

	slot0.cost_label:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.item_id))
end

function ActionHeroResetPanel.updateCostInfo(slot0, slot1)
	if Config.PartnerData.data_partner_const.reborn_cost and slot2.val[1] then
		slot0.item_id = slot2.val[1][1]

		if Config.ItemData.data_get_data(slot0.item_id) then
			slot0.change_btn_label:setString(string.format("<img src=%s visible=true scale=0.3 /><div fontColor=#ffffff fontsize=26 outline=2,#6c2b00>%d %s</div>", PathTool.getItemRes(slot3.icon), slot2.val[1][2], TI18N("重生")))
			slot0.cost_icon:loadTexture(PathTool.getItemRes(slot3.icon), LOADTEXT_TYPE)
		end

		slot0:updateItemInfo()
	end
end

function ActionHeroResetPanel.initData(slot0)
	if slot0.select_hero_vo == nil then
		slot0.bg_img:setVisible(true)
		slot0:initStar(0)
		slot0.name:setString("")
		slot0.camp_icon:setVisible(false)
		slot0.mode_node:setVisible(false)
		slot0.reset_btn:setVisible(false)
		slot0:playCommonEffect(false)
	else
		slot0.bg_img:setVisible(false)
		slot0:initStar(slot0.select_hero_vo.star or 0)
		slot0.name:setString(slot0.select_hero_vo.name)
		slot0.camp_icon:setVisible(true)

		slot2 = slot0.select_hero_vo.camp_type or 1
		slot3 = PathTool.getHeroCampTypeIcon(slot0.select_hero_vo.camp_type)

		if slot0.record_camp_type_res == nil or slot0.record_camp_type_res ~= slot3 then
			slot0.record_camp_type_res = slot3

			loadSpriteTexture(slot0.camp_icon, slot3, LOADTEXT_TYPE_PLIST)
		end

		slot0.mode_node:setVisible(true)
		slot0:updateSpine(slot0.mode_node, slot0.select_hero_vo, true)
		slot0.reset_btn:setVisible(true)
		slot0:playCommonEffect(true)
	end
end

function ActionHeroResetPanel.initStar(slot0, slot1)
	slot0.star_setting = HeroController:getInstance():getModel():createStar(slot1 or 0, slot0.star_node, slot0.star_setting, 26)
end

function ActionHeroResetPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		-- Nothing
	end
end

function ActionHeroResetPanel.playCommonEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine("E24702", cc.p(75, 53), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.lay_hero:addChild(slot0.play_effect, 1)
	else
		slot0.play_effect:setAnimation(0, PlayerAction.action, false)
	end
end

function ActionHeroResetPanel.playResetEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect2 then
			slot0.play_effect2:clearTracks()
			slot0.play_effect2:removeFromParent()

			slot0.play_effect2 = nil
		end
	elseif slot0.play_effect2 == nil then
		slot0.play_effect2 = createEffectSpine("E24701", cc.p(83, 203), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.lay_hero:addChild(slot0.play_effect2, 3)
	else
		slot0.play_effect2:setAnimation(0, PlayerAction.action, false)
	end
end

function ActionHeroResetPanel.DeleteMe(slot0)
	slot0:playCommonEffect(false)
	slot0:playResetEffect(false)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

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

	if slot0.hero_reset_select_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_reset_select_event)

		slot0.hero_reset_select_event = nil
	end

	if slot0.resources_load ~= nil then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	doStopAllActions(slot0.main_container)
end
