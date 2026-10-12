RecruitHeroWindow = RecruitHeroWindow or BaseClass(BaseView)
slot0 = RecruitHeroController:getInstance()

function RecruitHeroWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "recruithero/recruit_hero_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "action_bigbg_3"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("recruithero", "recruithero"),
			type = ResourcesType.plist
		}
	}
	slot0.player_item = {}
end

function RecruitHeroWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot1 = slot0.main_container:getChildByName("load_bg")

	if not slot0.bg_load then
		slot0.bg_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/action", "action_bigbg_3"), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.bg_load)
	end

	slot0.battle_preview_btn = slot0.main_container:getChildByName("battle_preview_btn")
	slot0.preview_btn_label = slot0.battle_preview_btn:getChildByName("preview_btn_label")

	slot0.preview_btn_label:setString(TI18N("战斗预览"))
	slot0.main_container:getChildByName("Text_1"):setString(TI18N("活动时间："))
	slot0.main_container:getChildByName("Text_3"):setString(TI18N("完成上方任务即可免费领取5星英雄龙马"))

	slot0.remain_time = slot0.main_container:getChildByName("remain_time")

	slot0.remain_time:setString("")

	slot0.all_get = slot0.main_container:getChildByName("all_get")

	slot0.all_get:setVisible(false)
	slot0.all_get:getChildByName("label"):setString(TI18N("领取"))

	slot0.all_goto = slot0.main_container:getChildByName("all_goto")

	slot0.all_goto:setVisible(false)
	slot0.all_goto:getChildByName("label"):setString(TI18N("未完成"))

	slot0.btn_paint = slot0.main_container:getChildByName("btn_paint")

	slot0.btn_paint:getChildByName("Text_2"):setString(TI18N("查看英雄"))

	slot0.finish_text = slot0.main_container:getChildByName("finish_text")

	slot0.finish_text:setString("")
	slot0:setPlayerItem()

	slot0.btn_close = slot0.main_container:getChildByName("btn_close")
end

function RecruitHeroWindow.setPlayerItem(slot0)
	slot1 = 100
	slot2 = 114
	slot4 = 26900

	if ActionController:getInstance():getModel():getSevenLoginData().type == 1 and Config.LoginDaysNewData and slot5.data_day and slot5.data_day[2] then
		slot4 = slot5.data_day[2].rewards[1][1]
	end

	for slot9 = 1, 3 do
		slot10 = {
			btn_goto = slot11:getChildByName("btn_goto")
		}
		slot11 = slot0.main_container:getChildByName("item_" .. slot9)

		slot10.btn_goto:setVisible(false)
		slot10.btn_goto:getChildByName("label"):setString(TI18N("前往完成"))

		slot10.btn_get = slot11:getChildByName("btn_get")

		slot10.btn_get:setVisible(false)

		slot10.btn_get_label = slot10.btn_get:getChildByName("label")

		slot10.btn_get_label:setString(TI18N("前往领取"))

		slot10.has = slot11:getChildByName("has")

		slot10.has:setVisible(false)

		slot10.title_label = slot11:getChildByName("title")
		slot0.player_item[slot9] = BackPackItem.new(false, true, false, 0.8, false)

		slot0.player_item[slot9]:setPosition(slot1, slot2)
		slot11:addChild(slot0.player_item[slot9])
		slot0.player_item[slot9]:setBaseData(({
			29905,
			slot4,
			26903
		})[slot9], 50)
		slot0.player_item[slot9]:setDefaultTip()

		slot0.player_item[slot9] = slot10
	end
end

function RecruitHeroWindow.openRootWnd(slot0)
	uv0:sender25100()
	uv0:getModel():setDayFirstLogin(false)
end

function RecruitHeroWindow.register_event(slot0)
	slot0:addGlobalEvent(RecruitHeroEvent.RecruitHeroBaseInfo, function (slot0)
		ActionController:getInstance():getModel():setCountDownTime(uv0.remain_time, slot0.end_time - GameNet:getInstance():getTime())
		uv0:showBtnStatus(slot0)
	end)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openRecruitHeroWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.battle_preview_btn, function ()
		TimesummonController:getInstance():send23219(BattlePreviewParm.RecruitHero)
	end, true)

	function slot4()
		uv0:openRecruitHeroWindow(false)
	end

	slot5 = false

	registerButtonEventListener(slot0.background, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.player_item) do
		registerButtonEventListener(slot5.btn_goto, function ()
			if uv0:getModel():getRecruitEndTime() then
				uv1:jumpGotoTeskView(uv2)
			else
				message(TI18N("活动已结束"))
			end
		end, true, 1)
		registerButtonEventListener(slot5.btn_get, function ()
			uv0:jumpGetTeskView(uv1)
		end, true, 1)
	end

	registerButtonEventListener(slot0.all_get, function ()
		uv0:sender25101(0)
	end, true, 2)
	registerButtonEventListener(slot0.btn_paint, function ()
		HeroController:getInstance():openHeroInfoWindowByBidStar(30508, 10)
	end, true, 1)
end

function RecruitHeroWindow.showBtnStatus(slot0, slot1)
	if not slot1 then
		return
	end

	slot4 = 0

	for slot9 = 1, 3 do
		if uv0:getModel():getRecruitBaseData(({
			2,
			1,
			3
		})[slot9]) then
			if slot9 == 1 then
				slot0.player_item[slot9].title_label:setString(string.format(({
					TI18N("通关%d/%d关"),
					TI18N("次日登录"),
					TI18N("激活至尊月卡")
				})[slot9], slot10.val, Config.WelfareData.data_welfare_const.dun_max_id.val))
			else
				slot0.player_item[slot9].title_label:setString(slot2[slot9])
			end

			if slot9 == 3 and slot10.status == 1 then
				slot0.player_item[slot9].btn_get_label:setString(TI18N("领取"))
			end

			slot0.player_item[slot9].btn_goto:setVisible(slot10.status == 0)
			slot0.player_item[slot9].btn_get:setVisible(slot10.status == 1)
			slot0.player_item[slot9].has:setVisible(slot10.status == 2)

			if slot10.status == 1 or slot10.status == 2 then
				slot4 = slot4 + 1
			end
		end
	end

	slot0.finish_text:setString(string.format(TI18N("完成进度: %d/3"), slot4))

	if slot1.state then
		slot0.all_goto:setVisible(slot1.state == 0)
		slot0.all_get:setVisible(slot1.state == 1 or slot1.state == 1)
	end
end

function RecruitHeroWindow.jumpGotoTeskView(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 == 1 then
		JumpController:getInstance():jumpViewByEvtData({
			5
		})
	elseif slot1 == 2 then
		if ActionController:getInstance():getModel():getSevenLoginData().type == 1 then
			ActionController:getInstance():openEightLoginWin(true)
		else
			ActionController:getInstance():openSevenLoginWin(true)
		end
	elseif slot1 == 3 then
		JumpController:getInstance():jumpViewByEvtData({
			44
		})
	end
end

function RecruitHeroWindow.jumpGetTeskView(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 == 1 then
		JumpController:getInstance():jumpViewByEvtData({
			46
		})
	elseif slot1 == 2 then
		if ActionController:getInstance():getModel():getSevenLoginData().type == 1 then
			ActionController:getInstance():openEightLoginWin(true)
		else
			ActionController:getInstance():openSevenLoginWin(true)
		end
	elseif slot1 == 3 then
		uv0:sender25101(slot1)
	end
end

function RecruitHeroWindow.close_callback(slot0)
	if slot0.player_item and next(slot0.player_item or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.player_item) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()
	end

	slot0.bg_load = nil

	doStopAllActions(slot0.remain_time)
	uv0:openRecruitHeroWindow(false)
end
