PrimusChallengePanel = PrimusChallengePanel or BaseClass(BaseView)
slot0 = PrimusController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = string.find

function PrimusChallengePanel.__init(slot0, slot1)
	slot0.win_type = WinType.Mini
	slot0.layout_name = "primus/primus_challenge_panel"
	slot0.is_full_screen = false
	slot0.is_use_csb = false
	slot0.res_list = {}
	slot0.attr_label_list = {}
	slot0.attr_icon_list = {}
	slot0.checkbox_list = {}
	slot0.checkbox_counts = {
		1,
		5,
		10
	}
	slot0.act_skill_item_list = {}
	slot0.passive_skill_item_list = {}
	slot0.skill_width = 88
end

function PrimusChallengePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.win_title = slot0.main_panel:getChildByName("win_title")

	slot0.win_title:setString(TI18N("霸气挑战"))

	slot0.record_btn = slot0.main_panel:getChildByName("record_btn")
	slot1 = slot0.main_panel:getChildByName("station_lay")
	slot0.mode_node = slot1:getChildByName("mode_node")
	slot0.occupant_tips = slot1:getChildByName("occupant_tips")
	slot0.tips_node = slot1:getChildByName("tips_node")
	slot0.head_node = slot1:getChildByName("head_node")
	slot0.title_img = slot1:getChildByName("title_img")
	slot0.name = slot1:getChildByName("name")
	slot0.name_bg = slot1:getChildByName("name_bg")
	slot2 = slot0.main_panel:getChildByName("boss_panel")

	slot2:getChildByName("desc_label"):setString(TI18N("Boss技能"))
	slot2:getChildByName("desc_label_1"):setString(TI18N("主动技能"))
	slot2:getChildByName("desc_label_2"):setString(TI18N("被动技能"))

	slot0.item_container_1 = slot2:getChildByName("item_container_1")

	slot0.item_container_1:setScrollBarEnabled(false)

	slot0.item_container_2 = slot2:getChildByName("item_container_2")

	slot0.item_container_2:setScrollBarEnabled(false)

	slot0.attr_panel = slot0.main_panel:getChildByName("attr_panel")
	slot9 = "title"
	slot0.arrt_title = slot0.attr_panel:getChildByName(slot9)

	for slot9 = 1, 4 do
		slot0.attr_label_list[slot9] = slot0.attr_panel:getChildByName("attr_label" .. slot9)
		slot0.attr_icon_list[slot9] = slot0.attr_panel:getChildByName("attr_icon" .. slot9)
	end

	slot0.arrt_title:setString(TI18N("霸主之位称号属性加成"))

	slot6 = slot0.main_panel:getChildByName("box_panel")
	slot0.checkbox_list[1] = slot6:getChildByName("checkbox1")
	slot0.checkbox_list[2] = slot6:getChildByName("checkbox5")
	slot0.checkbox_list[3] = slot6:getChildByName("checkbox10")

	slot0.checkbox_list[1]:getChildByName("name"):setString(uv0(TI18N("进化%s次"), slot0.checkbox_counts[1]))
	slot0.checkbox_list[2]:getChildByName("name"):setString(uv0(TI18N("进化%s次"), slot0.checkbox_counts[2]))
	slot0.checkbox_list[3]:getChildByName("name"):setString(uv0(TI18N("进化%s次"), slot0.checkbox_counts[3]))

	slot0.select_checkbox = 1
	slot0.warning_tips = slot6:getChildByName("warning_tips")

	slot0.warning_tips:setString(TI18N("(难度大请谨慎)"))

	slot0.tips_name = slot0.main_panel:getChildByName("tips_name")
	slot0.challenge_btn = slot0.main_panel:getChildByName("challenge_btn")
	slot0.gotoe_label = createRichLabel(24, cc.c3b(36, 144, 3), cc.p(0, 0.5), cc.p(0, 0))

	slot0.gotoe_label:setString(uv0("<div href=xxx>%s</div>", TI18N("前往竞技场")))
	slot0.gotoe_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		ArenaController:getInstance():requestOpenArenWindow(extend)
	end, {
		"click",
		"href"
	})
	slot0.main_panel:getChildByName("goto_node"):addChild(slot0.gotoe_label)

	slot0.tips_label = createRichLabel(22, cc.c3b(71, 44, 30), cc.p(0.5, 0.5), cc.p(0, 0), nil, nil, 1280)

	slot0.main_panel:getChildByName("tips_node"):addChild(slot0.tips_label)
end

function PrimusChallengePanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openPrimusChallengePanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.record_btn, handler(slot0, slot0._onClickChallengeRecordBtn), true, 2)

	slot4 = handler(slot0, slot0._onClickChallengeBtn)
	slot5 = true

	registerButtonEventListener(slot0.challenge_btn, slot4, slot5, 2)

	for slot4, slot5 in ipairs(slot0.checkbox_list) do
		slot5:addEventListener(function (slot0, slot1)
			playButtonSound2()

			if uv0.sever_data then
				uv0.select_checkbox = uv1

				uv0:setSelectCheckBox()
				uv0:initBossSkill(uv0.sever_data.num + uv0.checkbox_counts[uv1])
			end
		end)
	end
end

function PrimusChallengePanel._onClickChallengeBtn(slot0)
	if not slot0.sever_data then
		return
	end

	if slot0.is_have_title then
		CommonAlert.show(TI18N("您当前已占有一个霸主之位，若挑战其他霸主成功，将失去原有霸主之位，是否继续挑战？"), TI18N("确定"), function ()
			uv1:sender20702(uv0.sever_data.pos, uv0.checkbox_counts[uv0.select_checkbox])
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	else
		slot1()
	end
end

function PrimusChallengePanel._onClickChallengeRecordBtn(slot0)
	if not slot0.sever_data then
		return
	end

	uv0:sender20703(slot0.sever_data.pos)
end

function PrimusChallengePanel.openRootWnd(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.is_have_title = slot2
	slot0.sever_data = slot1
	slot0.local_data = Config.PrimusData.data_upgrade[slot1.pos]

	if Config.HonorData.data_title[slot0.local_data.honor_id] and slot0.title_img then
		slot0.item_load = loadSpriteTextureFromCDN(slot0.title_img, PathTool.getTargetRes("honor", "txt_cn_honor_" .. slot3.res_id, false, false), ResourcesType.single, slot0.item_load)
	end

	if slot0.tips_node and slot0.local_data then
		slot5 = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(0, 0))

		slot5:setString(uv0(TI18N("<div fontColor=#ffffff>已进化<div fontcolor=#14ff32>%s</div>次</div>"), slot0.sever_data.num))
		slot0.tips_node:addChild(slot5)
	end

	if (slot0.sever_data.name ~= nil or slot0.sever_data.name ~= "") and RoleController:getInstance():getRoleVo() and slot1.rid == slot4.rid and slot1.srv_id == slot4.srv_id then
		slot0.tips_name:setString(TI18N("已占领霸主之位"))
		slot0.challenge_btn:setVisible(false)
		slot0.gotoe_label:setVisible(false)
	end

	slot0:initHeadUi()
	slot0:initBossSkill(slot0.sever_data.num + 1)
	slot0:initHonorAttribute()
	slot0:setSelectCheckBox()
	slot0:updateTipsLabel()
end

function PrimusChallengePanel.updateTipsLabel(slot0)
	slot1 = ArenaController:getInstance():getModel():getMyLoopData()

	if slot0.tips_label and slot0.local_data then
		if slot1 and slot1.rank and slot1.rank > 0 then
			slot0.tips_label:setString(uv0(TI18N("挑战条件:当前竞技场处于前%s名(我的排名:<div fontcolor=#249003>%s</div>)"), slot0.local_data.arena_rank, slot1.rank))
		else
			slot0.tips_label:setString(uv0(TI18N("挑战条件:当前竞技场处于前%s名(我的排名:<div fontcolor=#249003>无</div>)"), slot0.local_data.arena_rank))
		end
	end
end

function PrimusChallengePanel.initHeadUi(slot0)
	if not slot0.sever_data then
		return
	end

	if slot0.sever_data.name == nil or slot0.sever_data.name == "" then
		slot0.occupant_tips:setString(TI18N("虚位以待"))
		slot0.name_bg:setVisible(false)
		slot0.name:setVisible(false)

		return
	end

	slot0.play_head = PlayerHead.new(PlayerHead.type.circle, nil, cc.size(96, 96))

	slot0.head_node:addChild(slot0.play_head)
	slot0.play_head:setPosition(cc.p(0, 0))
	slot0.play_head:setHeadRes(slot0.sever_data.face_id, false, LOADTEXT_TYPE, slot0.sever_data.face_file, slot0.sever_data.face_update_time)

	if slot0.sever_data.lev then
		slot0.play_head:setLev(slot0.sever_data.lev, cc.p(0, 67))
	end

	slot0.name:setString(slot0.sever_data.name)
	slot0.play_head:addCallBack(function ()
		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = uv0.sever_data.srv_id,
			rid = uv0.sever_data.rid
		})
	end)
end

function PrimusChallengePanel.initHonorAttribute(slot0)
	if not slot0.local_data then
		return
	end

	if not slot0.attr_label_list then
		return
	end

	if not slot0.attr_icon_list then
		return
	end

	if Config.HonorData.data_title[slot0.local_data.honor_id] then
		for slot5, slot6 in ipairs(slot0.attr_label_list) do
			slot7 = slot0.attr_icon_list[slot5]

			if slot1.attr[slot5] then
				slot6:setVisible(true)

				if PartnerCalculate.isShowPerByStr(slot1.attr[slot5][1]) then
					slot6:setString(uv0("%s + %s%%", TI18N(Config.AttrData.data_key_to_name[slot1.attr[slot5][1]]), slot1.attr[slot5][2] / 10))
				else
					slot6:setString(uv0("%s + %s ", TI18N(slot8), slot1.attr[slot5][2]))
				end

				if slot7 then
					slot7:setVisible(true)
					loadSpriteTexture(slot7, PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot1.attr[slot5][1])), LOADTEXT_TYPE_PLIST)
				end
			else
				slot6:setVisible(false)

				if slot7 then
					slot7:setVisible(false)
				end
			end
		end
	end
end

function PrimusChallengePanel.initBossSkill(slot0, slot1)
	if slot0.unit_data_list == nil then
		slot0.unit_data_list = {}

		for slot5, slot6 in pairs(Config.PrimusData.data_unitdata) do
			if slot0.sever_data.pos == slot6.pos then
				uv0(slot0.unit_data_list, slot6)
			end
		end
	end

	table.sort(slot0.unit_data_list, function (slot0, slot1)
		return slot0.min < slot1.min
	end)

	slot2 = nil
	slot3 = #slot0.unit_data_list

	for slot7, slot8 in ipairs(slot0.unit_data_list) do
		if slot8.min <= slot1 and slot1 <= slot8.max then
			slot2 = slot8

			break
		end

		if slot7 == slot3 then
			slot2 = slot8
		end
	end

	if slot2 == nil then
		return
	end

	slot0:updateSpine(slot2.look_id or 340502)

	if slot0.cur_unit_data and slot0.cur_unit_data.min == slot2.min then
		return
	end

	slot0.cur_unit_data = slot2
	slot6 = slot2.passive_skill
	slot12 = cc.size

	slot0.item_container_1:setInnerContainerSize(slot12(math.max(slot0.item_container_1:getContentSize().width, slot0.skill_width * #slot2.act_skill), slot0.item_container_1:getContentSize().height))

	for slot12, slot13 in ipairs(slot0.act_skill_item_list) do
		slot13.con:setVisible(false)
	end

	for slot12, slot13 in ipairs(slot5) do
		if Config.SkillData.data_get_skill(slot13) then
			if slot0.act_skill_item_list[slot12] == nil then
				slot0.act_skill_item_list[slot12] = {}
				slot0.act_skill_item_list[slot12] = slot0:updateSkillItem(slot14, slot0.act_skill_item_list[slot12], true)

				slot0.item_container_1:addChild(slot0.act_skill_item_list[slot12].con)
			else
				slot0.act_skill_item_list[slot12].con:setVisible(true)
				slot0:updateSkillItem(slot14, slot0.act_skill_item_list[slot12])
			end

			slot0.act_skill_item_list[slot12].con:setPosition((slot0.skill_width + 5) * (slot12 - 1) + slot0.skill_width / 2, slot0.skill_width / 2)
		else
			print(uv1("技能表id: %s 没发现", tostring(slot13)))
		end
	end

	slot14 = cc.size

	slot0.item_container_2:setInnerContainerSize(slot14(math.max(slot0.item_container_2:getContentSize().width, slot0.skill_width * #slot6), slot0.item_container_2:getContentSize().height))

	for slot14, slot15 in ipairs(slot0.passive_skill_item_list) do
		slot15.con:setVisible(false)
	end

	for slot14, slot15 in ipairs(slot6) do
		if Config.SkillData.data_get_skill(slot15) then
			if slot0.passive_skill_item_list[slot14] == nil then
				slot0.passive_skill_item_list[slot14] = {}
				slot0.passive_skill_item_list[slot14] = slot0:updateSkillItem(slot16, slot0.passive_skill_item_list[slot14], false)

				slot0.item_container_2:addChild(slot0.passive_skill_item_list[slot14].con)
			else
				slot0.passive_skill_item_list[slot14].con:setVisible(true)
				slot0:updateSkillItem(slot16, slot0.passive_skill_item_list[slot14])
			end

			slot0.passive_skill_item_list[slot14].con:setPosition((slot0.skill_width + 5) * (slot14 - 1) + slot0.skill_width / 2, slot0.skill_width / 2)
		else
			print(uv1("技能表id: %s 没发现", tostring(slot15)))
		end
	end
end

function PrimusChallengePanel.updateSpine(slot0, slot1)
	if not slot1 then
		return
	end

	function slot2()
		if not uv0.spine then
			uv0.spine = BaseRole.new(BaseRole.type.role, uv1)

			uv0.spine:setAnimation(0, PlayerAction.show, true)
			uv0.spine:setCascade(true)
			uv0.spine:setPosition(cc.p(0, -10))
			uv0.spine:setAnchorPoint(cc.p(0.5, 0.5))
			uv0.spine:setScale(0.4)
			uv0.mode_node:addChild(uv0.spine)
			uv0.spine:setCascade(true)
			uv0.spine:setOpacity(0)
			uv0.spine:runAction(cc.FadeIn:create(0.2))
		end
	end

	if slot0.spine then
		slot0.spine:setCascade(true)
		slot0.spine:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
			doStopAllActions(uv0.spine)
			uv0.spine:removeFromParent()

			uv0.spine = nil

			uv1()
		end)))
	else
		slot2()
	end
end

function PrimusChallengePanel.updateSkillItem(slot0, slot1, slot2, slot3)
	slot4 = cc.size(slot0.skill_width, slot0.skill_width)
	slot5 = cc.size(slot0.skill_width - 4, slot0.skill_width - 4)
	slot2.config = slot1

	if slot2.con == nil then
		slot6 = ccui.Widget:create()

		slot6:setContentSize(slot4)
		slot6:setTouchEnabled(true)
		slot6:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended and uv0.config then
				playButtonSound2()
				TipsManager:getInstance():showSkillTips(uv0.config)
			end
		end)

		slot2.con = slot6

		createImage(slot6, PathTool.getNormalSkillBg(), slot4.width / 2, slot4.height / 2, cc.p(0.5, 0.5), true, 0, true):setContentSize(slot4)
	end

	if slot2.icon == nil then
		slot2.icon = createImage(slot2.con, PathTool.getSkillRes(slot1.icon), slot4.width / 2, slot4.height / 2, cc.p(0.5, 0.5), false, 0, false)

		slot2.icon:setScale(0.75)
	else
		slot2.icon:loadTexture(slot6, LOADTEXT_TYPE)
		slot2.icon:setScale(0.75)
	end

	slot7 = slot1.level or 1

	if slot1.client_lev and slot1.client_lev > 0 then
		slot7 = slot1.client_lev
	end

	if slot2.lev_label == nil then
		slot2.lev_label = createLabel(20, Config.ColorData.data_color4[1], Config.ColorData.data_color4[2], slot0.skill_width - 8, 0, tostring(slot7), slot2.con, 2, cc.p(1, 0), nil)
	else
		slot2.lev_label:setString(tostring(slot7))
	end

	return slot2
end

function PrimusChallengePanel.setSelectCheckBox(slot0)
	if not slot0.select_checkbox then
		return
	end

	if not slot0.checkbox_list then
		return
	end

	for slot4, slot5 in ipairs(slot0.checkbox_list) do
		if slot0.select_checkbox == slot4 then
			slot5:setSelected(true)
		else
			slot5:setSelected(false)
		end
	end
end

function PrimusChallengePanel.close_callback(slot0)
	if slot0.spine_model then
		slot0.spine_model:DeleteMe()

		slot0.spine_model = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.play_head then
		slot0.play_head:DeleteMe()

		slot0.play_head = nil
	end

	uv0:openPrimusChallengePanel(false)
end
