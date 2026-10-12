HonorYuekaPanel = class("HonorYuekaPanel", function ()
	return ccui.Widget:create()
end)
slot0 = WelfareController:getInstance()
slot1 = Config.ChargeData.data_constant
slot2 = string.format
slot3 = slot1.month_card2_sun.val
slot4 = slot1.month_card2_items.val[1][1]
slot5 = slot1.month_card2_items.val[1][2]
slot6 = slot1.month_card2_cont_day.val

function HonorYuekaPanel.ctor(slot0)
	slot0.current_day = 0

	slot0:loadResources()
end

function HonorYuekaPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/welfare", "txt_cn_welfare_yueka_bg2"),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.loadResListCompleted then
			uv0:loadResListCompleted()
		end
	end)
end

function HonorYuekaPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HonorYuekaPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/yueka_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(17.5, 450)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot1 = slot0.main_container:getChildByName("bg")

	if not slot0.title_load then
		slot0.title_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/welfare", "txt_cn_welfare_yueka_bg2"), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.title_load)
	end

	slot0.btn_1 = slot0.main_container:getChildByName("btn_1")

	slot0.btn_1:getChildByName("Text_1"):setString(TI18N("充值激活"))

	slot0.bar_bg = slot0.main_container:getChildByName("Image_1_0")
	slot0.bar = slot0.bar_bg:getChildByName("bar")

	if slot0.bar then
		slot0.bar:setScale9Enabled(true)
	end

	slot0.current_change = slot0.bar_bg:getChildByName("current_change")

	slot0.current_change:setString(TI18N("当前充值："))
	slot0.main_container:getChildByName("Text_3"):setVisible(false)
	slot0.main_container:getChildByName("btn_rule"):setVisible(false)

	slot0.image_get = slot0.main_container:getChildByName("image_get")

	slot0.image_get:setVisible(false)

	slot0.text_day = slot0.image_get:getChildByName("text_day")

	slot0.text_day:setString("")

	slot0.btn_get = slot0.image_get:getChildByName("btn_get")
	slot0.btn_get_label = slot0.btn_get:getChildByName("Text_4")

	slot0.btn_get_label:setString(TI18N("领取"))

	slot0.text_1 = createRichLabel(24, Config.ColorData.data_color4[1], cc.p(0.5, 0.5), cc.p(180, 50), nil, , 400)

	slot0.bar_bg:addChild(slot0.text_1)

	slot0.text_2 = createRichLabel(24, Config.ColorData.data_color4[1], cc.p(0.5, 0.5), cc.p(524, 210), nil, , 400)

	slot0.main_container:addChild(slot0.text_2)

	slot0.text_3 = createRichLabel(24, Config.ColorData.data_color4[1], cc.p(0.5, 0.5), cc.p(524, 164), nil, , 400)

	slot0.main_container:addChild(slot0.text_3)
	slot0.text_1:setString(uv0(TI18N("<div outline=2,#110800>任意累计充值达到</div><div fontcolor=#ffd862 outline=2,#000000> %d元 </div><div outline=2,#110800>即可激活</div>"), uv1))

	slot4 = Config.ItemData.data_get_data(uv2.month_card2_return.val[1][1])

	slot0.text_2:setString(uv0(TI18N("<div outline=2,#110800>充值就</div><div fontsize=34 fontcolor=#ffd862 outline=2,#000000> 送%d天 </div><div outline=2,#110800>月卡</div>"), uv3))
	slot0.text_3:setString(uv0(TI18N("<div outline=2,#110800>每日可领取</div><div fontsize=34 fontcolor=#ffd862 outline=2,#000000> %d </div><img src=%s visible=true scale=0.30 />"), uv5, PathTool.getItemRes(Config.ItemData.data_get_data(uv4).icon)))
	uv6:sender16705()
end

function HonorYuekaPanel.register_event(slot0)
	if slot0.update_supre_event == nil then
		slot0.update_supre_event = GlobalEvent:getInstance():Bind(WelfareEvent.Update_Yueka, function (slot0)
			slot1 = 100
			slot2 = 100
			slot3, slot4 = nil
			slot5 = 0
			slot6 = 0
			slot7 = 0

			if slot0.card2_is_reward == 0 then
				uv0.image_get:setVisible(false)
				uv0.btn_1:setVisible(true)
				uv0.text_1:setVisible(true)
				uv0.bar_bg:setVisible(true)

				slot1 = uv1
				slot2 = slot0.card2_acc
			elseif slot0.card2_is_reward == 1 or slot0.card2_is_reward == 2 then
				slot3 = uv2
				slot4 = uv3
				slot6 = uv4
				slot7 = slot0.card2_end_time
				uv0.current_day = slot0.card2_days

				uv0.image_get:setVisible(true)
				uv0.btn_1:setVisible(false)
				uv0.text_1:setVisible(false)
				uv0.bar_bg:setVisible(false)

				if slot0.card2_is_reward == 1 then
					setChildUnEnabled(false, uv0.btn_get)
					uv0.btn_get_label:setString(TI18N("领取"))
				elseif slot0.card2_is_reward == 2 then
					setChildUnEnabled(true, uv0.btn_get)
					uv0.btn_get_label:disableEffect(cc.LabelEffect.OUTLINE)
					uv0.btn_get_label:setString(TI18N("已领取"))
				end
			end

			uv0.bar:setPercent(math.floor(slot2 / slot1 * 100))
			uv0.current_change:setString(uv5(TI18N("当前充值：%d / %d"), slot2, slot1))
			uv0.text_day:setString(uv0.current_day)
		end)
	end

	slot0.update_get_supre_event = GlobalEvent:getInstance():Bind(WelfareEvent.Update_Get_Yueka, function (slot0)
		if slot0 == 2 then
			setChildUnEnabled(true, uv0.btn_get)
			uv0.btn_get_label:disableEffect(cc.LabelEffect.OUTLINE)
			uv0.btn_get_label:setString(TI18N("已领取"))

			uv0.current_day = uv0.current_day + 1

			uv0.text_day:setString(uv0.current_day)
		end
	end)

	registerButtonEventListener(slot0.btn_1, function ()
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
	end, true, 1)
	registerButtonEventListener(slot0.btn_get, function ()
		WelfareController:getInstance():sender16706(2)
	end, true, 1)
end

function HonorYuekaPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function HonorYuekaPanel.DeleteMe(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.title_load then
		slot0.title_load:DeleteMe()

		slot0.title_load = nil
	end

	if slot0.update_supre_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_supre_event)

		slot0.update_supre_event = nil
	end

	if slot0.update_get_supre_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_get_supre_event)

		slot0.update_get_supre_event = nil
	end
end
