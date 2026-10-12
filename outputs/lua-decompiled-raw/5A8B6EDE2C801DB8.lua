slot1 = HeavenController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
HeavenDialWindow = class("HeavenDialWindow", function ()
	return ccui.Widget:create()
end)

function HeavenDialWindow.ctor(slot0, slot1)
	slot0.cur_group_id = slot1 or slot0:getDefaultGroupId()
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("heavendial", "heavendial"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("heaven", "heaven"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.loadResListCompleted then
			uv0:loadResListCompleted()
		end
	end)

	slot0.award_item_list = {}
	slot0.arriveLuckly_label = {}
	slot0.stage_data = {}
	slot0.backpackitem_list = {}
	slot0.rotate_ani_state = false
	slot0.cur_stage_index = 1
	slot0.is_show_dial_ani = false
	slot0.is_first_open = true

	slot0:configUI()
	slot0:register_event()
end

function HeavenDialWindow.loadResListCompleted(slot0)
end

function HeavenDialWindow.addToParent(slot0, slot1)
	slot0:setVisible(slot1 or false)

	if slot0.is_first_open then
		slot0:setData()

		slot0.is_first_open = false

		uv0:sender25232()
	end
end

function HeavenDialWindow.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("heaven/heaven_dial_window"))

	slot0.root_wnd:setPosition(0, 0)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1
	slot0.pos_light = slot1:getChildByName("pos_light")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.arrow_right = slot1:getChildByName("arrow_right")
	slot0.arrow_left = slot1:getChildByName("arrow_left")
	slot2 = slot1:getChildByName("top_panel")
	slot3 = slot1:getChildByName("bottom_panel")
	slot0.tips_label = slot3:getChildByName("tips_label")

	slot0.tips_label:setString("")

	slot0.extract_btn_1 = slot3:getChildByName("extract_btn_1")

	slot0.extract_btn_1:setName("guide_extract_btn_1")
	slot0.extract_btn_1:getChildByName("label"):setString(TI18N("维修1次"))

	slot0.free_label = slot3:getChildByName("free_label")

	slot0.free_label:setString(TI18N("本次免费"))

	slot0.cost_bg_1 = slot3:getChildByName("cost_bg_1")
	slot0.cost_bg_1_lab = slot0.cost_bg_1:getChildByName("label")

	slot0.cost_bg_1_lab:setString(TI18N("消耗:"))

	slot0.cost_icon_1 = slot0.cost_bg_1:getChildByName("cost_icon")
	slot0.cost_label_1 = slot0.cost_bg_1:getChildByName("cost_label")

	UITool.SetTitleColor(slot0.free_label)
	UITool.SetTitleColor(slot0.cost_bg_1_lab)
	UITool.SetTitleColor(slot0.cost_label_1)

	slot0.extract_btn_10 = slot3:getChildByName("extract_btn_10")

	slot0.extract_btn_10:getChildByName("label"):setString(TI18N("维修10次"))

	slot0.sp_discount = slot3:getChildByName("sp_discount")

	slot0.sp_discount:setVisible(false)
	slot0.sp_discount:getChildByName("Text_1"):setString(TI18N("钻石9折"))

	slot4 = slot3:getChildByName("cost_bg_10")

	slot4:getChildByName("label"):setString(TI18N("消耗:"))

	slot0.cost_icon_10 = slot4:getChildByName("cost_icon")
	slot0.cost_label_10 = slot4:getChildByName("cost_label")

	UITool.SetTitleColor(slot4:getChildByName("label"))
	UITool.SetTitleColor(slot0.cost_label_10)

	slot0.stage_layer = slot1:getChildByName("stage_layer")

	slot0.stage_layer:setClippingEnabled(true)

	slot0.progress_panel = slot3:getChildByName("progress_panel")
	slot0.progress = slot0.progress_panel:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)

	slot0.num_label = slot0.progress_panel:getChildByName("num_label")

	slot0.num_label:setString(TI18N("累计次数"))

	slot0.cur_num = slot0.progress_panel:getChildByName("cur_num")

	slot0.cur_num:setString("")

	slot0.tips_btn = slot2:getChildByName("tips_btn")

	slot0.tips_btn:getChildByName("label"):setString(TI18N("概率"))

	slot0.btn_shop = slot2:getChildByName("btn_shop")

	slot0.btn_shop:getChildByName("label"):setString(TI18N("神装商城"))

	slot0.btn_rule = slot2:getChildByName("btn_rule")
	slot0.score_bg = slot2:getChildByName("score_bg")
	slot0.score_title = slot0.score_bg:getChildByName("score_title")

	slot0.score_title:setString(TI18N("最高总评分："))

	slot0.all_score = createLabel(24, cc.c3b(244, 238, 211), cc.c3b(0, 0, 0), 9.41, 18, "", slot0.score_bg, 2, cc.p(0, 0.5))

	slot0:handlerLinghtEffect(true)

	slot0.baodi_count_bg = slot3:getChildByName("baodi_count_bg")
	slot0.baodi_count_tips = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(105, 17))

	slot0.baodi_count_bg:addChild(slot0.baodi_count_tips)

	slot0.item_num_txt = slot3:getChildByName("item_num_txt")

	slot0.item_num_txt:setTextColor(Config.ColorData.data_color4[1])
	slot0.item_num_txt:enableOutline(Config.ColorData.data_color4[2], 2)

	slot0.item_icon = slot3:getChildByName("item_icon")
	slot0.add_btn = slot3:getChildByName("add_btn")

	slot2:setPositionY(display.getTop(slot1) - 178)
	slot3:setPositionY(display.getBottom(slot1) + 190)
end

function HeavenDialWindow.register_event(slot0)
	registerButtonEventListener(slot0.add_btn, function ()
		if uv0.cur_cost_bid then
			BackpackController:getInstance():openTipsSource(true, uv0.cur_cost_bid)
		end
	end, true)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if Config.HolyEqmLotteryData.data_const.pray_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true)
	registerButtonEventListener(slot0.tips_btn, function (slot0, slot1, slot2)
		if uv0.cur_group_cfg then
			TipsManager:getInstance():showCommonTips(uv0.cur_group_cfg.desc, slot1:getTouchBeganPosition())
		end
	end, true)
	registerButtonEventListener(slot0.btn_shop, function ()
		SuitShopController:getInstance():openSuitShopMainView(true)
	end, true)
	registerButtonEventListener(slot0.arrow_left, function ()
		if uv0.is_show_dial_ani then
			return
		end

		uv0:showItemRotateAni(2)
	end, true)
	registerButtonEventListener(slot0.arrow_right, function ()
		if uv0.is_show_dial_ani then
			return
		end

		uv0:showItemRotateAni(1)
	end, true)
	registerButtonEventListener(slot0.extract_btn_1, function ()
		if uv0.is_show_dial_ani then
			return
		end

		uv0:onClickExtractBtn(1)
	end, true)
	registerButtonEventListener(slot0.extract_btn_10, function ()
		if uv0.is_show_dial_ani then
			return
		end

		uv0:onClickExtractBtn(10)
	end, true)
	slot0.stage_layer:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) >= 15
			end

			if slot2 == true and not uv0.is_show_dial_ani then
				playButtonSound2()

				if uv0.touch_began.x < uv0.touch_end.x then
					uv0:showItemRotateAni(2)
				else
					uv0:showItemRotateAni(1)
				end
			end
		end
	end)

	if not slot0.update_dial_base_data then
		slot0.update_dial_base_data = GlobalEvent:getInstance():Bind(HeavenEvent.Update_Dial_Base_Data, function ()
			uv0:updateDialCostInfo()
			uv0:updateBaodiCount()

			if uv0.cur_stage_index == 1 and uv0.stage_item_1 then
				uv0.stage_item_1:updateHolyItem()
			elseif uv0.cur_stage_index == 2 and uv0.stage_item_2 then
				uv0.stage_item_2:updateHolyItem()
			end
		end)
	end

	if not slot0.update_heaven_red_status then
		slot0.update_heaven_red_status = GlobalEvent:getInstance():Bind(HeavenEvent.Update_Heaven_Red_Status, function (slot0)
			if slot0 == HeavenConst.Red_Index.Dial then
				uv0:updateArrowBtnStatus()
			end
		end)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	if not slot0.delete_goods_event then
		slot0.delete_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	if not slot0.update_all_score then
		slot0.update_all_score = GlobalEvent:getInstance():Bind(HeavenEvent.Update_All_Score, function ()
			if uv0.all_score and uv1 and uv1:getAllScore() then
				uv0.all_score:setString(tostring(slot0))
			end
		end)
	end
end

function HeavenDialWindow.onClickDetailBtn(slot0, slot1, slot2, slot3)
	if slot0.cur_group_cfg then
		TipsManager:getInstance():showCommonTips(slot0.cur_group_cfg.desc, slot2:getTouchBeganPosition())
	end
end

function HeavenDialWindow.onClickExtractBtn(slot0, slot1)
	if not slot0.cur_group_id then
		return
	end

	if slot1 == 1 and slot0.dial_way_1 then
		slot2 = nil

		if slot0.dial_way_1 == HeavenConst.Dial_Way.Free then
			slot2 = 1
		elseif slot0.dial_way_1 == HeavenConst.Dial_Way.Item then
			slot2 = 4
		elseif slot0.dial_way_1 == HeavenConst.Dial_Way.Gold then
			slot2 = 3
		end

		if slot2 then
			if slot2 == 3 then
				if uv0:getHeavenDialById(slot0.cur_group_id) and slot0.cur_group_cfg and slot0.cur_group_cfg.day_limit_count <= slot3.day_count then
					message(TI18N("今日钻石维修次数已达上限"))

					return
				end

				if slot0.cur_group_cfg and slot0.cur_group_cfg.gain_once and slot0.cur_group_cfg.gain_once[1] then
					slot5 = slot0.cur_group_cfg.gain_once[1][2]

					if Config.ItemData.data_get_data(slot0.cur_group_cfg.gain_once[1][1]) and slot4 and slot5 then
						CommonAlert.show(string.format(TI18N("是否使用<img src=%s visible=true scale=0.4 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#289b14>(拥有:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#289b14>)维修<div fontColor=#289b14 fontsize= 26>1</div>次\n</div>"), PathTool.getItemRes(3), slot0.cur_group_cfg.loss_gold_once, RoleController:getInstance():getRoleVo().gold) .. string.format(TI18N("维修后可获得<div fontColor=#289b14 fontsize= 26>%d</div><div fontColor=#d95014 fontsize= 26>%s</div><div fontColor=#289b14>(同时附赠</div><div fontColor=#289b14 fontsize= 26>1</div>次随机奖励)</div>"), slot5, slot6.name), TI18N("确定"), function ()
							uv0.dial_times = 1
							uv0.dial_recruit_type = uv1

							uv0:handleDialEffect(true)
						end, TI18N("取消"), nil, CommonAlert.type.rich)
					end
				end
			else
				slot0.dial_times = 1
				slot0.dial_recruit_type = slot2

				slot0:handleDialEffect(true)
			end
		end

		return
	end

	if slot0.dial_way_10 then
		if slot0.dial_way_10 == HeavenConst.Dial_Way.Item then
			recruit_type = 4
		elseif slot0.dial_way_10 == HeavenConst.Dial_Way.Gold then
			recruit_type = 3
		end

		if recruit_type then
			if recruit_type == 3 then
				if uv0:getHeavenDialById(slot0.cur_group_id) and slot0.cur_group_cfg and slot0.cur_group_cfg.day_limit_count < slot2.day_count + 10 then
					message(TI18N("今日钻石维修次数已达上限"))

					return
				end

				if slot0.cur_group_cfg and slot0.cur_group_cfg.gain_once and slot0.cur_group_cfg.gain_once[1] then
					slot4 = slot0.cur_group_cfg.gain_once[1][2]

					if Config.ItemData.data_get_data(slot0.cur_group_cfg.gain_once[1][1]) and slot3 and slot4 then
						CommonAlert.show(string.format(TI18N("是否使用<img src=%s visible=true scale=0.4 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#289b14>(拥有:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#289b14>)维修<div fontColor=#289b14 fontsize= 26>10</div>次\n</div>"), PathTool.getItemRes(3), slot0.cur_group_cfg.loss_gold_ten, RoleController:getInstance():getRoleVo().gold) .. string.format(TI18N("维修后可获得<div fontColor=#289b14 fontsize= 26>%d</div><div fontColor=#d95014 fontsize= 26>%s</div><div fontColor=#289b14>(同时附赠</div><div fontColor=#289b14 fontsize= 26>10</div>次随机奖励)</div>"), slot4 * 10, slot5.name), TI18N("确定"), function ()
							uv0.dial_times = 10
							uv0.dial_recruit_type = recruit_type

							uv0:handleDialEffect(true)
						end, TI18N("取消"), nil, CommonAlert.type.rich)
					end
				end
			else
				slot0.dial_times = 10
				slot0.dial_recruit_type = recruit_type

				slot0:handleDialEffect(true)
			end
		end
	end
end

function HeavenDialWindow.updateProgress(slot0)
	if not uv0:getHeavenDialById(slot0.cur_group_id) then
		return
	end

	if slot0.cur_group_cfg then
		slot0.tips_label:setString(uv1(TI18N("今日钻石召唤次数上限：%d/%d"), slot1.day_count, slot0.cur_group_cfg.day_limit_count))
	end

	slot3 = 80
	slot5 = {
		108,
		108,
		108,
		110,
		110,
		110
	}

	if Config.HolyEqmLotteryData.data_award[slot0.cur_group_id] then
		for slot10, slot11 in ipairs(slot2) do
			if slot0.award_item_list[slot10] == nil then
				slot12 = ccui.Layout:create()

				slot12:setContentSize(cc.size(50, 50))
				slot12:setAnchorPoint(cc.p(0.5, 0.5))
				slot12:setPosition(cc.p(slot3 + (slot10 - 1) * (425 - slot3 + 0) / (#slot2 - 1), 16.5))
				slot0.progress_panel:addChild(slot12)
				slot12:setTouchEnabled(true)

				slot0.award_item_list[slot10] = slot12
				slot15 = createEffectSpine(PathTool.getEffectRes(slot5[slot10]), cc.p(25, 0), cc.p(0.5, 0.5), true, PlayerAction.action_1)
				slot12.effect = slot15

				slot12:addChild(slot15)
			end

			registerButtonEventListener(slot12, function (slot0, slot1, slot2)
				if uv0:getHeavenDialById(uv1.cur_group_id) then
					slot4 = false
					slot5 = false

					for slot9, slot10 in pairs(slot3.do_awards) do
						if uv2.id == slot10.award_id then
							slot5 = true

							break
						end
					end

					if slot5 == false and uv2.times <= slot3.all_award_count then
						slot4 = true
					end

					if slot4 == true then
						uv3:sender25231(uv1.cur_group_id, uv2.id)

						return
					end
				end

				uv1:showRewardItems(uv2.reward, slot1:getTouchBeganPosition(), uv4)
			end, false, 1)

			if not slot0.arriveLuckly_label[slot10] and slot0.award_item_list[slot10] then
				slot0.arriveLuckly_label[slot10] = createLabel(22, cc.c3b(244, 238, 211), cc.c3b(0, 0, 0), slot13, -10, "", slot0.progress_panel, 2, cc.p(0.5, 1))
			end

			if slot0.arriveLuckly_label[slot10] then
				slot0.arriveLuckly_label[slot10]:setString(slot11.times)
			end
		end

		slot7 = 0
		slot8 = 425
		slot10 = 0

		for slot14, slot15 in ipairs(slot2) do
			if slot14 == 1 then
				if slot1.all_award_count <= slot15.times then
					slot10 = slot1.all_award_count / slot15.times * (slot3 - 0)

					break
				else
					slot10 = slot9
				end
			elseif slot1.all_award_count <= slot15.times then
				slot10 = slot10 + (slot1.all_award_count - slot7) / (slot15.times - slot7) * slot6

				break
			else
				slot10 = slot10 + slot6
			end

			slot7 = slot15.times
		end

		slot0.progress:setPercent(slot10 / slot8 * 100)
		slot0.cur_num:setString(tostring(slot1.all_award_count))
	end

	slot0:updateAwardStatus()
end

function HeavenDialWindow.updateAwardStatus(slot0)
	if not uv0:getHeavenDialById(slot0.cur_group_id) then
		return
	end

	if Config.HolyEqmLotteryData.data_award[slot0.cur_group_id] then
		for slot6, slot7 in pairs(slot2) do
			slot8 = false
			slot9 = false

			for slot13, slot14 in pairs(slot1.do_awards) do
				if slot7.id == slot14.award_id then
					slot9 = true

					break
				end
			end

			if slot9 == false and slot7.times <= slot1.all_award_count then
				slot8 = true
			end

			slot10 = PlayerAction.action_1

			if slot8 == true then
				slot10 = PlayerAction.action_2
			end

			if slot9 == true then
				slot10 = PlayerAction.action_3
			end

			if slot0.award_item_list[slot6] and slot0.award_item_list[slot6].effect then
				slot0.award_item_list[slot6].effect:setToSetupPose()
				slot0.award_item_list[slot6].effect:setAnimation(0, slot10, true)
			end
		end
	end
end

function HeavenDialWindow.showRewardItems(slot0, slot1, slot2, slot3)
	if not slot0.tips_layer then
		slot0.tips_layer = ccui.Layout:create()

		slot0.tips_layer:setContentSize(slot0.root_wnd:getContentSize())
		slot0.root_wnd:addChild(slot0.tips_layer)
		slot0.tips_layer:setTouchEnabled(true)
		registerButtonEventListener(slot0.tips_layer, function ()
			uv0.tips_bg:removeFromParent()

			uv0.tips_bg = nil

			uv0.tips_layer:removeFromParent()

			uv0.tips_layer = nil
		end, false, 1)
	end

	slot5 = {}

	if not slot0.tips_bg then
		slot0.tips_bg = createImage(slot0.tips_layer, PathTool.getResFrame("common", "common_1056"), slot4.width * 0.5, 100, cc.p(0, 0), true, 10, true)

		slot0.tips_bg:setTouchEnabled(true)
	end

	if slot0.tips_bg then
		slot0.tips_bg:setContentSize(cc.size(BackPackItem.Width * #slot1 + 50, BackPackItem.Height + 50))

		slot6 = cc.p(0.5, 0)

		if slot0.tips_bg:getContentSize().width + slot2.x >= 720 then
			slot6 = cc.p(1, 0)
		end

		slot0.tips_bg:setAnchorPoint(slot6)
		slot0.tips_bg:setPosition(slot0.root_wnd:convertToNodeSpace(slot0.award_item_list[slot3]:convertToWorldSpace(cc.p(0, 50))))
	end

	for slot9, slot10 in pairs(slot1) do
		if not slot5[slot9] then
			slot5[slot9] = BackPackItem.new(nil, true, nil, 0.8)

			slot5[slot9]:setAnchorPoint(cc.p(0, 0.5))
			slot0.tips_bg:addChild(slot5[slot9])
			slot5[slot9]:setBaseData(slot10[1])
			slot5[slot9]:setPosition(cc.p(BackPackItem.Width * (slot9 - 1) + 30, 100))
			slot5[slot9]:setDefaultTip()

			slot0.backpackitem_list[slot9] = slot5[slot9]
			slot0.text_num = createLabel(22, cc.c4b(255, 238, 221, 255), nil, 60, -25, "", slot5[slot9], nil, cc.p(0.5, 0.5))

			slot0.text_num:setString("x" .. slot10[2])
		else
			slot5[slot9]:setBaseData(slot10[1])
			slot5[slot9]:setPosition(cc.p(BackPackItem.Width * (slot9 - 1) + 30, 100))
			slot0.text_num:setString("x" .. slot10[2])
		end
	end
end

function HeavenDialWindow.updateBaodiCount(slot0)
	if not slot0.cur_group_id then
		return
	end

	slot0.baodi_count_tips:setString(uv1(TI18N("再抽<div fontcolor=#68C74B>%d</div>次必出<div fontcolor=#FF5D5D>良品</div>以上"), uv0:getHeavenDialBaodiCountById(slot0.cur_group_id)))
end

function HeavenDialWindow.getDefaultGroupId(slot0)
	for slot5, slot6 in pairs(Config.HolyEqmLotteryData.data_group) do
		if (not slot6.open_cond or slot6.open_cond == 0 or uv0:checkHeavenDialIsOpenByGId(slot6.group_id)) and 0 < slot6.group_id then
			slot1 = slot6.group_id
		end
	end

	return slot1
end

function HeavenDialWindow.setData(slot0)
	if not slot0.cur_group_id then
		return
	end

	slot0.cur_group_cfg = Config.HolyEqmLotteryData.data_group[slot0.cur_group_id]

	if not slot0.cur_group_cfg then
		return
	end

	if slot0.cur_group_cfg.loss_item_once and slot0.cur_group_cfg.loss_item_once[1] then
		slot0.cur_cost_bid = slot0.cur_group_cfg.loss_item_once[1][1]
	end

	if uv0:getAllScore() then
		slot0.all_score:setString(tostring(slot1))
	end

	slot0:createStageItem()
	slot0:updateArrowBtnStatus()
	slot0:updateDialCostInfo()
	slot0:updateBaodiCount()
end

function HeavenDialWindow.updateItemNum(slot0, slot1, slot2)
	if slot0.cur_cost_bid and slot1 and slot2 and slot1 == BackPackConst.Bag_Code.BACKPACK then
		for slot6, slot7 in pairs(slot2) do
			if slot7 and slot7.base_id and slot0.cur_cost_bid == slot7.base_id then
				slot0:updateDialCostInfo()

				break
			end
		end
	end
end

function HeavenDialWindow.updateDialCostInfo(slot0)
	if not Config.ItemData.data_get_data(slot0.cur_cost_bid) or not slot0.cur_group_cfg then
		return
	end

	loadSpriteTexture(slot0.cost_icon_10, PathTool.getItemRes(slot1.icon), LOADTEXT_TYPE)
	loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(slot1.icon), LOADTEXT_TYPE)
	slot0.item_num_txt:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.cur_cost_bid))

	if uv0:getHeavenDialIsFreeById(slot0.cur_group_id) then
		slot0.cost_bg_1_lab:setVisible(false)
		slot0.cost_icon_1:setVisible(false)
		slot0.cost_label_1:setVisible(false)
		slot0.free_label:setVisible(true)

		slot0.dial_way_1 = HeavenConst.Dial_Way.Free
	elseif slot3 >= 1 then
		slot0.cost_bg_1_lab:setVisible(true)
		slot0.cost_icon_1:setVisible(true)
		slot0.cost_label_1:setVisible(true)
		slot0.free_label:setVisible(false)
		slot0.cost_label_1:setString("1")
		loadSpriteTexture(slot0.cost_icon_1, slot2, LOADTEXT_TYPE)
		slot0.cost_icon_1:setScale(0.4)

		slot0.dial_way_1 = HeavenConst.Dial_Way.Item
	else
		slot0.cost_bg_1_lab:setVisible(true)
		slot0.cost_icon_1:setVisible(true)
		slot0.cost_label_1:setVisible(true)
		slot0.free_label:setVisible(false)
		slot0.cost_label_1:setString(slot0.cur_group_cfg.loss_gold_once or 0)
		loadSpriteTexture(slot0.cost_icon_1, PathTool.getItemRes(3), LOADTEXT_TYPE)
		slot0.cost_icon_1:setScale(0.3)

		slot0.dial_way_1 = HeavenConst.Dial_Way.Gold
	end

	if slot3 >= 10 then
		slot0.cost_label_10:setString("10")
		loadSpriteTexture(slot0.cost_icon_10, slot2, LOADTEXT_TYPE)
		slot0.cost_icon_10:setScale(0.4)
		slot0.sp_discount:setVisible(false)

		slot0.dial_way_10 = HeavenConst.Dial_Way.Item
	else
		slot0.cost_label_10:setString(slot0.cur_group_cfg.loss_gold_ten or 0)
		loadSpriteTexture(slot0.cost_icon_10, PathTool.getItemRes(3), LOADTEXT_TYPE)
		slot0.cost_icon_10:setScale(0.3)

		slot0.dial_way_10 = HeavenConst.Dial_Way.Gold

		if slot0.cur_group_cfg.discount_res and slot0.cur_group_cfg.discount_res ~= "" then
			slot0.sp_discount:setVisible(true)
			loadSpriteTexture(slot0.sp_discount, PathTool.getResFrame("heavendial", slot0.cur_group_cfg.discount_res), LOADTEXT_TYPE_PLIST)
		else
			slot0.sp_discount:setVisible(false)
		end
	end

	slot0:updateProgress()
end

function HeavenDialWindow.createStageItem(slot0)
	if slot0.stage_item_1 or not slot0.cur_group_cfg then
		return
	end

	slot0.stage_item_1 = HeavenDialItem.new()

	slot0.stage_item_1:setPosition(cc.p(350, 370))
	slot0.stage_item_1:setData(slot0.cur_group_cfg)
	slot0.stage_layer:addChild(slot0.stage_item_1)
end

function HeavenDialWindow.showItemRotateAni(slot0, slot1)
	if not slot0.cur_group_id then
		return
	end

	if slot1 == 1 and (not Config.HolyEqmLotteryData.data_group[slot0.cur_group_id + 1] or not uv0:checkHeavenDialIsOpenByGId(slot2)) then
		if slot3 then
			message(slot3.open_desc)
		end

		return
	end

	if slot1 == 2 and slot0.cur_group_id <= 1 or slot1 == 1 and Config.HolyEqmLotteryData.data_group_length <= slot0.cur_group_id then
		return
	end

	if slot0.rotate_ani_state then
		return
	end

	slot0.rotate_ani_state = true

	if slot1 == 1 then
		slot0.cur_group_id = slot0.cur_group_id + 1
	elseif slot1 == 2 then
		slot0.cur_group_id = slot0.cur_group_id - 1
	end

	slot0:setData()

	if not slot0.stage_item_2 then
		slot0.stage_item_2 = HeavenDialItem.new()

		slot0.stage_layer:addChild(slot0.stage_item_2)
	end

	if slot0.cur_stage_index == 1 then
		slot0.stage_item_2:setData(slot0.cur_group_cfg)
		slot0.stage_item_1:showRotateAni(slot1, false)
		slot0.stage_item_2:showRotateAni(slot1, true)

		slot0.cur_stage_index = 2
	elseif slot0.cur_stage_index == 2 then
		slot0.stage_item_1:setData(slot0.cur_group_cfg)
		slot0.stage_item_2:showRotateAni(slot1, false)
		slot0.stage_item_1:showRotateAni(slot1, true)

		slot0.cur_stage_index = 1
	end

	GlobalTimeTicket:getInstance():add(function ()
		uv0.rotate_ani_state = false
	end, 0.25, 1)
end

function HeavenDialWindow.updateArrowBtnStatus(slot0)
	if uv0:getHeavenDialIsFreeById(slot0.cur_group_id - 1) == false then
		slot1 = uv0:getHeavenDialAwardRedById(slot0.cur_group_id - 1)
	end

	if uv0:getHeavenDialIsFreeById(slot0.cur_group_id + 1) == false then
		slot2 = uv0:getHeavenDialAwardRedById(slot0.cur_group_id + 1)
	end

	if not slot0.cur_group_id then
		slot0.arrow_left:setVisible(false)
		slot0.arrow_right:setVisible(false)
		addRedPointToNodeByStatus(slot0.arrow_left, false)
		addRedPointToNodeByStatus(slot0.arrow_right, false)
	elseif slot0.cur_group_id <= 1 then
		slot0.arrow_left:setVisible(false)
		slot0.arrow_right:setVisible(true)

		slot5 = true

		if not Config.HolyEqmLotteryData.data_group[slot0.cur_group_id + 1] or not uv0:checkHeavenDialIsOpenByGId(slot3) then
			slot5 = false
		end

		setChildUnEnabled(not slot5, slot0.arrow_right)
		setChildUnEnabled(false, slot0.arrow_left)
		addRedPointToNodeByStatus(slot0.arrow_left, false)

		if slot5 then
			addRedPointToNodeByStatus(slot0.arrow_right, slot2, 4, 4)
		else
			addRedPointToNodeByStatus(slot0.arrow_right, false)
		end
	elseif Config.HolyEqmLotteryData.data_group_length <= slot0.cur_group_id then
		slot0.arrow_left:setVisible(true)
		slot0.arrow_right:setVisible(false)
		setChildUnEnabled(false, slot0.arrow_right)
		addRedPointToNodeByStatus(slot0.arrow_left, slot1, 4, 4)
		addRedPointToNodeByStatus(slot0.arrow_right, false)
	else
		slot0.arrow_left:setVisible(true)
		slot0.arrow_right:setVisible(true)

		slot5 = true

		if not Config.HolyEqmLotteryData.data_group[slot0.cur_group_id + 1] or not uv0:checkHeavenDialIsOpenByGId(slot3) then
			slot5 = false
		end

		setChildUnEnabled(not slot5, slot0.arrow_right)
		addRedPointToNodeByStatus(slot0.arrow_left, slot1, 4, 4)

		if slot5 then
			addRedPointToNodeByStatus(slot0.arrow_right, slot2, 4, 4)
		else
			addRedPointToNodeByStatus(slot0.arrow_right, false)
		end
	end
end

function HeavenDialWindow.handlerLinghtEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.pos_light) and slot0.light_effect == nil then
			slot0.light_effect = createEffectSpine(Config.EffectData.data_effect_info[1090], cc.p(-6, -343), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.pos_light:addChild(slot0.light_effect)
		end
	elseif slot0.light_effect then
		slot0.light_effect:clearTracks()
		slot0.light_effect:removeFromParent()

		slot0.light_effect = nil
	end
end

function HeavenDialWindow.handleDialEffect(slot0, slot1)
	if slot1 == false then
		if slot0.dial_effect then
			slot0.dial_effect:clearTracks()
			slot0.dial_effect:removeFromParent()

			slot0.dial_effect = nil
		end
	elseif not tolua.isnull(slot0.main_container) and slot0.dial_effect == nil then
		slot2 = slot0.main_container:getContentSize()
		slot0.dial_effect = createEffectSpine(Config.EffectData.data_effect_info[1000], cc.p(slot2.width / 2, slot2.height / 2 - 200), cc.p(0.5, 0.5), false, PlayerAction.action, handler(slot0, slot0._onDialAniCallBack))

		slot0.main_container:addChild(slot0.dial_effect)

		slot0.is_show_dial_ani = true
	elseif slot0.dial_effect then
		slot0.dial_effect:setToSetupPose()
		slot0.dial_effect:setAnimation(0, PlayerAction.action, false)

		slot0.is_show_dial_ani = true
	end
end

function HeavenDialWindow._onDialAniCallBack(slot0)
	if slot0.cur_group_id and slot0.dial_times and slot0.dial_recruit_type then
		uv0:sender25217(slot0.cur_group_id, slot0.dial_times, slot0.dial_recruit_type)
	end

	slot0.is_show_dial_ani = false
end

function HeavenDialWindow.DeleteMe(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.update_dial_base_data then
		GlobalEvent:getInstance():UnBind(slot0.update_dial_base_data)

		slot0.update_dial_base_data = nil
	end

	if slot0.update_heaven_red_status then
		GlobalEvent:getInstance():UnBind(slot0.update_heaven_red_status)

		slot0.update_heaven_red_status = nil
	end

	if slot0.add_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.add_goods_event)

		slot0.add_goods_event = nil
	end

	if slot0.delete_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.delete_goods_event)

		slot0.delete_goods_event = nil
	end

	if slot0.modify_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.modify_goods_event)

		slot0.modify_goods_event = nil
	end

	if slot0.update_all_score then
		GlobalEvent:getInstance():UnBind(slot0.update_all_score)

		slot0.update_all_score = nil
	end

	if slot0.award_item_list and next(slot0.award_item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.award_item_list) do
			if slot5 and slot5.effect then
				slot5.effect:clearTracks()
				slot5.effect:removeFromParent()

				slot5.effect = nil
			end
		end
	end

	if slot0.backpackitem_list and next(slot0.backpackitem_list or {}) ~= nil then
		for slot4, slot5 in pairs(slot0.backpackitem_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.backpackitem_list = {}

	if slot0.stage_item_1 then
		slot0.stage_item_1:DeleteMe()

		slot0.stage_item_1 = nil
	end

	if slot0.stage_item_2 then
		slot0.stage_item_2:DeleteMe()

		slot0.stage_item_2 = nil
	end

	slot0:handleDialEffect(false)
	slot0:handlerLinghtEffect(false)

	if slot0.stage_layer then
		slot0.stage_layer:setClippingEnabled(false)
	end
end

HeavenDialItem = class("HeavenDialItem", function ()
	return ccui.Widget:create()
end)

function HeavenDialItem.ctor(slot0)
	slot0.heaven_list = {}
	slot0.item_panel_list = {}
	slot0.item_panel_pos_list = {}

	slot0:configUI()
	slot0:register_event()
end

function HeavenDialItem.configUI(slot0)
	slot0.size = cc.size(200, 300)

	slot0:setTouchEnabled(false)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("heaven/heaven_dial_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.name = slot2:getChildByName("name")
	slot0.image_name = slot2:getChildByName("image_name")

	slot0.image_name:setLocalZOrder(1)
	slot0.name:setLocalZOrder(2)

	slot6 = "bg"
	slot0.bg = slot2:getChildByName(slot6)

	for slot6 = 1, 4 do
		slot7 = slot2:getChildByName("heaven_" .. slot6)

		slot7:setLocalZOrder(2 + slot6)

		holy_item = BackPackItem.new(false, true, false, 0.7)

		holy_item:addCallBack(function ()
			uv0:selectHolyByIndex(uv1)
		end)
		holy_item:addLongTimeTouchCallback(function ()
			uv0:onCellLongTimeTouched(uv1)
		end)
		holy_item:setPosition(cc.p(50.5, 53))
		holy_item:showAddIcon(true)
		slot7:addChild(holy_item)

		slot0.heaven_list[slot6] = holy_item
		slot0.item_panel_list[slot6] = slot7
		slot0.item_panel_pos_list[slot6] = cc.p(slot7:getPositionX(), slot7:getPositionY())
	end
end

function HeavenDialItem.register_event(slot0)
end

function HeavenDialItem.selectHolyByIndex(slot0, slot1)
	if slot0.dialy_data then
		uv0:openHeavenDialWishWindow(true, slot1, slot0.dialy_data)
	end
end

function HeavenDialItem.onCellLongTimeTouched(slot0, slot1)
	slot2 = nil

	if slot0.dialy_data then
		for slot6, slot7 in pairs(slot0.dialy_data.lucky_holy_eqm) do
			if slot7.pos == slot1 then
				if Config.HolyEqmLotteryData.data_wish_show[slot7.lucky_holy_eqm] then
					slot2 = slot8
				end

				break
			end
		end
	end

	if slot2 then
		slot2.open_type = 1

		TipsManager:getInstance():showGoodsTips(slot2)
	end
end

function HeavenDialItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.name:setString(slot1.name)
	slot0:handleStoneEffect(false)
	slot0:handleStoneEffect(true, slot1.effect_id)
	slot0:updateHolyItem()
	slot0:showItemAction(true)

	if slot1.shadow_res then
		slot0.shadow = createSprite(PathTool.getResFrame("common", "common_30009"), 0, 0, slot0.bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, -2)
		slot2 = 100

		if slot1.group_id == 1 then
			slot2 = 110
		end

		slot0.bg:setPositionX(slot2)
		slot0.shadow:setPositionX(slot0.shadow:getPositionX() + 20)
		slot0.shadow:setScale(1.2)
	end
end

function HeavenDialItem.updateHolyItem(slot0)
	if not slot0.data then
		return
	end

	slot0.dialy_data = uv0:getHeavenDialById(slot0.data.group_id)

	for slot5, slot6 in pairs(slot0.heaven_list) do
		slot7 = nil

		for slot11, slot12 in pairs(slot1.lucky_holy_eqm) do
			if slot12.pos == slot5 then
				if Config.HolyEqmLotteryData.data_wish_show[slot12.lucky_holy_eqm] then
					slot7 = slot13
				end

				break
			end
		end

		slot8 = slot6

		if slot7 then
			slot8:setData(slot7)
			slot8:setItemIcon(PathTool.getItemRes(slot7.icon))
			slot8:setGoodsName(slot7.name, cc.p(slot8.Width / 2, -36), 26, cc.c4b(255, 234, 188, 255))
			slot8:showAddIcon(false)
			slot8:setSelfBackground(slot7.quality)
		else
			slot8:setData()
			slot8.item_icon:setVisible(false)
			slot8:setGoodsName(TI18N("心愿水晶"), cc.p(slot8.Width / 2, -36), 26, cc.c4b(255, 234, 188, 255))
			slot8:showAddIcon(true)
			slot8:setSelfBackground(BackPackConst.quality.white)
		end
	end
end

function HeavenDialItem.handleStoneEffect(slot0, slot1, slot2)
	if slot1 == true then
		if not tolua.isnull(slot0.container) and slot0.stone_effect == nil and slot2 then
			slot0.stone_effect = createEffectSpine(Config.EffectData.data_effect_info[slot2], cc.p(slot0.size.width / 2, 40), cc.p(0.5, 0), true, PlayerAction.action)

			slot0.container:addChild(slot0.stone_effect)

			slot0.effect_id = slot2
		end
	elseif slot0.stone_effect then
		slot0.stone_effect:clearTracks()
		slot0.stone_effect:removeFromParent()

		slot0.stone_effect = nil
	end
end

function HeavenDialItem.showRotateAni(slot0, slot1, slot2)
	slot0:stopAllActions()

	if slot1 == 1 then
		if slot2 then
			slot0:setPosition(cc.p(1050, 370))
			slot0:runAction(cc.MoveTo:create(0.2, cc.p(350, 370)))
		else
			slot0:setPosition(cc.p(350, 370))
			slot0:runAction(cc.MoveTo:create(0.2, cc.p(-350, 370)))
		end
	elseif slot1 == 2 then
		if slot2 then
			slot0:setPosition(cc.p(-350, 370))
			slot0:runAction(cc.MoveTo:create(0.2, cc.p(350, 370)))
		else
			slot0:setPosition(cc.p(350, 370))
			slot0:runAction(cc.MoveTo:create(0.2, cc.p(1050, 370)))
		end
	end
end

function HeavenDialItem.showItemAction(slot0, slot1)
	if slot1 == true then
		if slot0.item_panel_list then
			for slot5, slot6 in pairs(slot0.item_panel_list) do
				if slot0.item_panel_pos_list[slot5] then
					slot6:setPosition(slot0.item_panel_pos_list[slot5])
					slot6:stopAllActions()
					delayRun(slot6, math.random(1, 10) / 10, function ()
						slot0 = 20
						slot4 = cc.DelayTime:create(math.random(1, 10) / 10)
						slot5 = cc.Sequence:create(cc.MoveBy:create(2.5, cc.p(0, -slot0)), cc.MoveBy:create(2.5, cc.p(0, slot0)))

						if math.random(1, 2) == 2 then
							slot5 = cc.Sequence:create(slot2, slot1)
						end

						uv0:runAction(cc.RepeatForever:create(slot5))
					end)
				end
			end
		end

		if slot0.stone_effect then
			delayRun(slot0.stone_effect, math.random(1, 10) / 10, function ()
				slot0 = 20
				slot4 = cc.DelayTime:create(math.random(1, 10) / 10)
				slot5 = cc.Sequence:create(cc.MoveBy:create(2.5, cc.p(0, -slot0)), cc.MoveBy:create(2.5, cc.p(0, slot0)))

				if math.random(1, 2) == 2 then
					slot5 = cc.Sequence:create(slot2, slot1)
				end

				uv0.stone_effect:runAction(cc.RepeatForever:create(slot5))
			end)
		end
	else
		if slot0.item_panel_list then
			for slot5, slot6 in pairs(slot0.item_panel_list) do
				if slot0.item_panel_pos_list[slot5] then
					slot6:setPosition(slot0.item_panel_pos_list[slot5])
					slot6:stopAllActions()
				end
			end
		end

		if slot0.stone_effect then
			slot0.stone_effect:stopAllActions()
		end
	end
end

function HeavenDialItem.DeleteMe(slot0)
	slot0:showItemAction(false)

	if slot0.heaven_list then
		for slot4, slot5 in pairs(slot0.heaven_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end

		slot0.heaven_list = nil
	end

	if slot0.shadow_res_load then
		slot0.shadow_res_load:DeleteMe()

		slot0.shadow_res_load = nil
	end

	slot0:handleStoneEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
