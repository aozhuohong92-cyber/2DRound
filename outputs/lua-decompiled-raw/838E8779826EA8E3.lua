slot1 = ElfinController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
ElfinSummonPanel = class("ElfinSummonPanel", function ()
	return ccui.Widget:create()
end)

function ElfinSummonPanel.ctor(slot0)
	slot0._summon_type_1 = 1
	slot0._summon_type_10 = 3
	slot0._summon_type = 1
	slot0._init_flag = false
	slot0._init_status = false
	slot0.award_item_list = {}
	slot0.arriveLuckly_label = {}
	slot0.win_item_list = {}
	slot0.rewards_info = nil
	slot0.cur_ani_time = 0

	if Config.HolidaySpriteLotteryData.data_const.common_s then
		slot0.summon_item_bid = slot1.val
	end

	if Config.HolidaySpriteLotteryData.data_const.sprite_lottery_daily_limit then
		slot0.sprite_lottery_daily_limit = slot2.val
	end

	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("timesummon", "timesummon"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("elfin", "elfin"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New()

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:loadResListCompleted()
	end)
end

function ElfinSummonPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
	uv0:send26550()

	slot0._init_flag = true
end

function ElfinSummonPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("elfin/elfin_summon_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.effect_panel = slot1:getChildByName("effect_panel")
	slot0.win_award_panel = slot1:getChildByName("win_award_panel")
	slot0.image_bg = slot1:getChildByName("image_bg")
	slot0.bg_load = loadImageTextureFromCDN(slot0.image_bg, PathTool.getPlistImgForDownLoad("elfin", "txt_cn_elfin_summ_bg", false), ResourcesType.single, slot0.bg_load)
	slot0.item_num_txt = slot1:getChildByName("item_num_txt")

	slot0.item_num_txt:setTextColor(Config.ColorData.data_color4[1])
	slot0.item_num_txt:enableOutline(Config.ColorData.data_color4[2], 2)

	slot0.item_icon = slot1:getChildByName("item_icon")

	loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(Config.HolidaySpriteLotteryData.data_const.common_s.val), LOADTEXT_TYPE)

	slot0.wish_btn = slot1:getChildByName("wish_btn")

	slot0.wish_btn:setName("guide_wish_btn")

	slot0.wish_btn_lab = slot0.wish_btn:getChildByName("label")

	slot0.wish_btn_lab:setString(TI18N("许愿池"))
	slot0.wish_btn_lab:setZOrder(99)

	slot0.icon_1 = slot0.wish_btn:getChildByName("icon_1")
	slot0.Image_3 = slot0.wish_btn:getChildByName("Image_3")

	slot0.Image_3:setZOrder(98)

	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.add_btn = slot1:getChildByName("add_btn")
	slot0.summon_btn_1 = slot1:getChildByName("summon_btn_1")

	slot0.summon_btn_1:getChildByName("label"):setString(TI18N("召唤1次"))

	slot0.summon_btn_10 = slot1:getChildByName("summon_btn_10")

	slot0.summon_btn_10:getChildByName("label"):setString(TI18N("召唤10次"))

	slot0.cur_num_lab = slot1:getChildByName("cur_num_lab")

	slot0.cur_num_lab:setString("")

	slot0.progress_panel = slot1:getChildByName("progress_panel")
	slot0.progress = slot0.progress_panel:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)

	slot0.num_label = slot0.progress_panel:getChildByName("num_label")

	slot0.num_label:setString("")

	slot0.mask_bg = createSprite(PathTool.getResFrame("elfin", "elfin_1058"), 35.5, 35.5, nil, cc.p(0.5, 0.5))
	slot0.clipNode = cc.ClippingNode:create(slot0.mask_bg)

	slot0.clipNode:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.clipNode:setContentSize(cc.size(71, 71))
	slot0.clipNode:setCascadeOpacityEnabled(true)
	slot0.clipNode:setPosition(35.5, 35.5)
	slot0.clipNode:setAlphaThreshold(0)
	slot0.wish_btn:addChild(slot0.clipNode, 1)

	slot0.elfin_icon = createImage(slot0.clipNode, nil, 35.5, 35.5, cc.p(0.5, 0.5), false)

	slot0.elfin_icon:setScale(0.6)
	slot0.clipNode:setVisible(false)
end

function ElfinSummonPanel.updateSummonBtnStatus(slot0)
	if slot0.data and slot0.config and slot0.summon_item_bid then
		slot1 = BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid)

		if not slot0.summon_txt_1 then
			slot0.summon_txt_1 = createRichLabel(18, nil, cc.p(0.5, 0.5), cc.p(120.5, 22))

			slot0.summon_btn_1:addChild(slot0.summon_txt_1)
		end

		slot3 = ""
		slot4 = false

		if slot0.data.free_time and slot0.data.free_time <= GameNet:getInstance():getTime() then
			slot3 = TI18N("<div fontcolor=#ffffff>免费召唤</div>")

			slot0:openSummonFreeTimer(false)

			slot0._summon_type_1 = 1
			slot4 = true
		elseif slot1 >= 1 then
			if Config.ItemData.data_get_data(slot0.summon_item_bid) then
				slot3 = string.format(TI18N("<img src='%s' scale=0.4 /><div fontcolor=#ffffff>%d</div>"), PathTool.getItemRes(slot5.icon), slot1)
			end

			slot0:openSummonFreeTimer(false)

			slot0._summon_type_1 = 4
		elseif slot0.data.free_time then
			slot0.left_time = slot0.data.free_time - slot2
			slot3 = string.format(TI18N("<div fontcolor=#35ff14>%s</div><div fontcolor=#ffffff>后免费</div>"), TimeTool.GetTimeFormat(slot0.left_time))

			slot0:openSummonFreeTimer(true)

			slot0._summon_type_1 = 3
		end

		addRedPointToNodeByStatus(slot0.summon_btn_1, slot4, 0, 0)
		slot0.summon_txt_1:setString(slot3)

		if not slot0.summon_txt_10 then
			slot0.summon_txt_10 = createRichLabel(18, nil, cc.p(0.5, 0.5), cc.p(120.5, 22))

			slot0.summon_btn_10:addChild(slot0.summon_txt_10)
		end

		slot5 = ""

		if slot1 >= 10 then
			if Config.ItemData.data_get_data(slot0.summon_item_bid) then
				slot5 = string.format(TI18N("<img src='%s' scale=0.4 /><div fontcolor=#ffffff>%d</div>"), PathTool.getItemRes(slot6.icon), slot1)
			end

			slot0._summon_type_10 = 4
		else
			slot5 = string.format(TI18N("<img src='%s' scale=0.3 /><div fontcolor=#ffffff>%d</div>"), PathTool.getItemRes(slot0.config.loss_gold_ten[1][1]), slot0.config.loss_gold_ten[1][2])
			slot0._summon_type_10 = 3
		end

		slot0.summon_txt_10:setString(slot5)
	end
end

function ElfinSummonPanel.openSummonFreeTimer(slot0, slot1)
	if slot1 == true then
		if slot0.left_time > 0 and slot0.summon_txt_1 then
			if not slot0.summon_timer then
				slot0.summon_timer = GlobalTimeTicket:getInstance():add(function ()
					if uv0.data and uv0.data.free_time - GameNet:getInstance():getTime() > 0 then
						uv0.left_time = uv0.data.free_time - GameNet:getInstance():getTime()

						uv0.summon_txt_1:setString(string.format(TI18N("<div fontcolor=#35ff14>%s</div><div fontcolor=#ffffff>后免费</div>"), TimeTool.GetTimeFormat(uv0.left_time)))

						uv0._summon_type_1 = 3
					else
						uv0.summon_txt_1:setString(TI18N("<div fontcolor=#ffffff>免费召唤</div>"))

						uv0._summon_type_1 = 1

						GlobalTimeTicket:getInstance():remove(uv0.summon_timer)

						uv0.summon_timer = nil
					end
				end, 1)
			end
		elseif slot0.summon_timer ~= nil then
			GlobalTimeTicket:getInstance():remove(slot0.summon_timer)

			slot0.summon_timer = nil
		end
	elseif slot0.summon_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.summon_timer)

		slot0.summon_timer = nil
	end
end

function ElfinSummonPanel.updateProgress(slot0)
	slot2 = 80

	if Config.HolidaySpriteLotteryData.data_award[slot0.data.camp_id] then
		for slot8, slot9 in ipairs(slot1) do
			if slot0.award_item_list[slot8] == nil then
				slot10 = RoundItem.new(true, 0.55, 0.6)

				slot0.progress_panel:addChild(slot10)

				slot0.award_item_list[slot8] = slot10

				slot10:setPosition(cc.p(slot2 + (slot8 - 1) * (300 - slot2 + 0) / (#slot1 - 1), 16.5))
				slot10:setBaseData(slot9.reward[1][1], slot9.reward[1][2])
				slot10:setVisibleRedPoint(false)
				slot10:setVisibleRoundBG(false)
				slot10:addCallBack(function ()
					uv0:send26552(uv1.id)
				end)
			end

			if not slot0.arriveLuckly_label[slot8] and slot0.award_item_list[slot8] then
				slot0.arriveLuckly_label[slot8] = createLabel(22, cc.c3b(244, 238, 211), cc.c3b(0, 0, 0), slot11, -10, "", slot0.progress_panel, 2, cc.p(0.5, 1))
			end

			if slot0.arriveLuckly_label[slot8] then
				slot0.arriveLuckly_label[slot8]:setString(slot9.times)
			end
		end

		slot5 = 0
		slot6 = 300
		slot8 = 0

		for slot12, slot13 in ipairs(slot1) do
			if slot12 == 1 then
				if slot0.data.times <= slot13.times then
					slot8 = slot0.data.times / slot13.times * (slot2 - 0)

					break
				else
					slot8 = slot7
				end
			elseif slot0.data.times <= slot13.times then
				slot8 = slot8 + (slot0.data.times - slot5) / (slot13.times - slot5) * slot4

				break
			else
				slot8 = slot8 + slot4
			end

			slot5 = slot13.times
		end

		slot0.progress:setPercent(slot8 / slot6 * 100)
		slot0.num_label:setString(uv1(TI18N("累计积分:\n%d"), slot0.data.times))
	end

	slot0:updateAwardStatus()
end

function ElfinSummonPanel.updateAwardStatus(slot0)
	if Config.HolidaySpriteLotteryData.data_award[slot0.data.camp_id] then
		for slot5, slot6 in pairs(slot1) do
			slot7 = false
			slot8 = false

			for slot12, slot13 in pairs(slot0.data.do_awards) do
				if slot6.id == slot13.award_id then
					slot8 = true

					break
				end
			end

			if slot8 == false and slot6.times <= slot0.data.times then
				slot7 = true
			end

			setChildUnEnabled(false, slot0.award_item_list[slot5])

			if slot0.award_item_list[slot5] then
				slot0.award_item_list[slot5]:setDefaultTip(not slot7)
				slot0.award_item_list[slot5]:setVisibleRedPoint(slot7)

				if slot8 == true then
					setChildUnEnabled(true, slot0.award_item_list[slot5])
				end
			end
		end
	end
end

function ElfinSummonPanel.updateItemNum(slot0, slot1, slot2)
	if slot0.summon_item_bid then
		if slot1 and slot2 then
			if slot1 == BackPackConst.Bag_Code.BACKPACK then
				for slot6, slot7 in pairs(slot2) do
					if slot7 and slot7.base_id and slot0.summon_item_bid == slot7.base_id then
						slot0.item_num_txt:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid))
						slot0:updateSummonBtnStatus()

						break
					end
				end
			end
		else
			slot0.item_num_txt:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid))
		end
	end
end

function ElfinSummonPanel.register_event(slot0)
	if slot0.btn_rule then
		slot0.btn_rule:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if Config.HolidaySpriteLotteryData.data_const.reward_desc then
					TipsManager:getInstance():showCommonTips(slot2.desc, slot0:getTouchBeganPosition())
				end
			end
		end)
	end

	registerButtonEventListener(slot0.add_btn, function ()
		if uv0.summon_item_bid then
			BackpackController:getInstance():openTipsSource(true, uv0.summon_item_bid)
		end
	end, true)
	registerButtonEventListener(slot0.wish_btn, function ()
		uv0:openElfinWishWindow(true, uv1.data)
	end, true)
	registerButtonEventListener(slot0.summon_btn_1, function ()
		slot0, slot1 = HeroController:getInstance():getModel():getHeroMaxCount()

		if uv0._summon_type_1 == 3 and uv0.config then
			if uv0.data and uv0.sprite_lottery_daily_limit <= uv0.data.day_count then
				message(TI18N("今日钻石召唤次数已达上限"))

				return
			end

			uv0:showAlert(uv0.config.loss_gold_once[1][2], Config.ItemData.data_get_data(uv0.config.loss_gold_once[1][1]).icon, Config.ItemData.data_get_data(uv0.config.gain_once[1][1]).name or "", uv0.config.gain_once[1][2], 1, function ()
				uv0._summon_type = 1

				uv1:send26551(1, uv0._summon_type_1, false)
			end)
		else
			uv0._summon_type = 1

			uv1:send26551(1, uv0._summon_type_1, false)
		end
	end, true)
	registerButtonEventListener(slot0.summon_btn_10, function ()
		if uv0._summon_type_10 == 3 and uv0.config then
			if uv0.data and uv0.sprite_lottery_daily_limit <= uv0.data.day_count then
				message(TI18N("今日钻石召唤次数已达上限"))

				return
			end

			uv0:showAlert(uv0.config.loss_gold_ten[1][2], Config.ItemData.data_get_data(uv0.config.loss_gold_ten[1][1]).icon, Config.ItemData.data_get_data(uv0.config.gain_ten[1][1]).name or "", uv0.config.gain_ten[1][2], 10, function ()
				uv0._summon_type = 2

				uv1:send26551(10, uv0._summon_type_10, false)
			end)
		else
			uv0._summon_type = 2

			uv1:send26551(10, uv0._summon_type_10, false)
		end
	end, true)

	if not slot0.update_summon_data_event then
		slot0.update_summon_data_event = GlobalEvent:getInstance():Bind(ElfinEvent.Update_Elfin_Summon_Data_Event, function (slot0)
			uv0:setData(slot0)
		end)
	end

	if not slot0.update_summon_rewards_data_event then
		slot0.update_summon_rewards_data_event = GlobalEvent:getInstance():Bind(ElfinEvent.Update_Elfin_Summon_Rewards_Data_Event, function (slot0)
			uv0.rewards_info = slot0
		end)
	end

	if not slot0.update_elfin_item_event then
		slot0.update_elfin_item_event = GlobalEvent:getInstance():Bind(ElfinEvent.Update_Elfin_Item_Event, function (slot0)
			uv0.rewards_info = slot0
		end)
	end

	if not slot0.update_add_good_event then
		slot0.update_add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	if not slot0.update_delete_good_event then
		slot0.update_delete_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	if not slot0.update_modify_good_event then
		slot0.update_modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end
end

function ElfinSummonPanel.showAlert(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot0.alert then
		slot0.alert:close()

		slot0.alert = nil
	end

	function slot7()
		if uv0.alert then
			uv0.alert:close()

			uv0.alert = nil
		end
	end

	if not slot0.alert then
		slot0.alert = CommonAlert.show(string.format(TI18N("是否使用<img src=%s visible=true scale=0.5 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>(拥有:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>)\n</div>"), PathTool.getItemRes(slot2), slot1, RoleController:getInstance():getRoleVo().gold + RoleController:getInstance():getRoleVo().red_gold) .. string.format(TI18N("<div fontColor=#020019>购买</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019></div><div fontColor=#d95014 fontsize= 26>%s</div><div fontColor=#020019>(同时附赠</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>次召唤)</div>"), slot4, slot3, slot5), TI18N("确定"), slot6, TI18N("取消"), nil, CommonAlert.type.rich)
	end
end

function ElfinSummonPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if Config.HolidaySpriteLotteryData.data_action[slot0.data.camp_id] and slot2.group_id then
		slot0.config = Config.HolidaySpriteLotteryData.data_summon[slot2.group_id]
	end

	if slot0._init_status == false then
		slot0._init_status = true
	end

	slot0.cur_num_lab:setString(uv0(TI18N("今日钻石召唤上限：%d/%d"), slot0.data.day_count, slot0.sprite_lottery_daily_limit))
	slot0:updateSummonBtnStatus()
	slot0:updateProgress()
	slot0:updateItemNum()

	slot3 = nil

	if slot0.data.lucky_ids ~= nil and next(slot0.data.lucky_ids) ~= nil then
		for slot7, slot8 in pairs(slot0.data.lucky_ids) do
			slot3 = slot8.lucky_sprites_bid

			break
		end
	end

	if slot3 then
		if Config.ItemData.data_get_data(slot3) then
			slot0.elfin_icon_load = loadImageTextureFromCDN(slot0.elfin_icon, PathTool.getItemRes(slot4.icon), ResourcesType.single, slot0.elfin_icon_load)
		end

		slot0.clipNode:setVisible(true)
		slot0.icon_1:setVisible(false)
		addRedPointToNodeByStatus(slot0.Image_3, false, 0, 0)
	else
		slot0.icon_1:setVisible(true)
		slot0.clipNode:setVisible(false)
		addRedPointToNodeByStatus(slot0.Image_3, true, 0, 0)
	end
end

function ElfinSummonPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true and slot0._init_flag == true then
		uv0:send26550()
	end

	if slot1 == false then
		-- Nothing
	end
end

function ElfinSummonPanel.DeleteMe(slot0)
	if slot0.touchUi and not tolua.isnull(slot0.touchUi) then
		slot0.touchUi:removeFromParent()
	end

	slot0.touchUi = nil

	if slot0.award_item_list and next(slot0.award_item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.award_item_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.win_item_list and next(slot0.win_item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.win_item_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	if slot0.elfin_icon_load then
		slot0.elfin_icon_load:DeleteMe()

		slot0.elfin_icon_load = nil
	end

	if slot0.title_load then
		slot0.title_load:DeleteMe()

		slot0.title_load = nil
	end

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.alert then
		slot0.alert:close()

		slot0.alert = nil
	end

	if slot0.update_summon_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_summon_data_event)

		slot0.update_summon_data_event = nil
	end

	if slot0.update_summon_rewards_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_summon_rewards_data_event)

		slot0.update_summon_rewards_data_event = nil
	end

	if slot0.update_elfin_item_event then
		GlobalEvent:getInstance():UnBind(slot0.update_elfin_item_event)

		slot0.update_elfin_item_event = nil
	end

	if slot0.update_add_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_add_good_event)

		slot0.update_add_good_event = nil
	end

	if slot0.update_delete_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_delete_good_event)

		slot0.update_delete_good_event = nil
	end

	if slot0.update_modify_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_modify_good_event)

		slot0.update_modify_good_event = nil
	end

	slot0:openSummonFreeTimer(false)
end
