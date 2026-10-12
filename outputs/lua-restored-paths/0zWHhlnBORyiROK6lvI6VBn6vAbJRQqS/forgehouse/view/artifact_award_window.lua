ArtifactAwardWindow = ArtifactAwardWindow or BaseClass(BaseView)
slot0 = HeroController:getInstance()

function ArtifactAwardWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "forgehouse/artifact_award_window"
end

function ArtifactAwardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background_panel"):getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot2 = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot2, 2)
	slot2:getChildByName("title_container"):getChildByName("title_label"):setString(TI18N("熔炼奖励"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.ok_btn = slot2:getChildByName("ok_btn")
	slot0.ok_btn_label = slot0.ok_btn:getChildByName("label")

	slot0.ok_btn_label:setString(TI18N("领取"))
	slot2:getChildByName("main_container"):getChildByName("content_label"):setTextColor(cc.c3b(105, 55, 5))

	slot7 = Config.PartnerArtifactData.data_artifact_const.change_gift

	if Config.PartnerArtifactData.data_artifact_const.change_condition and slot7 and slot7.val and slot7.val[1] then
		slot9 = slot7.val[1][2]

		if Config.ItemData.data_get_data(slot7.val[1][1]) then
			slot0.award_item_bid = slot8

			slot5:setString(string.format(TI18N("熔炼值达到%d点后可领取[%s]x%d"), slot6.val, slot10.name, slot9))

			if not slot0.award_item then
				slot0.award_item = BackPackItem.new(false, true, false, nil, true, false)

				slot0.award_item:addCallBack(handler(slot0, slot0._onClickItemCallBack))
				slot0.award_item:setBaseData(slot8, slot9)
				slot0.award_item:setPosition(cc.p(290, 80))
				slot3:addChild(slot0.award_item)
			end
		end
	end
end

function ArtifactAwardWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.ok_btn, handler(slot0, slot0._onClickOkBtn), true)
end

function ArtifactAwardWindow._onClickCloseBtn(slot0)
	uv0:openArtifactAwardWindow(false)
end

function ArtifactAwardWindow._onClickOkBtn(slot0)
	uv0:sender11038()
	uv0:openArtifactAwardWindow(false)
end

function ArtifactAwardWindow._onClickItemCallBack(slot0)
	if slot0.award_item_bid then
		uv0:openArtifactComTipsWindow(true, slot0.award_item_bid)
	end
end

function ArtifactAwardWindow.refreshBtnStatus(slot0)
	slot1 = HeroController:getInstance():getModel():getArtifactLucky()
	slot2 = 0

	if Config.PartnerArtifactData.data_artifact_const.change_condition and slot3.val then
		slot2 = slot3.val
	end

	if slot2 <= slot1 then
		setChildUnEnabled(false, slot0.ok_btn)
		slot0.ok_btn:setTouchEnabled(true)
	else
		setChildUnEnabled(true, slot0.ok_btn)
		slot0.ok_btn:setTouchEnabled(false)
		slot0.ok_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	end
end

function ArtifactAwardWindow.openRootWnd(slot0)
	slot0:refreshBtnStatus()
end

function ArtifactAwardWindow.close_callback(slot0)
	uv0:openArtifactAwardWindow(false)
end
