ArtifactRecastCostPanel = ArtifactRecastCostPanel or BaseClass(BaseView)

function ArtifactRecastCostPanel.__init(slot0)
	slot0.ctrl = HeroController:getInstance()
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("artifact", "artifact"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "hero/artifact_recast_cost_panel"
end

function ArtifactRecastCostPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	ActionHelp.itemScaleAction(slot0.main_container)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.cost_btn_1 = slot0.main_container:getChildByName("cost_btn_1")

	slot0.cost_btn_1:getChildByName("label"):setString(TI18N("确认选择"))

	slot0.cost_btn_2 = slot0.main_container:getChildByName("cost_btn_2")

	slot0.cost_btn_2:getChildByName("label"):setString(TI18N("确认选择"))
	slot0.main_container:getChildByName("win_title"):setString(TI18N("选择提示"))
	slot0.main_container:getChildByName("Text_7"):setString(TI18N("选择一种您要使用的道具"))

	slot0.left_item = BackPackItem.new(true, true, nil)

	slot0.left_item:setPosition(cc.p(180, 300))
	slot0.main_container:addChild(slot0.left_item)

	slot0.right_item = BackPackItem.new(true, true, nil)

	slot0.right_item:setPosition(cc.p(484, 300))
	slot0.main_container:addChild(slot0.right_item)

	slot0.desc_label_1 = createRichLabel(22, cc.c4b(149, 83, 34, 255), cc.p(0.5, 0.5), cc.p(180, 160), 10, nil, 280)

	slot0.main_container:addChild(slot0.desc_label_1)
	slot0.desc_label_1:setString(TI18N("出现强力和稀有技能\n          <div fontcolor=#249003>概率翻倍</div>！"))

	slot0.desc_label_2 = createRichLabel(22, cc.c4b(149, 83, 34, 255), cc.p(0.5, 0.5), cc.p(484, 160), 10, nil, 280)

	slot0.main_container:addChild(slot0.desc_label_2)
	slot0.desc_label_2:setString(TI18N("<div fontcolor=#249003>必定</div>出现<div fontcolor=#249003>双高级</div>技能！"))
end

function ArtifactRecastCostPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		GlobalEvent:getInstance():Fire(HeroEvent.Artifact_Cost_Select_Event)
		uv0.ctrl:openArtifactRecastCostPanel(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		GlobalEvent:getInstance():Fire(HeroEvent.Artifact_Cost_Select_Event)
		uv0.ctrl:openArtifactRecastCostPanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.cost_btn_1, function ()
		GlobalEvent:getInstance():Fire(HeroEvent.Artifact_Cost_Select_Event, 1)
		uv0.ctrl:openArtifactRecastCostPanel(false)
	end, true, 1)
	registerButtonEventListener(slot0.cost_btn_2, function ()
		GlobalEvent:getInstance():Fire(HeroEvent.Artifact_Cost_Select_Event, 2)
		uv0.ctrl:openArtifactRecastCostPanel(false)
	end, true, 1)
end

function ArtifactRecastCostPanel.openRootWnd(slot0)
	slot0:initData()
end

function ArtifactRecastCostPanel.initData(slot0)
	slot2 = Config.PartnerArtifactData.data_artifact_const.lucky_item_id2

	if Config.PartnerArtifactData.data_artifact_const.lucky_item_id and slot2 then
		slot0.left_item:setBaseData(slot1.val, BackpackController:getInstance():getModel():getItemNumByBid(slot1.val))
		slot0.right_item:setBaseData(slot2.val, BackpackController:getInstance():getModel():getItemNumByBid(slot2.val))

		if Config.ItemData.data_get_data(slot1.val) then
			slot0.left_item:addCallBack(function ()
				TipsManager:getInstance():showGoodsTips(uv0, true)
			end)
			slot0.left_item:setGoodsName(slot5.name, cc.p(BackPackItem.Width / 2, -33), 24, BackPackConst.quality_color[slot5.quality])
		end

		if Config.ItemData.data_get_data(slot2.val) then
			slot0.right_item:addCallBack(function ()
				TipsManager:getInstance():showGoodsTips(uv0, true)
			end)
			slot0.right_item:setGoodsName(slot6.name, cc.p(BackPackItem.Width / 2 - 1, -33), 24, BackPackConst.quality_color[slot6.quality])
		end
	end
end

function ArtifactRecastCostPanel.close_callback(slot0)
	doStopAllActions(slot0.main_container)

	if slot0.left_item then
		slot0.left_item:DeleteMe()

		slot0.left_item = nil
	end

	if slot0.right_item then
		slot0.right_item:DeleteMe()

		slot0.right_item = nil
	end

	slot0.ctrl:openArtifactRecastCostPanel(false)
end
