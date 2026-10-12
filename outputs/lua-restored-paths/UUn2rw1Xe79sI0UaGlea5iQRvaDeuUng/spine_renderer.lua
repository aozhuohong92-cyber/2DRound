SpineRenderer = SpineRenderer or BaseClass()
slot0 = cc.Director:getInstance():getVisibleSize()
slot1 = table.insert
slot2 = table.remove

function SpineRenderer.__init(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11)
	slot0.scale = slot3 or BattleController:getInstance():getModel():getBattleSpineScale() or 1
	slot0.spine_scale2 = slot11 or 1
	slot0.is_ScaleX = 1
	slot0.spine_type = slot8
	slot0.rev_value = 1
	slot0.active = true
	slot0.hit = false
	slot0.id = autoId()
	slot0.screen_pos = slot1
	slot0.action_name = ""
	slot0.action_res = ""
	slot0.is_in_action = false
	slot0.cache_act_list = {}

	if slot0.spine_type == BattleObjectType.Hallows then
		-- Nothing
	end

	slot0.root = cc.NodeGrid:create()

	slot0.root:setCascadeOpacityEnabled(true)
	slot0.root:setPosition(slot1)
	slot0.root:setAnchorPoint(0.5, 0.5)

	slot0.spine_root = ccui.Widget:create()

	slot0.spine_root:setCascadeOpacityEnabled(true)
	slot0.spine_root:setAnchorPoint(0.5, 0.5)
	slot0.spine_root:setScale(slot0.spine_scale2)

	slot0.spinex_root = ccui.Widget:create()

	slot0.spinex_root:setCascadeOpacityEnabled(true)
	slot0.spinex_root:setAnchorPoint(0.5, 0.5)
	slot0.spinex_root:setScale(slot0.spine_scale2)
	slot0.spinex_root:setPosition(20, 30)

	slot0.hp_root = ccui.Widget:create()

	slot0.hp_root:setCascadeOpacityEnabled(true)

	slot0.top_effect_root = ccui.Widget:create()

	slot0.top_effect_root:setCascadeOpacityEnabled(true)
	slot0.top_effect_root:setAnchorPoint(0.5, 0.5)

	slot0.bottom_effect_root = ccui.Widget:create()

	slot0.bottom_effect_root:setCascadeOpacityEnabled(true)
	slot0.bottom_effect_root:setAnchorPoint(0.5, 0.5)

	slot0.buff_list_item = {}
	slot0.buff_pool_item = {}
	slot0.buff_id_to_icon = {}
	slot0.buff_list_data = {}
	slot0.is_boss = slot9
	slot0.effect_list = {}
	slot0.career = slot6
	slot0.height = 0
	slot0.buff_icon_height = 0
	slot0.isRun = false
	slot0.is_call_ready = false
	slot0.body_spine_name = slot2
	slot0.base_action_name = slot5
	slot0.group = slot7
	slot0.dir = 2
	slot0.role_num = 0
	slot0.ui_hp_width = nil
	slot0.ui_boss_width = nil
	slot0.tiem_scale = 2
	slot0.unit_is_boss = slot10 or 0
	slot0.passive_skill_list = {}
	slot0.passive_skill_pool = {}

	if slot2 ~= nil and slot0.spine_type ~= BattleObjectType.Elfin then
		slot0:removeBody()

		slot0.spine = createArmature(slot2, slot5)

		slot0.spine:setAnchorPoint(0.5, 0)
		slot0.spine:setAnimation(0, slot5, true)

		if slot0.spine_type == BattleObjectType.Hallows then
			slot0.spine_root:addChild(slot0.spinex_root)
			slot0.spinex_root:addChild(slot0.spine)
			slot0.spine:setLocalZOrder(1)
			slot0.spinex_root:setScale(0.35)
		else
			slot0.spine_root:addChild(slot0.spine)
		end
	end

	slot0.root:addChild(slot0.bottom_effect_root, 1)
	slot0.root:addChild(slot0.spine_root, 2)
	slot0.root:addChild(slot0.hp_root, 3)
	slot0.root:addChild(slot0.top_effect_root, 99)
	slot0.root:setScale(slot0.scale)

	slot0.role_height = 120 * slot0.scale
	slot0.is_init = false

	slot0:createHallowsStage()
end

function SpineRenderer.setHallowsScale(slot0)
	slot0.spine:setLocalZOrder(1)
	slot0.spinex_root:setScale(0.35)
end

function SpineRenderer.showSpineModel(slot0, slot1)
	slot0.spine_root:setVisible(slot1)
	slot0.hp_root:setVisible(slot1)
	slot0.top_effect_root:setVisible(slot1)
	slot0.bottom_effect_root:setVisible(slot1)
end

function SpineRenderer.setVisible(slot0, slot1)
	slot0.root:setVisible(slot1)
end

function SpineRenderer.handleGuiHunStatus(slot0, slot1)
	if slot1 == true then
		if slot0.ghost == nil then
			slot0.ghost = createSpineByName("H69001", PlayerAction.battle_stand, slot0.root)

			slot0.ghost:setAnimation(0, PlayerAction.battle_stand, true)
			slot0.ghost:setScaleX(slot0.rev_value)
			slot0.ghost:setPositionY(slot0.role_height * 0.5)
		end
	elseif not tolua.isnull(slot0.ghost) then
		slot0.ghost:removeFromParent()

		slot0.ghost = nil
	end
end

function SpineRenderer.playPassiveSkillName(slot0, slot1, slot2)
	if tolua.isnull(slot0.root) then
		return
	end

	slot3 = nil

	if slot0.play_delaytime == nil then
		slot0.play_delaytime = 0
	end

	slot5 = cc.DelayTime:create(slot0.play_delaytime % 3 * 0.3)
	slot0.play_delaytime = slot0.play_delaytime + 1

	if #slot0.passive_skill_pool > 0 then
		slot3 = uv0(slot0.passive_skill_pool, 1)
	else
		slot3 = createSprite(PathTool.getResFrame("battle", "battle_buff_name_bg"), 0, slot0.role_height * 0.5, slot0.root, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 99)

		slot3:setCascadeOpacityEnabled(true)
		slot3:setOpacity(100)
		slot3:setVisible(false)
		slot3:setScale(0.6)

		slot3.msg = createLabel(20, 217, 218, slot3:getContentSize().width / 2, slot3:getContentSize().height / 2, "", slot3, nil, cc.p(0.5, 0.5))
	end

	doStopAllActions(slot3)
	slot3.msg:setString(slot1)
	slot3:setPosition(0, slot0.role_height * 0.5)
	uv1(slot0.passive_skill_list, slot3)
	slot3:runAction(cc.Sequence:create(slot5, cc.CallFunc:create(function ()
		uv0:setVisible(true)
	end), cc.CallFunc:create(function ()
		uv0()
	end), cc.Spawn:create(cc.ScaleTo:create(0.4, 1.2), cc.MoveBy:create(0.4, cc.p(0, 50)), cc.FadeIn:create(0.4)), cc.Spawn:create(cc.ScaleTo:create(1.1, 0.9), cc.FadeTo:create(1.1, 100), cc.MoveBy:create(1.1, cc.p(0, 75))), cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
		if not tolua.isnull(uv0.root) then
			for slot3, slot4 in ipairs(uv0.passive_skill_list) do
				if slot4 == uv1 then
					uv2(uv0.passive_skill_pool, uv1)
					uv3(uv0.passive_skill_list, slot3)
					uv1:setVisible(false)

					if uv0.play_delaytime and uv0.play_delaytime > 0 then
						uv0.play_delaytime = uv0.play_delaytime - 1
					end

					break
				end
			end
		end
	end)))
end

function SpineRenderer.createHallowsStage(slot0)
	if slot0.spine_type ~= BattleObjectType.Hallows then
		return
	end

	slot0.hallows_round_info = createCSBNote(PathTool.getTargetCSB("battle/battle_hallow_node"))

	slot0.hallows_round_info:setScale(0.8)
	slot0.spine_root:addChild(slot0.hallows_round_info)
	slot0.hallows_round_info:setPosition(0, 0)
	slot0.hallows_round_info:setAnchorPoint(0.5, 0)
	slot0.hallows_round_info:setVisible(true)

	slot1 = slot0.hallows_round_info:getChildByName("container")
	slot2 = PathTool.getResFrame("battle", "battle_10040")

	if slot0.group == BattleGroupTypeConf.TYPE_GROUP_ENEMY then
		slot2 = PathTool.getResFrame("battle", "battle_10036")
	end

	slot0.hallows_progress = cc.ProgressTimer:create(createSprite(slot2, 110, 105, nil, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST))

	slot0.hallows_progress:setMidpoint(cc.p(0, 0))
	slot0.hallows_progress:setBarChangeRate(cc.p(0, 1))
	slot0.hallows_progress:setPosition(10, 18)
	slot0.hallows_progress:setType(cc.PROGRESS_TIMER_TYPE_BAR)

	if slot0.group == BattleGroupTypeConf.TYPE_GROUP_ENEMY then
		slot0.hallows_progress:setScaleX(-1)
	end

	slot1:addChild(slot0.hallows_progress)
end

function SpineRenderer.showHallowsState(slot0, slot1)
	if slot0.hallows_round_info then
		slot0.hallows_round_info:setVisible(slot1)
	end

	if slot0.hallows_progress and slot1 then
		slot0:setHallowsRound(0)
	end
end

function SpineRenderer.setHallowsRound(slot0, slot1, slot2)
	if not slot0.hallows_round_max then
		slot0.hallows_round_max = slot2 or 3
	end

	if not slot0.hallows_progress then
		return
	end

	slot3 = 0

	if (slot1 or 0) == 1 then
		slot3 = 17.8
	elseif slot1 == 2 then
		slot3 = 53.4
	elseif slot1 == 3 then
		slot3 = 100
	end

	slot0.hallows_progress:setPercentage(slot3)
end

function SpineRenderer.createElfinList(slot0)
	if slot0.spine_type ~= BattleObjectType.Elfin then
		return
	end

	slot0.elfin_node = createCSBNote(PathTool.getTargetCSB("battle/battle_elfin_node"))

	if not slot0.elfin_node then
		return
	end

	slot0.elfin_node:setScale(0.8)
	slot0.spine_root:addChild(slot0.elfin_node)
	slot0.elfin_node:setPosition(-5, 3)
	slot0.elfin_node:setAnchorPoint(0.5, 0)
	slot0.elfin_node:setVisible(true)

	slot0.elfin_list = {}

	for slot6 = 1, 4 do
		slot7 = {}
		slot8 = slot0.elfin_node:getChildByName("container"):getChildByName("elfin_" .. slot6)

		if not ElfinController:getInstance():getModel():checkElfinIsOpen(true) then
			registerButtonEventListener(slot8, handler(slot0, slot0.onClickElfinIcon), true)
		end

		slot7.elfin_panel = slot8
		slot7.mask_icon = slot8:getChildByName("mask_icon")
		slot7.effect_icon = slot8:getChildByName("effect_icon")

		slot7.effect_icon:setVisible(false)

		slot7.cd_time_txt = slot8:getChildByName("cd_time_txt")
		slot7.lock_txt = slot8:getChildByName("lock_txt")

		slot7.lock_txt:setString(TI18N("锁"))
		slot8:getChildByName("icon_k"):setLocalZOrder(2)
		uv0(slot0.elfin_list, slot7)

		if slot0.rev_value then
			slot7.cd_time_txt:setScaleX(slot0.rev_value)
			slot7.lock_txt:setScaleX(slot0.rev_value)
		end

		slot7.mask_icon:setLocalZOrder(2)
		slot7.cd_time_txt:setLocalZOrder(2)
		slot7.lock_txt:setLocalZOrder(2)
		slot7.mask_icon:setVisible(false)
		slot7.cd_time_txt:setVisible(false)
		slot7.lock_txt:setVisible(true)
	end
end

function SpineRenderer.onClickElfinIcon(slot0)
	ElfinController:getInstance():getModel():checkElfinIsOpen()
end

function SpineRenderer.showElfinSkillIcon(slot0, slot1, slot2)
	if not slot0.elfin_node then
		slot0:createElfinList()
	end

	slot0.elfin_node:setVisible(true)

	if not slot0.elfin_list then
		return
	end

	slot0.all_elfin_data = slot1 or {}

	if next(slot0.all_elfin_data) ~= nil then
		for slot6 = 1, 4 do
			slot7 = slot0.elfin_list[slot6]

			if slot0:getElfinDataByPos(slot6) then
				if (slot8.item_bid or 0) == 0 then
					if slot7.clipNode then
						slot7.clipNode:setVisible(false)
					end

					slot7.mask_icon:setVisible(false)
					slot7.cd_time_txt:setVisible(false)
					slot7.lock_txt:setVisible(false)
				else
					if Config.SpriteData.data_elfin_data(slot9) and slot10.skill and Config.SkillData.data_get_skill(slot10.skill) then
						slot7.skill_bid = slot10.skill

						if not slot7.clipNode then
							slot7.mask_bg = createSprite(PathTool.getResFrame("battle", "battle_10043"), 29, 29.5, nil, cc.p(0.5, 0.5))
							slot7.clipNode = cc.ClippingNode:create(slot7.mask_bg)

							slot7.clipNode:setAnchorPoint(cc.p(0.5, 0.5))
							slot7.clipNode:setContentSize(cc.size(58, 59))
							slot7.clipNode:setCascadeOpacityEnabled(true)
							slot7.clipNode:setPosition(29, 29.5)
							slot7.clipNode:setAlphaThreshold(0)
							slot7.elfin_panel:addChild(slot7.clipNode, 1)

							slot7.elfin_icon = createImage(slot7.clipNode, PathTool.getSkillRes(slot11.icon), 29, 29.5, cc.p(0.5, 0.5), false)

							slot7.elfin_icon:setScale(0.45)
						elseif slot7.elfin_icon then
							slot7.elfin_icon:loadTexture(slot12, LOADTEXT_TYPE)
						end
					end

					if slot7.clipNode then
						slot7.clipNode:setVisible(true)
					end

					slot7.mask_icon:setVisible(false)
					slot7.cd_time_txt:setVisible(true)
					slot7.cd_time_txt:setString("")
					slot7.lock_txt:setVisible(false)
				end
			else
				if slot7.clipNode then
					slot7.clipNode:setVisible(false)
				end

				slot7.mask_icon:setVisible(false)
				slot7.cd_time_txt:setVisible(false)
				slot7.lock_txt:setVisible(true)
			end
		end

		if slot2 then
			slot0:updateElfinSkillState(slot2)
		end
	elseif slot0.elfin_node then
		slot0.elfin_node:setVisible(false)
	end
end

function SpineRenderer.updateElfinSkillState(slot0, slot1)
	if not slot0.elfin_node then
		slot0:createElfinList()
	end

	slot0.elfin_node:setVisible(true)

	if not slot0.elfin_list then
		return
	end

	for slot5, slot6 in pairs(slot1 or {}) do
		for slot12, slot13 in pairs(slot0.elfin_list) do
			if slot13.skill_bid == slot6.skill_bid then
				if slot6.end_round - BattleController:getInstance():getModel():getFightActionCount() <= 0 then
					slot13.mask_icon:setVisible(false)
					slot13.cd_time_txt:setVisible(false)

					break
				end

				slot13.cd_time_txt:setString(slot15)
				slot13.mask_icon:setVisible(true)
				slot13.cd_time_txt:setVisible(true)

				break
			end
		end
	end
end

function SpineRenderer.showElfinSkillIconAni(slot0, slot1)
	if not slot0.elfin_node then
		slot0:createElfinList()
	end

	slot0.elfin_node:setVisible(true)

	if not slot0.elfin_list then
		return
	end

	slot2 = false

	for slot6, slot7 in pairs(slot0.elfin_list) do
		if slot7.skill_bid == slot1 then
			slot2 = true

			slot7.effect_icon:setVisible(true)
			slot7.effect_icon:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeOut:create(0.3), cc.FadeIn:create(0.3))))
			slot7.elfin_panel:runAction(cc.Sequence:create(cc.DelayTime:create(2), cc.CallFunc:create(function ()
				uv0.effect_icon:stopAllActions()
				uv0.effect_icon:setVisible(false)
			end)))

			break
		end
	end
end

function SpineRenderer.getElfinDataByPos(slot0, slot1)
	if not slot0.all_elfin_data then
		return
	end

	for slot5, slot6 in pairs(slot0.all_elfin_data) do
		if slot6.pos == slot1 then
			return slot6
		end
	end
end

function SpineRenderer.setColor(slot0, slot1, slot2, slot3)
	if slot0.spine then
		slot0.spine:setColor(cc.c3b(slot1, slot2, slot3))
	end
end

function SpineRenderer.setOpacity(slot0, slot1)
	slot0.spine_root:setOpacity(slot1)
end

function SpineRenderer.setupUI(slot0, slot1, slot2, slot3, slot4)
	slot6 = slot2 or 0
	slot9 = (slot4 or {}).crystal or 0
	slot0.height = slot0.role_height + 20
	slot0.model_x_fix = slot0.model_x_fix
	slot0.model_y_fix = slot0.model_y_fix

	if slot0.shadow == nil and slot0.spine_type ~= BattleObjectType.Hallows and slot0.spine_type ~= BattleObjectType.Elfin then
		slot0.shadow = createSprite(PathTool.getResFrame("common", "common_30009"), 0, 0, slot0.spine_root, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, -2)

		slot0.shadow:setScaleX(1)
	end

	if (not BattleController:getInstance():getIsNoramalBattle() or slot1 == BattleGroupTypeConf.TYPE_GROUP_ENEMY) and slot0.ui_hp == nil and slot0.spine_type ~= BattleObjectType.Hallows and slot0.spine_type ~= BattleObjectType.Elfin then
		slot0.is_init = true

		slot0:updateNormalHpUI(slot0.hp_root, 59, 6, slot1)
		slot0.hp_root:setPosition(0, slot7 + 6)

		if slot0.is_boss == TRUE then
			slot0:showBossEffect(true)
		else
			slot0:showBossEffect(false)
		end

		if not BattleController:getInstance():getIsNoramalBattle() then
			slot11 = createSprite(PathTool.getResFrame("battle", "battle_lev_bg"), -18, 8, slot0.hp_root, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

			slot11:setCascadeOpacityEnabled(true)
			createSprite(PathTool.getHeroCampTypeIcon(slot3), 5, 12, slot11, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 3):setScale(0.45)

			slot13 = createWithSystemFont(slot6, DEFAULT_FONT, 14)

			slot13:setPosition(21, 15)
			slot13:enableOutline(Config.ColorData.data_color4[2], 1)
			slot13:setAnchorPoint(cc.p(0, 0.5))

			if slot9 > 0 then
				slot13:setTextColor(cc.c4b(75, 255, 232))
			end

			slot11:addChild(slot13, 99)
		end
	end
end

function SpineRenderer.updateResonate(slot0, slot1)
	if slot1 == TRUE then
		if slot0.resonate_icon == nil then
			slot0.resonate_icon = createSprite(PathTool.getResFrame("common", "common_2037"), 7, 11, slot0.hp_root, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
		end
	elseif slot0.resonate_icon then
		slot0.resonate_icon:removeFromParent()

		slot0.resonate_icon = nil
	end
end

function SpineRenderer.showBossEffect(slot0, slot1)
	if not tolua.isnull(slot0.boss_effect) then
		slot0.boss_effect:setVisible(false)
		slot0.boss_effect:removeFromParent()

		slot0.boss_effect = nil
	end

	if slot1 == true then
		slot0.boss_effect = createSpineByName(Config.EffectData.data_effect_info[244])

		slot0.boss_effect:setAnimation(0, PlayerAction.action, true)

		if slot0.height then
			slot2:setPosition(0, 0)
		end

		slot2:setVisible(slot1)
		slot0.spine_root:addChild(slot2, -1)
	end
end

function SpineRenderer.updateNormalHpUI(slot0, slot1, slot2, slot3, slot4)
	if slot1 then
		slot5 = 1

		if slot0.ui_hp_width then
			slot5 = slot2 / slot0.ui_hp_width
		end

		slot6 = PathTool.getResFrame("battle", "battle_hp")

		if BattleController:getInstance():getModel():changeGroup(slot4) == BattleGroupTypeConf.TYPE_GROUP_ENEMY and BattleController:getInstance():getIsNoramalBattle() then
			slot6 = PathTool.getResFrame("battle", "battle_enemy_bg")
		end

		slot8 = createScale9Sprite(PathTool.getResFrame("battle", "battle_hp_bg"), 0, 1, LOADTEXT_TYPE_PLIST, slot1)

		slot8:setCapInsets(cc.rect(3, 4, 1, 1))
		slot8:setContentSize(cc.size(61, 8))

		slot0.ui_hp = ccui.LoadingBar:create()

		slot0.ui_hp:setCascadeOpacityEnabled(true)
		slot0.ui_hp:setScale9Enabled(true)
		slot0.ui_hp:setScaleX(slot5)
		slot0.ui_hp:setAnchorPoint(cc.p(0, 0.5))
		slot0.ui_hp:setPosition(-30, 1)
		slot0.ui_hp:setContentSize(cc.size(slot2, slot3))
		slot0.ui_hp:setCapInsets(cc.rect(2, 3, 1, 1))
		slot0.ui_hp:loadTexture(slot6, LOADTEXT_TYPE_PLIST)
		slot1:addChild(slot0.ui_hp, 3)

		slot0.ui_hp2 = cc.ProgressTimer:create(createSprite(PathTool.getResFrame("battle", "battle_injury_hp"), 0, 0, nil, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST))

		slot0.ui_hp2:setPosition(-30, 1)
		slot0.ui_hp2:setOpacity(255)
		slot0.ui_hp2:setPercentage(100)
		slot0.ui_hp2:setScaleX(slot5)
		slot0.ui_hp2:setType(cc.PROGRESS_TIMER_TYPE_BAR)
		slot0.ui_hp2:setBarChangeRate(cc.p(1, 0))
		slot0.ui_hp2:setAnchorPoint(cc.p(0, 0.5))
		slot0.ui_hp2:setMidpoint(cc.p(0, 0))
		slot1:addChild(slot0.ui_hp2, 2)

		if BattleController:getInstance():getIsNoramalBattle() then
			slot0.ui_hp:setScale(slot5 * -1)
			slot0.ui_hp:setPosition(30, 1)
			slot0.ui_hp2:setScaleX(slot5 * -1)
			slot0.ui_hp2:setPosition(30, 1)
		end

		slot0.ui_hp:setName("hp_bar")
	end
end

function SpineRenderer.playFontMessage(slot0, slot1, slot2, slot3, slot4, slot5)
	slot5 = slot5 or 0
	slot6 = nil

	function slot7()
		if not tolua.isnull(uv0) then
			uv0:setVisible(false)
			uv0:runAction(cc.RemoveSelf:create())
		end
	end

	if not tolua.isnull((not slot3 or createSprite(slot1)) and createWithSystemFont(slot1, DEFAULT_FONT, 36)) then
		slot6:setOpacity(0)

		if not slot3 then
			slot6:setColor(Config.ColorData.data_color3[227])
			slot6:enableOutline(Config.ColorData.data_color3[228], 2)
			slot6:setScale(0.6)
		end

		slot8 = cc.FadeIn:create(0.2)
		slot9 = cc.MoveBy:create(0.5, cc.p(0, 32))
		slot10 = cc.Hide:create()

		if slot4 then
			slot4:addChild(slot6, BATTLE_VIEW_TOP)

			slot11 = cc.p(slot0.root:getPosition())

			slot6:setPosition(slot11.x, slot11.y + slot0.role_height + 10 + slot5)
		else
			slot6:setPosition(0, slot0.role_height + 10 + slot5)
			slot0.spine_root:addChild(slot6, 2)
		end

		if slot2 ~= nil then
			slot6:runAction(cc.Sequence:create(cc.DelayTime:create(slot2), cc.Spawn:create(slot9, slot8), slot10, cc.CallFunc:create(slot7)))
		else
			slot6:runAction(cc.Sequence:create(slot11, slot10, cc.CallFunc:create(slot7)))
		end
	end
end

function SpineRenderer.reConnectUpdate(slot0, slot1, slot2)
	slot0:setHpPercent(math.min(math.max(100 * slot1 / slot2, 0), 100))
end

function SpineRenderer.createBuffItem(slot0, slot1)
	slot2 = nil

	if #slot0.buff_pool_item > 0 then
		slot2 = table.remove(slot0.buff_pool_item, 1)
		slot2.num = 0
		slot2.path = ""
	else
		slot3 = createSprite(nil, 0, 0, slot1, cc.p(0.5, 0.5), nil, 5)

		slot3:setCascadeOpacityEnabled(true)

		slot4 = createLabel(14, Config.ColorData.data_color4[1], nil, 17, -2, 0, slot3)

		slot4:setAnchorPoint(1, 0)
		slot4:enableOutline(Config.ColorData.data_color4[2], 1)

		slot2 = {
			icon = slot3,
			label = slot4,
			path = ""
		}
	end

	slot2.icon:setVisible(true)

	return slot2
end

function SpineRenderer.updataBuffList(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	slot3 = table.insert
	slot0.buff_id_to_icon = {}
	slot0.buff_list_data = {}
	slot4 = {}

	for slot8, slot9 in pairs(slot1) do
		if Config.SkillData.data_get_buff[slot9.bid] and slot10.icon ~= nil and slot10.icon ~= 0 then
			if slot0.buff_list_data[slot10.icon] == nil then
				slot0.buff_list_data[slot11] = {
					num = 0,
					res_id = slot11,
					list = {}
				}
			end

			if slot0.buff_list_data[slot11].num == 0 or slot10.join_type and slot10.join_type ~= 3 then
				slot0.buff_list_data[slot11].num = slot0.buff_list_data[slot11].num + 1

				if slot10.group then
					slot4[slot10.group] = true
				end
			elseif slot10.join_type and slot10.join_type == 3 and slot10.group and not slot4[slot10.group] then
				slot4[slot10.group] = true
				slot0.buff_list_data[slot11].num = slot0.buff_list_data[slot11].num + 1
			end

			slot3(slot0.buff_list_data[slot11].list, slot9.id)

			slot0.buff_id_to_icon[slot9.id] = slot11
		end
	end

	slot5 = {}

	for slot9, slot10 in pairs(slot0.buff_list_data) do
		slot3(slot5, slot10)
	end

	table.sort(slot5, function (slot0, slot1)
		return slot0.res_id < slot1.res_id
	end)

	for slot10 = 1, math.min(4, #slot5) do
		if slot5[slot10] then
			if slot0.buff_list_item[slot11.res_id] == nil then
				slot0.buff_list_item[slot11.res_id] = slot0:createBuffItem(slot0.hp_root)
			end

			slot12.label:setString(slot11.num)
			slot12.icon:setPosition(-20 + (slot10 - 1) % 3 * 22, -14 - 22 * math.floor((slot10 - 1) / 3))

			if slot12.path ~= PathTool.getBuffRes(slot11.res_id) then
				slot12.path = slot14

				loadSpriteTexture(slot12.icon, slot14, LOADTEXT_TYPE)
			end
		end
	end
end

function SpineRenderer.removeBuffIcon(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.buff_id_to_icon[slot1] == nil then
		return
	end

	if slot0.buff_list_item[slot2] == nil then
		return
	end

	if slot0.buff_list_data[slot2] == nil then
		return
	end

	for slot8, slot9 in ipairs(slot4.list) do
		if slot9 == slot1 then
			slot4.num = slot4.num - 1

			table.remove(slot4.list, slot8)

			break
		end
	end

	if slot4.num <= 0 then
		table.insert(slot0.buff_pool_item, slot3)
		slot3.icon:setVisible(false)

		slot0.buff_list_item[slot2] = nil
	else
		slot3.label:setString(slot4.num)
	end
end

function SpineRenderer.cleanAllBuffIcon(slot0)
	slot1 = table.insert

	for slot5, slot6 in pairs(slot0.buff_list_item) do
		if slot6.icon then
			slot6.icon:setVisible(false)
		end

		slot1(slot0.buff_pool_item, slot6)
	end

	slot0.buff_list_item = {}
end

function SpineRenderer.setHpPercent(slot0, slot1, slot2)
	if tolua.isnull(slot0.ui_hp) or tolua.isnull(slot0.ui_hp2) then
		return
	end

	slot0.ui_hp:setPercent(slot1)

	if slot0.is_boss == TRUE then
		GlobalEvent:getInstance():Fire(BattleEvent.Battle_Boss_Hp_Event, {
			show_type = 3,
			percent = slot1
		})
	end

	if slot0.ui_hp2:getPercentage() <= slot1 then
		slot0.ui_hp2:stopAllActions()
		slot0.ui_hp2:setPercentage(slot1)
	elseif slot2 then
		slot0.ui_hp2:stopAllActions()
		slot0.ui_hp2:setPercentage(slot1)
	else
		if slot0.target_percent and slot0.target_percent == slot1 then
			return
		end

		slot3 = BattleController:getInstance():getActTime("hp_effect_time")

		if slot0.ui_hp2:getPercentage() - slot1 >= 60 then
			slot3 = 0.3
		end

		slot0.target_percent = slot1

		slot0.ui_hp2:stopAllActions()
		slot0.ui_hp2:runAction(cc.Sequence:create(cc.ProgressTo:create(slot3, slot1), cc.CallFunc:create(function ()
			uv0.target_percent = nil
		end)))
	end
end

function SpineRenderer.showHpRoot(slot0, slot1)
	if slot1 then
		if not tolua.isnull(slot0.hp_root) then
			slot0.hp_root:setVisible(true)
		end

		if not tolua.isnull(slot0.shadow) then
			slot0.shadow:setVisible(true)
		end

		if slot0.buff_list_item then
			for slot5, slot6 in pairs(slot0.buff_list_item) do
				if slot6.icon then
					slot6.icon:setVisible(true)
				end
			end
		end
	else
		if not tolua.isnull(slot0.hp_root) then
			slot0.hp_root:setVisible(false)
		end

		if not tolua.isnull(slot0.shadow) then
			slot0.shadow:setVisible(false)
		end

		if slot0.buff_list_item then
			for slot5, slot6 in pairs(slot0.buff_list_item) do
				if slot6 and slot6.icon then
					slot6.icon:setVisible(false)
				end
			end
		end
	end
end

function SpineRenderer.setPosByGrid(slot0, slot1)
	if not tolua.isnull(slot0.root) then
		slot0.root:setPosition(gridPosToScreenPos(slot1))
	end
end

function SpineRenderer.getPosition(slot0)
	return cc.p(slot0.root:getPosition())
end

function SpineRenderer.doRun(slot0)
	if slot0.isRun then
		return
	end

	slot0.isRun = true

	slot0:playActionOnce(PlayerAction.run)
end

function SpineRenderer.doStand(slot0, slot1)
	if not slot0.isRun then
		return
	end

	slot0.isRun = false

	slot0:playActionOnce(PlayerAction.battle_stand)

	if not slot1 then
		BattleController:getInstance():getModel():addReadySum()
	else
		BattleController:getInstance():getNormalModel():addReadyNum()
	end
end

function SpineRenderer.playActionOnce(slot0, slot1, slot2)
	slot1 = slot1 or PlayerAction.battle_stand
	slot0.base_action_name = slot1

	slot0:_createSpineByName(slot1, slot2 or slot0.body_spine_name)
end

function SpineRenderer._createSpineByName(slot0, slot1, slot2)
	if slot2 ~= nil and slot2 ~= " " then
		slot0:createBody(slot2, slot1)
	end
end

function SpineRenderer.createBody(slot0, slot1, slot2)
	slot0:removeBody()

	slot0.body_spine_name = slot1
	slot0.body_action_name = slot2
	slot0.spine = slot0:createSpine(slot0.body_spine_name, slot0.body_action_name, true)

	if not tolua.isnull(slot0.spine) then
		if slot0.spine_type == BattleObjectType.Hallows then
			slot0.spinex_root:addChild(slot0.spine)
		else
			slot0.spine_root:addChild(slot0.spine)
		end
	end

	if slot0.spine_type == BattleObjectType.Hallows then
		slot0.spine:setLocalZOrder(1)
		slot0.spinex_root:setScale(0.35)
	end
end

function SpineRenderer.createSpine(slot0, slot1, slot2, slot3)
	if not tolua.isnull(createArmature(slot1, slot2)) then
		slot4:setAnimation(0, slot2, slot3)
		slot4:setToSetupPose()
	end

	return slot4
end

function SpineRenderer.createEncircleEffect(slot0, slot1)
	if slot1 == nil or slot1 == "" then
		return
	end

	if slot0.encircle_effect_path == slot1 then
		return
	end

	if tolua.isnull(slot0.spine_root) then
		return
	end

	slot0.encircle_effect_path = slot1

	if slot0.encircle_effect then
		slot0.encircle_effect:removeFromParent()

		slot0.encircle_effect = nil
	end

	slot0.encircle_effect = createSpineByName(slot1)

	slot0.encircle_effect:setAnimation(0, PlayerAction.action, true)
	slot0.spine_root:addChild(slot0.encircle_effect, 2)

	if slot0.spine_scale2 < 1 then
		slot0.encircle_effect:setScale(1 / slot0.spine_scale2)
	end
end

function SpineRenderer.removeBody(slot0)
	if not tolua.isnull(slot0.spine) then
		slot0.spine:setVisible(false)
		slot0.spine:clearTracks()
		slot0.spine:removeFromParent()
	end

	slot0.spine = nil
	slot0.body_action_name = nil
	slot0.spine_body_name = nil
end

function SpineRenderer.addToLayer(slot0, slot1, slot2)
	if tolua.isnull(slot1) or tolua.isnull(slot0.root) then
		return
	end

	if slot2 == nil then
		slot1:addChild(slot0.root, cc.Director:getInstance():getWinSize().height - cc.p(slot0.root:getPosition()).y)
	else
		slot1:addChild(slot0.root, slot2)
	end
end

function SpineRenderer.reverse(slot0, slot1)
	if tolua.isnull(slot0.spine_root) then
		return
	end

	if slot0.rev_value == (slot1 or -1) then
		return
	end

	slot0.rev_value = slot1

	slot0.spine_root:setScaleX(slot1 * slot0.spine_scale2)

	if slot0.elfin_list and next(slot0.elfin_list) ~= nil then
		for slot5, slot6 in pairs(slot0.elfin_list) do
			slot6.cd_time_txt:setScaleX(slot1)
			slot6.lock_txt:setScaleX(slot1)
		end
	end
end

function SpineRenderer.setScale(slot0, slot1, slot2, slot3, slot4)
	slot0:runAction(cc.Sequence:create(cc.ScaleTo:create(slot2 / 2, slot1), cc.DelayTime:create(slot3), cc.ScaleTo:create(slot4 / 2, slot0.scale)))
end

function SpineRenderer.release(slot0, slot1, slot2)
	slot4 = nil

	if slot1 then
		slot4 = cc.Sequence:create(cc.CallFunc:create(function ()
			if uv0.spine then
				uv0.spine:runAction(cc.FadeOut:create(uv1))
			end
		end), cc.DelayTime:create(slot2 == 0 and 0.1 or 0.5))
	end

	if not tolua.isnull(slot0.root) then
		slot0.root:runAction(cc.Sequence:create(slot4, cc.CallFunc:create(function ()
			if uv0.spine then
				uv0.spine:setVisible(false)
				uv0.spine:clearTracks()
				uv0.spine:removeFromParent()
			end

			uv0.spine_root:setVisible(false)
			uv0.spine_root:removeAllChildren()
			uv0.root:setVisible(false)

			if uv0.root:getParent() then
				uv0.root:removeFromParent()
			end

			uv0.root:removeAllChildren()
		end)))
	end
end

function SpineRenderer.realrelease(slot0, slot1)
	if slot1 and not tolua.isnull(slot0.spine_root) then
		slot0.spine_root:runAction(cc.FadeOut:create(0.5))
	end
end

function SpineRenderer.playSkillDeath(slot0)
	slot0.root:setVisible(false)
end

function SpineRenderer.setBlack(slot0, slot1)
	if not BattleController:getInstance():isInFight() then
		return
	end

	if slot0.is_die then
		return
	end

	slot2 = color1 or cc.c3b(128, 128, 128)
	slot3 = color2 or cc.c3b(255, 255, 255)

	if slot1 then
		slot0.black_type = "setBlack"
		slot6 = slot0.spine_root
		slot8 = slot6

		for slot7, slot8 in pairs(slot6.getChildren(slot8)) do
			slot8:setColor(slot2)
		end
	else
		slot0.black_type = nil
		slot6 = slot0.spine_root
		slot8 = slot6

		for slot7, slot8 in pairs(slot6.getChildren(slot8)) do
			slot8:setColor(slot3)
		end
	end
end

function SpineRenderer.setBlack2(slot0, slot1)
	if not BattleController:getInstance():isInFight() then
		return
	end

	if slot0.is_die then
		return
	end

	if slot1 then
		slot0.black_type = "setBlack2"

		slot0.root:setVisible(false)
	elseif not slot0.is_die then
		slot0.black_type = nil

		slot0.root:setVisible(true)
	end
end

function SpineRenderer.setBlackDie(slot0, slot1)
	if not BattleController:getInstance():isInFight() then
		return
	end

	slot2 = cc.c3b(110, 110, 110)
	slot3 = cc.c3b(255, 255, 255)

	if slot1 then
		slot0.black_type = "setBlackDie"
		slot6 = slot0.spine_root
		slot8 = slot6

		for slot7, slot8 in pairs(slot6.getChildren(slot8)) do
			slot8:setColor(slot2)
		end
	else
		slot0.black_type = nil
		slot6 = slot0.spine_root
		slot8 = slot6

		for slot7, slot8 in pairs(slot6.getChildren(slot8)) do
			slot8:setColor(slot3)
		end
	end
end

function SpineRenderer.showEffect(slot0, slot1)
	if not tolua.isnull(slot0.role_effect) then
		slot0.role_effect:setVisible(false)
		slot0.role_effect:removeFromParent()

		slot0.role_effect = nil
	end

	if slot1 == true then
		slot0.role_effect = createSpineByName(Config.EffectData.data_effect_info[109])

		slot0.role_effect:setAnimation(0, PlayerAction.action, false)

		if slot0.height then
			slot2:setPosition(0, 0)
		end

		slot2:setVisible(slot1)
		slot0.spine_root:addChild(slot2)
	end
end

function SpineRenderer.showTargetEffect(slot0, slot1)
end

function SpineRenderer.getSpineName(slot0)
	return slot0.spine_name
end

function SpineRenderer.addChild(slot0, ...)
	if not tolua.isnull(slot0.spine_root) and slot0.spine_root then
		slot0.spine_root:addChild(...)
	end
end

function SpineRenderer.setActionName(slot0, slot1, slot2)
	slot0.action_name = slot1
	slot0.action_res = slot2 == nil and slot1 or slot2
end

function SpineRenderer.getActionName(slot0)
	return slot0.action_name
end

function SpineRenderer.getActionRes(slot0)
	return slot0.action_res
end

function SpineRenderer.runAction(slot0, slot1)
	if slot1 == nil then
		return
	end

	if not tolua.isnull(slot0.root) then
		slot0.root:runAction(slot1)
	end
end

function SpineRenderer.__delete(slot0)
	for slot4, slot5 in ipairs(slot0.passive_skill_list) do
		doStopAllActions(slot5)
	end

	slot0.passive_skill_list = nil

	for slot4, slot5 in ipairs(slot0.passive_skill_pool) do
		doStopAllActions(slot5)
	end

	slot0.passive_skill_pool = nil

	doStopAllActions(slot0.root)

	if not tolua.isnull(slot0.shadow) then
		slot0.shadow:removeFromParent()

		slot0.shadow = nil
	end

	if not tolua.isnull(slot0.role_effect) then
		slot0.role_effect:removeFromParent()

		slot0.role_effect = nil
	end

	if not tolua.isnull(slot0.boss_effect) then
		slot0.boss_effect:removeFromParent()

		slot0.boss_effect = nil
	end

	if not tolua.isnull(slot0.spine) then
		slot0.spine:setVisible(false)
		slot0.spine:clearTracks()
		slot0.spine:removeFromParent()
	end

	if slot0.hallows_stage then
		slot0.hallows_stage:removeFromParent()

		slot0.hallows_stage = nil
	end

	slot0.spine = nil
	slot0.ui_hp = nil
	slot0.ui_hp2 = nil
	slot0.buff_list_item = nil
	slot0.skill_button = {}
	slot0.skill_type_list = {}

	if not tolua.isnull(slot0.spine_root) then
		slot0.spine_root:removeAllChildren()
	end

	if not tolua.isnull(slot0.root) then
		slot0.root:removeAllChildren()
	end

	if slot0.root:getParent() then
		slot0.root:removeFromParent()
	end
end
