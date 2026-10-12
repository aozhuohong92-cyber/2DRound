PartnerSummonWindow = PartnerSummonWindow or BaseClass(BaseView)
slot0 = table.insert

function PartnerSummonWindow.__init(slot0)
	slot0.ctrl = PartnersummonController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.win_type = WinType.Full
	slot0.layout_name = "partnersummon/partnersummon_window"
	slot0.item_list = {}
	slot0.goods_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("partnersummon", "partnersummon"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_11", true),
			type = ResourcesType.single
		}
	}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function PartnerSummonWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_11", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.main_container = slot0.container:getChildByName("main_container")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.tips_btn = slot0.main_container:getChildByName("tips_btn")
	slot0.partner_book_btn = slot0.main_container:getChildByName("partner_book_btn")
	slot0.book_btn_label = slot0.partner_book_btn:getChildByName("book_btn_label")

	slot0.book_btn_label:setString(TI18N("图书馆"))
	UITool.SetTitleColor(slot0.book_btn_label)
	slot0.partner_book_btn:setVisible(false)

	slot0.score_btn = slot0.main_container:getChildByName("score_btn")
	slot0.progress_bg = slot0.main_container:getChildByName("progress_bg_1")
	slot0.progress_label = slot0.progress_bg:getChildByName("progress_label")

	slot0.progress_label:setLocalZOrder(3)
	slot0.progress_bg:getChildByName("progress_bg_2"):setLocalZOrder(2)

	slot0.progress = ccui.LoadingBar:create()

	slot0.progress:setCascadeOpacityEnabled(true)
	slot0.progress:setScale9Enabled(true)
	slot0.progress:setContentSize(cc.size(282, 20))
	slot0.progress:setCapInsets(cc.rect(30, 10, 10, 1))
	slot0.progress:setAnchorPoint(cc.p(0, 0.5))
	slot0.progress:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_image_3"), LOADTEXT_TYPE_PLIST)
	slot0.progress:setPosition(cc.p(0, slot0.progress_bg:getContentSize().height / 2))
	slot0.progress:setPercent(0)
	slot0.progress_bg:addChild(slot0.progress)

	slot0.card_scrollview = slot0.main_container:getChildByName("card_scrollview")

	slot0.card_scrollview:setScrollBarEnabled(false)
	delayRun(slot0.root_wnd, 0.1, function ()
		uv0:createRole()
	end)
end

function PartnerSummonWindow.createRole(slot0)
	if not tolua.isnull(slot0.main_container) and slot0.role_effect == nil then
		slot0.role_effect = createEffectSpine(PathTool.getEffectRes(116), cc.p(320, 715), cc.p(0.5, 0.5), true, PlayerAction.special_action_0)

		slot0.main_container:addChild(slot0.role_effect, -1)
	end
end

function PartnerSummonWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0.ctrl:openPartnerSummonWindow(false)
			end
		end)
	end

	registerButtonEventListener(slot0.tips_btn, function (slot0, slot1, slot2)
		MainuiController:getInstance():openCommonExplainView(true, Config.RecruitData.data_explain, TI18N("规则说明"), true)
	end)

	if slot0.partner_book_btn then
		slot0.partner_book_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				PokedexController:getInstance():openPokedexWindow(true)
			end
		end)
	end

	registerButtonEventListener(slot0.score_btn, handler(slot0, slot0._onClickScoreBtn))

	if not slot0.update_summon_data_event then
		slot0.update_summon_data_event = GlobalEvent:getInstance():Bind(PartnersummonEvent.updateSummonDataEvent, function (slot0)
			uv0:updateData()
		end)
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "recruit_hero" then
				slot2 = slot1
				slot3 = uv0.model:getScoreSummonNeedCount()

				uv0.progress:setPercent(slot2 / slot3 * 100)
				uv0.progress_label:setString(string.format("%d/%d", slot2, slot3))
				uv0:showScoreFullAction(slot3 <= slot2)
			end
		end)
	end
end

function PartnerSummonWindow._onClickScoreBtn(slot0)
	if slot0.role_vo then
		if slot0.model:getScoreSummonNeedCount() <= slot0.role_vo.acc_recruit_hero then
			slot0.ctrl:openPartnerSummonScoreWindow(true)
		else
			message(string.format(TI18N("满%d积分开启积分召唤"), slot2))
		end
	end
end

function PartnerSummonWindow.showScoreFullAction(slot0, slot1)
	if slot1 == true then
		slot0.score_btn:setRotation(0)
		slot0.score_btn:stopAllActions()

		slot5 = cc.DelayTime:create(0.7)
		slot6 = {}

		for slot10 = 1, 5 do
			uv0(slot6, cc.RotateBy:create(0.05, -10))
			uv0(slot6, cc.RotateBy:create(0.1, 20))
			uv0(slot6, cc.RotateBy:create(0.05, -10))
		end

		uv0(slot6, slot5)
		slot0.score_btn:runAction(cc.RepeatForever:create(cc.Sequence:create(unpack(slot6))))
	else
		slot0.score_btn:setRotation(0)
		slot0.score_btn:stopAllActions()
	end
end

function PartnerSummonWindow.refreshProgressInfo(slot0)
	if slot0.role_vo then
		slot1 = slot0.role_vo.recruit_hero
		slot2 = slot0.model:getScoreSummonNeedCount()

		slot0.progress:setPercent(slot1 / slot2 * 100)
		slot0.progress_label:setString(string.format("%d/%d", slot1, slot2))
		slot0:showScoreFullAction(slot2 <= slot1)
	end
end

function PartnerSummonWindow.updateData(slot0)
	slot0.card_scrollview:setInnerContainerSize(cc.size(slot0.card_scrollview:getContentSize().width, math.max(slot0.card_scrollview:getContentSize().height, tableLen(slot0.model:getSummonGroupData() or {}) * PartnerSummonItem.HEIGHT)))

	slot4 = 7

	for slot8, slot9 in ipairs(slot1) do
		if not slot0.item_list[slot8] then
			delayRun(slot0.main_container, 4 * slot8 / display.DEFAULT_FPS, function ()
				uv0 = uv1.item_list[uv2]

				if not uv0 then
					uv0 = PartnerSummonItem.new(uv2)

					uv0:setData(uv2, uv3)
					uv0:setPosition(0, uv4 - (PartnerSummonItem.HEIGHT + uv5) * (uv2 - 1))
					uv1.card_scrollview:addChild(uv0)

					uv1.item_list[uv2] = uv0
				else
					uv0:setData(uv2, uv3)
					uv0:setPosition(0, uv4 - (PartnerSummonItem.HEIGHT + uv5) * (uv2 - 1))
				end
			end)
		else
			slot10:setData(slot8, slot9)
			slot10:setPosition(0, slot3 - (PartnerSummonItem.HEIGHT + slot4) * (slot8 - 1))
		end
	end
end

function PartnerSummonWindow.openRootWnd(slot0)
	slot0:updateData()
	slot0:refreshProgressInfo()
end

function PartnerSummonWindow.close_callback(slot0)
	slot0.main_container:stopAllActions()

	for slot4, slot5 in pairs(slot0.item_list) do
		if slot5 then
			slot5:DeleteMe()
		end
	end

	if slot0.role_effect then
		slot0.role_effect:clearTracks()
		slot0.role_effect:removeFromParent()

		slot0.role_effect = nil
	end

	if slot0.update_summon_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_summon_data_event)

		slot0.update_summon_data_event = nil
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	slot0:showScoreFullAction(false)
	slot0.ctrl:openPartnerSummonWindow(false)
end
