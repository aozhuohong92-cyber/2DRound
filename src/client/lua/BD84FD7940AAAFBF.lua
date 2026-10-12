GuildwarAttkPositionWindow = GuildwarAttkPositionWindow or BaseClass(BaseView)
slot1 = GuildwarController:getInstance():getModel()

function GuildwarAttkPositionWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildwar", "guildwar"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("form", "form"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "guildwar/guildwar_attk_position_window"
	slot0.item_list = {}
end

function GuildwarAttkPositionWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot2 = slot1:getChildByName("top_panel")
	slot3 = slot1:getChildByName("pos_panel")
	slot4 = slot1:getChildByName("buff_panel")

	slot4:setVisible(false)

	slot0.pos_panel = slot3
	slot0.buff_panel = slot4

	slot1:getChildByName("win_title"):setString(TI18N("挑战信息"))
	slot1:getChildByName("title_label"):setString(TI18N("胜利获得"))
	slot3:getChildByName("award_label"):setString(TI18N("难度越高奖励越丰厚，最多可获得上述奖励！"))

	slot0.defend_label = slot2:getChildByName("defend_label")
	slot8, slot9 = slot0.defend_label:getPosition()
	slot0.check_def_label = createRichLabel(24, 181, cc.p(0, 0.5), cc.p(slot8 + 5, slot9))

	slot0.check_def_label:setString(string.format(TI18N("<div fontColor=#249003 href=xxx>查看详情</div>")))

	slot14 = {
		"click",
		"href"
	}

	slot0.check_def_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		if uv0.data and uv0.data.pos then
			slot4 = uv1:getEnemyGuildWarBaseInfo()

			uv2:openDefendLookWindow(true, slot4.g_id, slot4.g_sid, uv0.data.pos)
		end
	end, slot14)
	slot2:addChild(slot0.check_def_label)

	slot0.star_list = {}

	for slot14 = 1, 3 do
		if slot2:getChildByName(string.format("star_%d", slot14)) then
			slot15:setVisible(false)

			slot0.star_list[({
				3,
				2,
				1
			})[slot14]] = slot15
		end
	end

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.easy_btn = slot3:getChildByName("easy_btn")

	slot0.easy_btn:getChildByName("label"):setString(TI18N("挑战"))

	slot0.com_btn = slot3:getChildByName("com_btn")

	slot0.com_btn:getChildByName("label"):setString(TI18N("挑战"))

	slot0.diff_btn = slot3:getChildByName("diff_btn")

	slot0.diff_btn:getChildByName("label"):setString(TI18N("挑战"))

	slot0.tips_label = slot1:getChildByName("tips_label")
	slot0.award_bg = slot1:getChildByName("image_2")
	slot0.count_label = slot1:getChildByName("count_label")
	slot0.easy_label = slot3:getChildByName("easy_label")
	slot0.easy_coe_label = slot3:getChildByName("easy_coe_label")
	slot0.com_label = slot3:getChildByName("com_label")
	slot0.com_coe_label = slot3:getChildByName("com_coe_label")
	slot0.diff_label = slot3:getChildByName("diff_label")
	slot0.diff_coe_label = slot3:getChildByName("diff_coe_label")
	slot0.good_con = slot1:getChildByName("good_con")
	slot0.image_easy = slot3:getChildByName("image_easy")
	slot0.image_com = slot3:getChildByName("image_com")
	slot0.image_dif = slot3:getChildByName("image_dif")

	slot4:getChildByName("buff_count_title"):setString(TI18N("据点挑战次数:"))
	slot1:getChildByName("count_title"):setString(TI18N("挑战次数:"))

	slot0.challenge_btn = slot4:getChildByName("challenge_btn")
	slot0.challenge_btn_label = slot0.challenge_btn:getChildByName("label")

	slot0.challenge_btn_label:setString(TI18N("挑战"))

	slot0.buff_count_label = slot4:getChildByName("buff_count_label")
	slot0.lv_label = slot4:getChildByName("lv_label")
	slot0.progress_bg = slot4:getChildByName("progress_bg")
	slot16 = slot0.progress_bg:getContentSize()
	slot0.progress = ccui.LoadingBar:create()

	slot0.progress:setCascadeOpacityEnabled(true)
	slot0.progress:setScale9Enabled(true)
	slot0.progress:setAnchorPoint(cc.p(0, 0.5))
	slot0.progress:setContentSize(slot16)
	slot0.progress:loadTexture(PathTool.getResFrame("common", "common_30006"), LOADTEXT_TYPE_PLIST)
	slot0.progress:setPosition(cc.p(0, slot16.height / 2))
	slot0.progress:setPercent(0)

	slot20 = slot0.progress

	slot0.progress_bg:addChild(slot20)

	slot0.attr_panel = {}

	for slot20 = 1, 6 do
		if slot4:getChildByName(string.format("attr_panel_%d", slot20)) then
			slot21.attr_label = slot21:getChildByName("attr_label")
			slot21.attr_value_1 = slot21:getChildByName("attr_value_1")
			slot21.attr_value_2 = slot21:getChildByName("attr_value_2")
			slot21.attr_image = slot21:getChildByName("image")
			slot0.attr_panel[slot20] = slot21
		end
	end

	slot17 = slot0.good_con:getContentSize()
	slot0.good_con_size = slot17
	slot0.item_scroll_view = createScrollView(slot17.width, slot17.height, 0, slot17.height / 2, slot0.good_con, ccui.ScrollViewDir.horizontal)

	slot0.item_scroll_view:setAnchorPoint(cc.p(0, 0.5))
	slot0.item_scroll_view:setInnerContainerSize(cc.size(slot17.width, slot17.height))
end

function GuildwarAttkPositionWindow.setData(slot0, slot1)
	slot0.data = slot1

	slot0.pos_panel:setVisible(slot1.hp > 0)
	slot0.buff_panel:setVisible(slot1.hp <= 0)

	slot2 = slot1.power or 0

	if slot1.hp > 0 then
		if slot1.hp == 1 then
			setChildUnEnabled(true, slot0.com_btn)
			setChildUnEnabled(true, slot0.diff_btn)
			setChildUnEnabled(true, slot0.image_com)
			setChildUnEnabled(true, slot0.image_dif)
		elseif slot1.hp == 2 then
			setChildUnEnabled(true, slot0.diff_btn)
			setChildUnEnabled(true, slot0.image_dif)
		end

		slot0.easy_coe_label:setString(Config.GuildWarData.data_const.easy_difficulty.val / 10 .. "%" .. TI18N("难度"))
		slot0.com_coe_label:setString(Config.GuildWarData.data_const.normal_difficulty.val / 10 .. "%" .. TI18N("难度"))
		slot0.diff_coe_label:setString(Config.GuildWarData.data_const.hard_difficulty.val / 10 .. "%" .. TI18N("难度"))

		if Config.GuildWarData.data_position[slot1.pos] then
			slot0.easy_label:setString(string.format(TI18N("+%d战绩"), math.ceil(slot6.warscore[1][2] or 0)))
			slot0.com_label:setString(string.format("+%d战绩", math.ceil(slot6.warscore[2][2] or 0)))
			slot0.diff_label:setString(string.format("+%d战绩", math.ceil(slot6.warscore[3][2] or 0)))
		end

		slot0.award_bg:setContentSize(cc.size(560, 190))
		slot0.tips_label:setString(TI18N("难度越高，敌方属性加成越高"))
	else
		slot0.award_bg:setContentSize(cc.size(560, 160))
		slot0.tips_label:setString(TI18N("挑战成功可增强公会增益"))

		slot4 = uv0:getMyGuildWarBaseInfo().buff_lev or 0
		slot5 = Config.GuildWarData.data_buff_length

		slot0.progress:setPercent(slot4 / slot5 * 100)
		slot0.lv_label:setString(string.format("%d/%d", slot4, slot5))

		slot6 = Config.GuildWarData.data_buff[slot4] or {}
		slot7 = Config.GuildWarData.data_buff[slot4 + 1] or {}
		slot6.attr = slot6.attr or {}
		slot7.attr = slot7.attr or {}

		for slot11 = 1, 6 do
			if not slot6.attr[slot11] and not slot7.attr[slot11] then
				slot0.attr_panel[slot11]:setVisible(false)
			else
				slot12:setVisible(true)

				slot14 = Config.AttrData.data_key_to_name[(slot6.attr[slot11] or slot7.attr[slot11])[1]]
				slot15 = 0

				if slot6.attr[slot11] then
					slot15 = slot6.attr[slot11][2]
				end

				slot16 = nil

				if slot7.attr[slot11] then
					slot16 = slot7.attr[slot11][2]
				end

				slot12.attr_label:setString(slot14)

				if PartnerCalculate.isShowPerByStr(slot13[1]) then
					slot15 = slot15 / 10 .. "%"
				end

				slot12.attr_value_1:setString(slot15)

				if slot16 then
					if slot17 then
						slot16 = slot16 / 10 .. "%"
					end

					slot12.attr_value_2:setString(slot16)
					slot12.attr_value_2:setVisible(true)
					slot12.attr_image:setVisible(true)
				else
					slot12.attr_value_2:setVisible(false)
					slot12.attr_image:setVisible(false)
				end
			end
		end

		slot8 = 0

		if Config.GuildWarData.data_const.ruins_challange_limit then
			slot8 = slot9.val
		end

		if slot8 - (slot1.relic_def_count or 0) < 0 then
			slot11 = 0
		end

		if slot11 > 0 then
			slot0.buff_count_label:setTextColor(Config.ColorData.data_color4[178])
		else
			slot0.buff_count_label:setTextColor(Config.ColorData.data_color4[183])
		end

		slot0.buff_count_label:setString(string.format("%d/%d", slot11, slot8))

		if slot8 <= slot10 then
			setChildUnEnabled(true, slot0.challenge_btn)
			slot0.challenge_btn:setTouchEnabled(false)
			slot0.challenge_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
		end
	end

	for slot6 = 1, 3 do
		if slot0.star_list[slot6] and slot1.hp < slot6 then
			slot7:setVisible(true)
		else
			slot7:setVisible(false)
		end
	end

	slot0.defend_label:setString(string.format(TI18N("已成功防御%d次"), slot1.def_count or 0))

	if Config.GuildWarData.data_const.win_strongholds_reward_hard and slot3.val then
		slot4 = #slot3.val

		if (slot0.good_con_size.width - slot4 * BackPackItem.Width * 0.8 - (slot4 - 1) * 30) / 2 < 0 then
			slot7 = 0
		end

		for slot11, slot12 in pairs(slot3.val) do
			if type(slot12) == "table" then
				slot14 = slot12[2]

				if Config.ItemData.data_get_data(slot12[1]) then
					if not slot0.item_list[slot11] then
						slot16 = BackPackItem.new(false, true, false, 1, false, true)

						slot16:setDefaultTip(true, true)
						slot16:setScale(slot6)
						slot0.item_scroll_view:addChild(slot16)

						slot0.item_list[slot11] = slot16
					end

					slot16:setBaseData(slot13, slot14)
					slot16:setPosition(slot7 + (BackPackItem.Width * slot6 + slot5) * (slot11 - 1) + BackPackItem.Width * slot6 * 0.5, slot0.good_con_size.height / 2)
				end
			end
		end
	end

	if Config.GuildWarData.data_const.challange_time_limit.val - uv0:getGuildWarChallengeCount() < 0 then
		slot6 = 0
	end

	if slot6 > 0 then
		slot0.count_label:setTextColor(Config.ColorData.data_color4[178])
	else
		slot0.count_label:setTextColor(Config.ColorData.data_color4[183])
	end

	slot0.count_label:setString(string.format("%d/%d", slot6, slot5))

	if not slot0.enemy_battle_array_panel then
		slot0.enemy_battle_array_panel = GuildwarBattleArrayPanel.new()
		slot7 = slot0.container:getContentSize()

		slot0.container:addChild(slot0.enemy_battle_array_panel)
		slot0.enemy_battle_array_panel:setPosition(cc.p(32, 545))
	end

	slot7 = {}
	slot8 = {}

	for slot12, slot13 in pairs(slot1.defense) do
		table.insert(slot8, slot13)
	end

	slot7.partner_list = slot8
	slot7.rid = slot1.rid
	slot7.srv_id = slot1.srv_id
	slot7.power = slot2
	slot7.formation_type = slot1.formation_type
	slot7.formation_lev = slot1.formation_lev

	slot0.enemy_battle_array_panel:setData(slot7)
end

function GuildwarAttkPositionWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openAttkPositionWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openAttkPositionWindow(false)
		end
	end)
	slot0.easy_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.data.pos then
				uv1:requestGuildWarFighting(uv0.data.pos, 1, 0)
			end
		end
	end)
	slot0.com_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.data.pos then
				uv1:requestGuildWarFighting(uv0.data.pos, 2, 0)
			end
		end
	end)
	slot0.diff_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.data.pos then
				uv1:requestGuildWarFighting(uv0.data.pos, 3, 0)
			end
		end
	end)
	slot0.challenge_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0:checkEnemyIsHaveLivePosition() then
				CommonAlert.show(string.format(TI18N("挑战废墟获得的战绩将大大减少，推荐优先挑战其他未沦陷的据点，请问是否继续挑战废墟？")), TI18N("确定"), function ()
					uv0:requestGuildWarFighting(uv1.data.pos, 0, 1)
				end, TI18N("取消"), nil, CommonAlert.type.common)
			else
				uv1:requestGuildWarFighting(uv2.data.pos, 0, 1)
			end
		end
	end)
end

function GuildwarAttkPositionWindow.openRootWnd(slot0, slot1)
	uv0:requestEnemyPositionData(slot1)
end

function GuildwarAttkPositionWindow.close_callback(slot0)
	if slot0.enemy_battle_array_panel then
		slot0.enemy_battle_array_panel:DeleteMe()

		slot0.enemy_battle_array_panel = nil
	end

	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openAttkPositionWindow(false)
end
