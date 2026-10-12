slot1 = SeerpalaceController:getInstance():getModel()
SeerpalaceSummonPanel = class("SeerpalaceSummonPanel", function ()
	return ccui.Widget:create()
end)

function SeerpalaceSummonPanel.ctor(slot0)
	slot0.summon_list = {}
	slot0.summon_pos = {}
	slot0.is_playing = false

	slot0:configUI()
	slot0:register_event()
end

function SeerpalaceSummonPanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function SeerpalaceSummonPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("seerpalace/seerpalace_summon_panel"))

	slot0.root_wnd:setPosition(0, 0)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.COMMON, "c_xianzhizhaohuan")

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.pos_npc = slot1:getChildByName("pos_npc")
	slot0.pos_ball = slot1:getChildByName("pos_ball")
	slot0.btn_summon = slot1:getChildByName("btn_summon")

	slot0.btn_summon:setScale9Enabled(false)

	slot2 = slot0.btn_summon:getContentSize()
	slot0.btn_summon_label = createRichLabel(30, 1, cc.p(0.5, 0.5), cc.p(slot2.width / 2, slot2.height / 2))

	slot0.btn_summon:addChild(slot0.btn_summon_label)
	slot0:handleNPCEffect(true)

	slot6 = true

	slot0:handleBallEffect(slot6)

	for slot6 = 1, 4 do
		if slot1:getChildByName("pos_node_" .. slot6) then
			delayRun(slot7, slot6 * 3 / 60, function ()
				if not uv0.summon_list[uv1] then
					slot0 = SeerpalaceSummonItem.new(handler(uv0, uv0._onClickSummonCard))

					uv2:addChild(slot0)

					uv0.summon_list[uv1] = slot0
				end

				slot0:setIndex(uv1)
			end)

			slot0.summon_pos[slot6] = slot7
		end
	end

	slot0:updateSummonBtnLabel()
end

function SeerpalaceSummonPanel._onClickSummonCard(slot0, slot1)
	if slot0.is_playing then
		return
	end

	if slot0.select_card then
		slot0.select_card:setSelectStatus(false)
	end

	if slot1 then
		slot0.select_card = slot1

		slot0.select_card:setSelectStatus(true)
	end

	slot0:updateSummonBtnLabel()
end

function SeerpalaceSummonPanel.handleNPCEffect(slot0, slot1)
	if slot1 == false then
		if slot0.npc_effect then
			slot0.npc_effect:clearTracks()
			slot0.npc_effect:removeFromParent()

			slot0.npc_effect = nil
		end
	elseif not tolua.isnull(slot0.pos_npc) and slot0.npc_effect == nil then
		slot0.npc_effect = createEffectSpine(Config.EffectData.data_effect_info[630], cc.p(0, -145), cc.p(0.5, 0.5), true, PlayerAction.action_1, handler(slot0, slot0._onNPCAniCallBack))

		slot0.npc_effect:setScale(1)

		slot0.npc_ani_status = 1

		slot0.pos_npc:addChild(slot0.npc_effect)
	end
end

function SeerpalaceSummonPanel.handleBallEffect(slot0, slot1)
end

function SeerpalaceSummonPanel.handleSummonEffect(slot0, slot1)
	if slot1 == false then
		if slot0.summon_effect then
			slot0.summon_effect:clearTracks()
			slot0.summon_effect:removeFromParent()

			slot0.summon_effect = nil
		end
	elseif not tolua.isnull(slot0.pos_ball) and slot0.summon_effect == nil then
		slot0.summon_effect = createEffectSpine(Config.EffectData.data_effect_info[632], cc.p(4, -44), cc.p(0.5, 0.5), false, PlayerAction.action, handler(slot0, slot0._onSummonAniCallBack))

		slot0.summon_effect:setScale(1)
		slot0.pos_ball:addChild(slot0.summon_effect)
	elseif slot0.summon_effect then
		slot0.summon_effect:setToSetupPose()
		slot0.summon_effect:setAnimation(0, PlayerAction.action, false)
	end
end

function SeerpalaceSummonPanel._onSummonAniCallBack(slot0)
	uv0:requestSeerpalaceSummon(slot0.select_card:getSummonGroupId())

	slot0.is_playing = false
end

function SeerpalaceSummonPanel._onNPCAniCallBack(slot0)
	if slot0.npc_effect and slot0.npc_ani_status == 2 then
		slot0.npc_effect:setAnimation(0, PlayerAction.action_1, true)

		slot0.npc_ani_status = 1
	end
end

function SeerpalaceSummonPanel.register_event(slot0)
	registerButtonEventListener(slot0.btn_summon, handler(slot0, slot0._onClickSummonBtn), true)
end

function SeerpalaceSummonPanel._onClickSummonBtn(slot0)
	if slot0.is_playing then
		return
	end

	if slot0.select_card then
		if slot0.select_card:getSummonCostItem() then
			if slot1[2] <= BackpackController:getInstance():getModel():getItemNumByBid(slot1[1]) and slot0.npc_effect then
				slot0.npc_ani_status = 2
				slot0.is_playing = true

				slot0.npc_effect:setAnimation(0, PlayerAction.action_2, false)
				slot0:handleSummonEffect(true)
				playOtherSound("c_xianzhizhaohuan")
			else
				uv0:requestSeerpalaceSummon(slot0.select_card:getSummonGroupId())
			end
		end
	else
		message("请先选择一种卡牌")
	end
end

function SeerpalaceSummonPanel.updateSummonBtnLabel(slot0)
	if slot0.select_card then
		if slot0.select_card:getSummonCostItem() then
			if Config.ItemData.data_get_data(slot1[1]) then
				slot0.btn_summon_label:setString(string.format(TI18N("<img src='%s' scale=0.3 /><div outline=2,#020019>%d 召唤</div>"), PathTool.getItemRes(slot4.icon), slot1[2]))
			end
		end
	else
		slot0.btn_summon_label:setString(TI18N("<div outline=2,#020019>召唤</div>"))
	end
end

function SeerpalaceSummonPanel.DeleteMe(slot0)
	slot0:handleNPCEffect(false)
	slot0:handleBallEffect(false)

	slot4 = false

	slot0:handleSummonEffect(slot4)

	for slot4, slot5 in pairs(slot0.summon_list) do
		slot5:DeleteMe()

		slot5 = nil
	end
end

SeerpalaceSummonItem = class("SeerpalaceSummonItem", function ()
	return ccui.Widget:create()
end)

function SeerpalaceSummonItem.ctor(slot0, slot1)
	slot0._clickCallBack = slot1
	slot0._is_select = false

	slot0:configUI()
	slot0:register_event()
end

function SeerpalaceSummonItem.configUI(slot0)
	slot0.size = cc.size(180, 196)

	slot0:setTouchEnabled(false)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("seerpalace/seerpalace_summon_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.effect_node = slot2:getChildByName("effect_node")
	slot0.summon_layer = slot2:getChildByName("summon_layer")
	slot0.check_layer = slot2:getChildByName("check_layer")
end

function SeerpalaceSummonItem.setIndex(slot0, slot1)
	slot0.index = slot1

	if Config.RecruitHighData.data_seerpalace_data[SeerpalaceConst.Index_To_GroupId[slot1]] and slot3.item_once then
		slot0.summon_cost = slot3.item_once[1]
		slot0.group_id = slot2
		slot5 = SeerpalaceConst.Effect_Pos[slot2]

		if SeerpalaceConst.Book_EffectId[slot2] and slot5 and slot4 ~= 0 then
			slot0:handleCardEffect(true, slot4, slot5)
		end
	end

	slot0.summon_layer:setName("guide_card_" .. slot1)
end

function SeerpalaceSummonItem.getSummonCostItem(slot0)
	return slot0.summon_cost
end

function SeerpalaceSummonItem.getSummonGroupId(slot0)
	return slot0.group_id
end

function SeerpalaceSummonItem.handleCardEffect(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.card_effect then
			slot0.card_effect:clearTracks()
			slot0.card_effect:removeFromParent()

			slot0.card_effect = nil
		end
	elseif not tolua.isnull(slot0.effect_node) and slot0.card_effect == nil then
		slot0.card_effect = createEffectSpine(Config.EffectData.data_effect_info[slot2], slot3, cc.p(0.5, 0.5), true, PlayerAction.action_1)

		slot0.card_effect:setScale(1)
		slot0.effect_node:addChild(slot0.card_effect)
	end
end

function SeerpalaceSummonItem.register_event(slot0)
	registerButtonEventListener(slot0.check_layer, handler(slot0, slot0._onClickCheckLayer))
	registerButtonEventListener(slot0.summon_layer, handler(slot0, slot0._onClickSummonLayer))
end

function SeerpalaceSummonItem._onClickCheckLayer(slot0)
	if slot0.index then
		uv0:openSeerpalacePreviewWindow(true, slot0.index)
	end
end

function SeerpalaceSummonItem._onClickSummonLayer(slot0)
	if slot0._is_select == false and slot0._clickCallBack then
		slot0:_clickCallBack(slot0)
	end
end

function SeerpalaceSummonItem.setSelectStatus(slot0, slot1)
	if slot1 == true then
		slot0.summon_layer:setPositionY(30)
		slot0.check_layer:setPositionY(30)
		slot0.card_effect:setAnimation(0, PlayerAction.action_2, true)
		slot0.card_effect:setToSetupPose()
	else
		slot0.summon_layer:setPositionY(0)
		slot0.check_layer:setPositionY(0)
		slot0.card_effect:setAnimation(0, PlayerAction.action_1, true)
		slot0.card_effect:setToSetupPose()
	end

	slot0._is_select = slot1
end

function SeerpalaceSummonItem.DeleteMe(slot0)
	slot0:handleCardEffect(false)
	slot0.container:stopAllActions()
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
