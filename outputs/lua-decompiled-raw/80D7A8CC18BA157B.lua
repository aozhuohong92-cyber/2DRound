ActionTreasureWindow = ActionTreasureWindow or BaseClass(BaseView)
slot1 = ActionController:getInstance():getModel()
slot2 = string.format
slot3 = Config.DialData.data_const
slot4 = Config.DialData.data_get_rand_list
slot5 = 8
slot6 = {
	{
		360,
		554
	},
	{
		508,
		483
	},
	{
		581,
		331
	},
	{
		503,
		185
	},
	{
		360,
		111
	},
	{
		218,
		180
	},
	{
		135,
		331
	},
	{
		216,
		486
	}
}
slot7 = {
	[0] = 1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	1
}

function ActionTreasureWindow.__init(slot0)
	slot0.firstComein = true
	slot0.is_full_screen = true
	slot0.touchEnable = false
	slot0.touchRefresh = false
	slot0.tab_list = {}
	slot0.reward_lucky = {}
	slot0.treasureCount = 1
	slot0.cur_index = nil
	slot0.cur_effect_index = nil
	slot0.desc_item_name = {}
	slot0.desc_item_Lv = {}
	slot0.hasTreasure_num = {}
	slot0.touchTreasure_type = 1
	slot0.checkMoreCount = 1
	slot0.touchEffect = {
		true,
		true
	}
	slot0.getRewardList = {}
	slot0.arriveLuckly_label = {}
	slot0.round_certer_load = {}
	slot0.item_list = {}
	slot0.luckly_item = {}
	slot0.win_type = WinType.Full
	slot0.layout_name = "action/action_treasure_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("welfare", "welfare"),
			type = ResourcesType.plist
		}
	}
end

function ActionTreasureWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot0.root_wnd:getChildByName("bg"):setScale(display.getMaxScale())

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/action", "action_treasure"), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.text_scroll = slot1:getChildByName("text_scroll")

	slot0.text_scroll:setScrollBarEnabled(false)

	slot0.probablity = slot1:getChildByName("probablity")

	slot0.probablity:setVisible(false)

	slot0.item_panel = slot1:getChildByName("item_panel")
	slot0.round_certer = slot0.item_panel:getChildByName("round")
	slot0.btnLockOther = slot0.item_panel:getChildByName("btnLockOther")

	slot1:getChildByName("Text_6"):setString(TI18N("下次免费刷新: "))

	slot0.refresh_time = slot1:getChildByName("refresh_time")

	slot0.refresh_time:setString("00:00:00")

	slot0.run_light = createSprite(PathTool.getResFrame("welfare", "welfare_37"), 0, 0, slot0.item_panel, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 10)

	slot0.run_light:setVisible(false)

	slot0.status_count = 0

	uv0:setLucklyRewardData()
	uv0:setBuyRewardData()
	slot1:getChildByName("Text_2"):setString(TI18N("探宝记录"))

	slot10 = cc.p(0, 20)
	slot0.treasure_total = createRichLabel(22, cc.c4b(255, 255, 248, 255), cc.p(0, 0.5), slot10, nil, , 150)

	slot0.main_container:getChildByName("treasure_bg"):addChild(slot0.treasure_total)

	slot0.luckyBar = slot1:getChildByName("luckyBar")

	slot0.luckyBar:setScale9Enabled(true)

	for slot10 = 1, 2 do
		slot11 = slot1:getChildByName("tab_container"):getChildByName(string.format("tab_btn_%s", slot10))
		slot11.label = slot11:getChildByName("title")

		slot11.label:setString(({
			TI18N("幸运探宝"),
			TI18N("高级探宝")
		})[slot10])

		slot11.normal = slot11:getChildByName("normal")
		slot11.select = slot11:getChildByName("select")

		slot11.select:setVisible(false)

		slot11.redpoint = slot11:getChildByName("redpoint")

		slot11.redpoint:setVisible(false)
		slot11.label:setTextColor(cc.c4b(90, 58, 38, 255))
		slot11.label:enableOutline(cc.c4b(2, 0, 25, 255), 2)

		slot11.index = slot10
		slot0.tab_list[slot10] = slot11
	end

	for slot10 = 1, 2 do
		slot0.hasTreasure_num[slot10] = BackpackController:getInstance():getModel():getBackPackItemNumByBid(uv0:getBuyRewardData(slot10)[1].expend_item[1][1])
	end

	slot0.btnTreasure = {}

	for slot10 = 1, 3 do
		slot11 = {
			btn = slot1:getChildByName("btn_treasure_" .. slot10),
			price = createRichLabel(24, Config.ColorData.data_color4[1], cc.p(0, 0.5), cc.p(43, 36), nil, , )
		}

		slot11.btn:addChild(slot11.price)

		slot0.btnTreasure[slot10] = slot11
	end

	slot0.text_lucky_num = slot1:getChildByName("text_lucky_num")

	slot0.text_lucky_num:setString("")

	slot0.btnRule = slot1:getChildByName("btnRule")
	slot0.btn_shop = slot1:getChildByName("btn_shop")

	slot0.btn_shop:getChildByName("Text_1"):setString(TI18N("探宝商城"))
	UITool.SetTitleColor(slot0.btn_shop:getChildByName("Text_1"))

	slot0.btn_return = slot1:getChildByName("btn_return")

	slot0.btn_return:setPosition(cc.p(display.getLeft(slot0.main_container) + slot0.btn_return:getPositionX(), display.getBottom(slot0.main_container) + slot0.btn_return:getPositionY() * display.getMaxScale(slot0.root_wnd)))
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.COMMON, "c_turntable_game")
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.COMMON, "c_turntable_game_1")
end

function ActionTreasureWindow.openRootWnd(slot0, slot1)
	slot0.jump_index = slot1 or 1

	slot0:changeTabLocalData(slot0.jump_index)
	uv0:requestLucky()
end

function ActionTreasureWindow.rewardProbility(slot0, slot1)
	slot2 = {}
	slot3 = 1
	slot4 = RoleController:getInstance():getRoleVo()

	if Config.DialData.data_magnificat_list[slot1 or 1] == nil then
		slot0.probablity:setVisible(false)

		return
	end

	for slot8, slot9 in ipairs(slot2) do
		if slot9.min <= slot4.lev and slot4.lev <= slot9.max then
			slot3 = slot8

			break
		end
	end

	slot5 = slot2[slot3]

	for slot9 = 1, slot0.checkMoreCount do
		if slot0.desc_item_name[slot9] then
			slot0.desc_item_name[slot9]:setVisible(false)
		end

		if slot0.desc_item_Lv[slot9] then
			slot0.desc_item_Lv[slot9]:setVisible(false)
		end
	end

	slot0.checkMoreCount = tableLen(slot5.award)

	slot0.probablity:setContentSize(cc.size(slot0.probablity:getContentSize().width, 45 * math.floor(slot0.checkMoreCount / 2)))

	slot7 = slot0.probablity:getContentSize().height - 35

	doStopAllActions(slot0.probablity)

	for slot11 = 1, slot0.checkMoreCount do
		delayRun(slot0.probablity, slot11 * 2 / 60, function ()
			if uv0 <= uv1 then
				slot0 = Config.ItemData.data_get_data(uv2.award[uv0][1])

				if not uv3.desc_item_name[uv0] then
					uv3.desc_item_name[uv0] = createLabel(26, cc.c4b(76, 216, 73, 255), nil, 0, 0, "", uv3.probablity, nil, cc.p(0, 0.5))
				end

				if uv3.desc_item_name[uv0] then
					uv3.desc_item_name[uv0]:setVisible(true)
					uv3.desc_item_name[uv0]:setContentSize(cc.size(150, 30))
					uv3.desc_item_name[uv0]:setString(TI18N(slot0.name))
					uv3.desc_item_name[uv0]:setPosition(40, uv4 - 36 * (uv0 - 1))
				end

				if not uv3.desc_item_Lv[uv0] then
					uv3.desc_item_Lv[uv0] = createLabel(26, cc.c4b(255, 167, 42, 255), nil, 0, 0, "", uv3.probablity, nil, cc.p(0, 0.5))
				end

				if uv3.desc_item_Lv[uv0] then
					uv3.desc_item_Lv[uv0]:setVisible(true)
					uv3.desc_item_Lv[uv0]:setString(uv2.award[uv0][2] .. "%")
					uv3.desc_item_Lv[uv0]:setPosition(265, uv4 - 36 * (uv0 - 1))
				end
			else
				slot0 = Config.ItemData.data_get_data(uv2.award[uv0][1])

				if not uv3.desc_item_name[uv0] then
					uv3.desc_item_name[uv0] = createLabel(26, cc.c4b(76, 216, 73, 255), nil, 0, 0, "", uv3.probablity, nil, cc.p(0, 0.5))
				end

				if uv3.desc_item_name[uv0] then
					uv3.desc_item_name[uv0]:setVisible(true)
					uv3.desc_item_name[uv0]:setContentSize(cc.size(150, 30))
					uv3.desc_item_name[uv0]:setString(TI18N(slot0.name))
					uv3.desc_item_name[uv0]:setPosition(350, uv4 - 36 * (uv0 - (uv1 + 1)))
				end

				if not uv3.desc_item_Lv[uv0] then
					uv3.desc_item_Lv[uv0] = createLabel(26, cc.c4b(255, 167, 42, 255), nil, 0, 0, "", uv3.probablity, nil, cc.p(0, 0.5))
				end

				if uv3.desc_item_Lv[uv0] then
					uv3.desc_item_Lv[uv0]:setVisible(true)
					uv3.desc_item_Lv[uv0]:setString(uv2.award[uv0][2] .. "%")
					uv3.desc_item_Lv[uv0]:setPosition(575, uv4 - 36 * (uv0 - (uv1 + 1)))
				end
			end
		end)
	end
end

function ActionTreasureWindow.itemRewardPos(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	for slot5 = 1, #slot1 do
		delayRun(slot0.item_panel, slot5 * 2 / 60, function ()
			if not uv0.item_list[uv1] then
				slot0 = BackPackItem.new(true, true, false, 0.8)

				slot0:setAnchorPoint(0.5, 0.5)
				uv0.item_panel:addChild(slot0)

				uv0.item_list[uv1] = slot0
			end

			if uv0.item_list[uv1] then
				uv0.item_list[uv1]:setPosition(uv2[uv1][1], uv2[uv1][2])
				uv0.item_list[uv1]:setBaseData(uv3[uv4[uv1].id][1].item_id, uv3[uv4[uv1].id][1].item_num)
				uv0.item_list[uv1]:setDefaultTip()

				if uv4[uv1] then
					if uv4[uv1].status == 1 then
						setChildUnEnabled(true, uv0.item_list[uv1])
					elseif uv4[uv1].status == 0 then
						setChildUnEnabled(false, uv0.item_list[uv1])
					end
				end

				uv0.item_list[uv1]:runAction(cc.FadeIn:create(0.01))
			end
		end)
	end

	slot0:runLightUniformSpeed()
end

function ActionTreasureWindow.changeTabLocalData(slot0, slot1)
	if slot0.cur_index == slot1 then
		return
	end

	slot1 = slot1 or 1

	if not slot0.round_certer_load[slot1] then
		slot0.round_certer_load[slot1] = loadSpriteTextureFromCDN(slot0.round_certer, PathTool.getPlistImgForDownLoad("bigbg/action", "action_treasure_round_" .. slot1), ResourcesType.single, slot0.round_certer_load[slot1])
	end

	if slot0.round_certer_load[slot1] then
		loadSpriteTexture(slot0.round_certer, slot2, LOADTEXT_TYPE)
	end

	slot11 = uv1("<img src='%s' scale=0.5 />  %d", PathTool.getItemRes(Config.ItemData.data_get_data(uv0:getBuyRewardData(slot1)[1].expend_item[1][1]).icon), slot0.hasTreasure_num[slot1])

	slot0.treasure_total:setString(slot11)

	for slot11 = 1, 3 do
		if slot11 == 3 then
			slot0.btnTreasure[slot11].price:setString(uv1(TI18N("<div outline=2,#020019>免费刷新</div>")))
			slot0.btnTreasure[slot11].price:setPosition(43, 41)
		else
			slot0.btnTreasure[slot11].price:setString(uv1(TI18N("<div outline=2,#020019>探宝%d次\n    </div><img src=%s visible=true scale=0.30 /><div fontColor=#fffb94 fontsize=20 outline=2,#020019> %d</div>"), uv2.treasure_num.val[slot1][slot11], slot6, slot3[slot11].expend_item[1][2]))
		end
	end

	slot9 = uv0:getLucklyRewardData(slot1)

	for slot14 = 1, 5 do
		if not slot0.luckly_item[slot14] then
			slot0.luckly_item[slot14] = RoundItem.new(true, 0.55, 0.7)

			slot0.luckyBar:addChild(slot0.luckly_item[slot14])
			slot0.luckly_item[slot14]:setPosition(cc.p(slot0.main_container:getChildByName("Image_2_0"):getContentSize().width / 5 * slot14, 12))
		end

		if not slot0.arriveLuckly_label[slot14] and slot0.luckly_item[slot14] then
			slot0.arriveLuckly_label[slot14] = createLabel(28, Config.ColorData.data_color4[1], nil, 65, -7, "", slot0.luckly_item[slot14], nil, cc.p(0.5, 0.5))
		end

		if slot0.arriveLuckly_label[slot14] then
			slot0.arriveLuckly_label[slot14]:setString(slot9[slot14].lucky_val)
		end

		if slot0.luckly_item[slot14] then
			slot0.luckly_item[slot14]:setBaseData(slot9[slot14].award[1][1], slot9[slot14].award[1][2])
			slot0.luckly_item[slot14]:setVisibleRedPoint(false)
			slot0.luckly_item[slot14]:setVisibleRoundBG(false)
			slot0.luckly_item[slot14]:addCallBack(function ()
				uv0:send16640(uv1, uv2[uv3].id)
			end)
		end
	end
end

function ActionTreasureWindow.sectionCalculation(slot0, slot1, slot2)
	slot1 = slot1 or 10
	slot3 = 20
	slot4 = 1

	if slot2[1] and slot2[2] and slot2[3] and slot2[4] and slot2[5] then
		if slot1 <= slot2[1].lucky_val then
			return slot1 / slot2[1].lucky_val * slot3
		elseif slot2[1].lucky_val < slot1 and slot1 <= slot2[2].lucky_val then
			slot4 = 2
		elseif slot2[2].lucky_val < slot1 and slot1 <= slot2[3].lucky_val then
			slot4 = 3
		elseif slot2[3].lucky_val < slot1 and slot1 <= slot2[4].lucky_val then
			slot4 = 4
		elseif slot2[4].lucky_val < slot1 and slot1 <= slot2[5].lucky_val then
			slot4 = 5
		else
			return 100
		end

		return slot3 * (slot4 - 1) + (slot1 - slot2[slot4 - 1].lucky_val) / (slot2[slot4].lucky_val - slot2[slot4 - 1].lucky_val) * slot3
	else
		return 0
	end
end

function ActionTreasureWindow.commonShowData(slot0, slot1, slot2)
	if not next(slot1) or not next(slot2) then
		return
	end

	slot3 = 0

	if slot2[5] then
		slot3 = slot2[5].lucky_val
	end

	slot0.text_lucky_num:setString(slot1.lucky .. "/" .. slot3)
	slot0.luckyBar:setPercent(slot0:sectionCalculation(slot1.lucky, slot2))

	if slot1.end_time - GameNet:getInstance():getTime() > 0 then
		uv0:setCountDownTime(slot0.refresh_time, slot5)
		slot0.btnTreasure[3].price:setPositionX(32)
		slot0.btnTreasure[3].price:setString(uv2(TI18N("<img src=%s visible=true scale=0.30 /><div outline=2,#020019> %d刷新</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(uv1.refreash.val[1][1]).icon), uv1.refreash.val[1][2]))

		slot0.touchEffect[slot1.type] = false
	else
		slot0.btnTreasure[3].price:setPositionX(45)
		slot0.btnTreasure[3].price:setString(uv2(TI18N("<div outline=2,#020019>免费刷新</div>")))
		doStopAllActions(slot0.refresh_time)
		slot0.refresh_time:setString("00:00:00")

		slot0.touchEffect[slot1.type] = true
	end

	slot6 = false

	for slot10, slot11 in pairs(slot2) do
		slot12 = true

		for slot16, slot17 in pairs(slot1.lucky_award) do
			if slot11.id == slot17.lucky then
				slot12 = false

				break
			end
		end

		if slot1.lucky < slot11.lucky_val then
			slot12 = false
		end

		setChildUnEnabled(false, slot0.luckly_item[slot10])

		if slot0.luckly_item[slot10] then
			slot0.luckly_item[slot10]:setDefaultTip(not slot12)

			slot6 = slot6 or slot12

			slot0.luckly_item[slot10]:setVisibleRedPoint(slot12)

			if slot12 == false and slot11.lucky_val <= slot1.lucky then
				setChildUnEnabled(true, slot0.luckly_item[slot10])
			end
		end
	end

	uv0:setLucklyTabRedPoint(slot1.type, slot6)
	slot0:showRedpoint()
end

function ActionTreasureWindow.showRedpoint(slot0)
	for slot5 = 1, 2 do
		slot0.tab_list[slot5].redpoint:setVisible(uv0:getLucklyTabRedPoint(slot5))

		slot1 = false or slot6
	end

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.lucky_treasure, slot1)
end

function ActionTreasureWindow.showTreasureLog(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot2 = ""

	if tableLen(slot1.log_list) >= 10 then
		slot3 = 10
	end

	for slot7, slot8 in pairs(slot0.getRewardList) do
		if slot8 then
			slot8:setVisible(false)
		end
	end

	slot7 = cc.size

	slot0.text_scroll:setInnerContainerSize(slot7(slot0.text_scroll:getContentSize().width, 26 * slot3))

	for slot7 = 1, slot3 do
		if slot1.log_list[slot7] then
			if not slot0.getRewardList[slot7] then
				slot0.getRewardList[slot7] = createRichLabel(22, cc.c4b(255, 255, 248, 255), cc.p(0.5, 1), cc.p(slot0.text_scroll:getContentSize().width * 0.5, 0), nil, , 600)

				slot0.text_scroll:addChild(slot0.getRewardList[slot7])
			end

			if slot0.getRewardList[slot7] then
				slot0.getRewardList[slot7]:setVisible(true)
				slot0.getRewardList[slot7]:setPositionY(slot0.text_scroll:getInnerContainerSize().height + 47 - 26 * (slot7 + 1))
				slot0.getRewardList[slot7]:setString(uv0(TI18N(" <div fontcolor=#4cd849>%s</div> 获得 <div fontcolor=#ffa72a>%s</div>"), slot1.log_list[slot7].role_name, Config.ItemData.data_get_data(slot1.log_list[slot7].bid).name))
			end
		end
	end
end

function ActionTreasureWindow.changeTabView(slot0, slot1)
	if slot0.cur_index == (slot1 or 1) then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.label:setTextColor(cc.c4b(90, 58, 38, 255))
		slot0.cur_tab.normal:setVisible(true)
		slot0.cur_tab.select:setVisible(false)
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_list[slot0.cur_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.label:setTextColor(cc.c4b(255, 255, 255, 255))
		slot0.cur_tab.normal:setVisible(false)
		slot0.cur_tab.select:setVisible(true)
	end

	slot0.touchEnable = false
	slot3 = uv0:getTreasureInitData(slot1)

	slot0:commonShowData(slot3, uv0:getLucklyRewardData(slot1))
	slot0:itemRewardPos(slot3.rand_lists)
	slot0:showTreasureLog(slot3)
end

function ActionTreasureWindow.register_event(slot0)
	slot0:addGlobalEvent(ActionEvent.UPDATE_LUCKYROUND_GET, function (slot0)
		if not slot0 then
			uv0:openLuckyTreasureWin(false)

			return
		end

		uv1:changeTabView(uv1.cur_index or uv1.jump_index)
	end)
	slot0:addGlobalEvent(ActionEvent.TREASURE_SUCCESS_DATA, function (slot0)
		if not slot0 then
			return
		end

		if slot0.code == 0 then
			uv0.touchEnable = false

			message(slot0.msg)

			return
		end

		uv0:showLotteryAudioEffect(true)

		uv0.showRewardList = slot0
		uv0.pos = 0
		uv0.runProcess = 0
		uv0.process = uv0.status_count
		uv0.speed = 1
		uv0.addSpeed = 0
		uv0.targetPos = slot0.awards3[1].pos - 1
		uv0.step = 0
		uv0.round = 5

		if uv0.targetPos <= 3 then
			uv0.round = 4
		end

		uv0:runLightUniformSpeedHide()

		if uv0.lottery_ticket == nil then
			uv0.lottery_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0:runHandler()
			end, 0.01)
		end
	end)
	slot0:addGlobalEvent(ActionEvent.UPDATA_TREASURE_LOG_DATA, function (slot0)
		if not slot0 then
			return
		end

		uv0:updataTreasureLogData(slot0.type, slot0.log_list)
		uv1:showTreasureLog(uv0:getTreasureInitData(slot0.type))
	end)
	slot0:addGlobalEvent(ActionEvent.UPDATA_TREASURE_POPUPS_SEND, function (slot0)
		uv0.showRewardList = slot0

		uv0:runLightReward()
	end)
	slot0:addGlobalEvent(ActionEvent.UPDATE_LUCKLY_DATA, function (slot0)
		if not slot0 then
			return
		end

		uv1.hasTreasure_num[slot0.type] = BackpackController:getInstance():getModel():getBackPackItemNumByBid(uv0:getBuyRewardData(slot0.type)[1].expend_item[1][1])

		if uv1.hasTreasure_num[slot0.type] <= 0 then
			uv1.hasTreasure_num[slot0.type] = 0
		end

		if Config.ItemData.data_get_data(slot2) then
			uv1.treasure_total:setString(uv2("<img src='%s' scale=0.5 />  %d", PathTool.getItemRes(slot3.icon), uv1.hasTreasure_num[slot0.type]))
		end

		uv0:updataTreasureInitData(slot0.type, slot0)
		uv1:commonShowData(uv0:getTreasureInitData(slot0.type), uv0:getLucklyRewardData(slot0.type))
	end)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		uv0:changeTreasureNumber(slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		uv0:changeTreasureNumber(slot1)
	end)

	slot4 = BackpackEvent.MODIFY_GOODS_NUM

	function slot5(slot0, slot1)
		uv0:changeTreasureNumber(slot1)
	end

	slot0:addGlobalEvent(slot4, slot5)

	for slot4, slot5 in pairs(slot0.tab_list) do
		registerButtonEventListener(slot5, function ()
			if uv0.touchEnable == true then
				return
			end

			uv0.probablity:setVisible(false)

			if uv1:getBuyRewardData(uv2.index) and slot1[1].limit_open then
				if slot1[1].limit_open[1][2] <= RoleController:getInstance():getRoleVo().lev then
					uv0:changeTabLocalData(uv2.index)
					uv0:changeTabView(uv2.index)
				else
					message(uv3(TI18N("人物等级%d级开启"), slot1[1].limit_open[1][2]))
				end
			end
		end, false, 1)
	end

	registerButtonEventListener(slot0.btn_return, function ()
		uv0:openLuckyTreasureWin(false)
	end, true, 2)
	registerButtonEventListener(slot0.btnRule, function (slot0, slot1, slot2)
		slot3 = Config.DialData.data_const.game_rule1

		if uv0.cur_index == 2 then
			slot3 = Config.DialData.data_const.game_rule2
		end

		TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, , 500)
	end, false, 1)
	registerButtonEventListener(slot0.btnLockOther, function ()
		uv0.probablity:setVisible(true)
		uv0:rewardProbility(uv0.cur_index)
	end, false, 1)
	registerButtonEventListener(slot0.probablity, function ()
		uv0.probablity:setVisible(false)
	end, false, 1)
	registerButtonEventListener(slot0.background, function ()
		uv0.probablity:setVisible(false)
	end, false, 1)

	function slot4()
		StrongerController:getInstance():clickCallBack(406)
	end

	slot5 = false

	registerButtonEventListener(slot0.btn_shop, slot4, slot5, 1)

	for slot4, slot5 in ipairs(slot0.btnTreasure) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:sendTreasureLottery(uv1)
		end, true, 1)
	end
end

function ActionTreasureWindow.showLotteryAudioEffect(slot0, slot1)
	if slot0.lottery_audio_effect then
		AudioManager:getInstance():removeEffectBySoundId(slot0.lottery_audio_effect)

		slot0.lottery_audio_effect = nil
	end

	if slot1 then
		slot0.lottery_audio_effect = AudioManager:getInstance():playEffectForHandAudoRemove(AudioManager.AUDIO_TYPE.COMMON, "c_turntable_game", false)
	end
end

function ActionTreasureWindow.sendTreasureLottery(slot0, slot1)
	if not slot0.cur_index then
		return
	end

	if slot0.touchEnable == true then
		message(TI18N("探宝进行中"))

		return
	end

	slot0.cur_index = slot0.cur_index or 1

	if slot1 == 3 then
		if RoleController:getInstance():getRoleVo().gold < uv0.refreash.val[1][2] and slot0.touchEffect[slot0.cur_index] == false then
			message(TI18N("钻石不足"))

			return
		end

		if slot0.touchRefresh == true then
			message(TI18N("刷新中..."))

			return
		end

		slot0.touchRefresh = true

		slot0:runLightUniformSpeedHide()
		slot0:startRefreshAction()
	else
		slot0.touchEnable = true

		if MainuiController:getInstance():checkIsOpenByActivate(uv1:getBuyRewardData(slot0.cur_index)[slot1].limit_open) == true then
			slot0.touchTreasure_type = slot1
		else
			slot0.touchEnable = false
		end

		uv2:send16638(slot0.cur_index, slot1)
	end
end

function ActionTreasureWindow.changeTreasureNumber(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot6.base_id == 37001 then
			slot0.hasTreasure_num[1] = BackpackController:getInstance():getModel():getBackPackItemNumByBid(37001)

			if slot0.cur_index == 1 then
				slot0.treasure_total:setString(uv0("<img src='%s' scale=0.5 />  %d", PathTool.getItemRes(Config.ItemData.data_get_data(37001).icon), slot0.hasTreasure_num[1]))
			end
		elseif slot6.base_id == 37002 then
			slot0.hasTreasure_num[2] = BackpackController:getInstance():getModel():getBackPackItemNumByBid(37002)

			if slot0.cur_index == 2 then
				slot0.treasure_total:setString(uv0("<img src='%s' scale=0.5 />  %d", PathTool.getItemRes(Config.ItemData.data_get_data(37002).icon), slot0.hasTreasure_num[2]))
			end
		end
	end
end

slot8 = 3

function ActionTreasureWindow.runHandler(slot0)
	if slot0.step == 0 then
		slot0.process = slot0.process + 0.33

		if slot0.process >= 3 then
			slot0.step = 1
			slot0.speed = 0.9
		end
	elseif slot0.step == 1 then
		slot0.process = slot0.process + slot0.speed

		if slot0.process > uv0 * slot0.round and slot0.targetPos > -1 then
			if slot0.targetPos > 3 then
				if uv1 < slot0.process % uv0 then
					slot0.speed = 0.04
					slot0.step = 2
				end
			elseif slot0.targetPos <= uv1 and slot0.process % (uv0 * slot0.round) >= slot0.targetPos - uv1 + uv0 then
				slot0.speed = 0.04
				slot0.step = 2
			end
		end
	elseif slot0.step == 2 then
		slot0.process = slot0.process + slot0.speed

		if slot0.cur_effect_index ~= math.floor(slot0.process) then
			slot0.cur_effect_index = slot1

			if slot0.stop_audio_effect then
				AudioManager:getInstance():removeEffectBySoundId(slot0.stop_audio_effect)
			end

			slot0.stop_audio_effect = AudioManager:getInstance():playEffectForHandAudoRemove(AudioManager.AUDIO_TYPE.COMMON, "c_turntable_game_1", false)
		end

		if slot0.targetPos <= slot0.process % uv0 and math.floor(slot0.process / uv0) >= 5 and slot0.lottery_ticket ~= nil then
			GlobalTimeTicket:getInstance():remove(slot0.lottery_ticket)

			slot0.lottery_ticket = nil
			slot0.cur_effect_index = nil

			slot0:showLotteryAudioEffect(false)
			AudioManager:getInstance():removeEffectBySoundId(slot0.stop_audio_effect)
			slot0:stopRunHandler()
		end
	end

	slot1, slot2 = math.modf(slot0.process)

	slot0:setPos(slot1)
end

function ActionTreasureWindow.setPos(slot0, slot1)
	if slot1 <= 0 then
		slot1 = slot1 + uv0
	elseif uv0 <= slot1 then
		slot1 = slot1 % uv0
	end

	slot0.run_light:setVisible(true)
	slot0.run_light:setPosition(uv1[uv2[slot1]][1], uv1[uv2[slot1]][2])
end

function ActionTreasureWindow.stopRunHandler(slot0)
	slot0.touchEnable = false

	if slot0.run_light_show_reward == nil then
		slot0.run_light_show_reward = GlobalTimeTicket:getInstance():add(function ()
			if not tolua.isnull(uv0.run_light) then
				uv0:runLightReward()

				uv0.showRewardList = nil

				uv0:runLightUniformSpeed()
			end
		end, 1, 1)
	end
end

function ActionTreasureWindow.runLightReward(slot0)
	if slot0.showRewardList then
		for slot5, slot6 in ipairs(slot0.showRewardList.awards1) do
			if slot6 then
				table.insert({}, slot6)
			end
		end

		for slot5, slot6 in ipairs(slot0.showRewardList.awards2) do
			if slot6 then
				table.insert(slot1, slot6)
			end
		end

		uv0:openTreasureGetItemWindow(true, slot1, slot0.cur_index, slot0.touchTreasure_type)
	end

	if uv1:getTreasureInitData(slot0.cur_index) then
		slot0:itemRewardPos(slot1.rand_lists)
	end

	slot0.showRewardList = nil
end

function ActionTreasureWindow.runLightUniformSpeedHide(slot0)
	slot0.run_light:setVisible(false)

	if slot0.open_view_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.open_view_ticket)

		slot0.open_view_ticket = nil
	end

	if slot0.run_light_show_reward ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.run_light_show_reward)

		slot0.run_light_show_reward = nil
	end
end

function ActionTreasureWindow.runLightUniformSpeed(slot0)
	if slot0.open_view_ticket == nil then
		slot0.open_view_ticket = GlobalTimeTicket:getInstance():add(function ()
			if not tolua.isnull(uv0.run_light) then
				uv0.run_light:setVisible(true)

				uv0.status_count = uv0.status_count % uv1

				uv0.run_light:setPosition(uv2[uv3[uv0.status_count]][1], uv2[uv3[uv0.status_count]][2])

				uv0.status_count = uv0.status_count + 1
			end
		end, 0.5)
	end
end

function ActionTreasureWindow.getActionFunc(slot0, slot1)
	if not slot1 then
		return
	end

	slot1:runAction(cc.FadeOut:create(0.07))
end

function ActionTreasureWindow.startRefreshAction(slot0)
	slot1 = {
		[slot5] = cc.CallFunc:create(function ()
			if uv0.item_list[uv1] then
				uv0:getActionFunc(uv0.item_list[uv1])
			end
		end)
	}

	for slot5 = 1, 8 do
	end

	slot2 = cc.Node:create()

	slot0.item_panel:addChild(slot2)
	slot2:runAction(cc.Sequence:create(slot1[1], slot1[2], slot1[3], slot1[4], slot1[5], slot1[6], slot1[7], slot1[8], slot1[9], slot1[10], slot1[11], slot1[12], cc.CallFunc:create(function ()
		uv0:send16642(uv1.cur_index)
		uv1:handleEffect()
	end), cc.RemoveSelf:create(true)))
end

function ActionTreasureWindow.handleEffect(slot0)
	playEffectOnce(PathTool.getEffectRes(614), slot0.item_panel:getContentSize().width * 0.5, slot0.item_panel:getContentSize().height * 0.5, slot0.item_panel, function ()
		uv0.touchRefresh = false

		uv0:itemRewardPos(uv1:getTreasureInitData(uv0.cur_index).rand_lists)
	end, nil, , , PlayerAction.action_1, 1)
end

function ActionTreasureWindow.close_callback(slot0)
	doStopAllActions(slot0.refresh_time)

	if slot0.lottery_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.lottery_ticket)

		slot0.lottery_ticket = nil
	end

	slot0:showLotteryAudioEffect(false)
	AudioManager:getInstance():removeEffectBySoundId(slot0.stop_audio_effect)

	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.luckly_item and next(slot0.luckly_item or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.luckly_item) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	for slot4, slot5 in pairs(slot0.round_certer_load) do
		if slot5 and slot5.DeleteMe then
			slot5:DeleteMe()
		end

		slot5 = nil
	end

	slot0:runLightReward()
	doStopAllActions(slot0.probablity)
	slot0:runLightUniformSpeedHide()
	uv0:openLuckyTreasureWin(false)
end
