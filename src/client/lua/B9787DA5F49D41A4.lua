ForgeArtifactPanel = class("ForgeArtifactPanel", function ()
	return ccui.Widget:create()
end)
slot0 = table.insert
slot1 = table.sort
slot2 = string.format

function ForgeArtifactPanel.ctor(slot0)
	slot0.artifact_items = {}
	slot0.com_artifact_id = 0
	slot0.chose_item_list = {}
	slot0.is_show_effect = false
	slot0.cur_auto_num = SysEnv:getInstance():getNum(SysEnv.keys.forge_artifact_num, 5)

	slot0:layoutUI()
	slot0:registerEvents()
	slot0:updataZhufuInfo()
end

function ForgeArtifactPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.skill_btn, handler(slot0, slot0._onClickSkillBtn))
	registerButtonEventListener(slot0.explain_btn, handler(slot0, slot0._onClickExplainBtn))
	registerButtonEventListener(slot0.quick_add_btn, handler(slot0, slot0._onClickQuickAddBtn))
	registerButtonEventListener(slot0.compound_btn, handler(slot0, slot0._onClickCompoundBtn))
	registerButtonEventListener(slot0.get_zhufu, handler(slot0, slot0._onClickGetZhufu))
	registerButtonEventListener(slot0.btn_redu, function ()
		uv0:onChangeAutoForgeNum(1)
	end, true)
	registerButtonEventListener(slot0.btn_add, function ()
		uv0:onChangeAutoForgeNum(2)
	end, true)

	if not slot0.lucky_update_evt then
		slot0.lucky_update_evt = GlobalEvent:getInstance():Bind(HeroEvent.Artifact_Lucky_Event, function ()
			uv0:updataZhufuInfo()
		end)
	end

	if not slot0.compound_update_evt then
		slot0.compound_update_evt = GlobalEvent:getInstance():Bind(HeroEvent.Artifact_Compound_Event, function (slot0)
			uv0.com_artifact_id = 0
			uv0.chose_item_list = {}

			uv0:updateChoseArtifactItems()
		end)
	end

	if not slot0.chose_update_evt then
		slot0.chose_update_evt = GlobalEvent:getInstance():Bind(HeroEvent.Artifact_Chose_Event, function (slot0)
			uv0.chose_item_list = slot0

			uv0:updateChoseArtifactItems()
		end)
	end
end

function ForgeArtifactPanel.onChangeAutoForgeNum(slot0, slot1)
	if slot1 == 1 then
		slot0.cur_auto_num = slot0.cur_auto_num - 1

		slot0.num_txt:setString(slot0.cur_auto_num)
	else
		slot0.cur_auto_num = slot0.cur_auto_num + 1

		slot0.num_txt:setString(slot0.cur_auto_num)
	end

	if slot0.cur_auto_num <= 2 then
		slot0.btn_redu:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.btn_redu)
	elseif slot0.cur_auto_num >= 5 then
		slot0.btn_add:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.btn_add)
	else
		slot0.btn_redu:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.btn_redu)
		slot0.btn_add:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.btn_add)
	end
end

function ForgeArtifactPanel.layoutUI(slot0)
	slot0.size = cc.size(720, 1280)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0, 0))

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("forgehouse/forge_artifact_panel"))

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

	slot0.btn_redu = slot0.main_container:getChildByName("btn_redu")
	slot0.btn_add = slot0.main_container:getChildByName("btn_add")
	slot0.num_txt = slot0.main_container:getChildByName("num_txt")

	slot0.num_txt:setString(slot0.cur_auto_num)

	if slot0.cur_auto_num <= 2 then
		slot0.btn_redu:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.btn_redu)
	elseif slot0.cur_auto_num >= 5 then
		slot0.btn_add:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.btn_add)
	end

	slot0.main_container:getChildByName("tips_txt"):setString(TI18N("同类低阶战技可合成高阶战技"))

	slot0.cost_txt = createRichLabel(20, 273, cc.p(0.5, 1), cc.p(slot0.rate_txt:getPositionX(), slot0.rate_txt:getPositionY() - 16))

	slot0.main_container:addChild(slot0.cost_txt)
	slot0.main_container:getChildByName("zhufu_title"):setString(TI18N("熔炼值"))

	slot0.zhufu_txt = slot0.main_container:getChildByName("zhufu_txt")
	slot0.get_zhufu = slot0.main_container:getChildByName("get_zhufu")
	slot0.zhufu_tips = slot0.main_container:getChildByName("zhufu_tips")

	if Config.PartnerArtifactData.data_artifact_const.change_gift and slot6.val[1][1] then
		loadSpriteTexture(slot0.main_container:getChildByName("zhufu_icon"), PathTool.getItemRes(slot7), LOADTEXT_TYPE)
	end

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

	slot10 = "pos_node"
	slot0.pos_node = slot0.main_container:getChildByName(slot10)

	for slot10 = 1, 5 do
		delayRun(slot0.main_container, slot10 * 4 / 60, function ()
			slot1 = BackPackItem.new(false, true, false, nil, true, false)

			slot1:addCallBack(handler(uv0, uv0._onClickItemCallBack))
			slot1:showAddIcon(true)
			slot1:setIsShowBackground(false)
			uv0.main_container:getChildByName("pos_node_" .. uv1):addChild(slot1)

			uv0.artifact_items[uv1] = slot1
		end)
	end
end

function ForgeArtifactPanel._onClickItemCallBack(slot0)
	HeroController:getInstance():openArtifactChoseWindow(true, {
		bid = slot0.com_artifact_id,
		max_num = 5,
		chose_list = slot0.chose_item_list or {}
	})
end

function ForgeArtifactPanel.handleComEffect(slot0, slot1)
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

function ForgeArtifactPanel.updateChoseArtifactItems(slot0)
	slot0.com_artifact_id = 0

	for slot4, slot5 in ipairs(slot0.artifact_items) do
		if slot0.chose_item_list[slot4] then
			if BackpackController:getModel():getBackPackItemById(slot6) then
				if slot0.com_artifact_id == 0 then
					slot0.com_artifact_id = Config.PartnerArtifactData.data_artifact_data[slot7.config.id].com_artifact
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

		slot2 = Config.PartnerArtifactData.data_artifact_data[slot0.com_artifact_id]
		slot3 = RoleController:getInstance():getRoleVo()

		if Config.PartnerArtifactData.data_artifact_compound[slot0.com_artifact_id] and slot1[#slot0.chose_item_list] then
			slot0.rate_txt:setString(TI18N("成功率 ") .. (slot1[#slot0.chose_item_list].rate or 0) / 10 .. "%")
			slot0.rate_txt:setTextColor(cc.c3b(112, 206, 50))
			slot0.rate_txt:setVisible(true)
			slot0:updateCostInfo(slot1[#slot0.chose_item_list].other_expend)
		else
			slot0.rate_txt:setTextColor(cc.c3b(206, 164, 120))
			slot0.rate_txt:setString(TI18N("需2个同类战技"))
			slot0.rate_txt:setVisible(true)
			slot0.cost_txt:setVisible(false)
		end

		if slot2 and slot3.lev < slot2.limit_lv then
			slot0.level_txt:setString(uv0(TI18N("需达到%d级"), slot2.limit_lv))
			slot0.level_txt:setVisible(true)
			slot0.cost_txt:setVisible(false)
		else
			slot0.level_txt:setVisible(false)
		end
	else
		slot0.target_item:setData({})
		slot0.rate_txt:setVisible(false)
		slot0.level_txt:setVisible(false)
		slot0.cost_txt:setVisible(false)
	end
end

function ForgeArtifactPanel.updateCostInfo(slot0, slot1)
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

function ForgeArtifactPanel.updataZhufuInfo(slot0)
	slot1 = HeroController:getInstance():getModel():getArtifactLucky()
	slot2 = 0

	if Config.PartnerArtifactData.data_artifact_const.change_condition and slot3.val then
		slot2 = slot3.val
	end

	slot0.progress_bar:setPercentage(slot1 / slot2 * 100)
	slot0.zhufu_txt:setString(slot1)
	slot0.zhufu_tips:setVisible(HeroController:getInstance():getModel():getArtifactLuckyRedStatus())

	if slot0.progress_effect then
		if slot4 / 100 * 324 < 3 then
			slot6 = 3
		end

		slot0.progress_effect:setPositionY(slot6)
	end
end

function ForgeArtifactPanel.handleProgressEffect(slot0, slot1)
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

function ForgeArtifactPanel._onClickTargetCallBack(slot0)
	if slot0.com_artifact_id ~= 0 then
		HeroController:getInstance():openArtifactComTipsWindow(true, slot0.com_artifact_id)
	end
end

function ForgeArtifactPanel._onClickSkillBtn(slot0)
	HeroController:getInstance():openArtifactSkillWindow(true)
end

function ForgeArtifactPanel._onClickExplainBtn(slot0, slot1, slot2)
	if Config.PartnerArtifactData.data_artifact_const.artifact_rule then
		TipsManager:getInstance():showCommonTips(slot3.desc, slot2:getTouchBeganPosition())
	end
end

function ForgeArtifactPanel._onClickQuickAddBtn(slot0)
	slot1 = BackpackController:getInstance():getModel():getBackPackItemListByType(BackPackConst.item_type.ARTIFACTCHIPS)
	slot7 = {
		"quality",
		"id"
	}

	uv0(slot1, SortTools.tableLowerSorter(slot7))

	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		if not slot2[slot7.quality] then
			slot2[slot7.quality] = {
				quality = slot7.quality,
				bid = slot7.config.id
			}
		end
	end

	for slot7 = 0, BackPackConst.quality.red do
		if slot2[slot7] and Config.PartnerArtifactData.data_artifact_data[slot2[slot7].bid] and slot9.com_artifact ~= 0 then
			slot10 = Config.PartnerArtifactData.data_artifact_data[slot9.com_artifact]

			print("target_cfg==================", BackpackController:getInstance():getModel():getItemNumByBid(slot8), slot10.limit_num)

			if slot10 and slot10.limit_num <= slot11 then
				print("bid================", slot11)

				if not false then
					slot3 = true
					slot0.chose_item_list = BackpackController:getInstance():getModel():getBackPackItemIdListByBid(slot8)
				end

				if slot0.cur_auto_num <= slot11 then
					slot0.chose_item_list = {}

					if slot0.cur_auto_num < slot11 then
						for slot16, slot17 in ipairs(slot12) do
							if slot16 <= slot0.cur_auto_num then
								uv1(slot0.chose_item_list, slot17)
							else
								break
							end
						end

						break
					end

					slot0.chose_item_list = slot12

					break
				end
			end
		end
	end

	if next(slot0.chose_item_list) == nil then
		message(TI18N("暂无可作为材料的战技"))
	else
		slot0:updateChoseArtifactItems()
	end
end

function ForgeArtifactPanel._onClickCompoundBtn(slot0)
	if slot0.is_show_effect == true then
		return
	end

	if slot0.com_artifact_id == 0 or next(slot0.chose_item_list) == nil then
		message(TI18N("请先放入合成材料"))
	elseif #slot0.chose_item_list < 2 then
		message(TI18N("至少需要放入2个同类战技"))
	elseif slot0.com_artifact_id == 10455 and #slot0.chose_item_list < 5 then
		CommonAlert.show(TI18N("当前所放置材料高级战技不足5个，继续合成将有概率失败，是否确定合成？"), TI18N("确定"), function ()
			uv0:handleComEffect(true)
		end, TI18N("取消"))
	else
		slot0:handleComEffect(true)
	end
end

function ForgeArtifactPanel.requestCompoundArtifact(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.chose_item_list) do
		uv0(slot1, {
			artifact_id = slot6
		})
	end

	HeroController:getInstance():sender11036(slot0.com_artifact_id, slot1)

	slot0.is_show_effect = false
end

function ForgeArtifactPanel._onClickGetZhufu(slot0)
	HeroController:getInstance():openArtifactAwardWindow(true)
end

function ForgeArtifactPanel.DeleteMe(slot0)
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
