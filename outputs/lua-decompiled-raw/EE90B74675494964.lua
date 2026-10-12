ActionPractiseTowerPanel = class("ActionPractiseTowerPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ActionController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function ActionPractiseTowerPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:loadResources()

	slot0.top3_item_list = {}
end

function ActionPractiseTowerPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionpractisetower", "actionpractisetower"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.configUI then
			uv0:configUI()
		end

		if uv0.register_event then
			uv0:register_event()
		end
	end)
end

function ActionPractiseTowerPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_practise_tower_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setPosition(-40, -80)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.image_bg = slot0.main_container:getChildByName("image_bg")

	if not slot0.background_load then
		slot0.background_load = loadSpriteTextureFromCDN(slot0.image_bg, PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_pt"), ResourcesType.single, slot0.background_load)
	end

	slot0.title_lab = slot0.main_container:getChildByName("title_lab")

	slot0.title_lab:setString(TI18N("兔丼监狱"))
	slot0.title_lab:setTextColor(cc.c3b(255, 255, 255))
	slot0.title_lab:enableOutline(cc.c3b(0, 0, 0), 2)

	slot0.rank_lab = slot0.main_container:getChildByName("rank_lab")

	slot0.rank_lab:enableOutline(cc.c3b(0, 0, 0), 2)

	slot0.pass_num = slot0.main_container:getChildByName("pass_num")

	slot0.pass_num:enableOutline(cc.c3b(0, 0, 0), 2)

	slot0.btn_tips = slot0.main_container:getChildByName("btn_tips")
	slot0.fight_btn = slot0.main_container:getChildByName("fight_btn")
	slot0.btn_label = slot0.fight_btn:getChildByName("label")

	slot0.btn_label:setString(TI18N("前往挑战"))
	UITool.SetTitleColor(slot0.btn_label)

	slot0.rank_container = slot0.main_container:getChildByName("rank_container")

	slot0.rank_container:getChildByName("rank_desc_label"):setString(TI18N("排行前三"))

	slot0.rank_top3_btn = slot0.rank_container:getChildByName("rank_btn")
	slot0.item_container = slot0.main_container:getChildByName("item_container")

	slot0.item_container:setScrollBarEnabled(false)

	slot0.time_label = createRichLabel(20, cc.c4b(255, 252, 237, 255), cc.p(1, 0.5), cc.p(690, 45), nil, , 500)

	slot0.main_container:addChild(slot0.time_label)
	slot0.time_label:setString(TI18N("<div outline=2,#000000>活动已结束</div>"))
	uv0:cs16603(slot0.holiday_bid)
	PractisetowerController:getInstance():sender29100()
end

function ActionPractiseTowerPanel.register_event(slot0)
	if not slot0.Updata_Data_Event then
		slot0.Updata_Data_Event = GlobalEvent:getInstance():Bind(PractisetowerEvent.Update_All_Data, function (slot0)
			uv0.pt_data = PractisetowerController:getInstance():getModel():getPractiseTowerData()

			uv0:setInitData()
		end)
	end

	if slot0.btn_tips then
		slot0.btn_tips:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				TipsManager:getInstance():showCommonTips(Config.HolidayPractiseTowerData.data_const.rules.desc, slot0:getTouchBeganPosition())
			end
		end)
	end

	registerButtonEventListener(slot0.fight_btn, function ()
		uv0:clickFight()
	end, true, 1)
	registerButtonEventListener(slot0.rank_top3_btn, function ()
		PractisetowerController:getInstance():openRankWindow(true)
	end, true, 1)

	if not slot0.Updata_My_Rank_Event then
		slot0.Updata_My_Rank_Event = GlobalEvent:getInstance():Bind(PractisetowerEvent.Update_My_rank, function ()
			uv0.pt_data = PractisetowerController:getInstance():getModel():getPractiseTowerData()

			uv0:updateMyRank()
		end)
	end
end

function ActionPractiseTowerPanel.setVisibleStatus(slot0, slot1)
	if (slot1 or false) == true then
		PractisetowerController:getInstance():sender29107(1)
	end

	slot0:setVisible(slot1)
end

function ActionPractiseTowerPanel.setInitData(slot0)
	if not slot0.pt_data then
		return
	end

	slot0:updateBossInfoByBossID()

	if slot0.pt_data.last_unixtime - GameNet:getInstance():getTime() <= 0 then
		doStopAllActions(slot0.time_label)
		slot0.time_label:setString(TI18N("<div outline=2,#000000>活动已结束</div>"))
	else
		if slot0.pt_data.last_unixtime - GameNet:getInstance():getTime() < 0 then
			slot1 = 0
		end

		commonCountDownTime(slot0.time_label, slot1, {
			callback = function (slot0)
				uv0:setTimeValFormatString(slot0)
			end
		})
	end

	slot0:updateTop3Info(slot0.pt_data.practise_role_rank)

	if slot0.pt_data.time > 0 and slot0.pt_data.last_unixtime - GameNet:getInstance():getTime() > 0 then
		addRedPointToNodeByStatus(slot0.fight_btn, true, 5, 5, nil, 2)
	else
		addRedPointToNodeByStatus(slot0.fight_btn, false, 5, 5, nil, 2)
	end
end

function ActionPractiseTowerPanel.setTimeValFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_label:setString(uv0("<div outline=2,#000000>剩余时间：</div><div fontcolor=#76e464 outline=2,#000000> %s</div>", TimeTool.GetTimeFormatDayIIIIIIII(slot1)))
	else
		slot0.time_label:setString(TI18N("<div outline=2,#000000>活动已结束</div>"))
	end
end

function ActionPractiseTowerPanel.updateTop3Info(slot0, slot1)
	if slot1 == nil then
		return
	end

	for slot5 = 1, 3 do
		slot6 = nil

		if not slot0.top3_item_list[((not slot1[slot5] or slot1[slot5]) and {
			is_nil = true,
			rank = slot5
		}).rank] then
			slot7 = slot0:createSingleRankItem(slot6.rank)

			slot0.rank_container:addChild(slot7)

			slot0.top3_item_list[slot6.rank] = slot7
		end

		if slot0.top3_item_list[slot6.rank] then
			slot7:setPosition(25, 210 - (slot6.rank - 1) * slot7:getContentSize().height)

			if slot6.is_nil == true then
				slot7.label:setString(TI18N("暂无"))
			else
				slot7.label:setString(slot6.name)
				slot7.value:setString((slot6.val or 0) .. TI18N("层"))
			end
		end
	end
end

function ActionPractiseTowerPanel.createSingleRankItem(slot0, slot1)
	slot2 = ccui.Layout:create()

	slot2:setAnchorPoint(cc.p(0, 1))
	slot2:setContentSize(cc.size(180, 60))

	slot3 = createSprite(PathTool.getResFrame("common", "common_300" .. slot1), 30, 30, slot2)

	slot3:setScale(0.7)

	slot2.sp = slot3
	slot4 = createLabel(20, 1, nil, 70, 41, "", slot2)

	slot4:setAnchorPoint(cc.p(0, 0.5))
	slot4:setTextColor(cc.c4b(255, 255, 255, 255))

	slot5 = createLabel(20, 1, nil, 70, 17, "", slot2)

	slot5:setAnchorPoint(cc.p(0, 0.5))
	slot5:setTextColor(cc.c4b(255, 203, 137, 255))

	slot2.label = slot4
	slot2.value = slot5

	return slot2
end

function ActionPractiseTowerPanel.clickFight(slot0)
	MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.PractiseTower)
end

function ActionPractiseTowerPanel.updateMyRank(slot0)
	if not slot0.pt_data then
		return
	end

	if slot0.pt_data.role_rank == 0 then
		slot1 = TI18N("未上榜")
	end

	slot0.rank_lab:setString(uv0(TI18N("当前排名：%s"), slot1))
end

function ActionPractiseTowerPanel.updateBossInfoByBossID(slot0)
	if not slot0.pt_data then
		return
	end

	slot0:updateMyRank()
	slot0.pass_num:setString(uv0(TI18N("已通层数：%d层"), slot0.pt_data.id))

	if Config.HolidayPractiseTowerData.data_const.item_show then
		slot0.item_list = commonShowSingleRowItemList(slot0.item_container, slot0.item_list, slot1.val or {}, {
			scale = 0.9,
			max_count = 4,
			is_center = true,
			show_effect_id = 263
		})
	end
end

function ActionPractiseTowerPanel.DeleteMe(slot0)
	doStopAllActions(slot0.time_label)

	if slot0.background_load then
		slot0.background_load:DeleteMe()

		slot0.background_load = nil
	end

	if slot0.resources_load ~= nil then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.Updata_Data_Event then
		GlobalEvent:getInstance():UnBind(slot0.Updata_Data_Event)

		slot0.Updata_Data_Event = nil
	end

	if slot0.Updata_My_Rank_Event then
		GlobalEvent:getInstance():UnBind(slot0.Updata_My_Rank_Event)

		slot0.Updata_My_Rank_Event = nil
	end

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end
end
