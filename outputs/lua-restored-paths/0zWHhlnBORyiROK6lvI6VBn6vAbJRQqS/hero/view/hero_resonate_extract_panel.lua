HeroResonateExtractPanel = HeroResonateExtractPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = BackpackController:getInstance():getModel()
slot3 = table.insert
slot4 = table.sort
slot5 = string.format
slot6 = math.ceil
slot7 = RoleController:getInstance():getRoleVo()

function HeroResonateExtractPanel.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
	slot0.layout_name = "hero/hero_resonate_extract_panel"
	slot0.extract_item_id = 10301

	if Config.ResonateData.data_const.alchemy_goods then
		slot0.extract_item_id = slot1.val
	end

	slot0.extract_item_config = Config.ItemData.data_get_data(slot0.extract_item_id)

	if Config.ResonateData.data_const.single_refine_consume and next(slot2.val) ~= nil then
		slot0.cost_item_id = slot2.val[1][1]
		slot0.single_cost_count = slot2.val[1][2]
	else
		slot0.cost_item_id = Config.ItemData.data_assets_label2id.hero_exp
		slot0.single_cost_count = 10000
	end

	slot0.cost_item_config = Config.ItemData.data_get_data(slot0.cost_item_id)
end

function HeroResonateExtractPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.main_panel = slot1
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("影子提炼"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.look_btn = slot0.main_container:getChildByName("look_btn")
	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("获取影液"))

	slot0.recovery_btn = slot0.main_container:getChildByName("recovery_btn")
	slot0.recovery_btn_label = slot0.recovery_btn:getChildByName("label")

	slot0.recovery_btn_label:setString(TI18N("放入"))

	slot0.spine_node = slot0.main_container:getChildByName("spine_node")
	slot0.item_load_bg = loadSpriteTextureFromCDN(slot0.main_container:getChildByName("bg"), PathTool.getPlistImgForDownLoad("bigbg/resonate", "hero_resonate_bg3", false), ResourcesType.single, slot0.item_load_bg)
	slot0.item_right_node = slot0.main_container:getChildByName("item_right_node")
	slot0.coin = slot0.main_container:getChildByName("coin")
	slot0.count = slot0.main_container:getChildByName("count")
	slot0.right_item = BackPackItem.new(true, true, nil, 1, false)

	slot0.right_item:setDefaultTip()
	slot0.item_right_node:addChild(slot0.right_item)

	slot4 = slot0.main_container:getChildByName("progress_container")
	slot0.progress = slot4:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.progress_time = slot4:getChildByName("time")

	slot0.progress_time:setString("")

	slot0.total_time = slot0.main_container:getChildByName("total_time")

	slot0.total_time:setString("")

	slot0.level_key = slot0.main_container:getChildByName("level_key")

	slot0.level_key:setString(TI18N("提炼等级:"))

	slot0.level_value = slot0.main_container:getChildByName("level_value")
	slot0.txt_key_1 = slot0.main_container:getChildByName("txt_key_1")

	slot0.txt_key_1:setString(TI18N("提炼效率:"))

	slot0.txt_key_2 = slot0.main_container:getChildByName("txt_key_2")

	slot0.txt_key_2:setString(TI18N("转换效率:"))

	slot0.txt_key_3 = slot0.main_container:getChildByName("txt_key_3")

	slot0.txt_key_3:setString(TI18N("剩余经验:"))

	slot0.txt_key_4 = slot0.main_container:getChildByName("txt_key_4")

	slot0.txt_key_4:setString(TI18N("剩余时间:"))

	slot0.txt_value_1 = createRichLabel(20, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(500, 521), nil, nil, 1900)
	slot0.txt_value_2 = createRichLabel(20, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(480, 492), nil, nil, 1900)
	slot0.txt_value_3 = slot0.main_container:getChildByName("txt_value_3")

	slot0.main_container:addChild(slot0.txt_value_1)
	slot0.main_container:addChild(slot0.txt_value_2)
end

function HeroResonateExtractPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClosedBtn()
	end, true, 2)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 1)
	registerButtonEventListener(slot0.recovery_btn, function ()
		uv0:onRecoveryBtn()
	end, false, 1)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		if Config.ResonateData.data_const.extract_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
		end
	end, true, 1)
	slot0:addGlobalEvent(HeroEvent.Hero_Resonate_Extract_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)

	if uv0 ~= nil and slot0.role_lev_event == nil then
		slot0.role_lev_event = uv0:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "hero_exp" then
				uv0:updateIconInfo()
			end
		end)
	end
end

function HeroResonateExtractPanel.updateIconInfo(slot0)
	if not slot0.cost_item_config then
		return
	end

	slot1 = slot0.cost_item_config.id

	if slot0.record_item_bid == nil or slot0.record_item_bid ~= slot1 then
		slot0.record_item_bid = slot1

		loadSpriteTexture(slot0.coin, PathTool.getItemRes(slot0.cost_item_config.icon), LOADTEXT_TYPE)
	end

	slot0.count:setString(MoneyTool.GetMoneyString(BackpackController:getInstance():getModel():getItemNumByBid(slot1)))
end

function HeroResonateExtractPanel.onClosedBtn(slot0)
	uv0:openHeroResonateExtractPanel(false)
end

function HeroResonateExtractPanel.onComfirmBtn(slot0)
	if not slot0.scdata then
		return
	end

	uv0:sender26413()
end

function HeroResonateExtractPanel.onRecoveryBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.all_num == 0 then
		uv0:openHeroResonateSelectExpPanel(true, {
			limit_count = slot0.limit_num,
			target_item_id = slot0.extract_item_id,
			cost_item_id = slot0.cost_item_id,
			price = slot0.single_cost_count
		})
	else
		if slot0.scdata.all_num - (slot0.scdata.do_num + slot0.scdata.get_num) <= 0 then
			message(TI18N("已提炼完成,请收获材料"))

			return
		end

		CommonAlert.show(uv1(TI18N("当前剩余经验<img src='%s' scale=0.3 /><div fontcolor=#289b14> %s </div>，未完成提炼，是否取回？"), PathTool.getItemRes(slot0.cost_item_config.icon), slot0.single_cost_count * slot1), TI18N("确定"), function ()
			uv0:sender26412()
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, {
			timer = 3,
			timer_for = true,
			title = TI18N("经验取回")
		})
	end
end

function HeroResonateExtractPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.config_level_up = Config.ResonateData.data_level_up(uv0.resonate_stone_level or 0)

	if not slot0.config_level_up then
		return
	end

	slot0.single_cost_time = slot0.config_level_up.need_time or 3600
	slot0.limit_num = slot0.config_level_up.limit_num or 5

	if uv0:isResonateExtractRedpoint() then
		uv1:sender26414()
	end

	uv1:sender26410()
	slot0:updateIconInfo()
	slot0.level_value:setString(slot3 .. TI18N("级"))

	slot4 = PathTool.getItemRes(slot0.extract_item_config.icon)

	slot0.txt_value_1:setString(uv2(TI18N("<img src='%s' scale=0.3 />1=%s秒"), slot4, slot0.single_cost_time))
	slot0.txt_value_2:setString(uv2(TI18N("<img src='%s' scale=0.3 />%s=<img src='%s' scale=0.3 />1"), PathTool.getItemRes(slot0.cost_item_config.icon), slot0.single_cost_count, slot4))
end

function HeroResonateExtractPanel.setData(slot0, slot1)
	if not slot0.single_cost_time then
		return
	end

	if slot0.scdata and slot0.scdata.get_num - slot1.get_num > 0 and slot0.extract_item_config then
		showAssetsMsg(uv0(TI18N("获得<div fontcolor=%s>%s</div>"), BackPackConst.getBlackQualityColorStr(slot0.extract_item_config.quality), slot0.extract_item_config.name))
	end

	slot0.scdata = slot1

	if slot0.scdata.all_num == 0 then
		slot0.right_item:setBaseData(slot0.extract_item_id, 1)
		slot0.right_item:setSpecialNum(0)
		doStopAllActions(slot0.progress_time)
		doStopAllActions(slot0.total_time)
		slot0.progress_time:setString(TI18N("点击莫利亚放入经验"))
		slot0.total_time:setString("0")
		slot0.progress:setPercent(0)
		slot0:showBottleEffect1(0)
		slot0.recovery_btn_label:setString(TI18N("放入"))
		slot0.txt_value_3:setString(0)
	else
		slot0.recovery_btn_label:setString(TI18N("取回"))
		slot0.right_item:setBaseData(slot0.extract_item_id, slot0.scdata.do_num)
		slot0.right_item:setSpecialNum(slot0.scdata.do_num)
		commonCountDownTime(slot0.progress_time, slot0.scdata.do_end_time - GameNet:getInstance():getTime(), {
			callback = function (slot0)
				uv0:setTimeFormatString(slot0)
			end
		})

		if slot0.scdata.all_num - (slot0.scdata.do_num + slot0.scdata.get_num) - 1 < 0 then
			coutn = 0
		end

		commonCountDownTime(slot0.total_time, slot0.single_cost_time * slot5 + slot4)
		slot0.txt_value_3:setString(MoneyTool.GetMoneyString((slot5 + 1) * slot0.single_cost_count))
	end
end

function HeroResonateExtractPanel.setTimeFormatString(slot0, slot1)
	if not slot0.progress_time then
		return
	end

	if not slot0.progress then
		return
	end

	if not slot0.single_cost_time then
		return
	end

	if slot1 <= 0 then
		slot1 = 0

		slot0.progress_time:setString("00:00")
		doStopAllActions(slot0.progress_time)
	else
		slot0.progress_time:setString(TimeTool.GetTimeForFunction(slot1))
	end

	if slot0.single_cost_time <= slot1 then
		slot0.progress:setPercent(0)
		slot0:showBottleEffect1(0)
	else
		slot3 = (slot0.single_cost_time - slot1) * 100 / slot0.single_cost_time

		slot0.progress:setPercent(slot3)
		slot0:showBottleEffect1(slot3)
	end
end

function HeroResonateExtractPanel.showBottleEffect1(slot0, slot1)
	if uv0(slot1 / 20) < 0 then
		slot2 = 0
	elseif slot2 > 5 then
		slot2 = 5
	end

	if PlayerAction["action_" .. slot2] == nil or slot2 == 0 then
		slot3 = PlayerAction.action_6
	end

	if slot0.record_action == nil or slot0.record_action ~= slot2 then
		slot0.record_action = slot2

		if slot0.girl_effect == nil then
			slot0.girl_effect = createEffectSpine("E24123", cc.p(188, -88), cc.p(0.5, 0.5), true, slot3)

			slot0.spine_node:addChild(slot0.girl_effect, 3)
		else
			slot0.girl_effect:setAnimation(0, slot3, true)
		end
	end
end

function HeroResonateExtractPanel.close_callback(slot0)
	if slot0.girl_effect then
		slot0.girl_effect:clearTracks()
		slot0.girl_effect:removeFromParent()

		slot0.girl_effect = nil
	end

	if slot0.bottle_effect then
		slot0.bottle_effect:clearTracks()
		slot0.bottle_effect:removeFromParent()

		slot0.bottle_effect = nil
	end

	if slot0.bottle_effect1 then
		slot0.bottle_effect1:clearTracks()
		slot0.bottle_effect1:removeFromParent()

		slot0.bottle_effect1 = nil
	end

	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.item_list = {}

	if slot0.right_item then
		slot0.right_item:DeleteMe()

		slot0.right_item = nil
	end

	if slot0.item_load_bg then
		slot0.item_load_bg:DeleteMe()
	end

	slot0.item_load_bg = nil

	if uv0 and slot0.role_lev_event then
		uv0:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	doStopAllActions(slot0.progress_time)
	uv1:openHeroResonateExtractPanel(false)
end
