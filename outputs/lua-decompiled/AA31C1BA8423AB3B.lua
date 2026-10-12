MainUiView = MainUiView or BaseClass()
slot0 = string.format
slot1 = MainuiController:getInstance()
slot2 = tolua.isnull
slot3 = RoleController:getInstance():getRoleVo()
slot4 = table.insert
slot5 = 0.1
slot6 = 0.01

function MainUiView.__init(slot0)
	slot0:initConfig()
	slot0:createRootWnd()
	slot0:registerEvent()

	if IS_IOS_PLATFORM then
		nativeSdkOpenpage("MainUiView")
	end
end

function MainUiView.initConfig(slot0)
	slot0.bottom_btn_list = {}
	slot0.icon_container_list = {}
	slot0.wealth_item_key = {
		"coin",
		"gold",
		"klb"
	}
	slot0.record_wealth_icon_res = {}
	slot0.wealth_icon_list = {}
	slot0.wealth_label_list = {}
	slot0.is_open = true
	slot0.cur_select_index = 0
	slot0.render_list = {}
	slot0.render_list_dic = {}
	slot0.function_list = {}
	slot0.cur_vip_lev = nil
	slot0.top_left_off = 15
	slot0.left_off = 20
	slot0.right_off = 20
	slot0.top_left_max_sum = 6
	slot0.left_max_sum = 7
	slot0.is_in_shrink = false
	slot0.is_shrink = false
	slot0.layout_list = {}

	for slot4, slot5 in pairs(FunctionIconVo.type) do
		slot0.layout_list[slot5] = {}
	end

	slot0.btn_cache_tips = {}
	slot0.hide_container_status = true
	slot0.dungeon_item_label = {}
	slot0.left_icon_unfold = true
	slot0.right_icon_unfold = true
	slot0.func_show_status = true
	slot0.red_bag_2_type = 0
	slot0.training_camp_lev_limit = Config.TrainingCampData.data_const.training_camp_lev_limit
end

function MainUiView.createRootWnd(slot0)
	slot0.node = ccui.Layout:create()

	slot0.node:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.node:setAnchorPoint(cc.p(0, 0))

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("mainui/mainui_view"))

	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0.node:addChild(slot0.root_wnd)

	slot4 = "bottom_container"
	slot0.bottom_container = slot0.root_wnd:getChildByName(slot4)

	for slot4 = 1, 7 do
		slot5 = slot0.bottom_container:getChildByName("mainui_tab_" .. slot4)
		slot6 = slot5:getChildByName("tips_point")

		slot6:setVisible(false)

		slot7 = "main_ui_view[bottom_container]"
		slot8 = "mainui_tab_" .. slot4

		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if IS_IOS_PLATFORM then
					nativeSdkClickEvent(uv0, uv1)
				end

				playButtonSound()
				uv2:changeMainUiStatus(uv3)
			end
		end)

		if slot4 == MainuiConst.btn_index.backpack then
			slot9 = slot0.bottom_container:convertToWorldSpace(cc.p(slot5:getPosition()))
			slot9.y = slot9.y + display.getBottom(slot0.root_wnd)

			uv0:setBackPackBtnPos(slot9)
		end

		slot9 = {
			btn = slot5,
			index = slot4,
			tips_point = slot6,
			normal = slot5:getChildByName("normal"),
			selected = slot5:getChildByName("selected"),
			icon = slot5:getChildByName("icon"),
			notice = slot5:getChildByName("notice"),
			tips_status = false,
			init_y = slot5:getPositionY(),
			config = slot10
		}

		if Config.FunctionData.data_base[slot4] and slot10.activate then
			if slot9.notice then
				slot9.notice:setString(slot10.label)
			end
		end

		slot0.bottom_btn_list[slot4] = slot9

		if slot4 == 1 then
			slot0.cur_select_index = slot4
			slot0.cur_select_btn = slot9

			slot0.cur_select_btn.normal:setVisible(false)
			slot0.cur_select_btn.selected:setVisible(true)
			slot9.btn:setPositionY(slot9.init_y + 10)
		end
	end

	slot0.top_container = slot0.root_wnd:getChildByName("top_container")
	slot0.exp_bar = slot0.top_container:getChildByName("exp_bar")

	slot0.exp_bar:setScale9Enabled(true)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setPosition(40, 40)
	slot0.top_container:getChildByName("head_container"):addChild(slot0.role_head)

	slot0.info_container = slot0.top_container:getChildByName("info_container")
	slot0.lev_label = slot0.info_container:getChildByName("lev_label")
	slot5 = "name_label"
	slot0.name_label = slot0.info_container:getChildByName(slot5)

	for slot5 = 1, 3 do
		slot0.wealth_label_list[slot5] = slot0.info_container:getChildByName("wealth_label_" .. slot5)
		slot0.wealth_icon_list[slot5] = slot0.info_container:getChildByName("wealth_icon_" .. slot5)
	end

	slot0.fight_label = slot0.info_container:getChildByName("fight_label")
	slot0.gold_touch = slot0.top_container:getChildByName("gold_touch")
	slot0.coin_touch = slot0.top_container:getChildByName("coin_touch")
	slot0.klb_touch = slot0.top_container:getChildByName("klb_touch")
	slot0.coin_redpoint = slot0.top_container:getChildByName("Sprite_8")
	slot0.hide_container = slot0.root_wnd:getChildByName("hide_container")
	slot0.handle_btn = slot0.hide_container:getChildByName("handle_btn")
	slot0.prompt_container = slot0.root_wnd:getChildByName("prompt_container")
	slot0.prompt_tips_layout = slot0.prompt_container:getChildByName("tips_layout")
	slot0.prompt_bubble_layout = slot0.prompt_container:getChildByName("bubble_layout")
	slot0.prompt_desc = slot0.prompt_bubble_layout:getChildByName("desc")
	slot0.prompt_bubble = slot0.prompt_bubble_layout:getChildByName("bubble")
	slot0.prompt_bubble_size = slot0.prompt_bubble:getContentSize()

	slot0.prompt_desc:setTextColor(cc.c4b(71, 44, 30, 255))

	slot0.effect_container = slot0.prompt_container:getChildByName("effect_container")

	slot0.effect_container:setVisible(false)
	slot0.effect_container:setName("guide_effect_btn")

	slot0.prompt_container_effect_size = slot0.effect_container:getContentSize()
	slot0.tips_btn = slot0.prompt_container:getChildByName("tips_btn")
	slot0.prompt_tips_scroll = slot0.prompt_tips_layout:getChildByName("tips_scroll")

	slot0.prompt_tips_scroll:setScrollBarEnabled(false)

	slot0.prompt_tips_scroll_size = slot0.prompt_tips_scroll:getContentSize()
	slot0.count_size_label = slot0.prompt_tips_layout:getChildByName("count_size_label")
	slot0.prompt_tips_bg = slot0.prompt_tips_layout:getChildByName("tips_bg")
	slot0.prompt_tips_bg_size = slot0.prompt_tips_bg:getContentSize()

	slot0.prompt_tips_layout:setVisible(false)

	slot2 = display.getBottom() + slot0.bottom_container:getContentSize().height + 60
	slot8 = slot2

	slot0.handle_btn:setPosition(display.getRight() - 45, slot8)
	slot0.prompt_container:setPositionY(slot2 - 90)

	slot0.red_bag_container = slot0.hide_container:getChildByName("red_bag_container")

	slot0.red_bag_container:setVisible(false)

	slot0.red_bag_size = slot0.red_bag_container:getContentSize()
	slot0.red_bag_container_2 = slot0.hide_container:getChildByName("red_bag_container_2")

	slot0.red_bag_container_2:setVisible(false)
	slot0.red_bag_container_2:setPositionY(531)

	slot0.red_bag_2_size = slot0.red_bag_container_2:getContentSize()
	slot0.red_bag_container_3 = slot0.hide_container:getChildByName("red_bag_container_3")

	slot0.red_bag_container_3:setVisible(false)

	slot0.red_bag_3_size = slot0.red_bag_container_3:getContentSize()
	slot0.time_collect_container = slot0.hide_container:getChildByName("time_collect_container")

	slot0.time_collect_container:setVisible(false)

	slot0.time_collect_size = slot0.time_collect_container:getContentSize()
	slot0.vote_mergeServer_container = slot0.hide_container:getChildByName("vote_mergeServer_container")

	slot0.vote_mergeServer_container:setVisible(false)
	slot0.vote_mergeServer_container:setPosition(cc.p(-50, 300))

	slot0.vote_mergeServer_container_size = slot0.vote_mergeServer_container:getContentSize()
	slot7 = "icon_container"
	slot0.icon_container = slot0.root_wnd:getChildByName(slot7)

	for slot7, slot8 in pairs(FunctionIconVo.type) do
		slot9 = nil

		if ((slot8 ~= FunctionIconVo.type.right_bottom_1 and slot8 ~= FunctionIconVo.type.right_bottom_2 or slot0.hide_container) and slot0.icon_container):getChildByName("icon_container_" .. slot8) then
			slot0.icon_container_list[slot8] = slot10
			slot11 = 0
			slot12 = 0

			if slot8 == FunctionIconVo.type.right_top_1 then
				slot11 = display.getRight() - 113
				slot12 = display.getTop() - slot0.top_container:getContentSize().height + 10
			elseif slot8 == FunctionIconVo.type.right_top_2 then
				slot11 = display.getRight() - 11
				slot12 = display.getTop() - slot0.top_container:getContentSize().height - 28
			elseif slot8 == FunctionIconVo.type.right_bottom_1 then
				slot11 = slot3 - 57
				slot12 = slot2
			elseif slot8 == FunctionIconVo.type.right_bottom_2 then
				slot11 = slot3
				slot12 = slot2 + 55
			elseif slot8 == FunctionIconVo.type.left_top then
				slot11 = display.getLeft() + 9
				slot12 = display.getTop() - slot0.top_container:getContentSize().height - 92
			end

			slot10:setPosition(slot11, slot12)
		end
	end

	slot0.vip_label = CommonNum.new(19, slot0.info_container, 1, -2, cc.p(0, 0.5))

	slot0.vip_label:setPosition(22, 56)

	slot0.handle_x = slot3
	slot0.handle_y = slot2

	slot0:updateHandleBtnShowStatus()

	if MAKELIFEBETTER == true or IS_APPLE_RMUI == true then
		slot5 = slot0.icon_container_list[FunctionIconVo.type.right_bottom_2]
		slot6 = slot0.icon_container_list[FunctionIconVo.type.right_top_2]

		if slot0.icon_container_list[FunctionIconVo.type.right_bottom_1] then
			slot4:setVisible(false)
		end

		if slot5 then
			slot5:setVisible(false)
		end

		if slot6 then
			slot6:setVisible(false)
		end

		slot0.top_container:getChildByName("Image_2"):setVisible(false)
		slot0.top_container:getChildByName("Sprite_6"):setVisible(false)
		slot0.top_container:getChildByName("Sprite_10"):setVisible(false)
		slot0.vip_label:setVisible(false)
		slot0.gold_touch:setVisible(false)
		slot0.gold_touch:setTouchEnabled(false)
	end
end

function MainUiView.getMainUiIndex(slot0)
	return slot0.cur_select_index
end

function MainUiView.checkFightUi(slot0, slot1)
	return slot1 == MainuiConst.btn_index.main_scene or slot1 == MainuiConst.btn_index.drama_scene or slot1 == MainuiConst.btn_index.esecsice or slot1 == MainuiConst.btn_index.guild or slot1 == MainuiConst.btn_index.partner
end

function MainUiView.changeMainUiStatus(slot0, slot1, slot2, slot3, slot4)
	if slot0.bottom_btn_list[slot1] == nil or not slot5.is_unlock then
		if slot5.config ~= nil then
			message(slot5.config.desc)
		end

		return
	end

	if StoryController:getInstance():getModel():isStoryState() then
		return
	end

	if slot0:checkFightClickStatus(slot4) == true then
		return
	end

	if slot0.cur_select_index == slot1 and slot1 ~= MainuiConst.btn_index.main_scene then
		if slot1 == MainuiConst.btn_index.drama_scene then
			BaseView.closeAllView()
		end

		return
	end

	if slot0:checkFightUi(slot0.cur_select_index) then
		BattleController:getInstance():openBattleView(false)
	end

	BaseView.closeAllView()
	slot0:setMaiuiBtnStatus(slot1)

	if slot1 ~= MainuiConst.btn_index.drama_scene then
		slot0:changeBackgroundMusic()
	end

	if slot1 == MainuiConst.btn_index.main_scene then
		MainSceneController:getInstance():handleSceneStatus(true)
	elseif slot1 == MainuiConst.btn_index.partner then
		HeroController:getInstance():openHeroBagWindow(true, slot2, slot3)
	elseif slot1 == MainuiConst.btn_index.backpack then
		if BackpackController:getInstance():getModel():checkEquipsIsFull() == true then
			slot2 = BackPackConst.item_tab_type.EQUIPS
		end

		BackpackController:getInstance():openMainView(true, slot2)
	elseif slot1 == MainuiConst.btn_index.drama_scene then
		uv0:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Darma)
	elseif slot1 == MainuiConst.btn_index.esecsice then
		EsecsiceController:getInstance():openEsecsiceView(true)
	elseif slot1 == MainuiConst.btn_index.guild then
		GuildController:getInstance():checkOpenGuildWindow()
		GuildskillController:getInstance():getModel():clearGuildSkillIconRed()
	elseif slot1 == MainuiConst.btn_index.hallows then
		if slot3 then
			HallowsController:getInstance():openHallowsMainWindow(true, slot3[1], slot3[2], slot3[3])
		else
			HallowsController:getInstance():openHallowsMainWindow(true)
		end
	end

	slot0:changeSomeShowStatus(slot1)
	slot0:doChangeBySubType(slot1, slot2, slot3)
end

function MainUiView.setMaiuiBtnStatus(slot0, slot1)
	if slot0.cur_select_btn ~= nil then
		if slot0.cur_select_index == MainuiConst.btn_index.drama_scene then
			slot0:changeChallengeEffectStatus(false)
		else
			slot0.cur_select_btn.normal:setVisible(true)
			slot0.cur_select_btn.selected:setVisible(false)
			slot0.cur_select_btn.btn:setPositionY(slot0.cur_select_btn.init_y)
		end

		slot0.cur_select_btn = nil
	end

	slot0.cur_select_index = slot1
	slot0.cur_select_btn = slot0.bottom_btn_list[slot1]

	if slot0.cur_select_btn ~= nil then
		if slot0.cur_select_index == MainuiConst.btn_index.drama_scene then
			slot0:changeChallengeEffectStatus(true)
		else
			slot0.cur_select_btn.normal:setVisible(false)
			slot0.cur_select_btn.selected:setVisible(true)
			slot0.cur_select_btn.btn:setPositionY(slot0.cur_select_btn.init_y + 10)
		end
	end

	uv0:setUIFightType(slot0:getUIFightByIndex(slot1))
end

function MainUiView.getUIFightByIndex(slot0, slot1)
	if slot1 == MainuiConst.btn_index.main_scene then
		return MainuiConst.ui_fight_type.main_scene
	elseif slot1 == MainuiConst.btn_index.partner then
		return MainuiConst.ui_fight_type.partner
	elseif slot1 == MainuiConst.btn_index.backpack then
		return MainuiConst.ui_fight_type.backpack
	elseif slot1 == MainuiConst.btn_index.drama_scene then
		return MainuiConst.ui_fight_type.drama_scene
	else
		return MainuiConst.ui_fight_type.normal
	end
end

function MainUiView.doChangeBySubType(slot0, slot1, slot2, slot3)
	if slot1 == nil or slot2 == nil then
		return
	end

	slot0.sub_type = slot2

	delayRun(slot0.root_wnd, 0.2, function ()
		if uv0.sub_type and uv0.sub_type ~= uv1 then
			return
		end

		slot0 = ""
		slot1 = ""

		if uv2 == MainuiConst.btn_index.main_scene then
			slot0 = "MainuiConst.btn_index.main_scene"

			if uv1 == MainuiConst.sub_type.arena_call then
				slot1 = "MainuiConst.sub_type.arena_call"

				MainSceneController:getInstance():openBuild(CenterSceneBuild.arena, ArenaConst.arena_type.loop)
			elseif uv1 == MainuiConst.sub_type.champion_call then
				slot1 = "MainuiConst.sub_type.champion_call"

				MainSceneController:getInstance():openBuild(CenterSceneBuild.arena, ArenaConst.arena_type.rank)
			elseif uv1 == MainuiConst.sub_type.guild_boss then
				slot1 = "MainuiConst.sub_type.guild_boss"

				if uv3 and uv3.gid == 0 then
					message(TI18N("您暂时还没有加入公会"))
				else
					uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildDun)
				end
			elseif uv1 == MainuiConst.sub_type.startower then
				slot1 = "MainuiConst.sub_type.startower"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.StarTower)
			elseif uv1 == MainuiConst.sub_type.partnersummon then
				slot1 = "MainuiConst.sub_type.partnersummon"

				PartnersummonController:getInstance():openPartnerSummonWindow(true)
			elseif uv1 == MainuiConst.sub_type.escort then
				slot1 = "MainuiConst.sub_type.escort"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Escort, uv5)
			elseif uv1 == MainuiConst.sub_type.forge_house then
				slot1 = "MainuiConst.sub_type.forge_house"

				if uv5 and type(uv5) == "number" then
					ForgeHouseController:getInstance():openForgeHouseView(true, uv5)
				else
					ForgeHouseController:getInstance():openForgeHouseView(true)
				end
			elseif uv1 == MainuiConst.sub_type.seerpalace then
				slot1 = "MainuiConst.sub_type.seerpalace"

				if uv5 and type(uv5) == "number" then
					SeerpalaceController:getInstance():openSeerpalaceMainWindow(true, uv5)
				else
					SeerpalaceController:getInstance():openSeerpalaceMainWindow(true)
				end
			elseif uv1 == MainuiConst.sub_type.wonderful then
				slot1 = "MainuiConst.sub_type.wonderful"

				if type(uv5) == "number" then
					ActionController:getInstance():openActionMainPanel(true, nil, uv5)
				elseif type(uv5) == "table" then
					ActionController:getInstance():openActionMainPanel(true, uv5[1], uv5[2])
				end
			elseif uv1 == MainuiConst.sub_type.godbattle then
				slot1 = "MainuiConst.sub_type.godbattle"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Godbattle)
			elseif uv1 == MainuiConst.sub_type.world_boss then
				slot1 = "MainuiConst.sub_type.world_boss"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.WorldBoss)
			elseif uv1 == MainuiConst.sub_type.function_icon then
				slot1 = "MainuiConst.sub_type.function_icon"

				uv4:iconClickHandle(uv5)
			elseif uv1 == MainuiConst.sub_type.guild_skill then
				slot1 = "MainuiConst.sub_type.guild_skill"

				GuildskillController:getInstance():openGuildSkillMainWindow(true)
			elseif uv1 == MainuiConst.sub_type.guildwar then
				slot1 = "MainuiConst.sub_type.guildwar"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildWar)
			elseif uv1 == MainuiConst.sub_type.ladderwar then
				slot1 = "MainuiConst.sub_type.ladderwar"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.LadderWar)
			elseif uv1 == MainuiConst.sub_type.primuswar then
				slot1 = "MainuiConst.sub_type.primuswar"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.PrimusWar)
			elseif uv1 == MainuiConst.sub_type.expedit_fight then
				slot1 = "MainuiConst.sub_type.expedit_fight"

				HeroExpeditController:getInstance():requestEnterHeroExpedit()
			elseif uv1 == MainuiConst.sub_type.endless then
				slot1 = "MainuiConst.sub_type.endless"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Endless)
			elseif uv1 == MainuiConst.sub_type.dungeonstone then
				slot1 = "MainuiConst.sub_type.dungeonstone"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.DungeonStone, uv5)
			elseif uv1 == MainuiConst.sub_type.adventure then
				slot1 = "MainuiConst.sub_type.adventure"

				AdventureController:getInstance():requestEnterAdventure()
			elseif uv1 == MainuiConst.sub_type.eliteMatchWar then
				slot1 = "MainuiConst.sub_type.eliteMatchWar"

				ElitematchController:getInstance():openElitematchMainWindow(true)
			elseif uv1 == MainuiConst.sub_type.elementWar then
				slot1 = "MainuiConst.sub_type.elementWar"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.ElementWar, uv5)
			elseif uv1 == MainuiConst.sub_type.heavenwar then
				slot1 = "MainuiConst.sub_type.heavenwar"

				if uv5 == HeavenConst.Tab_Index.DialRecord then
					HeavenController:getInstance():openHeavenMainWindow(true, nil, HeavenConst.Tab_Index.DialRecord)
				else
					uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.HeavenWar)
				end
			elseif uv1 == MainuiConst.sub_type.crossarenawar then
				slot1 = "MainuiConst.sub_type.crossarenawar"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.CrossArenaWar)
			elseif uv1 == MainuiConst.sub_type.homeworld then
				slot1 = "MainuiConst.sub_type.homeworld"

				HomeworldController:getInstance():requestOpenMyHomeworld()
			elseif uv1 == MainuiConst.sub_type.crosschampion then
				slot1 = "MainuiConst.sub_type.crosschampion"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.CrossChampion)
			elseif uv1 == MainuiConst.sub_type.limitexercise then
				slot1 = "MainuiConst.sub_type.limitexercise"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.LimitExercise)
			elseif uv1 == MainuiConst.sub_type.termbegins then
				slot1 = "MainuiConst.sub_type.termbegins"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.TermBegins, {
					index = 1
				})
			elseif uv1 == MainuiConst.sub_type.termbeginsboss then
				slot1 = "MainuiConst.sub_type.termbeginsboss"

				uv4:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.TermBegins, {
					index = 2
				})
			elseif uv1 == MainuiConst.sub_type.adventruemine then
				slot1 = "MainuiConst.sub_type.adventruemine"

				AdventureController:getInstance():requestEnterMaxAdventureMine()
			elseif uv1 == MainuiConst.sub_type.guildsecretarea then
				slot1 = "MainuiConst.sub_type.guildsecretarea"

				MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildSecretArea)
			elseif uv1 == MainuiConst.sub_type.arenateam then
				slot1 = "MainuiConst.sub_type.arenateam"

				MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Arean_Team)
			elseif uv1 == MainuiConst.sub_type.monopolywar_1 then
				slot1 = "MainuiConst.sub_type.monopolywar_1"

				MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.MonopolyWar_1)
			elseif uv1 == MainuiConst.sub_type.monopolywar_2 then
				slot1 = "MainuiConst.sub_type.monopolywar_2"

				MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.MonopolyWar_2)
			elseif uv1 == MainuiConst.sub_type.monopolywar_3 then
				slot1 = "MainuiConst.sub_type.monopolywar_3"

				MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.MonopolyWar_3)
			elseif uv1 == MainuiConst.sub_type.monopolywar_4 then
				slot1 = "MainuiConst.sub_type.monopolywar_4"

				MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.MonopolyWar_4)
			elseif uv1 == MainuiConst.sub_type.monopolyboss then
				slot1 = "MainuiConst.sub_type.monopolyboss"

				MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.MonopolyBoss)
			elseif uv1 == MainuiConst.sub_type.peakchampion then
				slot1 = "MainuiConst.sub_type.peakchampion"

				ArenapeakchampionController:getInstance():openArenapeakchampionGuessingWindow(true)
			elseif uv1 == MainuiConst.sub_type.planeswar then
				slot1 = "MainuiConst.sub_type.planeswar"

				MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.PlanesWar, uv5)
			elseif uv1 == MainuiConst.sub_type.yearmonsterWar then
				slot1 = "MainuiConst.sub_type.yearmonsterWar"

				ActionyearmonsterController:getInstance():sender28204()
			elseif uv1 == MainuiConst.sub_type.whitedaywar then
				slot1 = "MainuiConst.sub_type.whitedaywar"

				ActionController:getInstance():openActionMainPanel(true, nil, ActionRankCommonType.white_day)
			elseif uv1 == MainuiConst.sub_type.planes_rank then
				slot1 = "MainuiConst.sub_type.planes_rank"

				ActionController:getInstance():openActionMainPanel(true, nil, ActionRankCommonType.planes_rank)
			elseif uv1 == MainuiConst.sub_type.arenamanypeople then
				slot1 = "MainuiConst.sub_type.arenamanypeople"

				MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.AreanManyPeople)
			end
		elseif uv2 == MainuiConst.btn_index.drama_scene then
			slot0 = "MainuiConst.btn_index.drama_scene"

			if uv1 == MainuiConst.sub_type.dungeon_auto then
				slot1 = "MainuiConst.sub_type.dungeon_auto"
				slot2 = BattleDramaController:getInstance():getModel()
				slot3 = slot2:getDramaData()

				if slot2 and slot3 then
					BattleDramaController:getInstance():openDramBossInfoView(true, slot2:getSingleBossData(slot3.max_dun_id))
				end
			end
		end

		if IS_IOS_PLATFORM then
			nativeSdkClickEvent(slot0, slot1)
		end
	end)
end

function MainUiView.changeSomeShowStatus(slot0, slot1)
end

function MainUiView.checkFightClickStatus(slot0, slot1)
	if BattleController:getInstance():getIsClickStatus() then
		if GuideController:getInstance():isInGuide() == true or slot1 == true then
			BattleController:getInstance():csFightExit()

			slot2 = false
		else
			slot3 = TI18N("正在观看录像或切磋中，是否退出?")

			if BattleController:getInstance():getIsHeroTestWar() then
				slot3 = TI18N("正在观看战斗演示，是否切换界面?")
			end

			if slot0.tips_alert then
				slot0.tips_alert:close()

				slot0.tips_alert = nil
			end

			function slot5()
				if uv0.tips_alert then
					uv0.tips_alert:close()

					uv0.tips_alert = nil
				end
			end

			if not slot0.tips_alert then
				slot0.tips_alert = CommonAlert.show(slot3, TI18N("确定"), function ()
					BattleController:getInstance():csFightExit()
				end, TI18N("取消"), slot5, CommonAlert.type.rich, slot5, nil, nil, true)
			end
		end
	end

	return slot2
end

function MainUiView.changeBackgroundMusic(slot0)
	AudioManager:getInstance():playMusic(AudioManager.AUDIO_TYPE.SCENE, RoleController:getInstance():getModel().city_music_name or "s_002", true)
end

function MainUiView.updateBtnTipsPoint(slot0, slot1, slot2)
	if not slot0.bottom_btn_list[slot1] then
		return
	end

	if slot2 == nil then
		slot0.btn_cache_tips[slot1] = nil
	elseif type(slot2) ~= "table" then
		slot0.btn_cache_tips[slot1] = slot2
	else
		if slot0.btn_cache_tips[slot1] == nil then
			slot0.btn_cache_tips[slot1] = {}
		end

		if slot2.bid ~= nil then
			slot0.btn_cache_tips[slot1][slot2.bid] = slot2.status
		else
			for slot6, slot7 in pairs(slot2) do
				if slot7.bid ~= nil then
					slot0.btn_cache_tips[slot1][slot7.bid] = slot7.status
				end
			end
		end
	end

	slot3 = false

	if slot0.btn_cache_tips[slot1] then
		if type(slot0.btn_cache_tips[slot1]) == "table" then
			for slot7, slot8 in pairs(slot0.btn_cache_tips[slot1]) do
				if slot8 == true then
					slot3 = true

					break
				end
			end
		else
			slot3 = slot0.btn_cache_tips[slot1]
		end
	end

	if slot0.bottom_btn_list[slot1] and slot4.tips_status ~= slot3 then
		slot4.tips_status = slot3

		if slot4.tips_point then
			slot4.tips_point:setVisible(slot3)
		end
	end
end

function MainUiView.showRedBagEffect(slot0, slot1)
	if slot1 == true and not uv0(slot0.play_effect) then
		return
	end

	slot0.red_bag_container:setVisible(slot1)

	if slot1 == true and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(260), cc.p(slot0.red_bag_size.width / 2, slot0.red_bag_size.height / 2), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.red_bag_container:addChild(slot0.play_effect, 1)
	elseif slot0.play_effect then
		slot0.play_effect:removeFromParent()

		slot0.play_effect = nil
	end
end

function MainUiView.showRedBagEffect2(slot0, slot1, slot2)
	slot0.red_bag_container_2:setVisible(slot1)

	if slot1 == true then
		if not slot0.redbag_effect then
			slot0.redbag_effect = createEffectSpine(PathTool.getEffectRes(331), cc.p(slot0.red_bag_2_size.width / 2, slot0.red_bag_2_size.height / 2), cc.p(0.5, 0.5), true, PlayerAction.action_1)

			slot0.red_bag_container_2:addChild(slot0.redbag_effect, 1)
		else
			slot0.redbag_effect:setToSetupPose()
		end

		if (slot2 or 1) == 1 then
			slot0.redbag_effect:setAnimation(0, PlayerAction.action_1, true)
			slot0.red_bag_container_2:setPositionX(-100)
		else
			slot0.redbag_effect:setAnimation(0, PlayerAction.action_2, true)
			slot0.red_bag_container_2:setPositionX(-40)
		end
	elseif slot0.redbag_effect then
		slot0.redbag_effect:removeFromParent()

		slot0.redbag_effect = nil
	end
end

function MainUiView.showRedBagEffect3(slot0, slot1, slot2)
	slot0.red_bag_container_3:setVisible(slot1)

	if slot1 == true then
		if not slot0.redbag_effect_2 then
			slot0.redbag_effect_2 = createEffectSpine(PathTool.getEffectRes(331), cc.p(slot0.red_bag_3_size.width / 2, slot0.red_bag_3_size.height / 2), cc.p(0.5, 0.5), true, PlayerAction.action_1)

			slot0.red_bag_container_3:addChild(slot0.redbag_effect_2, 1)
		else
			slot0.redbag_effect_2:setToSetupPose()
		end

		if (slot2 or 1) == 1 then
			slot0.redbag_effect_2:setAnimation(0, PlayerAction.action_1, true)
			slot0.red_bag_container_3:setPositionX(-100)
		else
			slot0.redbag_effect_2:setAnimation(0, PlayerAction.action_2, true)
			slot0.red_bag_container_3:setPositionX(-40)
		end
	elseif slot0.redbag_effect_2 then
		slot0.redbag_effect_2:removeFromParent()

		slot0.redbag_effect_2 = nil
	end
end

function MainUiView.showMergeEffect(slot0, slot1, slot2)
	slot0.vote_mergeServer_container:setVisible(slot1)

	if slot1 == true then
		if not slot0.show_MergeEffect then
			slot0.show_MergeEffect = createEffectSpine(PathTool.getEffectRes(205), cc.p(slot0.vote_mergeServer_container_size.width / 2, slot0.vote_mergeServer_container_size.height / 2), cc.p(0.5, 0.5), true, PlayerAction.action_2)

			slot0.vote_mergeServer_container:addChild(slot0.show_MergeEffect, 1)
		else
			slot0.show_MergeEffect:setToSetupPose()
		end

		_type = slot2 or 1

		if _type == 1 then
			slot0.show_MergeEffect:setAnimation(0, PlayerAction.action_2, true)
			slot0.vote_mergeServer_container:setPositionX(-50)
		else
			slot0.show_MergeEffect:setAnimation(0, PlayerAction.action_1, true)
			slot0.vote_mergeServer_container:setPositionX(-60)
		end
	elseif slot0.show_MergeEffect then
		slot0.show_MergeEffect:removeFromParent()

		slot0.show_MergeEffect = nil
	end
end

function MainUiView.showTimeCollectEffect(slot0, slot1)
	slot0.time_collect_container:setVisible(slot1)

	if slot1 == true then
		if not slot0.timecollect_effect then
			slot0.timecollect_effect = createEffectSpine(PathTool.getEffectRes(538), cc.p(slot0.time_collect_size.width / 2, slot0.time_collect_size.height / 2), cc.p(0.5, 0.5), true, PlayerAction.action_1)

			slot0.time_collect_container:addChild(slot0.timecollect_effect, 1)
		else
			slot0.timecollect_effect:setToSetupPose()
		end

		slot0.timecollect_effect:setAnimation(0, PlayerAction.action, true)
	elseif slot0.timecollect_effect then
		slot0.timecollect_effect:removeFromParent()

		slot0.timecollect_effect = nil
	end
end

function MainUiView.open(slot0)
	if slot0.node:getParent() == nil then
		ViewManager:getInstance():addToLayerByTag(slot0.node, ViewMgrTag.TOP_TAG)
		slot0:updateRoleData()
		slot0:checkUnLockStatusByLev()
		slot0:createChallengeEffect()
		slot0:createChatBubble()
		slot0:adaptScreen()

		if slot0.function_time_ticket == nil then
			slot0.function_time_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0:functionTimeTicketList()
			end, 1)
		end
	else
		slot0:handleHideContainer(true)
	end
end

function MainUiView.handleHideContainer(slot0, slot1)
	slot0.hide_container_status = slot1

	if slot0.wait_update == nil then
		slot0.wait_update = GlobalTimeTicket:getInstance():add(function ()
			if uv0.hide_container_status == true then
				uv0.is_open = uv0.hide_container_status

				uv0.hide_container:setVisible(uv0.is_open)
				uv0.icon_container:setVisible(uv0.is_open)
				uv0.prompt_container:setVisible(uv0.is_open)
			end

			GlobalTimeTicket:getInstance():remove(uv0.wait_update)

			uv0.wait_update = nil
		end, 0.2, 1)
	end
end

function MainUiView.close(slot0)
	if not uv0(slot0.hide_container) then
		slot0.is_open = false
		slot0.hide_container_status = false

		slot0.hide_container:setVisible(false)
		slot0.icon_container:setVisible(false)
		slot0.prompt_container:setVisible(false)
	end
end

function MainUiView.isOpen(slot0)
	return slot0.is_open
end

function MainUiView.showFuncIconList(slot0, slot1)
	if not uv0(slot0.icon_container) then
		slot0.icon_container:setVisible(slot1)
	end
end

function MainUiView.addIconList(slot0, slot1)
	if slot1 == nil then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if slot6 ~= nil and slot6.config ~= nil and not slot0:checkIconIn(slot6.config.id) then
			slot0.render_list_dic[slot6.config.id] = slot6

			table.insert(slot0.render_list, slot6)
		end
	end

	if slot0.render_list ~= nil and next(slot0.render_list) ~= nil then
		table.sort(slot0.render_list, SortTools.tableLowerSorter({
			"pos",
			"sort"
		}))
	end

	if slot0.add_function_timer == nil then
		slot0.add_function_timer = GlobalTimeTicket:getInstance():add(function ()
			uv0:createFunctionIcon()
		end, 2 / display.DEFAULT_FPS)
	end
end

function MainUiView.addIcon(slot0, slot1)
	if slot1 == nil or slot1.config == nil or slot0:checkIconIn(slot1.config.id) then
		return
	end

	slot0.render_list_dic[slot1.config.id] = slot1

	table.insert(slot0.render_list, slot1)
	table.sort(slot0.render_list, SortTools.tableLowerSorter({
		"pos",
		"sort"
	}))

	if slot0.add_function_timer == nil then
		slot0.add_function_timer = GlobalTimeTicket:getInstance():add(function ()
			uv0:createFunctionIcon()
		end, 2 / display.DEFAULT_FPS)
	end
end

function MainUiView.checkIconIn(slot0, slot1)
	if slot0.function_list[slot1] ~= nil or slot0.render_list_dic[slot1] ~= nil then
		return true
	end

	return false
end

function MainUiView.removeIcon(slot0, slot1)
	if Config.FunctionData.data_info[slot1] == nil then
		return
	end

	if slot0.function_list[slot1] ~= nil and slot0.function_list[slot1].DeleteMe then
		slot0.function_list[slot1]:DeleteMe()

		slot0.function_list[slot1] = nil
	end

	for slot6, slot7 in ipairs(slot0.render_list) do
		if slot7.config.id == slot1 then
			table.remove(slot0.render_list, slot6)

			break
		end
	end

	slot0.render_list_dic[slot1] = nil

	if slot0.layout_list == nil or slot0.layout_list[slot2.type] == nil then
		return
	end

	slot6 = slot2.type

	for slot6, slot7 in ipairs(slot0.layout_list[slot6]) do
		if slot7 and slot7.config.id == slot1 then
			table.remove(slot0.layout_list[slot2.type], slot6)

			break
		end
	end

	slot0:updateIconLayout(slot2.type)
end

function MainUiView.createFunctionIcon(slot0)
	if slot0.render_list == nil or next(slot0.render_list) == nil then
		if slot0.add_function_timer ~= nil then
			GlobalTimeTicket:getInstance():remove(slot0.add_function_timer)

			slot0.add_function_timer = nil
		end

		slot0.can_touch_unfold = true

		return
	end

	if table.remove(slot0.render_list, 1) == nil then
		return
	end

	slot0.render_list_dic[slot1.config.id] = nil

	if slot1.config and slot1.config.is_show == 0 then
		return
	end

	slot0:addItemToTabArray(slot1)
end

function MainUiView.addItemToTabArray(slot0, slot1)
	if slot1 == nil or slot1.config == nil then
		return
	end

	if slot0.layout_list == nil then
		slot0.layout_list = {}
	end

	if slot0.layout_list[slot1.config.type] == nil then
		slot0.layout_list[slot1.config.type] = {}
	end

	slot2 = true
	slot6 = slot1.config.type

	for slot6, slot7 in pairs(slot0.layout_list[slot6]) do
		if slot7.config.id == slot1.config.id then
			slot7 = slot1
			slot2 = false

			break
		end
	end

	slot1.is_new = slot2

	table.insert(slot0.layout_list[slot1.config.type], slot1)
	table.sort(slot0.layout_list[slot1.config.type], SortTools.KeyLowerSorter("sort"))
	slot0:updateIconLayout(slot1.config.type)
end

function MainUiView.updateIconLayout(slot0, slot1)
	slot0:updateIconBgShowStatus(slot1)

	if slot0.layout_list == nil or slot0.layout_list[slot1] == nil or next(slot0.layout_list[slot1]) == nil then
		return
	end

	if slot0:getContainerByType(slot1) == nil or uv0(slot2) then
		return
	end

	slot4, slot5 = nil

	for slot9 = 1, #slot0.layout_list[slot1] do
		if slot0.layout_list[slot1][slot9] and slot4.config then
			if slot0.function_list[slot4.config.id] == nil and slot4.is_new == true then
				slot4.is_new = false
				slot5 = FunctionIcon.new(slot4)

				slot2:addChild(slot5)

				slot0.function_list[slot4.config.id] = slot5
			end

			if slot0.function_list[slot4.config.id] ~= nil then
				slot0:setIconPosition(slot5, slot9, slot2, slot1)
			end
		end
	end

	slot0:updateIconRedStatus()
	slot0:updateHandleBtnShowStatus()
end

function MainUiView.updateIconBgShowStatus(slot0, slot1)
	if slot1 == FunctionIconVo.type.right_top_2 then
		if next(slot0.layout_list[slot1]) ~= nil then
			slot2 = slot0.icon_container_list[slot1]

			if not slot0.right_icon_bg then
				slot0.right_icon_bg = createImage(slot2, PathTool.getResFrame("common", "mainui_1036"), slot2:getContentSize().width * 0.5, 190, cc.p(0.5, 1), true, -1, true)

				slot0.right_icon_bg:setCapInsets(cc.rect(40, 115, 10, 1))

				slot0.right_arrow_btn = ccui.Layout:create()

				slot0.right_arrow_btn:setTouchEnabled(true)
				slot0.right_arrow_btn:setContentSize(cc.size(100, 70))
				slot0.right_arrow_btn:setAnchorPoint(0.5, 0)
				slot0.right_arrow_btn:setPosition(50, 0)
				slot0.right_icon_bg:addChild(slot0.right_arrow_btn)
				registerButtonEventListener(slot0.right_arrow_btn, function ()
					uv0:onClickArrowBtn(1)
				end, true, 1, nil, nil, 0.5)
			end

			slot0.right_icon_bg.bg_hight = #slot0.layout_list[slot1] * 94 + 164

			slot0.right_icon_bg:setVisible(true)

			if slot0.right_icon_unfold == true then
				slot0.right_icon_bg:setContentSize(cc.size(98, slot3))
			end
		elseif slot0.right_icon_bg then
			slot0.right_icon_bg:setVisible(false)
		end
	end

	slot0:adjustTopcontainerPos()
end

function MainUiView.onClickArrowBtn(slot0, slot1)
	if not slot0.can_touch_unfold then
		return
	end

	if slot1 == 1 then
		if #slot0.layout_list[FunctionIconVo.type.right_top_2] <= 1 then
			return
		end

		slot2, slot3 = slot0:getIconListByType(FunctionIconVo.type.right_top_2)

		if slot0.right_icon_unfold == true then
			slot0.right_icon_unfold = false

			slot0:showIconUnfoldAni(slot2, 1, slot3)
			slot0:showIconBgUnfoldAni(slot0.right_icon_bg, 1)
		else
			slot0.right_icon_unfold = true

			slot0:showIconUnfoldAni(slot2, 2, slot3)
			slot0:showIconBgUnfoldAni(slot0.right_icon_bg, 2)
		end

		slot0:updateIconRedStatus()
	end
end

function MainUiView.updateIconRedStatus(slot0)
	slot1 = slot0:getIconListByType(FunctionIconVo.type.right_top_2)

	if slot0.right_icon_unfold == true then
		addRedPointToNodeByStatus(slot0.right_icon_bg, false)
	else
		slot2 = false

		for slot6, slot7 in pairs(slot1) do
			if slot7:getIconRedStatus() == true then
				slot2 = true

				break
			end
		end

		addRedPointToNodeByStatus(slot0.right_icon_bg, slot2, -5, -slot0.right_icon_bg:getContentSize().height + 55)
	end
end

function MainUiView.showIconBgUnfoldAni(slot0, slot1, slot2)
	slot3 = 0
	slot4 = 10
	slot6 = (slot1.bg_hight - 258) / slot4
	slot0.icon_bg_timer_id = GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 + 1
		slot0 = nil

		uv2:setContentSize(cc.size(98, uv1 == 1 and uv2.bg_hight - uv0 * uv3 or uv4 + uv0 * uv3))

		if uv5 <= uv0 then
			GlobalTimeTicket:getInstance():remove(uv6.icon_bg_timer_id)
		end
	end, uv0, slot4, slot0.icon_bg_timer_id)
end

function MainUiView.getIconListByType(slot0, slot1)
	slot2 = {}
	slot3 = nil

	for slot8 = 1, #slot0.layout_list[slot1] do
		if slot0.layout_list[slot1][slot8] and slot9.config then
			icon = slot0.function_list[slot9.config.id]

			if slot8 == 1 then
				slot3 = icon.original
			else
				uv0(slot2, icon)
			end
		end
	end

	return slot2, slot3
end

function MainUiView.showIconUnfoldAni(slot0, slot1, slot2, slot3)
	if slot2 == 1 then
		if slot3 then
			for slot7, slot8 in pairs(slot1) do
				slot8:setIsShowUnfoldAni(true)
				slot8:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(uv0, slot3), cc.FadeOut:create(uv0)), cc.CallFunc:create(function ()
					uv0:setVisible(false)
					uv0:setIsShowUnfoldAni(false)
				end)))
			end
		end
	else
		for slot7, slot8 in pairs(slot1) do
			if slot8.original then
				slot8:setPosition(slot3)
				slot8:setVisible(true)
				slot8:setIsShowUnfoldAni(true)
				slot8:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(uv0, slot8.original), cc.FadeIn:create(uv0)), cc.CallFunc:create(function ()
					uv0:setIsShowUnfoldAni(false)
				end)))
			end
		end
	end
end

function MainUiView.updateHandleBtnShowStatus(slot0)
	if not MAKELIFEBETTER and not IS_APPLE_RMUI and (#slot0.layout_list[FunctionIconVo.type.right_bottom_1] > 0 or #slot0.layout_list[FunctionIconVo.type.right_bottom_2] > 0) then
		slot0.handle_btn:setVisible(true)
	else
		slot0.handle_btn:setVisible(false)
	end
end

function MainUiView.getContainerByType(slot0, slot1)
	if slot0.icon_container_list ~= nil then
		return slot0.icon_container_list[slot1]
	end
end

function MainUiView.setIconPosition(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot3:getContentSize()
	slot6 = 0
	slot7 = 0

	if slot4 == FunctionIconVo.type.right_top_1 then
		slot6 = slot5.width - slot1.width * 0.5 - (slot2 - 1) % slot0.top_left_max_sum * (slot1.width + slot0.top_left_off)
		slot7 = slot5.height - math.floor((slot2 - 1) / slot0.top_left_max_sum) * (slot5.height + 10) - slot5.height * 0.5
	elseif slot4 == FunctionIconVo.type.right_bottom_1 then
		slot6 = slot5.width - slot1.width * 0.5 - (slot2 - 1) % slot0.left_max_sum * (slot1.width + slot0.left_off)
		slot7 = slot5.height - math.floor((slot2 - 1) / slot0.left_max_sum) * slot5.height - slot5.height * 0.5
	elseif slot4 == FunctionIconVo.type.right_bottom_2 then
		slot6 = slot5.width * 0.5
		slot7 = slot1.height * 0.5 + (slot2 - 1) * (slot1.height + slot0.right_off)
	elseif slot4 == FunctionIconVo.type.right_top_2 then
		slot6 = slot5.width * 0.5
		slot7 = slot5.height - slot1.height * 0.5 - (slot2 - 1) * (slot1.height + slot8)
	elseif slot4 == FunctionIconVo.type.left_top then
		slot6 = slot5.width * 0.5
		slot7 = slot5.height - slot1.height * 0.5 - (slot2 - 1) * (slot1.height + slot8)
	end

	if slot1.original == nil or getNorKey(slot1.original.x, slot1.original.y) ~= getNorKey(slot6, slot7) then
		slot1:setPosition(slot6, slot7)

		slot1.original = cc.p(slot6, slot7)
	end

	if slot2 ~= 1 and slot4 == FunctionIconVo.type.right_top_2 and not slot0.right_icon_unfold then
		slot1:setOpacity(0)
		slot1:setVisible(false)
	else
		slot1:setOpacity(255)
		slot1:setVisible(true)
	end

	slot0:adjustTopcontainerPos()
end

function MainUiView.adjustTopcontainerPos(slot0)
	slot2 = 0

	if slot0.layout_list[FunctionIconVo.type.right_top_2] and tableLen(slot1) > 0 then
		slot2 = 1
	end

	if slot0.is_have_top_2 ~= slot2 then
		slot0.is_have_top_2 = slot2

		if slot2 == 1 then
			slot0.icon_container_list[FunctionIconVo.type.right_top_1]:setPositionX(display.getRight() - 113)
		else
			slot3:setPositionX(display.getRight() - 11)
		end
	end
end

function MainUiView.functionTimeTicketList(slot0)
	if slot0.function_list and next(slot0.function_list) ~= nil then
		for slot4, slot5 in pairs(slot0.function_list) do
			if slot5.data and slot5.data.end_time and slot5.data.end_time > 0 and slot5.updateTime then
				slot5:updateTime()
			end
		end
	end
end

function MainUiView.updateRoleData(slot0)
	slot0:updateRoleLev()
	slot0:updateRoleFc()
	slot0:updateRoleName()
	slot0:updateRoleExp()
	slot0:updateRoleHead()
	slot0:updateRoleHeadCircle()
	slot0:updateRoleVip()
	slot0:updateRoleAssets()
end

function MainUiView.updateRoleLev(slot0)
	if uv0 == nil then
		return
	end

	if slot0.cur_lev == uv0.lev then
		return
	end

	slot0.cur_lev = uv0.lev

	slot0.lev_label:setString(slot0.cur_lev)
end

function MainUiView.updateRoleFc(slot0)
	if uv0 == nil then
		return
	end

	if slot0.cur_fc == uv0.power then
		return
	end

	slot0.cur_fc = uv0.power

	slot0.fight_label:setString(slot0.cur_fc)
end

function MainUiView.updateRoleName(slot0)
	if uv0 == nil then
		return
	end

	if slot0.cur_name == uv0.name then
		return
	end

	slot0.cur_name = uv0.name

	slot0.name_label:setString(slot0.cur_name)
end

function MainUiView.updateRoleExp(slot0)
	if uv0 == nil or uv0.exp == nil or uv0.exp_max == nil then
		return
	end

	slot0.exp_bar:setPercent(100 * uv0.exp / uv0.exp_max)
end

function MainUiView.updateRoleHead(slot0)
	if TencentCos:getInstance():getSecretid() == nil or slot1 == "" then
		return
	end

	if uv0 == nil then
		return
	end

	slot3 = uv0.face_update_time

	slot0.role_head:setHeadRes(uv0.face_id, false, LOADTEXT_TYPE, uv0.face_file, uv0.face_update_time)
end

function MainUiView.updateRoleHeadCircle(slot0)
	if uv0 == nil then
		return
	end

	if slot0.avatar_base_id == uv0.avatar_base_id then
		return
	end

	slot0.avatar_base_id = uv0.avatar_base_id

	if Config.AvatarData.data_avatar[uv0.avatar_base_id] then
		slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot1.res_id or 1), false, false), nil, false, slot1.offy)
	end
end

function MainUiView.updateRoleVip(slot0)
	if uv0 == nil then
		return
	end

	slot0.vip_label:setNum(uv0.vip_lev)
end

function MainUiView.updateRoleAssets(slot0)
	if uv0 == nil then
		return
	end

	for slot4, slot5 in ipairs(slot0.wealth_item_key) do
		slot0.wealth_label_list[slot4]:setString(MoneyTool.GetMoneyString(uv0[slot5] or 0))

		if Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot5]) then
			slot10 = PathTool.getItemRes(slot9.icon, false)

			if slot0.record_wealth_icon_res[slot4] == nil or slot0.record_wealth_icon_res[slot4] ~= slot10 then
				slot0.record_wealth_icon_res[slot4] = slot10

				if slot0.wealth_icon_list[slot4] then
					loadSpriteTexture(slot0.wealth_icon_list[slot4], slot10, LOADTEXT_TYPE)
				end
			end
		end
	end
end

function MainUiView.getFreeSize(slot0)
	if slot0.free_size == nil then
		slot0.free_size = 2 * (display.height - SCREEN_HEIGHT) * 0.5 + slot0.top_container:getPositionY() + math.abs(slot0.bottom_container:getPositionY()) + SCREEN_HEIGHT - slot0.bottom_container:getContentSize().height - slot0.top_container:getContentSize().height - display.height
	end

	return slot0.free_size
end

function MainUiView.getTopViweBottomY(slot0)
	if slot0.top_view_bottom_y == nil then
		slot0.top_view_bottom_y = slot0.top_container:convertToWorldSpace(cc.p(0, 0)).y
	end

	return slot0.top_view_bottom_y
end

function MainUiView.getTopViewHeight(slot0)
	if slot0.top_height == nil then
		slot0.top_height = slot0.top_container:getContentSize().height + 20
	end

	return slot0.top_height
end

function MainUiView.adaptScreen(slot0)
	slot0.top_container:setPositionY(display.getTop())
	slot0.bottom_container:setPositionY(display.getBottom())
end

function MainUiView.getBottomHeight(slot0)
	if slot0.bottom_height == nil then
		slot0.bottom_height = slot0.bottom_container:getContentSize().height + 20
	end

	return slot0.bottom_height
end

function MainUiView.getChatHeightPositionY(slot0)
	if slot0.bottom_world_height == nil then
		slot0.bottom_world_height = display.getBottom() + slot0.bottom_container:getContentSize().height
	end

	return slot0.bottom_world_height
end

function MainUiView.checkUnLockStatus(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = false

	for slot6, slot7 in pairs(slot0.bottom_btn_list) do
		if slot7.config and slot7.config.activate and slot7.config.activate[1][1] == "dun" and slot8[2] <= slot1 ~= slot7.is_unlock then
			slot7.is_unlock = slot2

			if slot7.notice then
				slot7.notice:setVisible(not slot2)
			end

			if slot2 == false then
				setChildUnEnabled(true, slot7)
			else
				setChildUnEnabled(false, slot7)
			end
		end
	end
end

function MainUiView.checkUnLockStatusByLev(slot0, slot1)
	if uv0 == nil then
		return
	end

	slot2 = false

	for slot6, slot7 in pairs(slot0.bottom_btn_list) do
		if slot7.config and slot7.config.activate and slot7.config.activate[1][1] == "lev" and slot8[2] <= uv0.lev ~= slot7.is_unlock then
			slot7.is_unlock = slot2

			if slot7.notice then
				slot7.notice:setVisible(not slot2)
			end

			if slot2 == false then
				setChildUnEnabled(true, slot7)
			else
				setChildUnEnabled(false, slot7)
			end
		end
	end
end

function MainUiView.createChallengeEffect(slot0)
	if slot0.challenge_effect ~= nil then
		return
	end

	if slot0.bottom_btn_list[MainuiConst.btn_index.drama_scene] == nil then
		return
	end

	slot3 = slot1.btn:getContentSize()
	slot4 = PlayerAction.action_1

	if slot0.cur_select_index == MainuiConst.btn_index.drama_scene then
		slot4 = PlayerAction.action_2
	end

	slot0.challenge_effect = createEffectSpine(PathTool.getEffectRes(310), cc.p(5, 10), cc.p(0, 0), true, slot4)

	slot0.challenge_effect:setScale(1.3)
	slot1.icon:addChild(slot0.challenge_effect)
end

function MainUiView.changeChallengeEffectStatus(slot0, slot1)
	if slot0.challenge_effect == nil then
		return
	end

	if slot1 == true then
		slot0.challenge_effect:setAnimation(0, PlayerAction.action_2, true)
	else
		slot0.challenge_effect:setAnimation(0, PlayerAction.action_1, true)
	end
end

function MainUiView.updateChatMsgNum(slot0)
	slot1 = ChatController:getInstance()
	slot2 = 0
	slot2 = SysEnv:getInstance():getBool(SysEnv.keys.chat_red_open, true) == false and slot1:getChannelMsgSum(ChatConst.Channel.Friend) + slot1:getChannelMsgSum(ChatConst.Channel.Gang) or slot1:getTotalMsgSum()

	if slot0.chat_red_container then
		slot0.chat_red_container:setVisible(slot2 > 0)

		if slot2 > 99 then
			slot2 = "+99"
		end

		slot0.chat_red_num:setString(slot2)
	end
end

function MainUiView.registerEvent(slot0)
	if uv0 and slot0.role_update_event == nil then
		slot0.role_update_event = uv0:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "power" or slot0 == "match_rank" then
				uv0:updateRoleFc()
			elseif slot0 == "lev" then
				uv0:updateRoleLev()
				uv0:updataVIPRedPoint()
				uv0:checkUnLockStatusByLev(slot1)

				uv0.overLev = false

				if Config.MergeVotingData.data_const.level_limit.val <= slot1 then
					uv0.overLev = true

					MergeserverController:getInstance():sender10991()
				end

				uv0:showPromptEffect(true)
				uv0:updateTipsBtnStatus()
				uv0:updateCityDesc(true)
				uv0:updataExchangeRedPoint()
			elseif slot0 == "exp" or slot0 == "exp_max" then
				uv0:updateRoleExp()
			elseif slot0 == "name" then
				uv0:updateRoleName()
			elseif slot0 == "face_id" or slot0 == "face_update_time" or slot0 == "custom_face_file" then
				uv0:updateRoleHead()
			elseif slot0 == "avatar_base_id" then
				uv0:updateRoleHeadCircle()
			elseif slot0 == "coin" or slot0 == "gold" or slot0 == "red_gold" or slot0 == "silver_coin" or slot0 == "hero_exp" or slot0 == "klb" then
				uv0:updateRoleAssets()
			elseif slot0 == "vip_lev" then
				uv0:updateRoleVip()
			elseif slot0 == "gid" and slot1 == 0 then
				uv0:showRedBagEffect(false)
			end
		end)
	end

	if slot0.vip_image_redpoint == nil then
		slot0.vip_image_redpoint = GlobalEvent:getInstance():Bind(VipEvent.SUPRE_CARD_GET, function (slot0)
			uv0:updataVIPRedPoint()
		end)
	end

	slot0.red_bag_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("main_ui_view[red_bag_container]", "red_bag_container")
			end

			playButtonSound2()
			RedbagController:getInstance():openMainView(true)
		end
	end)
	slot0.red_bag_container_2:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("main_ui_view[red_bag_container]", "red_bag_container_2")
			end

			playButtonSound2()

			if uv0.red_bag_2_type == 1 then
				PetardActionController:getInstance():openRedbagWindow(true)
			elseif uv0.red_bag_2_type == 2 then
				JumpController:getInstance():jumpViewByEvtData({
					70
				})
			end
		end
	end)
	slot0.red_bag_container_3:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("main_ui_view[red_bag_container]", "red_bag_container_3")
			end

			playButtonSound2()
			ReturnActionController:getInstance():openReturnRedbagWindow(true)
		end
	end)
	slot0.time_collect_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("main_ui_view[time_collect_container]", "time_collect_container")
			end

			playButtonSound2()
			ActionController:getInstance():openActionTimeCollectWindow(true)
		end
	end)
	slot0.vote_mergeServer_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			MergeserverController:getInstance():openMergeWindow(true)
		end
	end)

	if slot0.role_head then
		slot0.role_head:addCallBack(function ()
			RoleController:getInstance():openRolePersonalSpacePanel(true)
		end, false)
	end

	if slot0.gold_touch then
		slot0.gold_touch:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.wealth_item_key[2] then
					if uv0.wealth_item_key[2] == "hero_exp" then
						if Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.hero_exp) then
							BackpackController:getInstance():openTipsSource(true, slot2)
						end
					else
						VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
					end
				else
					VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
				end
			end
		end)
	end

	if slot0.klb_touch then
		slot0.klb_touch:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.wealth_item_key[3] then
					VipController:getInstance():openVipMainWindow(true, VIPTABCONST.KLB)
				else
					VipController:getInstance():openVipMainWindow(true, VIPTABCONST.KLB)
				end
			end
		end)
	end

	slot0.handle_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("main_ui_view[handle_btn]", "handle_btn")
			end

			playButtonSound2()
			uv0:shrinkBtnContainer()
		end
	end)
	slot0.effect_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("main_ui_view[effect_container]", "effect_container")
			end

			playButtonSound2()

			if uv0.training_camp_lev_limit and uv1.lev < uv0.training_camp_lev_limit.val then
				message(uv2(TI18N("%d级开启变强攻略"), uv0.training_camp_lev_limit.val))

				return
			end

			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Training_Camp)
		end
	end)
	slot0.tips_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("main_ui_view[tips_btn]", "tips_btn")
			end

			slot2 = false

			uv0:_onClickPromptTips(not uv0.prompt_tips_layout:isVisible())
		end
	end)

	if slot0.coin_touch then
		slot0.coin_touch:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if IS_IOS_PLATFORM then
					nativeSdkClickEvent("main_ui_view[coin_touch]", "coin_touch")
				end

				playButtonSound2()

				if uv0.wealth_item_key[1] then
					ExchangeController:getInstance():openExchangeMainView(true)
				else
					ExchangeController:getInstance():openExchangeMainView(true)
				end
			end
		end)
	end

	if slot0.coin_touch_redpoint == nil then
		slot0.coin_touch_redpoint = GlobalEvent:getInstance():Bind(ExchangeEvent.Extra_Reward, function (slot0)
			uv0.exchange_data = slot0

			uv0:updataExchangeRedPoint()
		end)
	end

	if slot0.new_msg_add_event == nil then
		slot0.new_msg_add_event = GlobalEvent:getInstance():Bind(EventId.CHAT_NEWMSG_FLAG, function ()
			uv0:updateChatMsgNum()
		end)
	end

	if slot0.red_bag_event == nil then
		slot0.red_bag_event = GlobalEvent:getInstance():Bind(RedbagEvent.Can_Get_Red_Bag, function (slot0)
			if slot0 and next(slot0) ~= nil then
				uv0:showRedBagEffect(true)
			else
				uv0:showRedBagEffect(false)
			end
		end)
	end

	if slot0.petard_red_bag_event == nil then
		slot0.petard_red_bag_event = GlobalEvent:getInstance():Bind(PetardActionEvent.Update_Petard_Main_Redbag_Event, function (slot0)
			if uv0.red_bag_2_type == 2 and uv0.red_bag_container_2 and uv0.red_bag_container_2:isVisible() == true then
				return
			end

			if slot0 and slot0 ~= 0 then
				uv0.red_bag_2_type = 1

				uv0:showRedBagEffect2(true, slot0)
			else
				uv0:showRedBagEffect2(false)
			end
		end)
	end

	if slot0.year_red_bag_event == nil then
		slot0.year_red_bag_event = GlobalEvent:getInstance():Bind(ActionyearmonsterEvent.Update_Year_Main_Redbag_Event, function (slot0)
			if uv0.red_bag_2_type == 1 and uv0.red_bag_container_2 and uv0.red_bag_container_2:isVisible() == true then
				return
			end

			if slot0 and slot0 ~= 0 then
				uv0.red_bag_2_type = 2

				uv0:showRedBagEffect2(true, 2)
			else
				uv0:showRedBagEffect2(false)
			end
		end)
	end

	if slot0.return_red_bag_event == nil then
		slot0.return_red_bag_event = GlobalEvent:getInstance():Bind(ReturnActionEvent.Update_Return_Main_Redbag_Event, function (slot0)
			if slot0 and slot0 ~= 0 then
				uv0:showRedBagEffect3(true, slot0)
			else
				uv0:showRedBagEffect3(false)
			end
		end)
	end

	if slot0.time_collect_event == nil then
		slot0.time_collect_event = GlobalEvent:getInstance():Bind(ActionEvent.Update_Time_Collect_Main_Icon_Event, function (slot0)
			if slot0 and slot0 == 1 then
				uv0:showTimeCollectEffect(true)
			else
				uv0:showTimeCollectEffect(false)
			end
		end)
	end

	if slot0.vote_mergeServer_event == nil then
		slot0.vote_mergeServer_event = GlobalEvent:getInstance():Bind(MergeserverEvent.Update_Main_Mergeserver_Event, function (slot0)
			if slot0 and next(slot0) ~= nil then
				slot1 = RoleController:getInstance():getRoleVo()
				slot2 = GameNet:getInstance():getTime()
				slot3 = Config.MergeVotingData.data_const.level_limit.val
				slot4 = Config.MergeVotingData.data_const.role_time_limit.val
				slot5 = 1

				if slot0.status == 1 then
					if slot0.is_vote == 1 then
						slot5 = 2
					else
						slot5 = 1
					end
				elseif slot0.status == 2 then
					slot5 = 1
				end

				if slot3 <= slot1.lev and slot4 <= (slot2 - slot1.reg_time) / 86400 then
					if slot0.status == 1 then
						uv0:showMergeEffect(true, slot5)
					else
						uv0:showMergeEffect(false)
					end
				end

				if slot0.status == 2 then
					uv0:showMergeEffect(true, 1)
				end
			end
		end)
	end

	if slot0.vote_mergeSuccess_event == nil then
		slot0.vote_mergeSuccess_event = GlobalEvent:getInstance():Bind(MergeserverEvent.Update_Merge_Success_Event, function (slot0)
			if slot0.flag == 1 then
				message(slot0.msg)
				uv0.show_MergeEffect:setAnimation(0, PlayerAction.action_1, true)
				uv0.vote_mergeServer_container:setPositionX(-60)
			else
				uv0.show_MergeEffect:setAnimation(0, PlayerAction.action_2, true)
				uv0.vote_mergeServer_container:setPositionX(-50)
			end
		end)
	end

	if slot0.vote_mergeAction_event == nil then
		slot0.vote_mergeAction_event = GlobalEvent:getInstance():Bind(MergeserverEvent.vote_mergeAction_event, function (slot0)
			if slot0 == false then
				uv0.show_MergeEffect:setAnimation(0, PlayerAction.action_1, true)
				uv0.vote_mergeServer_container:setPositionX(-60)
			else
				uv0.show_MergeEffect:setAnimation(0, PlayerAction.action_2, true)
				uv0.vote_mergeServer_container:setPositionX(-50)
			end
		end)
	end

	if slot0.update_wealth_event == nil then
		slot0.update_wealth_event = GlobalEvent:getInstance():Bind(MainuiEvent.HEAD_UPDATE_WEALTH_EVENT, function (slot0, slot1)
			if slot0 and slot1 then
				uv0.wealth_item_key[slot0] = Config.ItemData.data_assets_id2label[slot1]

				uv0:updateRoleAssets()
			end
		end)
	end

	if not slot0.update_prompt_tips then
		slot0.update_prompt_tips = GlobalEvent:getInstance():Bind(PromptEvent.ADD_PROMPT_DATA, function (slot0)
			if uv0.is_open and not ChatController:getInstance():isChatOpen() and tableLen(PromptController:getInstance():getModel():getPromptList()) > 0 then
				uv0:showPromptTips(true, slot2)
			end
		end)
	end

	if not slot0.remove_prompt_tips then
		slot0.remove_prompt_tips = GlobalEvent:getInstance():Bind(PromptEvent.REMOVE_PROMPT_DATA, function ()
			if tableLen(PromptController:getInstance():getModel():getPromptList()) > 0 then
				uv0:showPromptTips(true, slot1)
			else
				uv0:showPromptTips(false)
			end
		end)
	end

	if not slot0.update_trainingcamp_data then
		slot0.update_trainingcamp_data = GlobalEvent:getInstance():Bind(TrainingcampEvent.Update_Trainingcamp_Data_Event, function ()
			uv0:showPromptEffect(true)
			uv0:updateTipsBtnStatus()
			uv0:updateCityDesc(false)
			uv0:updateCityDesc(true)
		end)
	end
end

function MainUiView.updataVIPRedPoint(slot0)
	if not uv0 then
		return
	end

	if MAKELIFEBETTER ~= true and IS_APPLE_RMUI ~= true and uv0.lev < 6 then
		return
	end
end

function MainUiView.updataExchangeRedPoint(slot0)
	if not slot0.exchange_data then
		return
	end

	slot1 = Config.ConvertData.data_trade_cost.red_lev_min

	for slot5, slot6 in ipairs(slot0.exchange_data.list) do
		if slot6.id == 1 and slot0.coin_redpoint then
			slot7 = false

			if slot6.max - slot6.num > 0 and uv0 and slot1 and slot1.val <= uv0.lev then
				slot7 = true
			end

			addRedPointToNodeByStatus(slot0.coin_redpoint, slot7, 11, 7)
		end
	end
end

function MainUiView.setMergeServerContainerPositionY(slot0, slot1)
	if slot1 then
		slot0.vote_mergeServer_container:setPositionY(300)
	else
		slot0.vote_mergeServer_container:setPositionY(300)
	end
end

function MainUiView.setMainUIChatBubbleStatus(slot0, slot1)
	if not uv0(slot0.chat_bubble) then
		slot0.chat_bubble_status = slot1

		if slot0.chat_wait_update == nil and slot1 == true then
			slot0.chat_wait_update = GlobalTimeTicket:getInstance():add(function ()
				if uv0.chat_bubble_status == true then
					uv0.chat_bubble:setVisible(uv0.chat_bubble_status)
				end

				GlobalTimeTicket:getInstance():remove(uv0.chat_wait_update)

				uv0.chat_wait_update = nil
			end, 0.2, 1)
		else
			slot0.chat_bubble:setVisible(slot0.chat_bubble_status)
		end
	end
end

function MainUiView.createChatBubble(slot0)
	if not uv0(slot0.chat_bubble) then
		return
	end

	if MAKELIFEBETTER == true then
		return
	end

	if IS_APPLE_RMUI == true then
		return
	end

	slot0.chat_bubble = ccui.Layout:create()

	slot0.chat_bubble:setContentSize(cc.size(44, 44))
	slot0.chat_bubble:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.chat_bubble:setTouchEnabled(true)
	slot0.chat_bubble:setPosition(slot0.handle_x, slot0.handle_y + 512)

	slot1 = createSprite(PathTool.getResFrame("mainui", "mainui_chat_main_icon"), 22, 22, slot0.chat_bubble, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot0.chat_red_container = createSprite(PathTool.getResFrame("mainui", "mainui_1034"), 44, 48, slot0.chat_bubble, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot0.chat_red_num = createLabel(18, 1, nil, 18, 14, "99", slot0.chat_red_container, nil, cc.p(0.5, 0.5))

	slot0.chat_bubble:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			if IS_IOS_PLATFORM then
				nativeSdkClickEvent("main_ui_view[chat_bubble]", "chat_bubble")
			end

			if uv0.is_move == false then
				playButtonSound2()
				ChatController:getInstance():openChatPanel()
			end
		elseif slot1 == ccui.TouchEventType.began then
			uv0.is_move = false
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.moved then
			slot2 = slot0:getTouchMovePosition()

			if not uv0.is_move and uv0.touch_began and (math.abs(slot2.x - uv0.touch_began.x) <= 30 and math.abs(slot2.y - uv0.touch_began.y) <= 30) == false then
				uv0.is_move = true
			end

			if uv0.is_move == true and uv0:checkPosInRect(slot0:getParent():convertToNodeSpaceAR(slot2)) then
				slot0:setPosition(cc.p(slot2.x, slot2.y))
			end
		end
	end)
	slot0:updateChatMsgNum()
	ViewManager:getInstance():addToLayerByTag(slot0.chat_bubble, ViewMgrTag.DIALOGUE_TAG)

	if GuideController:getInstance():isInGuide() then
		slot0:setMainUIChatBubbleStatus(false)
	end
end

function MainUiView.checkPosInRect(slot0, slot1)
	slot3 = SCREEN_WIDTH
	slot4 = slot0:getBottomHeight() - math.abs(display.getBottom())
	slot5 = display.getTop() - slot0:getTopViewHeight()

	if slot1.x < 0 + 40 then
		return false
	end

	if slot1.x > slot3 - slot6 then
		return false
	end

	if slot1.y < slot4 + slot6 then
		return false
	end

	if slot1.y > slot5 - slot6 then
		return false
	end

	return true
end

function MainUiView.shrinkBtnContainer(slot0)
	if slot0.is_in_shrink == true then
		return
	end

	slot0.is_in_shrink = true
	slot0.is_shrink = not slot0.is_shrink

	slot0.icon_container_list[FunctionIconVo.type.right_bottom_1]:setVisible(true)
	slot0.icon_container_list[FunctionIconVo.type.right_bottom_2]:setVisible(true)

	slot3 = 100
	slot4, slot5, slot6, slot7 = nil

	if slot0.is_shrink == true then
		slot4 = cc.MoveBy:create(0.1, cc.p(slot3, 0))
		slot5 = cc.MoveBy:create(0.1, cc.p(0, -slot3))
		slot6 = cc.FadeOut:create(0.1)
		slot7 = cc.FadeOut:create(0.1)
	else
		slot4 = cc.MoveBy:create(0.1, cc.p(-slot3, 0))
		slot5 = cc.MoveBy:create(0.1, cc.p(0, slot3))
		slot6 = cc.FadeIn:create(0.1)
		slot7 = cc.FadeIn:create(0.1)
	end

	slot1:runAction(cc.Sequence:create(cc.Spawn:create(slot4, slot6), cc.CallFunc:create(function ()
		uv0.is_in_shrink = false

		if uv0.is_shrink == true then
			uv1:setVisible(false)
		end
	end)))
	slot2:runAction(cc.Sequence:create(cc.Spawn:create(slot5, slot7), cc.CallFunc:create(function ()
		if uv0.is_shrink == true then
			uv1:setVisible(false)
		end
	end)))
end

function MainUiView._onClickPromptTips(slot0, slot1)
	if slot1 == false then
		slot0.prompt_tips_layout:setVisible(false)
	else
		slot2 = cc.p(50.38, 68.23)

		if slot0.training_camp_lev_limit and uv0.lev < slot0.training_camp_lev_limit.val or TrainingcampController:getInstance():getModel():getIsALLFinish() == true then
			slot2 = cc.p(0, 68.23)
		end

		slot0.prompt_tips_layout:setPosition(slot2)
		slot0.prompt_tips_layout:setVisible(true)
	end
end

function MainUiView.checkShowNewPromptBubble(slot0)
	if tableLen(PromptController:getInstance():getModel():getPromptList()) > 0 then
		slot0:showPromptTips(true, slot2)
	end
end

function MainUiView.showPromptBubble(slot0)
	if Config.TrainingCampData.data_city_tips[math.random(#Config.TrainingCampData.data_city_tips) or 1] then
		slot0.prompt_bubble_layout:stopAllActions()
		slot0.prompt_bubble_layout:setVisible(true)
		slot0.prompt_desc:setString(slot2.desc)

		slot3 = slot0.prompt_desc:getContentSize()

		slot0.prompt_bubble:setContentSize(cc.size(slot3.width + 39, slot3.height + 52))
		slot0.prompt_bubble_layout:runAction(cc.Sequence:create(cc.FadeIn:create(0.7), cc.DelayTime:create(1.5), cc.FadeOut:create(0.7)))
	end
end

function MainUiView.updateCityDesc(slot0, slot1)
	if slot1 == true then
		if slot0.training_camp_lev_limit and uv0.lev < slot0.training_camp_lev_limit.val or slot0.prompt_tips_layout and slot0.prompt_tips_layout:isVisible() == true or TrainingcampController:getInstance():getModel():getIsALLFinish() == true then
			slot1 = false
		end
	end

	if slot1 then
		if not slot0.prompt_desc then
			return
		end

		if slot0.time_ticket == nil then
			slot2 = "city_tips_cd"

			if TrainingcampController:getInstance():getModel():getIsFinish() == true then
				slot2 = "city_complete_cd"
			end

			if Config.TrainingCampData.data_const and Config.TrainingCampData.data_const[slot2] then
				slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
					uv0:showPromptBubble()
				end, Config.TrainingCampData.data_const[slot2].val)
			end
		end
	else
		if slot0.time_ticket then
			GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

			slot0.time_ticket = nil
		end

		if slot0.prompt_bubble_layout then
			slot0.prompt_bubble_layout:stopAllActions()
			slot0.prompt_bubble_layout:setVisible(false)
		end
	end
end

function MainUiView.updateTipsBtnStatus(slot0, slot1)
	slot2 = false
	slot3 = false

	if tableLen(PromptController:getInstance():getModel():getPromptList()) > 0 then
		slot2 = true
		slot3 = true
	end

	if slot2 == true then
		if slot0.training_camp_lev_limit and slot0.training_camp_lev_limit.val <= uv0.lev and TrainingcampController:getInstance():getModel():getIsALLFinish() == false then
			slot2 = false
		else
			slot3 = false
		end
	end

	if slot0.tips_btn and not uv1(slot0.tips_btn) then
		slot0.tips_btn:setVisible(slot2)
	end

	if slot1 ~= nil then
		slot0:_onClickPromptTips(slot1)
	else
		if slot3 == false then
			slot3 = slot0.prompt_tips_layout:isVisible() and true or false
		end

		slot0:_onClickPromptTips(slot3)
	end
end

function MainUiView.showPromptTips(slot0, slot1, slot2)
	if slot1 == true and slot2 and next(slot2) ~= nil then
		slot0.prompt_tips_scroll:removeAllChildren()

		for slot7, slot8 in pairs(slot2) do
			slot0.count_size_label:setString(slot8.name)

			if 0 < slot0.count_size_label:getContentSize().width then
				slot3 = slot9.width
			end
		end

		if slot3 < 168 then
			slot3 = 168
		end

		slot4 = tableLen(slot2)
		slot5 = 49
		slot6 = 12
		slot7 = PathTool.getResFrame("mainui", "mainui_tips_bg1")
		slot9 = math.min(slot4 * (slot6 + slot5), 160)
		slot10 = slot3 + 20 + 4

		slot0.prompt_tips_scroll:setContentSize(cc.size(slot10, slot9))
		slot0.prompt_tips_scroll:setInnerContainerSize(cc.size(slot10, slot9))
		slot0.prompt_tips_bg:setContentSize(cc.size(slot10 + slot0.prompt_tips_bg_size.width - slot0.prompt_tips_scroll_size.width, slot9 + 60))

		if slot9 > 160 then
			slot0.prompt_tips_scroll:setInnerContainerSize(cc.size(slot10, math.max(slot0.prompt_tips_scroll_size.height, slot4 * (slot6 + slot5))))
		end

		for slot15, slot16 in pairs(slot2) do
			slot17 = createButton(slot0.prompt_tips_scroll, slot16.name, slot10 / 2, 5 + (slot6 + slot5) * (slot15 - 1), cc.size(slot3, slot5), slot7, 22, Config.ColorData.data_color4[175], slot7, slot7, LOADTEXT_TYPE_PLIST)

			slot17:setAnchorPoint(0.5, 0)
			slot17:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					uv0:onClickPromptTipsItem(uv1)
				end
			end)
		end

		slot0:updateTipsBtnStatus(true)
		slot0:updateCityDesc(false)
	else
		slot0:updateTipsBtnStatus(false)
		slot0:updateCityDesc(true)
	end
end

function MainUiView.showPromptEffect(slot0, slot1)
	if slot0.training_camp_lev_limit and uv0.lev < slot0.training_camp_lev_limit.val or TrainingcampController:getInstance():getModel():getIsALLFinish() == true then
		slot1 = false
	end

	if slot1 == true then
		slot0.effect_container:setVisible(true)

		if not slot0.show_PromptEffect then
			slot0.show_PromptEffect = createEffectSpine(PathTool.getEffectRes(160), cc.p(slot0.prompt_container_effect_size.width / 2, 0), cc.p(0, 0), true, PlayerAction.action)

			slot0.show_PromptEffect:setScale(1)
			slot0.effect_container:addChild(slot0.show_PromptEffect, 1)
		else
			slot0.show_PromptEffect:setToSetupPose()
		end
	else
		if slot0.show_PromptEffect then
			slot0.show_PromptEffect:removeFromParent()

			slot0.show_PromptEffect = nil
		end

		slot0.effect_container:setVisible(false)
	end
end

function MainUiView.setIsShowMainUI(slot0, slot1)
	slot0.top_container:stopAllActions()
	slot0.bottom_container:stopAllActions()

	if slot1 then
		slot0.top_container:runAction(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(360, display.getTop())), cc.FadeIn:create(0.2)))
		slot0.bottom_container:runAction(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(360, display.getBottom())), cc.FadeIn:create(0.2)))
	else
		slot0.top_container:runAction(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(360, display.getTop() + 300)), cc.FadeOut:create(0.2)))
		slot0.bottom_container:runAction(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(360, display.getBottom() - 300)), cc.FadeOut:create(0.2)))
	end
end

function MainUiView.setShowBottomUI(slot0, slot1)
	slot0.bottom_container:setVisible(slot1)
end

function MainUiView.__delete(slot0)
	slot0:showPromptEffect(false)
	slot0:updateCityDesc(false)

	if slot0.function_time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.function_time_ticket)

		slot0.function_time_ticket = nil
	end

	for slot4, slot5 in pairs(slot0.icon_container_list) do
		if slot5 ~= nil and not uv0(slot5) then
			slot5:stopAllActions()
		end
	end

	if slot0.vip_label then
		slot0.vip_label:DeleteMe()

		slot0.vip_label = nil
	end

	if slot0.vip_image_label then
		slot0.vip_image_label:DeleteMe()

		slot0.vip_image_label = nil
	end

	if slot0.add_function_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.add_function_timer)

		slot0.add_function_timer = nil
	end

	if uv1 then
		if slot0.role_update_event ~= nil then
			uv1:UnBind(slot0.role_update_event)

			slot0.role_update_event = nil
		end

		uv1 = nil
	end

	if slot0.update_acc then
		GlobalEvent:getInstance():UnBind(slot0.update_acc)

		slot0.update_acc = nil
	end

	if slot0.red_bag_event then
		GlobalEvent:getInstance():UnBind(slot0.red_bag_event)

		slot0.red_bag_event = nil
	end

	if slot0.petard_red_bag_event then
		GlobalEvent:getInstance():UnBind(slot0.petard_red_bag_event)

		slot0.petard_red_bag_event = nil
	end

	if slot0.year_red_bag_event then
		GlobalEvent:getInstance():UnBind(slot0.year_red_bag_event)

		slot0.year_red_bag_event = nil
	end

	if slot0.return_red_bag_event then
		GlobalEvent:getInstance():UnBind(slot0.return_red_bag_event)

		slot0.return_red_bag_event = nil
	end

	if slot0.time_collect_event then
		GlobalEvent:getInstance():UnBind(slot0.time_collect_event)

		slot0.time_collect_event = nil
	end

	if slot0.new_msg_add_event then
		GlobalEvent:getInstance():UnBind(slot0.new_msg_add_event)

		slot0.new_msg_add_event = nil
	end

	if slot0.update_recharge_red then
		GlobalEvent:getInstance():UnBind(slot0.update_recharge_red)

		slot0.update_recharge_red = nil
	end

	if slot0.vote_mergeServer_event then
		GlobalEvent:getInstance():UnBind(slot0.vote_mergeServer_event)

		slot0.vote_mergeServer_event = nil
	end

	if slot0.vote_mergeSuccess_event then
		GlobalEvent:getInstance():UnBind(slot0.vote_mergeSuccess_event)

		slot0.vote_mergeSuccess_event = nil
	end

	if slot0.vote_mergeAction_event then
		GlobalEvent:getInstance():UnBind(slot0.vote_mergeAction_event)

		slot0.vote_mergeAction_event = nil
	end

	if slot0.update_drama_max_event then
		GlobalEvent:getInstance():UnBind(slot0.update_drama_max_event)

		slot0.update_drama_max_event = nil
	end

	if slot0.update_wealth_event then
		GlobalEvent:getInstance():UnBind(slot0.update_wealth_event)

		slot0.update_wealth_event = nil
	end

	if slot0.update_prompt_tips then
		GlobalEvent:getInstance():UnBind(slot0.update_prompt_tips)

		slot0.update_prompt_tips = nil
	end

	if slot0.remove_prompt_tips then
		GlobalEvent:getInstance():UnBind(slot0.remove_prompt_tips)

		slot0.remove_prompt_tips = nil
	end

	if slot0.coin_touch_redpoint then
		GlobalEvent:getInstance():UnBind(slot0.coin_touch_redpoint)

		slot0.coin_touch_redpoint = nil
	end

	if slot0.vip_image_redpoint then
		GlobalEvent:getInstance():UnBind(slot0.vip_image_redpoint)

		slot0.vip_image_redpoint = nil
	end

	if slot0.vip_image_effect then
		slot0.vip_image_effect:clearTracks()
		slot0.vip_image_effect:removeFromParent()

		slot0.vip_image_effect = nil
	end

	for slot4, slot5 in pairs(slot0.function_list) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.function_list = {}
	slot0.render_list = {}
	slot0.render_list_dic = {}

	slot0:showRedBagEffect2(false)
	slot0:showRedBagEffect3(false)
	slot0:showTimeCollectEffect(false)

	if not uv0(slot0.chat_bubble) then
		slot0.chat_bubble:removeFromParent()
	end

	slot0.chat_bubble = nil

	if not uv0(slot0.node) then
		slot0.node:removeAllChildren()
		slot0.node:removeFromParent()
	end
end
