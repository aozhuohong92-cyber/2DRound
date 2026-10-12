ForgeHolyEqmPanel = class("ForgeHolyEqmPanel", function ()
	return ccui.Widget:create()
end)
slot0 = table.insert
slot1 = table.sort
slot2 = string.format

function ForgeHolyEqmPanel.ctor(slot0)
	slot0.artifact_items = {}
	slot0.com_artifact_id = 0
	slot0.chose_item_list = {}
	slot0.is_show_effect = false
	slot0.cur_auto_num = 5

	slot0:layoutUI()
	slot0:registerEvents()
end

function ForgeHolyEqmPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.skill_btn, handler(slot0, slot0._onClickSkillBtn))
	registerButtonEventListener(slot0.explain_btn, handler(slot0, slot0._onClickExplainBtn))
	registerButtonEventListener(slot0.quick_add_btn, handler(slot0, slot0._onClickQuickAddBtn))
	registerButtonEventListener(slot0.compound_btn, handler(slot0, slot0._onClickCompoundBtn))
	registerButtonEventListener(slot0.get_zhufu, handler(slot0, slot0._onClickGetZhufu))

	if not slot0.compound_update_evt then
		slot0.compound_update_evt = GlobalEvent:getInstance():Bind(HeroEvent.Holy_Eqm_Compound_Event, function (slot0)
			uv0.com_artifact_id = 0
			uv0.chose_item_list = {}

			delayRun(uv0, 0.016666666666666666, function ()
				uv0:updateChoseArtifactItems()
			end)
		end)
	end

	if not slot0.chose_update_evt then
		slot0.chose_update_evt = GlobalEvent:getInstance():Bind(HeroEvent.SHEN_JIANG_FANG_HOLY_EQUIP_COMPOSE_SELECT_LIST, function (slot0)
			uv0.chose_item_list = slot0

			delayRun(uv0, 0.016666666666666666, function ()
				uv0:updateChoseArtifactItems()
			end)
		end)
	end
end

function ForgeHolyEqmPanel.layoutUI(slot0)
	slot0.size = cc.size(720, 1280)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0, 0))

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("forgehouse/forge_holy_eqm_panel"))

	slot0.root_wnd:setPosition(0, 0)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.skill_btn = slot0.main_container:getChildByName("skill_btn")
	slot0.rate_txt = slot0.main_container:getChildByName("rate_txt")

	slot0.rate_txt:setVisible(false)

	slot0.level_txt = slot0.main_container:getChildByName("level_txt")

	slot0.level_txt:setVisible(false)

	slot0.explain_btn = slot0.main_container:getChildByName("explain_btn")
	slot0.quick_add_btn = slot0.main_container:getChildByName("quick_add_btn")

	slot0.quick_add_btn:getChildByName("label"):setString(TI18N("一键添加"))

	slot0.compound_btn = slot0.main_container:getChildByName("compound_btn")

	slot0.compound_btn:getChildByName("label"):setString(TI18N("合成"))
	slot0.main_container:getChildByName("tips_txt"):setString(TI18N("同类低阶神装可合成高阶神装"))

	slot0.cost_txt = createRichLabel(20, 273, cc.p(0.5, 1), cc.p(slot0.rate_txt:getPositionX(), slot0.rate_txt:getPositionY() - 16))

	slot0.main_container:addChild(slot0.cost_txt)

	slot0.progress_panel = slot0.main_container:getChildByName("progress_panel")
	slot0.progress_bar = cc.ProgressTimer:create(createSprite(PathTool.getResFrame("artifact", "artifact_1002"), 0, 0, nil, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST))

	slot0.progress_bar:setType(cc.PROGRESS_TIMER_TYPE_BAR)
	slot0.progress_bar:setMidpoint(cc.p(0.5, 0))
	slot0.progress_bar:setBarChangeRate(cc.p(0, 1))
	slot0.progress_bar:setAnchorPoint(cc.p(0, 0))
	slot0.progress_bar:setPosition(cc.p(0, 0))
	slot0.progress_bar:setPercentage(0)
	slot0.progress_panel:addChild(slot0.progress_bar)
	slot0:handleProgressEffect(true)

	slot7 = "pos_node"
	slot0.pos_node = slot0.main_container:getChildByName(slot7)

	for slot7 = 1, 5 do
		delayRun(slot0.main_container, slot7 * 4 / 60, function ()
			slot1 = BackPackItem.new(false, true, false, nil, true, false)

			slot1:addCallBack(handler(uv0, uv0._onClickItemCallBack))
			slot1:showAddIcon(true)
			slot1:setIsShowBackground(false)
			uv0.main_container:getChildByName("pos_node_" .. uv1):addChild(slot1)

			uv0.artifact_items[uv1] = slot1
		end)
	end
end

function ForgeHolyEqmPanel._onClickItemCallBack(slot0)
	HeroController:getInstance():openHolyEqmChoseWindow(true, {
		bid = slot0.com_artifact_id,
		max_num = 5,
		chose_list = slot0.chose_item_list or {}
	})
end

function ForgeHolyEqmPanel.handleComEffect(slot0, slot1)
	if slot1 == true then
		slot0.is_show_effect = true

		if not tolua.isnull(slot0.pos_node) and slot0.com_effect == nil then
			slot0.com_effect = createEffectSpine(Config.EffectData.data_effect_info[661], cc.p(0, 0), cc.p(0.5, 0.5), false, PlayerAction.action, handler(slot0, slot0.requestCompoundArtifact))

			slot0.pos_node:addChild(slot0.com_effect)
		elseif slot0.com_effect then
			slot0.com_effect:setToSetupPose()
			slot0.com_effect:setAnimation(0, PlayerAction.action, false)
		end
	elseif slot0.com_effect then
		slot0.com_effect:clearTracks()
		slot0.com_effect:removeFromParent()

		slot0.com_effect = nil
	end
end

function ForgeHolyEqmPanel.updateChoseArtifactItems(slot0)
	slot0.com_artifact_id = 0

	for slot4, slot5 in ipairs(slot0.artifact_items) do
		if slot0.chose_item_list[slot4] then
			if BackpackController:getModel():getBagItemById(BackPackConst.Bag_Code.EQUIPS, slot6) then
				if slot0.com_artifact_id == 0 then
					slot0.com_artifact_id = Config.PartnerHolyEqmData.data_artifact_data[slot7.config.id].com_artifact
				end

				slot5:setData(slot7)

				if not slot5.chose_effect then
					slot5.chose_effect = createEffectSpine(Config.EffectData.data_effect_info[662], cc.p(BackPackItem.Width / 2, BackPackItem.Height / 2), cc.p(0.5, 0.5), true, PlayerAction.action)

					slot5:addChild(slot5.chose_effect)
				end

				slot5.chose_effect:setVisible(true)
				slot5:showAddIcon(false)
			else
				slot5:setData({})
				slot5:showAddIcon(true)

				if slot5.chose_effect then
					slot5.chose_effect:setVisible(false)
				end
			end
		else
			slot5:setData({})
			slot5:showAddIcon(true)

			if slot5.chose_effect then
				slot5.chose_effect:setVisible(false)
			end
		end
	end

	if not slot0.target_item then
		slot0.target_item = BackPackItem.new(false, true, false, nil, true, false)

		slot0.target_item:addCallBack(handler(slot0, slot0._onClickTargetCallBack))
		slot0.target_item:setIsShowBackground(false)
		slot0.pos_node:addChild(slot0.target_item)
	end

	if slot0.com_artifact_id ~= 0 then
		slot0.target_item:setBaseData(slot0.com_artifact_id)

		if Config.PartnerHolyEqmData.data_artifact_compound[slot0.com_artifact_id] and slot1[#slot0.chose_item_list] then
			slot0.rate_txt:setString(TI18N("成功率 ") .. (slot1[#slot0.chose_item_list].rate or 0) / 10 .. "%")
			slot0.rate_txt:setTextColor(cc.c3b(112, 206, 50))
			slot0.rate_txt:setVisible(true)
			slot0:updateCostInfo(slot1[#slot0.chose_item_list].other_expend)
		else
			slot0.rate_txt:setTextColor(cc.c3b(206, 164, 120))
			slot0.rate_txt:setString(TI18N("需2个同类神装"))
			slot0.rate_txt:setVisible(true)
			slot0.cost_txt:setVisible(false)
		end
	else
		slot0.target_item:setData({})
		slot0.rate_txt:setVisible(false)
		slot0.level_txt:setVisible(false)
		slot0.cost_txt:setVisible(false)
	end
end

function ForgeHolyEqmPanel.updateCostInfo(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot0.cost_txt:setVisible(true)

	slot2 = ""

	for slot6, slot7 in ipairs(slot1) do
		slot9 = slot7[2]

		if Config.ItemData.data_get_data(slot7[1]) then
			if slot2 ~= "" then
				slot2 = slot2 .. ","
			end

			slot2 = string.format("%s<img src='%s' scale=0.3 />%s", slot2, PathTool.getItemRes(slot10.icon), MoneyTool.GetMoneyString(slot9))
		end
	end

	slot0.cost_txt:setString(TI18N("     消耗\n") .. slot2)
end

function ForgeHolyEqmPanel.handleProgressEffect(slot0, slot1)
	if slot1 == false then
		if slot0.progress_effect then
			slot0.progress_effect:clearTracks()
			slot0.progress_effect:removeFromParent()

			slot0.progress_effect = nil
		end
	elseif not tolua.isnull(slot0.progress_panel) and slot0.progress_effect == nil then
		slot0.progress_effect = createEffectSpine(Config.EffectData.data_effect_info[660], cc.p(24.5, 0), cc.p(0, 1), true, PlayerAction.action)

		slot0.progress_panel:addChild(slot0.progress_effect)
	end
end

function ForgeHolyEqmPanel._onClickTargetCallBack(slot0)
	if slot0.com_artifact_id ~= 0 then
		HeroController:getInstance():openArtifactComTipsWindow(true, slot0.com_artifact_id)
	end
end

function ForgeHolyEqmPanel._onClickSkillBtn(slot0)
	HeroController:getInstance():openArtifactSkillWindow(true)
end

function ForgeHolyEqmPanel._onClickExplainBtn(slot0, slot1, slot2)
	if Config.PartnerHolyEqmData.data_const.artifact_rule then
		TipsManager:getInstance():showCommonTips(slot3.desc, slot2:getTouchBeganPosition())
	end
end

function ForgeHolyEqmPanel._onClickQuickAddBtn(slot0)
	BackpackController:openQuickAddHolyWindow(true)
end

function ForgeHolyEqmPanel._onClickCompoundBtn(slot0)
	if slot0.is_show_effect == true then
		return
	end

	if slot0.com_artifact_id == 0 or next(slot0.chose_item_list) == nil then
		message(TI18N("请先放入合成材料"))
	elseif #slot0.chose_item_list < 2 then
		message(TI18N("至少需要放入2个同类神装"))
	elseif #slot0.chose_item_list < 5 then
		CommonAlert.show("合成数量不足5个,操作有可能失败,请谨慎操作", TI18N("确定"), function ()
			uv0:handleComEffect(true)
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	else
		slot0:handleComEffect(true)
	end
end

function ForgeHolyEqmPanel.requestCompoundArtifact(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.chose_item_list) do
		uv0(slot1, {
			artifact_id = slot6
		})
	end

	HeroController:getInstance():sender11039(slot0.com_artifact_id, slot1)

	slot0.is_show_effect = false
end

function ForgeHolyEqmPanel._onClickGetZhufu(slot0)
	HeroController:getInstance():openArtifactAwardWindow(true)
end

function ForgeHolyEqmPanel.DeleteMe(slot0)
	if SysEnv:getInstance():getNum(SysEnv.keys.forge_artifact_num) ~= slot0.cur_auto_num then
		SysEnv:getInstance():set(SysEnv.keys.forge_artifact_num, slot0.cur_auto_num)
	end

	if RoleEnv:getInstance():getStr(RoleEnv.keys.artifact_count_tips) ~= os.date("%m_%d") then
		RoleEnv:getInstance():set(RoleEnv.keys.artifact_count_tips, slot2, true)
	end

	slot6 = PromptTypeConst.Artifact_Count_tips

	PromptController:getInstance():getModel():removePromptDataByTpye(slot6)

	for slot6, slot7 in pairs(slot0.artifact_items) do
		if slot7.chose_effect then
			slot7.chose_effect:clearTracks()
			slot7.chose_effect:removeFromParent()

			slot7.chose_effect = nil
		end

		slot7:DeleteMe()

		slot7 = nil
	end

	slot0:handleComEffect(false)
	slot0:handleProgressEffect(false)

	if slot0.target_item then
		slot0.target_item:DeleteMe()

		slot0.target_item = nil
	end

	if slot0.lucky_update_evt then
		GlobalEvent:getInstance():UnBind(slot0.lucky_update_evt)

		slot0.lucky_update_evt = nil
	end

	if slot0.compound_update_evt then
		GlobalEvent:getInstance():UnBind(slot0.compound_update_evt)

		slot0.compound_update_evt = nil
	end

	if slot0.chose_update_evt then
		GlobalEvent:getInstance():UnBind(slot0.chose_update_evt)

		slot0.chose_update_evt = nil
	end
end
