BattleMvpView = BattleMvpView or BaseClass(BaseView)

function BattleMvpView.__init(slot0, slot1)
	slot0.win_type = WinType.Mini
	slot0.layout_name = "battle/battle_mvp_view"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battlemvp", "battlemvp"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("battle", "battle"),
			type = ResourcesType.plist
		}
	}
	slot0.is_csb_action = true
	slot0.ani_isover = false
	slot0.item_list = {}

	slot0:setData(slot1)
end

function BattleMvpView.setData(slot0, slot1)
	slot1 = slot1 or {}
	slot0.data = slot1
	slot0.result = slot1.result
	slot0.reward_list = slot1.item_rewards or {}
	slot0.fight_type = slot1.combat_type or BattleConst.Fight_Type.Darma
	slot0.partner_bid = slot1.partner_bid or 0
	slot0.use_skin = slot1.use_skin or 0
	slot0.partner_hurt = slot1.partner_hurt or 0
	slot0.partner_total_hurt = slot1.partner_total_hurt or 0
	slot0.role_exp = slot1.exp or 0
	slot0.role_lv = slot1.lev or 1
	slot0.role_nowlv = slot1.new_lev or 1
	slot0.role_nowexp = slot1.new_exp or 0
end

function BattleMvpView.open_callback(slot0)
	playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("container")

	slot0.main_container:setLocalZOrder(1)

	slot1 = slot0.main_container:getPositionY()
	slot0.containerSize = slot0.main_container:getContentSize()
	slot3 = RoleController:getInstance():getRoleVo()
	slot0.offset_y = display.getTop(slot0.root_wnd) - CC_DESIGN_RESOLUTION.height

	slot0.main_container:setPositionY(414 + slot0.offset_y)
	slot0.main_container:setOpacity(0)
	slot0.main_container:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(0, 200)), cc.FadeIn:create(0.2)))

	slot0.pic_mvp = slot0.root_wnd:getChildByName("pic_mvp")

	slot0.pic_mvp:setLocalZOrder(1)
	slot0.pic_mvp:setPosition(cc.p(-300, 1155 + slot0.offset_y))
	slot0.pic_mvp:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(300, 0)), cc.FadeIn:create(0.2)))

	slot0.pic_bg = slot0.root_wnd:getChildByName("pic_bg")

	slot0.pic_bg:setPosition(cc.p(-300, 1010 + slot0.offset_y))
	slot0.pic_bg:runAction(cc.Spawn:create(cc.MoveBy:create(0.3, cc.p(300, 0)), cc.FadeIn:create(0.3)))
	slot0.main_container:getChildByName("main_bg"):setContentSize(cc.size(720, 525 + slot0.offset_y))

	slot0.auto_combat_num = slot0.main_container:getChildByName("auto_combat_num")

	slot0.auto_combat_num:setVisible(false)

	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 456, "", slot0.main_container, nil, cc.p(0.5, 0.5))

	if Config.BattleBgData.data_fight_name[slot0.fight_type] then
		slot0.fight_text:setString(TI18N("当前战斗：") .. slot6)
	end

	slot0.time_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(slot2.width / 2, -110 - slot0.offset_y), nil, , 1000)

	slot0.time_label:setString(TI18N("10秒后关闭"))
	slot0.time_label:setVisible(false)
	slot0.main_container:addChild(slot0.time_label)

	slot0.comfirm_btn = createButton(slot0.main_container, TI18N("确定"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot0.comfirm_btn:setPosition(slot0.main_container:getContentSize().width / 2 - 170, -56 - slot0.offset_y)
	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:onCloseBtn()
		end
	end)

	if (Config.BattleBgData.data_back_limit[slot0.fight_type] or 0) <= slot3.lev then
		slot0.cancel_btn = createButton(slot0.main_container, TI18N("返回玩法"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1018"), 24, Config.ColorData.data_color4[1])

		slot0.cancel_btn:setPosition(slot0.main_container:getContentSize().width / 2 + 170, -56 - slot0.offset_y)
		slot0.cancel_btn:enableOutline(Config.ColorData.data_color4[263], 2)
		slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if uv0.ani_isover then
					BattleResultReturnMgr:returnByFightType(uv0.fight_type)
				end

				uv0:onCloseBtn()
			end
		end)
	else
		slot0.comfirm_btn:setPositionX(slot0.main_container:getContentSize().width / 2)
	end

	slot0.harm_btn = slot0.main_container:getChildByName("harm_btn")

	if slot0.data and next(slot0.data) ~= nil then
		slot0.harm_btn:setVisible(true)
	else
		slot0.harm_btn:setVisible(false)
	end

	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))

	slot8 = createRichLabel(22, 31, cc.p(0.5, 0.5), cc.p(slot2.width / 2, 305), nil, , 1000)

	slot8:setString(TI18N("获得物品"))
	slot0.main_container:addChild(slot8)
	createSprite(PathTool.getResFrame("common", "common_1094"), 330, 320, slot0.main_container, cc.p(0, 1)):setScaleX(-1)

	slot10 = createSprite(PathTool.getResFrame("common", "common_1094"), 390, 320, slot0.main_container, cc.p(0, 1))
	slot0.progressBg = slot0.main_container:getChildByName("sprite_3")
	slot0.proBgSize = slot0.progressBg:getContentSize()
	slot0.progress = ccui.LoadingBar:create()

	slot0.progress:setAnchorPoint(cc.p(0, 0.5))
	slot0.progress:loadTexture(PathTool.getResFrame("battlemvp", "battlemvp_1004"), LOADTEXT_TYPE_PLIST)
	slot0.progress:setPosition(cc.p(0, slot0.proBgSize.height / 2))
	slot0.progress:setPercent(0)
	slot0.progressBg:addChild(slot0.progress)

	slot0.proBar = createImage(slot0.progressBg, PathTool.getResFrame("battlemvp", "battlemvp_1005"), 0, slot0.proBgSize.height / 2, cc.p(1, 0.5), true)
	slot0.proTxt = createLabel(18, cc.c3b(255, 255, 255), nil, slot0.proBgSize.width / 2, slot0.proBgSize.height / 2, "", slot0.progressBg, nil, cc.p(0.5, 0.5))

	slot0.proTxt:enableOutline(cc.c3b(0, 0, 0), 1)
	slot0.proBar:setPosition(cc.p(slot0.proBgSize.width * 0 / 100 + 2, slot0.proBgSize.height / 2))
	slot0.progressBg:setVisible(false)
	delayRun(slot0.root_wnd, 0.3, function ()
		uv0:showProgressEffect()
	end)

	slot12 = slot0.main_container:getChildByName("sprite_2")
	slot13 = slot12:getContentSize()
	slot0.head_icon = PlayerHead.new(PlayerHead.type.circle)

	slot0.head_icon:setPosition(slot13.width / 2, slot13.height / 2)
	slot0.head_icon:setHeadRes(slot3.face_id, false, LOADTEXT_TYPE, slot3.face_file, slot3.face_update_time)
	slot0.head_icon:setScale(0.8)
	slot12:addChild(slot0.head_icon)

	slot0.roleLvTxt = createLabel(24, cc.c3b(255, 232, 183), nil, 0, slot0.proBgSize.height + 2, string.format("Lv.%d", slot0.role_nowlv), slot0.progressBg, nil, cc.p(0, 0))

	slot0.pic_bg:setLocalZOrder(1)

	slot16 = Config.PartnerSkinData.data_skin_info[slot0.use_skin]

	if Config.PartnerData.data_partner_base[slot0.partner_bid] then
		slot18 = nil
		slot19 = slot0.pic_bg:getPositionY()
		slot0.roleNameTxt = createLabel(38, cc.c3b(255, 224, 80), nil, -300, slot19 + 15, slot15.name, slot0.root_wnd, nil, cc.p(0, 0))

		slot0.roleNameTxt:setLocalZOrder(1)
		slot0.roleNameTxt:enableOutline(cc.c3b(168, 16, 0), 1)
		slot0.roleNameTxt:runAction(cc.MoveTo:create(0.5, cc.p(30, slot19 + 15)))

		if not slot0.bust_load then
			slot0.bust_load = createResourcesLoad(PathTool.getPartnerBustRes((not slot16 or slot16.bustid) and slot15.bustid), ResourcesType.single, function ()
				if not uv0.bustIcon then
					uv0.bustIcon = createImage(uv0.root_wnd, uv1, 740, 860 + uv0.offset_y, cc.p(0, 0), false, 0, false)

					uv0.bustIcon:ignoreContentAdaptWithSize(true)
					uv0.bustIcon:runAction(cc.MoveTo:create(0.2, cc.p(0, 860 + uv0.offset_y)))
				end
			end, slot0.bust_load)
		end
	end

	slot17 = createLabel(24, cc.c3b(255, 232, 183), nil, 30, 38, TI18N("总伤害输出"), slot0.pic_bg, nil, cc.p(0, 0))
	slot20 = createLabel(24, cc.c3b(255, 129, 36), nil, 30, 5, string.format("%d(%s)", tonumber(slot0.partner_hurt), string.format("%.2f", slot0.partner_hurt / slot0.partner_total_hurt * 100) .. "%"), slot0.pic_bg, nil, cc.p(0, 0))

	slot0:handleEffect(true)

	slot0.scroll_view = createScrollView(SCREEN_WIDTH, 240 + slot0.offset_y, 0, 382, slot0.root_wnd, ccui.ScrollViewDir.vertical)

	slot0.scroll_view:setLocalZOrder(2)
	slot0:rewardViewUI()
end

function BattleMvpView.showProgressEffect(slot0)
	slot1 = Config.RoleData.data_role_attr[slot0.role_lv].exp_max
	slot2 = slot0.role_exp / slot1 * 100
	slot3 = slot0.role_nowexp / slot1 * 100

	if slot0.role_lv ~= slot0.role_nowlv then
		slot3 = 100
	end

	if slot0.data.auto_num and slot0.data.auto_num > 0 then
		slot0.auto_combat_num:setVisible(true)
		slot0.auto_combat_num:setString(string.format(TI18N("已连续通过关卡数：%s"), slot0.data.auto_num))
	end

	slot0.progress:setPercent(slot2)
	slot0.proTxt:setString(string.format("%d/%d", tonumber(slot0.role_exp), tonumber(slot1)))
	slot0.proBar:setPosition(cc.p(slot0.proBgSize.width * slot2 / 100 + 2, slot0.proBgSize.height / 2))
	slot0.progressBg:setVisible(true)
	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 + 1

		if uv1 < uv0 then
			if uv2.role_lv == uv2.role_nowlv then
				uv3 = Config.RoleData.data_role_attr[uv2.role_nowlv].exp_max
				uv0 = uv2.role_nowexp / uv3 * 100

				uv2.progress:setPercent(uv0)
				uv2.proBar:setPosition(cc.p(uv2.proBgSize.width * uv0 / 100 + 2, uv2.proBgSize.height / 2))
				uv2.proTxt:setString(string.format("%d/%d", uv2.role_nowexp, tonumber(uv3)))
				GlobalTimeTicket:getInstance():remove("mvp_progress_timer")
			else
				if uv2.progressEffect == nil then
					uv2.progressEffect = createEffectSpine(PathTool.getEffectRes(275), cc.p(uv2.proBgSize.width / 2, uv2.proBgSize.height / 2), cc.p(0.5, 0.5), false)

					uv2.progressBg:addChild(uv2.progressEffect)
				else
					uv2.progressEffect:setAnimation(0, PlayerAction.action, false)
				end

				uv2.role_lv = uv2.role_lv + 1
				uv0 = 0
				uv1 = 100
				uv3 = Config.RoleData.data_role_attr[uv2.role_lv].exp_max

				if uv2.role_lv == uv2.role_nowlv then
					uv1 = uv2.role_nowexp / Config.RoleData.data_role_attr[uv2.role_nowlv].exp_max * 100
				end
			end
		else
			uv2.progress:setPercent(uv0)
			uv2.proBar:setPosition(cc.p(uv2.proBgSize.width * uv0 / 100 + 2, uv2.proBgSize.height / 2))
			uv2.proTxt:setString(string.format("%d/%d", math.ceil(uv3 * uv0 / 100), tonumber(uv3)))
		end
	end, 0.01, 0, "mvp_progress_timer")
end

function BattleMvpView.onCloseBtn(slot0)
	if slot0.ani_isover then
		BattleController:getInstance():openFinishView(false, slot0.fight_type)
	end
end

function BattleMvpView.register_event(slot0)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:onCloseBtn()
		end
	end)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
end

function BattleMvpView._onClickHarmBtn(slot0)
	if slot0.data and next(slot0.data) ~= nil then
		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data)
	end
end

function BattleMvpView.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end

		if slot0.progressEffect then
			slot0.progressEffect:clearTracks()
			slot0.progressEffect:removeFromParent()

			slot0.progressEffect = nil
		end
	elseif not tolua.isnull(slot0.main_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(274), cc.p(slot0.containerSize.width * 0.5, 515), cc.p(0.5, 0.5), false, PlayerAction.action_1)

		slot0.main_container:addChild(slot0.play_effect, 1)
	end
end

function BattleMvpView.rewardViewUI(slot0)
	if not slot0.reward_list then
		return
	end

	slot1 = #slot0.reward_list
	slot2 = 4
	slot0.row = math.ceil(slot1 / slot2)
	slot0.space = 50
	slot0.spaceX = 20
	slot0.max_height = math.max((slot0.space + BackPackItem.Height) * slot0.row, slot0.scroll_view:getContentSize().height)

	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_view:getContentSize().width, slot0.max_height))

	if slot2 <= slot1 then
		slot1 = slot2
	end

	slot0.start_x = (slot0.scroll_view:getContentSize().width - (slot1 * BackPackItem.Width + (slot1 - 1) * slot0.spaceX)) * 0.5

	if slot0.row == 1 then
		slot0.start_y = slot0.max_height * 0.5
	else
		slot0.start_y = slot0.max_height - 20 - BackPackItem.Height * 0.5
	end

	slot0.action_effect = {}

	for slot8, slot9 in ipairs(slot0.reward_list) do
		if slot9.bid and slot9.num then
			delayRun(slot0.root_wnd, slot8 * 0.1, function ()
				uv0.action_effect[uv1] = createEffectSpine(Config.EffectData.data_effect_info[156], cc.p(uv0.start_x + BackPackItem.Width * 0.5 + (uv1 - 1) % uv2 * (BackPackItem.Width + uv0.spaceX), uv0.start_y - math.floor((uv1 - 1) / uv2) * (BackPackItem.Height + uv0.space)), cc.p(0.5, 0.5), false, PlayerAction.action_3, function ()
					if uv0.action_effect[uv1] then
						uv0.action_effect[uv1]:runAction(cc.RemoveSelf:create(true))

						uv0.action_effect[uv1] = nil
					end
				end, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

				uv0.scroll_view:addChild(uv0.action_effect[uv1], 1)
				uv0.action_effect[uv1]:registerSpineEventHandler(function (slot0)
					if slot0.eventData.name == "appear" then
						slot1 = BackPackItem.new(true, true)

						slot1:setBaseData(uv0.bid, uv0.num)
						slot1:setGoodsName(Config.ItemData.data_get_data(uv0.bid).name, nil, 20, cc.c3b(255, 232, 183))
						slot1:setPosition(cc.p(uv1, uv2 + 20))
						slot1:setDefaultTip()
						uv3.scroll_view:addChild(slot1)

						uv3.item_list[uv4] = slot1
					end
				end, sp.EventType.ANIMATION_EVENT)
			end)
		end
	end

	delayRun(slot0.main_container, 0.5, function ()
		uv0:updateTimer()
	end)
end

function BattleMvpView.updateTimer(slot0)
	slot0.ani_isover = true

	slot0.time_label:setVisible(true)
	slot0.comfirm_btn:setVisible(true)

	slot1 = 10

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 - 1

		if uv1.time_label and not tolua.isnull(uv1.time_label) then
			uv1.time_label:setString(math.ceil(uv0) .. TI18N("秒后关闭"))
		end

		if slot0 <= 0 then
			GlobalTimeTicket:getInstance():remove("mvp_close_timer")
			BattleController:getInstance():openFinishView(false, uv1.fight_type)
		end
	end, 1, 0, "mvp_close_timer")
end

function BattleMvpView.close_callback(slot0)
	slot0.root_wnd:stopAllActions()

	if slot0.bust_load then
		slot0.bust_load:DeleteMe()
	end

	slot0.bust_load = nil

	GlobalTimeTicket:getInstance():remove("mvp_close_timer")
	GlobalTimeTicket:getInstance():remove("mvp_progress_timer")

	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 then
				slot5:DeleteMe()
			end
		end
	end

	slot0.item_list = {}
	slot0.item_list = nil

	slot0:handleEffect(false)
	HeroController:getInstance():openEquipTips(false)
	TipsManager:getInstance():hideTips()
	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW, slot0.fight_type)

	if slot0.fight_type == BattleConst.Fight_Type.Darma then
		GlobalEvent:getInstance():Fire(BattleEvent.MOVE_DRAMA_EVENT, slot0.fight_type)
	end

	if BattleController:getInstance():getModel():getBattleScene() and BattleController:getInstance():getIsSameBattleType(slot0.fight_type) then
		BattleController:getInstance():getModel():result(slot0.data, slot0.is_leave_self)
	end

	BattleController:getInstance():openFinishView(false, slot0.fight_type)
end
