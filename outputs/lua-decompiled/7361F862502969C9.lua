ActiontermbeginsTabBossPanel = class("ActiontermbeginsTabBossPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ActiontermbeginsController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = RoleController:getInstance():getRoleVo()
slot5 = math.floor

function ActiontermbeginsTabBossPanel.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ActiontermbeginsTabBossPanel.config(slot0)
	slot0.paper_item_id = 1

	if Config.HolidayTermBeginsData.data_const.paper_item_id then
		slot0.paper_item_id = slot1.val
	end

	slot0.ticket_item_id = 1

	if Config.HolidayTermBeginsData.data_const.ticket_item_id then
		slot0.ticket_item_id = slot2.val
	end

	slot0.collection_quantity = 178750

	if Config.HolidayTermBeginsData.data_const.collection_quantity then
		slot0.collection_quantity = slot3.val
	end

	slot0.collection_buff = 21360

	if Config.HolidayTermBeginsData.data_const.collection_buff then
		slot0.collection_buff = slot4.val
	end
end

function ActiontermbeginsTabBossPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("actiontermbegins/action_term_begins_tab_boss_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container_size = slot0.main_container:getContentSize()
	slot0.item_lay_list = {}
	slot0.bottom_panel = slot0.main_container:getChildByName("bottom_panel")
	slot0.item_load_panel_bg = loadSpriteTextureFromCDN(slot0.bottom_panel:getChildByName("panel_bg"), PathTool.getPlistImgForDownLoad("bigbg/termbegins", "term_begins_panel_bg", false), ResourcesType.single, slot0.item_load_panel_bg)
	slot0.unopen_panel = slot0.bottom_panel:getChildByName("unopen_panel")
	slot4 = slot0.unopen_panel:getChildByName("progress_container")
	slot0.progress = slot4:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.progress_time = slot4:getChildByName("time")

	slot0.progress_time:setString("")
	slot0.unopen_panel:getChildByName("progress_key"):setString(TI18N("收集进度"))

	slot5 = TI18N("提交满分试卷可以增长进度,进度每增长1%为全服玩家提供5%伤害")

	if Config.HolidayTermBeginsData.data_const.collection_damage_tips then
		slot5 = slot6.desc
	end

	slot0.unopen_panel:getChildByName("protress_tips"):setString(slot5)

	slot0.comfirm_btn = slot0.unopen_panel:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("提交试卷"))

	slot0.open_panel = slot0.bottom_panel:getChildByName("open_panel")

	slot0.open_panel:getChildByName("hit_reward_label"):setString(TI18N("击杀奖励"))
	slot0.open_panel:getChildByName("hit_reward_tips"):setString(TI18N("所有参与的玩家可获得"))

	slot0.rank_reward_label = slot0.open_panel:getChildByName("rank_reward_label")

	slot0.rank_reward_label:setString(TI18N("您当前排名:"))

	slot0.rank_reward_tips = slot0.open_panel:getChildByName("rank_reward_tips")

	slot0.rank_reward_tips:setString(TI18N("保持排名您可获得以上奖励"))

	slot0.reward_item = BackPackItem.new(false, true, false, 0.6, false, true)

	slot0.reward_item:setDefaultTip()
	slot0.open_panel:getChildByName("reward_item_node"):addChild(slot0.reward_item)

	slot0.item_scrollview = slot0.open_panel:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	slot0.rank_btn = slot0.bottom_panel:getChildByName("rank_btn")

	slot0.rank_btn:getChildByName("label"):setString(TI18N("伤害排行"))

	slot0.sweep_btn = slot0.open_panel:getChildByName("sweep_btn")
	slot0.sweep_btn_label = slot0.sweep_btn:getChildByName("label")

	slot0.sweep_btn_label:setString(TI18N("一键扫荡"))

	slot0.fight_btn = slot0.open_panel:getChildByName("fight_btn")
	slot0.fight_btn_label = slot0.fight_btn:getChildByName("label")

	slot0.fight_btn_label:setString(TI18N("前往挑战"))

	slot0.is_hit_img = slot0.main_container:getChildByName("is_hit_img")

	slot0.is_hit_img:setVisible(false)
	slot0.is_hit_img:setZOrder(2)
	slot0.is_hit_img:getChildByName("hit_tips"):setString(TI18N("BOSS已被击败可以继续追击"))

	slot0.buff_node = slot0.main_container:getChildByName("buff_node")
	slot0.progress_container = slot0.main_container:getChildByName("progress_container")
	slot0.boss_hp_progress = slot0.progress_container:getChildByName("progress")

	slot0.boss_hp_progress:setPercent(0)

	slot0.boss_hp_value = slot0.progress_container:getChildByName("hp_value")

	slot0.boss_hp_value:setString("")

	slot0.boss_name = slot0.progress_container:getChildByName("boss_name")

	slot0.boss_name:setString("")

	slot0.reward_btn = slot0.bottom_panel:getChildByName("reward_btn")

	slot0.reward_btn:getChildByName("label"):setString(TI18N("收集奖励"))

	slot9 = slot0.bottom_panel:getChildByName("buy_panel")

	slot9:getChildByName("key"):setString(TI18N("当前拥有:"))

	slot0.icon = slot9:getChildByName("icon")
	slot0.buy_count = slot9:getChildByName("label")
	slot0.key_tips = slot9:getChildByName("key_tips")

	slot0.key_tips:setString(TI18N("数量不足时可以使用钻石挑战"))
	slot0.key_tips:setVisible(false)

	slot0.look_btn = slot0.bottom_panel:getChildByName("look_btn")
	slot0.less_time = createRichLabel(22, cc.c4b(128, 247, 49, 255), cc.p(0.5, 0.5), cc.p(360, 1024), nil, nil, 720)

	slot0.main_container:addChild(slot0.less_time)
end

function ActiontermbeginsTabBossPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.rank_btn, function ()
		uv0:onRankBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.sweep_btn, function ()
		uv0:onSweepBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.fight_btn, function ()
		uv0:onFightBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.reward_btn, function ()
		uv0:onRewardBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.HolidayTermBeginsData.data_const.boss_descreption.desc, slot1:getTouchBeganPosition())
	end, true, 1)

	if not slot0.boss_form_event then
		slot0.boss_form_event = GlobalEvent:getInstance():Bind(ActiontermbeginsEvent.TERM_BEGINS_BOSS_FORM_EVENT, function ()
			HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.TermBeginsBoss)
		end)
	end

	if not slot0.subit_paper_event then
		slot0.subit_paper_event = GlobalEvent:getInstance():Bind(ActiontermbeginsEvent.TERM_BEGINS_SUBIT_PAPER_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0.scdata.paper_sum = slot0.paper_sum or 0

			uv0:updateParperInfo()
		end)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				uv0:updateCostInfo()
			end
		end)
	end

	if not slot0.del_goods_event then
		slot0.del_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				uv0:updateCostInfo()
			end
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
				uv0:updateCostInfo()
			end
		end)
	end
end

function ActiontermbeginsTabBossPanel.onComfirmBtn(slot0)
	if not slot0.scdata then
		return
	end

	ActiontermbeginsController:getInstance():openActionBuyPanel(true, {
		item_id = slot0.paper_item_id,
		shop_type = MallConst.MallType.TermBeginsBuy
	})
end

function ActiontermbeginsTabBossPanel.onRankBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.boss_flag ~= 1 then
		-- Nothing
	end

	uv0:openActiontermbeginsRankMainPanel(true, {
		index = 2,
		rank_type = RankConstant.RankType.termbegins
	})
end

function ActiontermbeginsTabBossPanel.onSweepBtn(slot0)
	if slot0.is_time_out then
		message(TI18N("活动已结束"))

		return
	end

	if not slot0.scdata then
		return
	end

	if slot0.scdata.dps > 0 then
		if BackpackController:getInstance():getModel():getItemNumByBid(slot0.ticket_item_id) <= 0 then
			if not Config.ItemData.data_get_data(slot0.ticket_item_id) then
				return
			end

			slot3 = 3
			slot4 = 100

			if Config.HolidayTermBeginsData.data_const.entrance_exam_cost and next(slot5.val) ~= nil then
				slot3 = slot5.val[1] or 3
				slot4 = slot5.val[2] or 100
			end

			CommonAlert.show(uv0(TI18N("%s不足，是否花费 <img src=%s visible=true scale=0.5 />%s 购买<div fontcolor='#289b14'>1</div>张%s并扫荡？\n(扫荡根据上次的伤害量<div fontcolor=#249003>%s</div>进行结算)"), slot2.name, PathTool.getItemRes(Config.ItemData.data_get_data(slot3).icon), slot4, slot2.name, slot0.scdata.dps), TI18N("确定"), function ()
				uv0:sender26712(uv1.scdata.boss_id)
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		else
			CommonAlert.show(uv0(TI18N("确定按照上次挑战的伤害量<div fontcolor=#249003>%s</div>扫荡一次吗？"), slot0.scdata.dps), TI18N("确定"), function ()
				uv0:sender26709(uv1.scdata.boss_id)
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		end
	end
end

function ActiontermbeginsTabBossPanel.onFightBtn(slot0)
	if slot0.is_time_out then
		message(TI18N("活动已结束"))

		return
	end

	if BackpackController:getInstance():getModel():getItemNumByBid(slot0.ticket_item_id) <= 0 then
		if not Config.ItemData.data_get_data(slot0.ticket_item_id) then
			return
		end

		slot3 = 3
		slot4 = 100

		if Config.HolidayTermBeginsData.data_const.entrance_exam_cost and next(slot5.val) ~= nil then
			slot3 = slot5.val[1] or 3
			slot4 = slot5.val[2] or 100
		end

		CommonAlert.show(uv0(TI18N("%s不足，是否花费 <img src=%s visible=true scale=0.5 />%s 购买<div fontcolor='#289b14'>1</div>张%s"), slot2.name, PathTool.getItemRes(Config.ItemData.data_get_data(slot3).icon), slot4, slot2.name), TI18N("确定"), function ()
			uv0:sender26712(0)
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	else
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.TermBeginsBoss)
	end
end

function ActiontermbeginsTabBossPanel.onRewardBtn(slot0)
	uv0:openActiontermbeginsCollectResultPanel(true, {
		scdata = slot0.scdata,
		is_time_out = slot0.is_time_out
	})
end

function ActiontermbeginsTabBossPanel.setData(slot0, slot1)
	if not slot0.is_init then
		slot0.is_init = true

		if slot0.parent and slot0.parent.scdata then
			slot0:setScdata(slot0.parent.scdata)
		end
	end
end

function ActiontermbeginsTabBossPanel.setScdata(slot0, slot1)
	slot0.scdata = slot1

	if not Config.HolidayTermBeginsData.data_round_info[slot0.scdata.round] then
		return
	end

	if not Config.HolidayTermBeginsData.data_boss_info[slot2.boss_round] then
		return
	end

	for slot7, slot8 in pairs(slot3) do
		slot0.scdata.boss_id = slot8.boss_id

		break
	end

	slot0.boss_config = slot3[slot0.scdata.boss_id]

	if not slot0.boss_config then
		return
	end

	if slot0.scdata.boss_flag == 1 then
		slot0:initOpenPanelInfo()
	else
		slot0:initUnOpenPanleInfo()
	end
end

function ActiontermbeginsTabBossPanel.initUnOpenPanleInfo(slot0)
	if not slot0.scdata then
		return
	end

	slot0.unopen_panel:setVisible(true)
	slot0.open_panel:setVisible(false)
	slot0.progress_container:setVisible(false)
	slot0.buff_node:setVisible(false)
	slot0:updateBuffIconInfo(false)
	slot0:updateParperInfo()

	if slot0.boss_config then
		slot0:updateSpine(slot0.boss_config.unit_id)
	end

	slot0:updateCostInfo()
	slot0.less_time:setVisible(true)

	if slot0.scdata.boss_time - GameNet:getInstance():getTime() < 0 then
		slot1 = 0
	end

	commonCountDownTime(slot0.less_time, slot1, {
		callback = function (slot0)
			uv0:setTimeFormatString(slot0)
		end
	})
end

function ActiontermbeginsTabBossPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.less_time:setString(string.format(TI18N("<div outline=2,#000000>%s</div><div fontcolor=#ffffff outline=2,#000000 >后开放</div>"), TimeTool.GetTimeFormatDayIIIIII(slot1)))
	else
		slot0.less_time:setString(string.format(TI18N("<div fontcolor=#ffffff outline=2,#000000 >即将开放</div>")))
	end
end

function ActiontermbeginsTabBossPanel.updateParperInfo(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.paper_sum * 100 / slot0.collection_quantity > 100 then
		slot1 = 100
	end

	slot0.progress:setPercent(slot1)
	slot0.progress_time:setString(uv0(slot1) .. "%")
end

function ActiontermbeginsTabBossPanel.initOpenPanelInfo(slot0)
	if not slot0.scdata then
		return
	end

	if not slot0.boss_config then
		return
	end

	slot0.unopen_panel:setVisible(false)
	slot0.open_panel:setVisible(true)
	slot0.buff_node:setVisible(true)
	slot0:updateBuffIconInfo(true)
	slot0.less_time:setVisible(false)

	if slot0.scdata.dps and slot0.scdata.dps > 0 then
		slot0.sweep_btn_label:enableOutline(Config.ColorData.data_color4[263], 2)
		setChildUnEnabled(false, slot0.sweep_btn)
	else
		setChildUnEnabled(true, slot0.sweep_btn)
		slot0.sweep_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	end

	slot1 = slot0.scdata.boss_hp_per / 10

	slot0.boss_hp_progress:setPercent(slot1)
	slot0.boss_hp_value:setString(uv0(slot1) .. "%")
	slot0.boss_name:setString(slot0.boss_config.boss_name)

	if slot0.boss_config then
		slot0:updateSpine(slot0.boss_config.unit_id)
	end

	if slot0.scdata.boss_hp_per == 0 then
		slot0.is_hit_img:setVisible(true)
		slot0.progress_container:setVisible(false)
	else
		slot0.is_hit_img:setVisible(false)
		slot0.progress_container:setVisible(true)
	end

	if next(slot0.boss_config.hit_award) ~= nil then
		slot0.reward_item:setBaseData(slot0.boss_config.hit_award[1][1], slot0.boss_config.hit_award[1][2])
	end

	if (slot0.scdata.boss_rank or 0) and slot2 > 0 then
		slot0.rank_reward_label:setString(uv1(TI18N("您当前排名: %s%%"), slot2))
		slot0.rank_reward_tips:setString(TI18N("保持排名您可获得以上奖励"))
	else
		slot0.rank_reward_label:setString(uv1(TI18N("您当前排名: 未上榜")))
		slot0.rank_reward_tips:setString(TI18N("前1%可获得以上奖励"))
	end

	if uv2:getRankRewardByRank(slot2) and not slot0.item_list then
		slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot3, {
			scale = 0.6,
			max_count = 5,
			is_center = true
		})
	end

	slot0:updateCostInfo()

	if slot0.scdata.end_time - GameNet:getInstance():getTime() <= 0 then
		slot4 = 0

		slot0:setBtnUnEnabled()
	elseif slot0.time_ticket == nil then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0 = uv0 - 1

			if uv0 <= 0 then
				uv1:setBtnUnEnabled()
				uv1:updateCostInfo()
				uv1:clearTimeTicket()
			end
		end, 1)
	end
end

function ActiontermbeginsTabBossPanel.setBtnUnEnabled(slot0)
	slot0.is_time_out = true

	setChildUnEnabled(true, slot0.sweep_btn)
	slot0.sweep_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	setChildUnEnabled(true, slot0.fight_btn)
	slot0.fight_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
end

function ActiontermbeginsTabBossPanel.clearTimeTicket(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function ActiontermbeginsTabBossPanel.updateBuffIconInfo(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if slot1 then
		if slot0.battle_buff_object == nil then
			slot0.battle_buff_object = {}
			slot2 = createCSBNote(PathTool.getTargetCSB("battle/battle_buff_icon"))

			slot2:setAnchorPoint(0.5, 0.5)
			slot0.buff_node:addChild(slot2)
			slot2:getChildByName("Panel_1"):setVisible(false)
			slot2:getChildByName("num_label"):setVisible(false)

			slot0.battle_buff_object.container = slot2
			slot0.battle_buff_object.buff_icon = slot2:getChildByName("icon")
			slot0.battle_buff_object.buff_desc = slot2:getChildByName("desc_label")
		end

		if slot0.collection_buff then
			slot0.battle_buff_object.container:setVisible(true)

			if PathTool.getBuffRes(slot0.collection_buff) ~= slot0.battle_buff_object.buff_res then
				slot0.battle_buff_object.buff_res = slot2

				loadSpriteTexture(slot0.battle_buff_object.buff_icon, slot2, LOADTEXT_TYPE)
			end

			slot0.battle_buff_object.buff_desc:setString(uv0(TI18N("伤害+%s%%"), slot0.scdata.buff_per))
		else
			slot0.battle_buff_object.container:setVisible(false)
		end
	elseif slot0.battle_buff_object and slot0.battle_buff_object.container then
		slot0.battle_buff_object.container:setVisible(false)
	end
end

function ActiontermbeginsTabBossPanel.updateSpine(slot0, slot1)
	if not slot0.main_container then
		return
	end

	if slot0.cur_master_id == slot1 then
		return
	end

	slot0.cur_master_id = slot1

	if slot0.spine then
		doStopAllActions(slot0.spine)
		slot0.spine:removeFromParent()

		slot0.spine = nil

		;(function ()
			if not uv0.spine then
				uv0.spine = BaseRole.new(BaseRole.type.unit, uv1, nil, {
					scale = 1
				})

				uv0.spine:setAnimation(0, PlayerAction.show, true)
				uv0.spine:setCascade(true)
				uv0.spine:setPosition(uv0.main_container_size.width * 0.5, 620)
				uv0.spine:setAnchorPoint(cc.p(0.5, 0.5))
				uv0.main_container:addChild(uv0.spine)
				uv0.spine:setOpacity(0)
				uv0.spine:runAction(cc.FadeIn:create(0.2))
			end
		end)()
	else
		slot2()
	end
end

function ActiontermbeginsTabBossPanel.updateCostInfo(slot0)
	if not slot0.scdata then
		return
	end

	slot1 = nil

	if slot0.scdata.boss_flag == 1 then
		slot1 = slot0.ticket_item_id

		slot0.key_tips:setVisible(true)
	else
		slot1 = slot0.paper_item_id

		slot0.key_tips:setVisible(false)
	end

	if slot0.record_cost_item_id == nil or slot0.record_cost_item_id ~= slot1 then
		slot0.record_cost_item_id = slot1

		if Config.ItemData.data_get_data(slot1) then
			loadSpriteTexture(slot0.icon, PathTool.getItemRes(slot2.icon, false), LOADTEXT_TYPE)
		end
	end

	slot0.buy_count:setString(MoneyTool.GetMoneyString(BackpackController:getInstance():getModel():getItemNumByBid(slot1)))

	if slot0.scdata.boss_flag == 1 then
		if not slot0.is_time_out and slot2 > 0 then
			addRedPointToNodeByStatus(slot0.fight_btn, true, 5, 5)
		else
			addRedPointToNodeByStatus(slot0.fight_btn, false, 5, 5)
		end
	elseif not slot0.is_time_out and slot2 > 0 then
		addRedPointToNodeByStatus(slot0.comfirm_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.comfirm_btn, false, 5, 5)
	end

	slot0:updateRewardBtnRedpoint()
end

function ActiontermbeginsTabBossPanel.updateRewardBtnRedpoint(slot0)
	if not slot0.scdata then
		return
	end

	slot1 = BackpackController:getInstance():getModel():getItemNumByBid(slot0.paper_item_id)
	slot2 = false

	if slot0.parent.paper_reward_scdata then
		for slot6, slot7 in ipairs(slot0.parent.paper_reward_scdata.collect_schedule) do
			if slot7.staus == 1 then
				slot2 = true

				break
			end
		end
	end

	if slot1 > 0 or slot2 then
		addRedPointToNodeByStatus(slot0.reward_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.reward_btn, false, 5, 5)
	end
end

function ActiontermbeginsTabBossPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function ActiontermbeginsTabBossPanel.DeleteMe(slot0)
	if slot0.boss_form_event then
		GlobalEvent:getInstance():UnBind(slot0.boss_form_event)

		slot0.boss_form_event = nil
	end

	if slot0.subit_paper_event then
		GlobalEvent:getInstance():UnBind(slot0.subit_paper_event)

		slot0.subit_paper_event = nil
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

	if slot0.item_load_panel_bg then
		slot0.item_load_panel_bg:DeleteMe()
	end

	slot0.item_load_panel_bg = nil

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_scrollview)
	slot0:clearTimeTicket()
end
