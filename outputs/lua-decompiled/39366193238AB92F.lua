JumpController = JumpController or BaseClass(BaseController)

function JumpController.config(slot0)
end

function JumpController.registerEvents(slot0)
end

function JumpController.jumpViewByEvtData(slot0, slot1)
	if not slot1 or not slot1[1] then
		return
	end

	if tonumber(slot1[1]) == 1 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.partnersummon)
	elseif slot2 == 2 then
		if slot1 and next(slot1) then
			if slot1[2] == "star" then
				if slot1[3] <= 5 then
					PartnersummonController:getInstance():openPartnerSummonWindow(true)
				else
					HeroController:getInstance():openHeroResetWindow(true, HeroConst.SacrificeType.eHeroFuse)
				end
			elseif slot3 == "lev" then
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner)
			else
				PartnersummonController:getInstance():openPartnerSummonWindow(true)
			end
		else
			PartnersummonController:getInstance():openPartnerSummonWindow(true)
		end
	elseif slot2 == 3 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.arena_call)
	elseif slot2 == 4 then
		FriendController:getInstance():openFriendWindow(true, FriendConst.Type.MyFriend)
	elseif slot2 == 5 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.drama_scene)
	elseif slot2 == 6 then
		MallController:getInstance():openVarietyStoreWindows(true)
	elseif slot2 == 7 then
		VipController:getInstance():openVipMainWindow(true, slot1[2] or VIPTABCONST.CHARGE, slot1[3])
	elseif slot2 == 8 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.backpack, slot1[2])
	elseif slot2 == 9 then
		ChatController:getInstance():openChatPanel(slot1[2] or ChatConst.Channel.World)
	elseif slot2 == 10 then
		ChatController:getInstance():openChatPanel(ChatConst.Channel.Friend, "friend")
	elseif slot2 == 11 then
		BattleDramaController:getInstance():openDramBattleQuickView(true)
	elseif slot2 == 12 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.startower)
	elseif slot2 == 13 then
		if RoleController:getInstance():getRoleVo():isHasGuild() then
			GuildController:getInstance():openGuildDonateWindow(true)
		else
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.guild)
		end
	elseif slot2 == 14 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.guild)
	elseif slot2 == 15 then
		MallController:getInstance():openMallPanel(true, slot1[2], slot1[3])
	elseif slot2 == 16 then
		StrongerController:getInstance():openMainWin(true, slot1[2])
	elseif slot2 == 17 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.dungeonstone)
	elseif slot2 == 18 then
		VoyageController:getInstance():openVoyageMainWindow(true)
	elseif slot2 == 19 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner, slot1[2])
	elseif slot2 == 20 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.hallows)
	elseif slot2 == 21 then
		if GuildwarController:getInstance():checkIsCanOpenGuildWarWindow() == true then
			if GuildwarController:getInstance():getModel():getGuildWarStatus() == GuildwarConst.status.processing or slot4 == GuildwarConst.status.settlement then
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.guildwar)
			else
				message(TI18N("公会战尚未开启"))
			end
		end
	elseif slot2 == 22 then
		HeroController:getInstance():openHeroResetWindow(true, HeroConst.SacrificeType.eHeroSacrifice)
	elseif slot2 == 23 then
		HeroController:getInstance():openHeroResetWindow(true, HeroConst.SacrificeType.eHeroFuse)
	elseif slot2 == 24 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.seerpalace, slot1[2])
	elseif slot2 == 25 then
		PlanesafkController:getInstance():sender28601()
	elseif slot2 == 26 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.forge_house, slot1[2] or ForgeHouseConst.Tab_Index.Equip)
	elseif slot2 == 27 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.primuswar)
	elseif slot2 == 28 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.eliteMatchWar)
	elseif slot2 == 29 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.ladderwar)
	elseif slot2 == 30 then
		HeroController:getInstance():openFormMainWindow(true)
	elseif slot2 == 31 then
		if RoleController:getInstance():getRoleVo():isHasGuild() then
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildDun)
		else
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.guild)
		end
	elseif slot2 == 32 then
		if RoleController:getInstance():getRoleVo():isHasGuild() then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.guild_skill)
		else
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.guild)
		end
	elseif slot2 == 33 then
		if RoleController:getInstance():getRoleVo():isHasGuild() then
			RedbagController:getInstance():openMainView(true)
		else
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.guild)
		end
	elseif slot2 == 34 then
		MainuiController:changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.adventure)
	elseif slot2 == 35 then
		ExchangeController:getInstance():openExchangeMainView(true)
	elseif slot2 == 36 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.champion_call)
	elseif slot2 == 37 then
		if LadderController:getInstance():getModel():getLadderOpenStatus() then
			LadderController:getInstance():requestLadderMyBaseInfo()
			LadderController:getInstance():openLadderShopWindow(true)
		end
	elseif slot2 == 38 then
		WelfareController:getInstance():openMainWindow(true, ActionSpecialID.invest)
	elseif slot2 == 39 then
		WelfareController:getInstance():openMainWindow(true, ActionSpecialID.growfund)
	elseif slot2 == 40 then
		ActionController:getInstance():openLuckyTreasureWin(true)
	elseif slot2 == 41 then
		TaskController:getInstance():openTaskMainWindow(true, slot1[2])
	elseif slot2 == 42 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.elementWar)
	elseif slot2 == 43 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.endless)
	elseif slot2 == 44 then
		WelfareController:getInstance():openMainWindow(true, WelfareIcon.yueka)
	elseif slot2 == 45 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.wonderful, slot1[2])
	elseif slot2 == 46 then
		BattleDramaController:getInstance():openDramRewardView(true)
	elseif slot2 == 47 then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.HeavenWar, slot1[2])
	elseif slot2 == 48 then
		HeavenController:getInstance():openHeavenMainWindow(true, nil, HeavenConst.Tab_Index.DialRecord, slot1[2])
	elseif slot2 == 49 then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.CrossArenaWar)
	elseif slot2 == 50 then
		CrossarenaController:getInstance():openCrossarenaShopWindow(true)
	elseif slot2 == 51 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.homeworld)
	elseif slot2 == 52 then
		if not AdventureController:getInstance():checkMaxMineLayerInfo() then
			message(TI18N("冒险第十层可进入水晶秘境，采集珍贵晶石精炼神技"))
			MainuiController:changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.adventure)
		end
	elseif slot2 == 53 then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.CrossChampion)
	elseif slot2 == 54 then
		HeroController:getInstance():openHeroResonateExtractPanel(true)
	elseif slot2 == 55 then
		HeroController:getInstance():openHeroResonateWindow(true)
	elseif slot2 == 56 then
		if WelfareController:getInstance().welfare_win and slot3.welfare_win.tab_list[WelfareIcon.week] then
			slot3.welfare_win:handleSelectedTab(slot3.welfare_win.tab_list[WelfareIcon.week])
		end
	elseif slot2 == 57 then
		if ActionController:getInstance():getActionSubTabVo(ActionRankCommonType.recruit_luxury) then
			slot3:openActionMainPanel(true, nil, slot4.bid)
		else
			message(TI18N("该活动已结束"))
		end
	elseif slot2 == 58 then
		if ActionController:getInstance():getActionSubTabVo(ActionRankCommonType.summon_luxury) then
			slot3:openActionMainPanel(true, nil, slot4.bid)
		else
			message(TI18N("该活动已结束"))
		end
	elseif slot2 == 59 then
		if CrosschampionController:getInstance():getModel():checkCrossChampionIsOpen() then
			CrosschampionController:getInstance():openCrosschampionShopWindow(true)
		end
	elseif slot2 == 60 then
		if ElfinController:getModel():checkElfinIsOpen() then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner, HeroConst.BagTab.eElfin, slot1[2])
		end
	elseif slot2 == 61 then
		HomeworldController:getInstance():openHomeworldShopWindow(true, {
			index = slot1[2]
		})
	elseif slot2 == 62 then
		if not RoleController:getInstance():getRoleVo() then
			return
		end

		if slot3:isHasGuild() then
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildSecretArea)
		else
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.guild)
		end
	elseif slot2 == 63 then
		if not RoleController:getInstance():getRoleVo() then
			return
		end

		if slot3:isHasGuild() then
			GuildmarketplaceController:getInstance():openGuildmarketplaceMainWindow(true)
		else
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.guild)
		end
	elseif slot2 == 64 then
		if not PetardActionController:getInstance():getModel():checkPetardIsOpen() then
			message(TI18N("活动未开启"))

			return
		end

		if ActionController:getInstance():getActionSubTabVo(ActionRankCommonType.petard) then
			slot3:openActionMainPanel(true, MainuiConst.icon.festival, slot4.bid)
		else
			message(TI18N("该活动已结束"))
		end
	elseif slot2 == 65 then
		if ArenateamController:getInstance():getModel():checkArenaTeamIsOpen() then
			ArenateamController:getInstance():openArenateamMainWindow(true)
		end
	elseif slot2 == 66 then
		if slot0:checkMonopolyIcon() then
			MonopolyController:getInstance():openHolynightMainWindow(true, slot1[2])
		end
	elseif slot2 == 67 then
		if ArenapeakchampionController:getInstance():getModel():checkPeakChampionIsOpen() then
			ArenapeakchampionController:getInstance():openArenapeakchampionMainWindow(true)
		end
	elseif slot2 == 68 then
		PlanesafkController:getInstance():sender28601()
	elseif slot2 == 69 then
		WelfareController:getInstance():openMainWindow(true, WelfareIcon.invicode)
	elseif slot2 == 70 then
		ActionyearmonsterController:getInstance():sender28204()
	elseif slot2 == 71 then
		slot3 = Config.ChargeData.data_constant.open_lv

		if not RoleController:getInstance():getRoleVo() or not slot3 then
			return
		end

		if slot3 and slot4 and slot4.lev < slot3.val then
			message(TI18N("6级开启英魂商城"))

			return
		end

		MallController:getInstance():openMallSingleShopPanel(true, {
			mall_type = MallConst.MallType.HeroSoulShop,
			item_id = 10005,
			config = Config.ExchangeData.data_shop_exchage_herosoul,
			shop_name = TI18N("英魂商城")
		})
	elseif slot2 == 72 then
		WelfareController:getInstance():openMainWindow(true, WelfareIcon.week)
	elseif slot2 == 73 then
		WelfareController:getInstance():openMainWindow(true, WelfareIcon.subscribe)
	elseif slot2 == 74 then
		if ActionController:getInstance():getActionSubTabVo(ActionRankCommonType.grow_gift) then
			slot3:openActionMainPanel(true, nil, slot4.bid)
		else
			message(TI18N("该活动已结束"))
		end
	elseif slot2 == 75 then
		ArenapeakchampionController:getInstance():openArenapeakchampionShop()
	elseif slot2 == 76 then
		if not ArenaManyPeopleController:getInstance():getModel():checkAMPIsOpen() then
			message(TI18N("活动未开启"))

			return
		end

		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.AreanManyPeople)
	elseif slot2 == 79 then
		EmoguoshiController:getInstance():openEmoguoMainView(true, EmoguoshiConst.mainView.random)
	end
end

function JumpController.checkMonopolyIcon(slot0)
	if MainuiController:getInstance() and slot1.mainui and slot1.mainui:checkIconIn(MainuiConst.icon.monopoly) then
		return true
	end

	message(TI18N("活动未开启或已结束"))

	return false
end

function JumpController.__delete(slot0)
end
