BattleBuffTips = BattleBuffTips or BaseClass()

function BattleBuffTips.__init(slot0, slot1)
	slot0.delay = slot1 or 3
	slot0.WIDTH = 380
	slot0.HEIGHT = 250
	slot0.SPACE_H = 10
	slot0.title_space = 22
	slot0.space_x = 30

	slot0:createRootWnd()
end

function BattleBuffTips.createRootWnd(slot0)
	slot0:LoadLayoutFinish()
	slot0:registerCallBack()
end

function BattleBuffTips.LoadLayoutFinish(slot0)
	slot0.screen_bg = ccui.Layout:create()

	slot0.screen_bg:setAnchorPoint(cc.p(0, 0))
	slot0.screen_bg:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.screen_bg:setTouchEnabled(true)
	slot0.screen_bg:setSwallowTouches(false)

	slot0.root_wnd = ccui.Widget:create()

	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:setPosition(cc.p(0, 0))
	slot0.screen_bg:addChild(slot0.root_wnd)

	slot0.background = createScale9Sprite(PathTool.getResFrame("common", "common_90005"), 0, 0)

	slot0.background:setContentSize(slot0.WIDTH, 77)
	slot0.background:setPositionX(slot0.WIDTH / 2)
	slot0.background:setCapInsets(cc.rect(24, 29, 27, 18))
	slot0.root_wnd:addChild(slot0.background)
end

function BattleBuffTips.registerCallBack(slot0)
	slot0.screen_bg:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			TipsManager:getInstance():hideTips()
		end
	end)
end

function BattleBuffTips.setPosition(slot0, slot1, slot2)
	slot0.root_wnd:setAnchorPoint(cc.p(0, 1))
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function BattleBuffTips.setPos(slot0, slot1, slot2)
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function BattleBuffTips.getContentSize(slot0)
	return slot0.root_wnd:getContentSize()
end

function BattleBuffTips.getScreenBg(slot0)
	return slot0.screen_bg
end

function BattleBuffTips.showTipsByVo(slot0, slot1)
	slot2 = slot1.name
	slot3 = slot1.cur_round
	slot5 = slot1.buff_list

	for slot10, slot11 in pairs(slot1.buff_icon) do
		slot6 = 0 + 1
	end

	slot0.HEIGHT = 0
	slot0._height = 0
	slot7 = slot0.SPACE_H
	slot0.scroll_view = createScrollView(slot0.WIDTH - 30, slot0._height, 20, slot7 + 30, slot0.root_wnd)
	slot8 = 0
	slot9 = slot0:createSingleTips(key, v, slot5, slot3)
	slot0._height = slot0._height + slot9
	slot0.HEIGHT = slot0.HEIGHT + slot9
	slot7 = slot7 + 15 + slot0._height

	if slot0._height > 0 then
		slot10 = createScale9Sprite(PathTool.getResFrame("common", "common_1016"), slot0.WIDTH / 2, slot7 + 25)

		slot10:setContentSize(cc.size(slot0.WIDTH - 30, 1))
		slot10:setAnchorPoint(0.5, 1)
		slot0.root_wnd:addChild(slot10)

		slot7 = slot7 + 10
	end

	slot12 = createRichLabel(22, 10, cc.p(0.5, 0), cc.p(slot0.WIDTH / 2 - 15, slot7 + 25), nil, nil, slot0.WIDTH - 20)

	slot12:setString(StringFormat("<div fontcolor=#14b4f0>    {0}  </div>", slot2))
	slot0.root_wnd:addChild(slot12)

	slot7 = slot7 + slot12:getContentSize().height
	slot13 = nil

	if slot1.data_vo.object_type == 2 then
		slot13 = Config.PartnerData.data_partner_base[slot1.data_vo.object_bid]
	elseif slot1.data_vo.object_type == 3 then
		slot13 = Config.UnitData.data_unit(slot1.data_vo.object_bid)
	end

	if slot13 ~= nil then
		slot17 = createRichLabel(18, 39, cc.p(1, 0), cc.p(slot0.WIDTH - 20, 15), nil, nil, slot0.WIDTH - slot0.title_space)

		slot17:setString("Lv." .. slot1.lev .. ({
			["5"] = TI18N("物"),
			["4"] = TI18N("法"),
			["1"] = TI18N("辅"),
			["3"] = TI18N("体"),
			["2"] = TI18N("防")
		})[slot13.partial])
		slot0.root_wnd:addChild(slot17)

		slot7 = slot7 + slot17:getContentSize().height
	end

	slot0:adjustPos(slot7)
end

function BattleBuffTips.adjustPos(slot0, slot1)
	slot0.root_wnd:setContentSize(cc.size(slot0.WIDTH, slot1 + slot0.SPACE_H))

	if slot1 + slot0.SPACE_H <= 77 then
		slot2 = 77
	end

	slot0.background:setContentSize(cc.size(slot0.WIDTH, slot2))
	slot0.background:setPositionY((slot1 + slot0.SPACE_H) / 2)
	slot0.scroll_view:setContentSize(cc.size(slot0.WIDTH - 30, slot0._height))
	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.WIDTH, slot0.HEIGHT))
end

function BattleBuffTips.createSingleTips(slot0, slot1, slot2, slot3, slot4)
	slot6 = ccui.Widget:create()

	slot6:setAnchorPoint(cc.p(0, 0))
	slot6:setContentSize(cc.size(slot0.WIDTH, 0))
	slot6:setPosition(cc.p(0, slot0.HEIGHT))
	slot0.scroll_view:addChild(slot6, 2222)

	slot8 = ""
	slot9 = ""

	for slot14, slot15 in pairs(slot3) do
		if Config.SkillData.data_get_buff[slot15.bid] and Config.SkillData.data_get_buff[slot15.bid].desc ~= "" and not ({})[slot14] then
			slot7 = "" .. string.format("<div><img src='%s'/></div><div fontcolor=#64e678 fontsize=18> %s </div>%s\n", PathTool.getBuffRes(Config.SkillData.data_get_buff[slot15.bid].icon), Config.SkillData.data_get_buff[slot15.bid].name .. ":", Config.SkillData.data_get_buff[slot15.bid].desc)
		end
	end

	slot11 = createRichLabel(18, 4, cc.p(0, 0), cc.p(0, slot5), 5, nil, slot0.WIDTH - slot0.space_x)

	slot11:setString(slot7)
	slot6:addChild(slot11)

	return slot11:getSize().height
end

function BattleBuffTips.open(slot0)
	ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0.screen_bg)
	doStopAllActions(slot0.screen_bg)
	delayRun(slot0.screen_bg, slot0.delay, function ()
		TipsManager:getInstance():hideTips()
	end)
end

function BattleBuffTips.close(slot0)
	doStopAllActions(slot0.screen_bg)
	slot0.screen_bg:removeFromParent()
end
