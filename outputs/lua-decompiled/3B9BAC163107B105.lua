PartnerSummonScoreWindow = PartnerSummonScoreWindow or BaseClass(BaseView)

function PartnerSummonScoreWindow.__init(slot0)
	slot0.ctrl = PartnersummonController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "partnersummon/partnersummon_sore_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("partnersummon", "partnersummon"),
			type = ResourcesType.plist
		}
	}
end

function PartnerSummonScoreWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot2 = slot1:getChildByName("main_container")

	slot2:getChildByName("content_label"):setString(string.format(TI18N("消耗%d点积分可进行积分召唤，必出5星传说英雄"), slot0.model:getScoreSummonNeedCount()))

	slot5 = slot2:getChildByName("tips_label")

	if Config.RecruitData.data_partnersummon_const.recruit_vip then
		slot6 = Config.RecruitData.data_partnersummon_const.recruit_vip.val or 3
	end

	slot0.vip_limit_lv = slot6

	slot5:setString(string.format(TI18N("（VIP%d方可召唤）"), slot6))

	if not slot0.item_node then
		slot0.item_node = BackPackItem.new(false, false, false)

		slot0.item_node:setPosition(cc.p(290, 80))
		slot0.item_node:setBaseData(29999)
		slot2:addChild(slot0.item_node)
	end

	slot1:getChildByName("title_container"):getChildByName("title_label"):setString(TI18N("积分召唤"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.ok_btn = slot1:getChildByName("ok_btn")
	slot0.ok_btn_label = slot0.ok_btn:getChildByName("label")

	slot0.ok_btn_label:setString(TI18N("召唤"))
end

function PartnerSummonScoreWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.ok_btn, handler(slot0, slot0._onClickOkBtn), true)
end

function PartnerSummonScoreWindow._onClickCloseBtn(slot0)
	slot0.ctrl:openPartnerSummonScoreWindow(false)
end

function PartnerSummonScoreWindow._onClickOkBtn(slot0)
	slot0.ctrl:send23201(PartnersummonConst.Summon_Type.Score, 1, 3)
end

function PartnerSummonScoreWindow.refreshBtnStatus(slot0)
	if slot0.model:getScoreSummonNeedCount() <= RoleController:getInstance():getRoleVo().recruit_hero and slot0.vip_limit_lv <= slot1.vip_lev then
		setChildUnEnabled(false, slot0.ok_btn)
		slot0.ok_btn:setTouchEnabled(true)
	else
		setChildUnEnabled(true, slot0.ok_btn)
		slot0.ok_btn:setTouchEnabled(false)
		slot0.ok_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	end
end

function PartnerSummonScoreWindow.openRootWnd(slot0)
	slot0:refreshBtnStatus()
end

function PartnerSummonScoreWindow.close_callback(slot0)
	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end

	slot0.ctrl:openPartnerSummonScoreWindow(false)
end
