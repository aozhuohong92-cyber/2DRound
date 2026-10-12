ElfinRousePanel = class("ElfinRousePanel", function ()
	return ccui.Layout:create()
end)
slot1 = ElfinController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format

function ElfinRousePanel.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("hero/hero_elfin_rouse_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)
	slot0:initElfinData()
	uv0({}, {
		path = PathTool.getPlistImgForDownLoad("elfin", "elfin"),
		type = ResourcesType.plist
	})

	if slot0.init_res_load then
		slot0.init_res_load:DeleteMe()

		slot0.init_res_load = nil
	end

	slot0.init_res_load = ResourcesLoad.New()

	slot0.init_res_load:addAllList(slot1, function ()
		if not tolua.isnull(uv0.root_wnd) then
			uv0:loadResListCompleted()
		end
	end)
end

function ElfinRousePanel.loadResListCompleted(slot0)
	slot0:initView()
	slot0:registerEvent()
	slot0:changeSelectedTab()
	slot0:updateElfinRedInfo()
end

function ElfinRousePanel.initElfinData(slot0)
	slot0.tree_elfin_list = {}
	slot0.tree_skill_list = {}
	slot0.tree_attr_list = {}
	slot0.tree_step_max = false
	slot0.tree_is_max_step = false
end

function ElfinRousePanel.initView(slot0)
	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.elfin_book_txt = createRichLabel(24, cc.c4b(15, 91, 206, 255), cc.p(0.5, 0.5), cc.p(621, 850))

	slot0.container:addChild(slot0.elfin_book_txt)
	slot0.elfin_book_txt:setString(uv0(TI18N("<div href=xxx >传记 </div><img src='%s'/>"), PathTool.getResFrame("elfin", "elfin_1016")))
	slot0.elfin_book_txt:addTouchEventListener(function ()
		if Config.SpriteData.data_const.ancient_story then
			HeroController:getInstance():openHeroLibraryStoryPanel(true, TI18N("幽灵果实 佩罗娜"), slot0.desc)
		end
	end)

	slot0.rouse_panel = slot0.container:getChildByName("rouse_panel")

	slot0.rouse_panel:getChildByName("rouse_name_txt"):setString(TI18N("幽灵果实 佩罗娜"))
	slot0.rouse_panel:getChildByName("rouse_tips"):setString(TI18N("幽灵由佩罗娜创造，可以与你一同作战"))
	slot0.rouse_panel:getChildByName("skill_title"):setString(TI18N("施法顺序:"))
	slot0.rouse_panel:getChildByName("rouse_lv_title"):setString(TI18N("觉醒等级:"))
	slot0.rouse_panel:getChildByName("rouse_step_title"):setString(TI18N("唤醒阶段:"))

	slot0.rouse_bg = slot0.rouse_panel:getChildByName("rouse_bg")

	slot0.rouse_bg:ignoreContentAdaptWithSize(true)

	slot0.rouse_lv_txt = slot0.rouse_panel:getChildByName("rouse_lv_txt")
	slot0.rouse_step_txt = slot0.rouse_panel:getChildByName("rouse_step_txt")
	slot0.power_click = slot0.rouse_panel:getChildByName("power_click")
	slot0.score_title = slot0.power_click:getChildByName("score_title")

	slot0.score_title:setString(TI18N("评分："))

	slot0.fight_label = CommonNum.new(20, slot0.power_click, 99999, -2, cc.p(0.5, 0.5))

	slot0.fight_label:setPosition(103, 29)

	slot0.rouse_rule_btn = slot0.rouse_panel:getChildByName("rouse_rule_btn")
	slot0.rouse_btn = slot0.rouse_panel:getChildByName("rouse_btn")
	slot0.rouse_btn_label = slot0.rouse_btn:getChildByName("label")

	slot0.rouse_btn_label:setString(TI18N("觉醒"))

	slot0.adjust_btn = slot0.rouse_panel:getChildByName("adjust_btn")
	slot0.max_lv_sp = slot0.rouse_panel:getChildByName("max_lv_sp")
	slot4 = "cost_panel"
	slot0.rouse_cost_panel = slot0.rouse_panel:getChildByName(slot4)
	slot0.cost_objects = {}

	for slot4 = 1, 2 do
		uv1(slot0.cost_objects, {
			cost_bg = slot0.rouse_cost_panel:getChildByName("cost_bg_" .. slot4),
			res_icon = slot0.rouse_cost_panel:getChildByName("cost_res_icon_" .. slot4),
			cost_txt = slot0.rouse_cost_panel:getChildByName("cost_txt_" .. slot4)
		})
	end
end

function ElfinRousePanel.registerEvent(slot0)
	registerButtonEventListener(slot0.rouse_btn, function ()
		uv0:onClickRouseBtn()
	end, true)
	registerButtonEventListener(slot0.adjust_btn, function ()
		uv0:onClickAdjustBtn()
	end, true)
	slot0.rouse_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.began then
			if GuideController:getInstance():isInGuide() or uv0.tree_is_max_step == true then
				return
			end

			if not uv0.tree_step_max then
				uv0.sequence_action = uv0.rouse_btn:runAction(cc.Sequence:create(cc.DelayTime:create(0.3), cc.CallFunc:create(function ()
					uv0:startTimeTicket()
				end)))

				uv0.sequence_action:setTag(10086)
			end
		elseif slot1 == ccui.TouchEventType.canceled then
			uv0:clearTimeTicket()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0:clearTimeTicket()
			uv0:onClickRouseBtn()
		end
	end)
	registerButtonEventListener(slot0.rouse_rule_btn, function (slot0, slot1, slot2)
		uv0:onClickRouseRuleBtn(slot0, slot1, slot2)
	end, true, nil, nil, 0.8)

	if not slot0.get_tree_data_event then
		slot0.get_tree_data_event = GlobalEvent:getInstance():Bind(ElfinEvent.Get_Elfin_Tree_Data_Event, function ()
			uv0:updateRouseInfo()
		end)
	end

	if not slot0.tree_up_lv_event then
		slot0.tree_up_lv_event = GlobalEvent:getInstance():Bind(ElfinEvent.Elfin_Tree_Lv_Up_Event, function ()
		end)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateItemNum(slot1)
		end)
	end

	if not slot0.del_goods_event then
		slot0.del_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateItemNum(slot1)
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateItemNum(slot1)
		end)
	end

	if not slot0.update_red_status_event then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(ElfinEvent.Update_Elfin_Red_Event, function (slot0, slot1)
			uv0:updateElfinRedInfo(slot0, slot1)
		end)
	end
end

function ElfinRousePanel.changeSelectedTab(slot0)
	slot0:updateRouseInfo()

	if not slot0.init_rouse_flag then
		slot0.init_rouse_flag = true

		uv0:sender26510()
	end
end

function ElfinRousePanel.updateRouseInfo(slot0)
	slot0.elfin_tree_data = uv0:getElfinTreeData()

	if not slot0.elfin_tree_data or next(slot0.elfin_tree_data) == nil then
		return
	end

	if not Config.SpriteData.data_tree_step[slot0.elfin_tree_data.break_lev] or not Config.SpriteData.data_tree_up_lv(slot0.elfin_tree_data.lev) then
		return
	end

	slot3 = PathTool.getElfinTreeBgRes(slot2.res_id)

	if not slot0.cur_tree_bg_res or slot0.cur_tree_bg_res ~= slot3 then
		slot0.cur_tree_bg_res = slot3
		slot0.tree_bg_load = loadImageTextureFromCDN(slot0.rouse_bg, slot3, ResourcesType.single, slot0.tree_bg_load)
	end

	slot0.fight_label:setNum(slot0.elfin_tree_data.power)

	slot4 = 0

	for slot8 = 1, 4 do
		slot9 = slot0:getTreeElfinBidByPos(slot8)

		if not slot0.tree_skill_list[slot8] then
			slot10 = SkillItem.new(true, true, true, 0.75, true)

			slot0.rouse_panel:addChild(slot10)
			slot10:setPosition(cc.p(250 + (slot8 - 1) * 112, 340))

			slot0.tree_skill_list[slot8] = slot10
		end

		slot10:showNoneText(false)
		slot10:setSkillFirstCd(0)

		if slot9 then
			slot10:showLockIcon(false)

			if slot9 == 0 or not Config.SpriteData.data_elfin_data(slot9) then
				slot10:setData()
				slot10:showName(false)
				slot10:showLevel(false)
				slot10:showNoneText(true, TI18N("请先将幽灵附着在佩罗娜上~"))
			elseif Config.SkillData.data_get_skill(slot11.skill) then
				slot10:showLevel(true)
				slot10:setData(slot12)
				slot10:showName(true, slot12.name, nil, 20, true, cc.c4b(255, 240, 210, 255), PathTool.getResFrame("elfin", "elfin_1022"), cc.size(110, 26))

				if slot12.type == "active_skill" then
					slot10:setSkillFirstCd(slot4 + 1)
				end
			end
		else
			slot10:setData()
			slot10:showName(false)
			slot10:showLevel(false)

			if Config.SpriteData.data_tree_limit[slot8] then
				slot10:showLockIcon(true, nil, uv1(TI18N("佩罗娜达到%s阶解锁"), StringUtil.numToChinese(slot11)))
			end
		end

		if not slot0.tree_elfin_list[slot8] then
			slot11 = ElfinRouseItem.new()

			slot0.rouse_panel:addChild(slot11)
			slot11:setPosition(cc.p(180 + (1 - slot8 % 2) * 400, 690 - (math.ceil(slot8 / 2) - 1) * 160))

			slot0.tree_elfin_list[slot8] = slot11
		end

		slot11:setData({
			elfin_bid = slot9,
			elfin_pos = slot8,
			need_step = Config.SpriteData.data_tree_limit[slot8]
		})
	end

	slot0.rouse_lv_txt:setString(slot0.elfin_tree_data.lev .. "/" .. slot2.lev_max)

	slot9 = TI18N("阶")
	slot8 = StringUtil.numToChinese(slot0.elfin_tree_data.break_lev) .. slot9

	slot0.rouse_step_txt:setString(slot8)

	for slot8, slot9 in pairs(slot0.tree_attr_list) do
		slot9:setVisible(false)
	end

	for slot8, slot9 in ipairs(ElfinConst.Tree_Attrs) do
		if PartnerCalculate.isShowPerByStr(slot9) then
			slot10 = slot0.elfin_tree_data[slot9] / 100 .. "%"
		end

		if not slot0.tree_attr_list[slot8] then
			slot11 = createRichLabel(24, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), nil, nil, nil, 380)

			slot0.rouse_panel:addChild(slot11)

			slot0.tree_attr_list[slot8] = slot11
		end

		slot11:setVisible(true)
		slot11:setPosition(cc.p(92 + (1 - slot8 % 2) * 312, 188 - (math.ceil(slot8 / 2) - 1) * 46))
		slot11:setString(uv1("<img src='%s' scale=1 /><div fontcolor=#643223>    %s</div>", PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot9)), slot10))
	end

	slot0.tree_is_max_step = false

	slot0.rouse_btn:setVisible(true)

	if Config.SpriteData.data_tree_up_lv_length <= slot0.elfin_tree_data.lev then
		slot0.tree_is_max_step = true

		for slot8 = 1, 2 do
			slot0:showTreeCostInfo(false, slot8)
		end

		slot0.max_lv_sp:setVisible(true)
		slot0.rouse_btn:setVisible(false)
		slot0.max_lv_sp:setPositionX(360)
	elseif slot2.lev_max <= slot0.elfin_tree_data.lev then
		slot0.rouse_btn_label:setString(TI18N("唤醒"))
		slot0.max_lv_sp:setVisible(true)
		slot0.rouse_cost_panel:setVisible(false)

		slot0.tree_step_max = true
		slot0.tree_is_max_step = false

		slot0.max_lv_sp:setPositionX(173)
	else
		slot0.max_lv_sp:setVisible(false)
		slot0.rouse_cost_panel:setVisible(true)
		slot0.rouse_btn_label:setString(TI18N("觉醒"))

		slot0.tree_step_max = false

		if slot1.expend then
			for slot8, slot9 in ipairs(slot1.expend) do
				if slot8 == 1 then
					slot0.cost_item_bid_1 = slot9[1]
					slot0.cost_item_need_num_1 = slot9[2]
				elseif slot8 == 2 then
					slot0.cost_item_bid_2 = slot10
					slot0.cost_item_need_num_2 = slot11
				end

				slot0:showTreeCostInfo(true, slot8, slot10, slot11)
			end
		end
	end
end

function ElfinRousePanel.getTreeElfinBidByPos(slot0, slot1)
	if not slot0.elfin_tree_data then
		return
	end

	slot2 = nil

	for slot6, slot7 in pairs(slot0.elfin_tree_data.sprites) do
		if slot7.pos == slot1 then
			slot2 = slot7.item_bid

			break
		end
	end

	return slot2
end

function ElfinRousePanel.showTreeCostInfo(slot0, slot1, slot2, slot3, slot4)
	if not slot0.cost_objects[slot2] then
		return
	end

	if slot1 == true then
		slot5.cost_bg:setVisible(true)
		slot5.res_icon:setVisible(true)
		slot5.cost_txt:setVisible(true)

		if Config.ItemData.data_get_data(slot3) then
			loadSpriteTexture(slot5.res_icon, PathTool.getItemRes(slot6.icon), LOADTEXT_TYPE)

			slot8 = BackpackController:getInstance():getModel():getItemNumByBid(slot3)

			slot5.cost_txt:setString(string.format("%s/%s", MoneyTool.GetMoneyString(slot8, false), MoneyTool.GetMoneyString(slot4, false)))

			if slot8 < slot4 then
				slot5.cost_txt:setTextColor(cc.c3b(255, 93, 93))
			else
				slot5.cost_txt:setTextColor(cc.c3b(255, 246, 228))
			end
		end
	else
		slot5.cost_bg:setVisible(false)
		slot5.res_icon:setVisible(false)
		slot5.cost_txt:setVisible(false)
	end
end

function ElfinRousePanel.checkNeedUpdateItemNum(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if slot6.config then
			if slot0.cost_item_bid_1 and slot6.config.id == slot0.cost_item_bid_1 then
				slot0:showTreeCostInfo(true, 1, slot0.cost_item_bid_1, slot0.cost_item_need_num_1)
			elseif slot0.cost_item_bid_2 and slot6.config.id == slot0.cost_item_bid_2 then
				slot0:showTreeCostInfo(true, 2, slot0.cost_item_bid_2, slot0.cost_item_need_num_2)
			end
		end
	end
end

function ElfinRousePanel.onClickRouseBtn(slot0)
	if not slot0.elfin_tree_data then
		return
	end

	if slot0.tree_step_max == true then
		uv0:openElfinTreeStepWindow(true)
	else
		uv0:sender26511()
	end
end

function ElfinRousePanel.onClickAdjustBtn(slot0)
	uv0:openElfinAdjustWindow(true)
end

function ElfinRousePanel.startTimeTicket(slot0)
	if slot0.time_ticket == nil then
		slot0.can_play_lvup_sound = true
		slot0.time_idnex = 0
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			if uv0.tree_step_max == true then
				uv0:clearTimeTicket()
			else
				uv1:sender26511()

				uv0.can_play_lvup_sound = false
				uv0.time_idnex = uv0.time_idnex + 1

				if uv0.time_idnex > 2 then
					uv0.time_idnex = 0
					uv0.can_play_lvup_sound = true
				end
			end
		end, 0.2)
	end
end

function ElfinRousePanel.clearTimeTicket(slot0)
	if slot0.sequence_action then
		slot0.rouse_btn:stopActionByTag(10086)

		slot0.sequence_action = nil
	end

	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function ElfinRousePanel.onClickRouseRuleBtn(slot0, slot1, slot2, slot3)
	if Config.SpriteData.data_const.ancient_desc then
		TipsManager:getInstance():showCommonTips(slot4.desc, slot2:getTouchBeganPosition(), nil, nil, 480)
	end
end

function ElfinRousePanel.updateElfinRedInfo(slot0, slot1, slot2)
	if slot1 == HeroConst.RedPointType.eElfin_tree_lvup then
		slot0:updateTreeLvupRedStatus()
	elseif slot1 == HeroConst.RedPointType.eElfin_empty_pos then
		slot0:updateTreeElfinRedStatus()
	elseif slot1 == HeroConst.RedPointType.eElfin_compound then
		slot0:updateTreeElfinRedStatus()
	elseif slot1 == HeroConst.RedPointType.eElfin_higher_lv then
		slot0:updateTreeElfinRedStatus()
	else
		slot0:updateTreeLvupRedStatus()
		slot0:updateTreeElfinRedStatus()
	end
end

function ElfinRousePanel.updateTreeLvupRedStatus(slot0)
	addRedPointToNodeByStatus(slot0.rouse_btn, uv0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_tree_lvup), 10, 10)
end

function ElfinRousePanel.updateTreeElfinRedStatus(slot0)
	if not slot0.tree_elfin_list then
		return
	end

	for slot4, slot5 in pairs(slot0.tree_elfin_list) do
		slot5:updateResStatus()
	end
end

function ElfinRousePanel.DeleteMe(slot0)
	slot0:clearTimeTicket()

	for slot4, slot5 in pairs(slot0.tree_skill_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.tree_elfin_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.init_res_load then
		slot0.init_res_load:DeleteMe()

		slot0.init_res_load = nil
	end

	if slot0.tree_bg_load then
		slot0.tree_bg_load:DeleteMe()

		slot0.tree_bg_load = nil
	end

	if slot0.fight_label then
		slot0.fight_label:DeleteMe()
	end

	slot0.fight_label = nil

	if slot0.get_tree_data_event then
		GlobalEvent:getInstance():UnBind(slot0.get_tree_data_event)

		slot0.get_tree_data_event = nil
	end

	if slot0.tree_up_lv_event then
		GlobalEvent:getInstance():UnBind(slot0.tree_up_lv_event)

		slot0.tree_up_lv_event = nil
	end

	if slot0.add_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.add_goods_event)

		slot0.add_goods_event = nil
	end

	if slot0.del_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.del_goods_event)

		slot0.del_goods_event = nil
	end

	if slot0.modify_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.modify_goods_event)

		slot0.modify_goods_event = nil
	end

	if slot0.update_red_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_red_status_event)

		slot0.update_red_status_event = nil
	end
end
