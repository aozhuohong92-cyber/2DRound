BackpackController = BackpackController or BaseClass(BaseController);

function BackpackController.config(slot0)
	slot0.model = BackpackModel.New(slot0);
	slot0.dispather = GlobalEvent:getInstance();
end

function BackpackController.getModel(slot0)
	return slot0.model
end

function BackpackController.registerEvents(slot0)
end

function BackpackController.registerProtocals(slot0)
	slot0:RegisterProtocal(10500, "handle10500");
	slot0:RegisterProtocal(10501, "handle10501");
	slot0:RegisterProtocal(10502, "handle10502");
	slot0:RegisterProtocal(10503, "handle10503");
	slot0:RegisterProtocal(10510, "handle10510");
	slot0:RegisterProtocal(10511, "handle10511");
	slot0:RegisterProtocal(10512, "handle10512");
	slot0:RegisterProtocal(10515, "handle10515");
	slot0:RegisterProtocal(10520, "handle10520");
	slot0:RegisterProtocal(10521, "handle10521");
	slot0:RegisterProtocal(10522, "handle10522");
	slot0:RegisterProtocal(10523, "handle10523");
	slot0:RegisterProtocal(10526, "handle10526");
	slot0:RegisterProtocal(10528, "handle10528");
	slot0:RegisterProtocal(10530, "handle10530");
	slot0:RegisterProtocal(11008, "handle11008");
end

function BackpackController.sender10500(slot0)
	slot0:SendProtocal(10500, {});
end

function BackpackController.sender10501(slot0)
	slot0:SendProtocal(10501, {});
end

function BackpackController.handle10500(slot0, slot1)
	if not slot1 then
		return
	end

	slot1.bag_code = BackPackConst.Bag_Code.BACKPACK;

	slot0.model:initItemList(slot1);
end

function BackpackController.handle10501(slot0, slot1)
	if not slot1 then
		return
	end

	slot1.bag_code = BackPackConst.Bag_Code.EQUIPS;

	slot0.model:initItemList(slot1);
end

function BackpackController.handle10503(slot0, slot1)
	if not slot1 then
		return
	end

	slot1.bag_code = BackPackConst.Bag_Code.PETBACKPACK;

	slot0.model:initItemList(slot1);
end

function BackpackController.sender10502(slot0)
	slot0:SendProtocal(10502, {});
end

function BackpackController.handle10502(slot0, slot1)
	if not slot1 then
		return
	end

	slot1.bag_code = BackPackConst.Bag_Code.HOME;

	slot0.model:initItemList(slot1);
end

function BackpackController.handle10510(slot0, slot1)
	slot0.model:addItemInBagCode(slot1);
end

function BackpackController.handle10511(slot0, slot1)
	slot0.model:deleteBagItems(slot1);
end

function BackpackController.handle10512(slot0, slot1)
	slot0.model:updateBagItemsNum(slot1);
end

function BackpackController.sender10515(slot0, slot1, slot2, slot3)
	Debug.info(slot3);
	slot0:SendProtocal(10515, {
		id = slot1,
		quantity = slot2,
		args = slot3 or {}
	});
end

function BackpackController.handle10515(slot0, slot1)
	message(slot1.msg);

	if slot1.flag == TRUE then
		slot0:openBatchUseItemView(false);
		slot0:closeGiftSelectPanel();
		GlobalEvent:getInstance():Fire(BackpackEvent.BACKPACK_USE_ITEM_EVENT, slot1);
	end
end

function BackpackController.sender10520(slot0, slot1, slot2)
	slot0:SendProtocal(10520, {
		id = slot1,
		storage = slot2
	});
end

function BackpackController.handle10520(slot0, slot1)
	message(slot1.msg);
end

function BackpackController.sender10521(slot0, slot1, slot2)
	slot0:SendProtocal(10521, {
		storage = slot1,
		args = slot2
	});
end

function BackpackController.handle10521(slot0, slot1)
	if slot1.items then
		GlobalEvent:getInstance():Fire(BackpackEvent.BACKPACK_SELL_CONFIRM, slot1);
	end
end

function BackpackController.sender10522(slot0, slot1, slot2)
	slot0:SendProtocal(10522, {
		storage = slot1,
		args = slot2
	});
end

function BackpackController.handle10522(slot0, slot1)
	showAssetsMsg(slot1.msg);

	if slot1.flag == TRUE then
		if slot0.batch_use then
			slot0:openBatchUseItemView(false);
		end

		if slot0.sell_window then
			slot0:openSellWindow(false);
		end

		slot0:closeGiftSelectPanel();
		GlobalEvent:getInstance():Fire(BackpackEvent.Sell_Goods_Success);
	end
end

function BackpackController.sender10523(slot0, slot1, slot2)
	slot0:SendProtocal(10523, {
		id = slot1,
		num = slot2
	});
end

function BackpackController.handle10523(slot0, slot1)
	message(slot1.msg);

	if slot1.flag == 1 then
		GlobalEvent:getInstance():Fire(BackpackEvent.Compose_Goods_Success);
		TipsManager:getInstance():showBackPackCompTips(false);
	end
end

function BackpackController.sender10526(slot0, slot1)
	slot0:SendProtocal(10526, {
		type = slot1
	});
end

function BackpackController.handle10526(slot0, slot1)
	slot0.model:updateExpansionInfo(slot1);
end

function BackpackController.sender10528(slot0)
	slot0:SendProtocal(10528, {});
end

function BackpackController.handle10528(slot0, slot1)
	slot0.model:setEquipsOutput(slot1.time);
	slot0.model:setExpOutput(slot1.minu_exp);
end

function BackpackController.handle10530(slot0, slot1)
	CommonAlert.show(TI18N("背包已满，战斗将无法获得掉落的道具奖励，是否前往熔炼?"), TI18N("确认"), function ()
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.backpack, BackPackConst.item_tab_type.EQUIPS);
	end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, nil, true);
end

function BackpackController.sender11008(slot0, slot1, slot2)
	slot0:SendProtocal(11008, {
		bid = slot1,
		num = slot2
	});
end

function BackpackController.handle11008(slot0, slot1)
	GlobalEvent:getInstance():Fire(BackpackEvent.Compose_BackPack_Success);
	message(slot1.msg);
	TipsManager:getInstance():showBackPackCompTips(false);
	TipsManager:getInstance():showCompChooseTips(false);

	if slot1.result == 1 then
		slot2 = {};

		for slot6, slot7 in pairs(slot1.partners) do
			slot8 = Config.PartnerData.data_partner_base[slot7.partner_bid];
			slot2[slot6] = {
				bid = slot7.partner_bid,
				star = slot8.init_star,
				camp_type = slot8.camp_type,
				show_type = MainuiConst.item_exhibition_type.partner_type
			};
		end

		MainuiController:getInstance():openGetItemView(true, slot2, 0);
	end
end

function BackpackController.openMainView(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.back_pack ~= nil then
			slot0.back_pack:close();

			slot0.back_pack = nil;
		end

		slot0.back_pack_open_type = slot2;
	else
		slot2 = slot2 or BackPackConst.item_tab_type.PROPS;

		if slot0.back_pack == nil then
			slot0.back_pack = BackPackWindow.New(slot2);
		end

		if slot0.back_pack and slot0.back_pack:isOpen() == false then
			slot0.back_pack:open();
		end
	end
end

function BackpackController.setEquipBackPackStatus(slot0, slot1)
	if slot0.back_pack then
		slot0.back_pack:setEquipRedStatus(slot1);
	end
end

function BackpackController.getBackpackRoot(slot0)
	if slot0.back_pack then
		return slot0.back_pack.root_wnd
	end
end

function BackpackController.getBackpackSellRoot(slot0)
	if slot0.sell_window then
		return slot0.sell_window.root_wnd
	end
end

function BackpackController.openSellWindow(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.sell_window ~= nil then
			slot0.sell_window:close();

			slot0.sell_window = nil;
		end
	else
		slot2 = slot2 or BackPackConst.Bag_Code.BACKPACK;

		if slot3 == nil or next(slot3) == nil then
			return
		end

		if slot0.sell_window == nil then
			slot0.sell_window = BackPackSellWindow.New();
		end

		if slot0.sell_window:isOpen() == false then
			slot0.sell_window:open(slot2, slot3);
		end
	end
end

function BackpackController.openItemSellPanel(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == false then
		if slot0.item_sell_panel ~= nil then
			slot0.item_sell_panel:close();

			slot0.item_sell_panel = nil;
		end
	else
		slot6 = slot3 or BackPackConst.Bag_Code.BACKPACK;
		slot7 = slot4 or 1;

		if slot0.item_sell_panel == nil then
			slot0.item_sell_panel = ItemSellPanel.New();
		end

		if slot0.item_sell_panel:isOpen() == false then
			slot0.item_sell_panel:open(slot2, slot6, slot7, slot5);
		end
	end
end

function BackpackController.openQuickSellHolyWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.sell_holy_wnd then
			slot0.sell_holy_wnd = BackPackSellHolyWindow.New();
		end

		if slot0.sell_holy_wnd:isOpen() == false then
			slot0.sell_holy_wnd:open();
		end
	elseif slot0.sell_holy_wnd then
		slot0.sell_holy_wnd:close();

		slot0.sell_holy_wnd = nil;
	end
end

function BackpackController.openHeroSpecialBreakWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.break_special_window then
			slot0.break_special_window = HeroSpecialBreakWindow.New();
		end

		if slot0.break_special_window:isOpen() == false then
			slot0.break_special_window:open();
		end
	elseif slot0.break_special_window then
		slot0.break_special_window:close();

		slot0.break_special_window = nil;
	end
end

function BackpackController.openQuickAddHolyWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.add_holy_wnd then
			slot0.add_holy_wnd = BackPackAddHolyWindow.New();
		end

		if slot0.add_holy_wnd:isOpen() == false then
			slot0.add_holy_wnd:open();
		end
	elseif slot0.add_holy_wnd then
		slot0.add_holy_wnd:close();

		slot0.add_holy_wnd = nil;
	end
end

function BackpackController.openQuickSellEquipWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.sell_equip_wnd then
			slot0.sell_equip_wnd = BackPackSellEquipWindow.New();
		end

		if slot0.sell_equip_wnd:isOpen() == false then
			slot0.sell_equip_wnd:open();
		end
	elseif slot0.sell_equip_wnd then
		slot0.sell_equip_wnd:close();

		slot0.sell_equip_wnd = nil;
	end
end

function BackpackController.openSellConfirmWindow(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == false then
		if slot0.sell_confirm_window ~= nil then
			slot0.sell_confirm_window:close();

			slot0.sell_confirm_window = nil;
		end
	else
		slot3 = slot3 or BackPackConst.Bag_Code.EQUIPS;

		if slot0.sell_confirm_window == nil then
			slot0.sell_confirm_window = BackPackSellConfirmWindow.New();
		end

		if slot0.sell_confirm_window:isOpen() == false then
			slot0.sell_confirm_window:open(slot2, slot3, slot4, slot5);
		end
	end
end

function BackpackController.openBackPackEquipInterceptWindow(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.intercept_window ~= nil then
			slot0.intercept_window:close();

			slot0.intercept_window = nil;
		end
	else
		if slot3 == nil or next(slot3) == nil then
			slot0:openSellWindow(true, BackPackConst.Bag_Code.EQUIPS, slot2);

			return
		end

		if slot0.intercept_window == nil then
			slot0.intercept_window = BackPackEquipInterceptWindow.New();
		end

		slot0.intercept_window:open(slot2, slot3);
	end
end

function BackpackController.getData(slot0)
	return slot0.model
end

function BackpackController.checkItemSoureIsOpenByConfig(slot0, slot1)
	if slot1.evt_type == BackPackConst.item_source_type.evt_partner_call then
		return true
	elseif slot1.evt_type == BackPackConst.item_source_type.evt_mall_buy then
		return slot0:checkShopIsOpen(slot1.extend[1])
	elseif slot1.evt_type == BackPackConst.item_source_type.evt_activity then
		return slot0:checkActivityIsOpen(slot1.extend[1])
	elseif slot1.evt_type == BackPackConst.item_source_type.evt_dun_chapter then
		if slot1.extend[1] == 0 and slot1.extend[2] == 0 then
			return true
		end

		return slot0:checkDungeonChapterIsOpen(slot1.extend[1], slot1.extend[2])
	else
		return true
	end
end

function BackpackController.checkShopIsOpen(slot0, slot1)
	return true
end

function BackpackController.checkActivityIsOpen(slot0, slot1)
	return true
end

function BackpackController.checkDungeonChapterIsOpen(slot0, slot1, slot2)
	if DungeonController:getInstance():getModel():getChapterWithId(slot1) == nil then
		return false
	elseif slot2 == 0 then
		if slot4.status == DUNGEON_CHAPTER_STATUS.LOCK then
			return false
		else
			return true
		end
	elseif slot4.dun_list == nil or slot4.dun_list[slot2] == nil or slot4.dun_list[slot2].status == nil then
		return false
	else
		return true
	end
end

function BackpackController.checkDungeonChapterIsPass(slot0, slot1, slot2)
	if DungeonController:getInstance():getModel():getChapterWithId(slot1) == nil then
		return false
	elseif slot2 == 0 then
		if slot4.status == DUNGEON_CHAPTER_STATUS.LOCK then
			return false
		else
			slot5 = pairs;
			slot7 = slot4.dun_list or {};

			for slot8, slot9 in slot5(slot7) do
				if slot9.status == 0 then
					return true
				end
			end

			return false
		end
	elseif slot4.dun_list == nil or slot4.dun_list[slot2] == nil or slot4.dun_list[slot2].status == nil or slot4.dun_list[slot2].status == 1 then
		return false
	else
		return true
	end
end

function BackpackController.checkItemSoureIsOpen(slot0, slot1)
	if Config.ItemData.data_get_data(slot1) == nil or slot2.source == nil or next(slot2.source) == nil then
		return false
	else
		for slot6, slot7 in ipairs(slot2.source) do
			if slot0:checkItemSoureIsOpenByConfig(Config.SourceData.data_source_data[slot7]) == true then
				return true
			end
		end

		return false
	end
end

function BackpackController.openGiftSelectPanel(slot0, slot1)
	if slot0.gift_panel == nil then
		slot0.gift_panel = GiftSelectPanel.New();
	end

	if slot0.gift_panel and slot0.gift_panel:isOpen() == false then
		slot0.gift_panel:open(slot1);
	end
end

function BackpackController.closeGiftSelectPanel(slot0)
	if slot0.gift_panel ~= nil then
		slot0.gift_panel:close();

		slot0.gift_panel = nil;
	end
end

function BackpackController.getItemSourceRoot(slot0)
	if slot0.source_view then
		return slot0.source_view.root_wnd
	end
end

function BackpackController.gotoItemSourceTarget(slot0, slot1, slot2, slot3, slot4)
end

function BackpackController.directorySwap(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	if slot1.evt_type ~= BackPackConst.item_source_type.evt_dun_chapter then
		return
	end

	if #slot1.extend < 2 then
		return
	end

	slot5 = 1;

	if slot4 > 1 then
		slot5 = slot3 - slot0:getModel():getBackPackItemNumByBid(slot2);
	end

	if slot1.extend[2] ~= 0 then
		if slot4 > 1 then
			DungeonController:getInstance():requestQuickSwap(slot6, slot5, slot2, slot3);
		else
			DungeonController:getInstance():requestSwapDungeon(slot6, 1, slot2, slot3);
		end
	elseif slot1.extend[1] then
		DungeonController:getInstance():requestQuickSwap(slot7, slot5, slot2, slot3);
	end
end

function BackpackController.openBatchUseItemView(slot0, slot1, slot2, slot3, slot4)
	if slot1 == false then
		if slot0.batch_use ~= nil then
			slot0.batch_use:close();

			slot0.batch_use = nil;
		end
	else
		if slot2 == nil or slot2.config == nil then
			return
		end

		if slot0.batch_use == nil then
			slot0.batch_use = BackPackBatchView.New(BackpackController:getInstance());
		end

		if slot0.batch_use and slot0.batch_use:isOpen() == false then
			slot0.batch_use:open(slot2, slot3, slot4);
		end
	end
end

function BackpackController.openBackPackComposeWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.compose_window ~= nil then
			slot0.compose_window:close();

			slot0.compose_window = nil;
		end
	else
		if slot0.compose_window == nil then
			slot0.compose_window = BackPackComposeWindow.New(slot2);
		end

		if slot0.compose_window and slot0.compose_window:isOpen() == false then
			slot0.compose_window:open();
		end
	end
end

function BackpackController.openTipsSource(slot0, slot1, slot2, slot3, slot4)
	if slot1 then
		slot5 = GuideController:getInstance():getGuideConfig();

		if type(slot2) == "number" then
			slot2 = Config.ItemData.data_get_data(slot2);
		end

		if slot2 == nil then
			return
		end

		slot3 = slot3 or {};

		if not slot0.tips_source then
			slot0.tips_source = TipsSource.New();
		end

		slot0.tips_source:open(slot2, slot3, slot4);
	elseif slot0.tips_source then
		slot0.tips_source:close();

		slot0.tips_source = nil;
	end
end

function BackpackController.openTipsOnlySource(slot0, slot1, slot2, slot3, slot4)
	if slot1 then
		if slot2 == nil then
			return
		end

		slot3 = slot3 or {};

		if not slot0.tips_only_source then
			slot0.tips_only_source = TipsOnlySource.New();
		end

		slot0.tips_only_source:open(slot2, slot3, slot4);
	elseif slot0.tips_only_source then
		slot0.tips_only_source:close();

		slot0.tips_only_source = nil;
	end
end

function BackpackController.getItemTipsSourceRoot(slot0)
	if slot0.tips_source then
		return slot0.tips_source.root_wnd
	end
end

function BackpackController.gotoItemSources(slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil or slot2 == nil then
		return
	end

	if slot1 == "evt_partner_call" then
		JumpController:getInstance():jumpViewByEvtData({
			1
		});
	elseif slot1 == "evt_mall_buy" then
		if slot2[1] then
			JumpController:getInstance():jumpViewByEvtData({
				15,
				slot2[1],
				slot3
			});
		end
	elseif slot1 == "evt_vip" then
		JumpController:getInstance():jumpViewByEvtData({
			7,
			VIPTABCONST.VIP,
			slot2[1]
		});
	elseif slot1 == "evt_boss" then
		-- Nothing
	elseif slot1 == "evt_world_boss" then
		-- Nothing
	elseif slot1 == "evt_tower" then
		JumpController:getInstance():jumpViewByEvtData({
			12
		});
	elseif slot1 == "evt_divination" then
		AuguryController:getInstance():openMainView(true);
	elseif slot1 == "evt_dun_chapter" then
		JumpController:getInstance():jumpViewByEvtData({
			5
		});
	elseif slot1 == "evt_gold_market" then
		-- Nothing
	elseif slot1 == "evt_silver_market" then
		-- Nothing
	elseif slot1 == "evt_arena" then
		JumpController:getInstance():jumpViewByEvtData({
			3
		});
	elseif slot1 == "evt_arena_box" then
		JumpController:getInstance():jumpViewByEvtData({
			3
		});
	elseif slot1 == "evt_bag_eqm" then
		JumpController:getInstance():jumpViewByEvtData({
			8,
			BackPackConst.item_tab_type.EQUIPS
		});
	elseif slot1 == "evt_bag_partner" then
		JumpController:getInstance():jumpViewByEvtData({
			8,
			BackPackConst.item_tab_type.HERO
		});
	elseif slot1 == "evt_dun_stone" then
		JumpController:getInstance():jumpViewByEvtData({
			17
		});
	elseif slot1 == "evt_bag_star_life" then
		JumpController:getInstance():jumpViewByEvtData({
			8,
			BackPackConst.item_tab_type.SPECIAL
		});
	elseif slot1 == "evt_friend" then
		JumpController:getInstance():jumpViewByEvtData({
			4
		});
	elseif slot1 == "evt_league" then
		JumpController:getInstance():jumpViewByEvtData({
			14
		});
	elseif slot1 == "evt_league_dungeon" then
		JumpController:getInstance():jumpViewByEvtData({
			31
		});
	elseif slot1 == "evt_league_donate" then
		JumpController:getInstance():jumpViewByEvtData({
			13
		});
	elseif slot1 == "evt_league_sail" then
		JumpController:getInstance():jumpViewByEvtData({
			18
		});
	elseif slot1 == "evt_league_skill" then
		JumpController:getInstance():jumpViewByEvtData({
			32
		});
	elseif slot1 == "evt_league_shop" then
		JumpController:getInstance():jumpViewByEvtData({
			15,
			MallConst.MallType.UnionShop
		});
	elseif slot1 == "evt_league_redpacket" then
		JumpController:getInstance():jumpViewByEvtData({
			33
		});
	elseif slot1 == "evt_league_war" then
		JumpController:getInstance():jumpViewByEvtData({
			21
		});
	elseif slot1 == "evt_god_world" then
		JumpController:getInstance():jumpViewByEvtData({
			34
		});
	elseif slot1 == "evt_league_help" then
		-- Nothing
	elseif slot1 == "evt_exchange" then
		JumpController:getInstance():jumpViewByEvtData({
			35
		});
	elseif slot1 == "evt_arena_champion" then
		JumpController:getInstance():jumpViewByEvtData({
			36
		});
	elseif slot1 == "evt_endless" then
		JumpController:getInstance():jumpViewByEvtData({
			43
		});
	elseif slot1 == "evt_partner_power" then
		PartnersummonController:getInstance():openGodPartnerSummonView(true);
	elseif slot1 == "evt_hero" then
		-- Nothing
	elseif slot1 == "evt_pet" then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Escort);
	elseif slot1 == "evt_shengqi" then
		JumpController:getInstance():jumpViewByEvtData({
			20
		});
	elseif slot1 == "evt_xingming" then
		JumpController:getInstance():jumpViewByEvtData({
			12
		});
	elseif slot1 == "evt_primus" then
		PrimusController:getInstance():openPrimusMainWindow(true);
	elseif slot1 == "evt_skyladder" then
		JumpController:getInstance():jumpViewByEvtData({
			29
		});
	elseif slot1 == "evt_skyshop" then
		JumpController:getInstance():jumpViewByEvtData({
			37
		});
	elseif slot1 == "evt_change" then
		JumpController:getInstance():jumpViewByEvtData({
			7
		});
	elseif slot1 == "evt_yueke" then
		-- Nothing
	elseif slot1 == "evt_invest" then
		JumpController:getInstance():jumpViewByEvtData({
			38
		});
	elseif slot1 == "evt_growfund" then
		JumpController:getInstance():jumpViewByEvtData({
			39
		});
	elseif slot1 == "evt_partner" then
		JumpController:getInstance():jumpViewByEvtData({
			19
		});
	elseif slot1 == "evt_partner_gemstone" then
		-- Nothing
	elseif slot1 == "evt_lucky_treasure" or slot1 == "evt_treasure" then
		JumpController:getInstance():jumpViewByEvtData({
			40
		});
	elseif slot1 == "evt_recruit_high" then
		JumpController:getInstance():jumpViewByEvtData({
			24,
			SeerpalaceConst.Tab_Index.Summon
		});
	elseif slot1 == "evt_hero_conversion" then
		JumpController:getInstance():jumpViewByEvtData({
			24,
			SeerpalaceConst.Tab_Index.Change
		});
	elseif slot1 == "evt_partner_synthesis" then
		JumpController:getInstance():jumpViewByEvtData({
			23
		});
	elseif slot1 == "evt_partner_decompose" then
		JumpController:getInstance():jumpViewByEvtData({
			22
		});
	elseif slot1 == "evt_partner_eqm_synthesis" then
		JumpController:getInstance():jumpViewByEvtData({
			26
		});
	elseif slot1 == "evt_expedition" then
		JumpController:getInstance():jumpViewByEvtData({
			25
		});
	elseif slot1 == "evt_grocery_store" then
		JumpController:getInstance():jumpViewByEvtData({
			6
		});
	elseif slot1 == "evt_daily_quest" then
		JumpController:getInstance():jumpViewByEvtData({
			41
		});
	elseif slot1 == "evt_achievement" then
		JumpController:getInstance():jumpViewByEvtData({
			41,
			TaskConst.type.feat
		});
	elseif slot1 == "evt_rune_synthesis" then
		JumpController:getInstance():jumpViewByEvtData({
			26,
			ForgeHouseConst.Tab_Index.Artifact
		});
	elseif slot1 == "evt_skillshop" then
		JumpController:getInstance():jumpViewByEvtData({
			15,
			MallConst.MallType.SkillShop
		});
	elseif slot1 == "evt_eliteshop" then
		JumpController:getInstance():jumpViewByEvtData({
			15,
			MallConst.MallType.EliteShop
		});
	elseif slot1 == "evt_elitematch" then
		JumpController:getInstance():jumpViewByEvtData({
			28
		});
	elseif slot1 == "evt_element_temple" then
		JumpController:getInstance():jumpViewByEvtData({
			42
		});
	elseif slot1 == "evt_dungeon_heaven" then
		JumpController:getInstance():jumpViewByEvtData({
			47
		});
	elseif slot1 == "evt_dungeon_heaven_inside" then
		JumpController:getInstance():jumpViewByEvtData({
			47,
			HeavenController:getInstance():getModel():getOpenMaxChapterId()
		});
	elseif slot1 == "evt_arena_cluster" then
		JumpController:getInstance():jumpViewByEvtData({
			49
		});
	elseif slot1 == "evt_mall_competition" then
		JumpController:getInstance():jumpViewByEvtData({
			50
		});
	elseif slot1 == "evt_home" then
		JumpController:getInstance():jumpViewByEvtData({
			51
		});
	elseif slot1 == "evt_veins_competition" then
		JumpController:getInstance():jumpViewByEvtData({
			52
		});
	elseif slot1 == "evt_cluster_champion" then
		JumpController:getInstance():jumpViewByEvtData({
			53
		});
	elseif slot1 == "evt_experience_alchemy" then
		JumpController:getInstance():jumpViewByEvtData({
			54
		});
	elseif slot1 == "evt_resonate" then
		JumpController:getInstance():jumpViewByEvtData({
			55
		});
	elseif slot1 == "evt_gift_feather" then
		JumpController:getInstance():jumpViewByEvtData({
			56
		});
	elseif slot1 == "evt_festival_feather" then
		JumpController:getInstance():jumpViewByEvtData({
			57
		});
	elseif slot1 == "evt_summon_feather" then
		JumpController:getInstance():jumpViewByEvtData({
			58
		});
	elseif slot1 == "evt_mall_cluster_champion" then
		JumpController:getInstance():jumpViewByEvtData({
			59
		});
	elseif slot1 == "evt_elfin" then
		JumpController:getInstance():jumpViewByEvtData({
			60
		});
	elseif slot1 == "evt_bag_elfin" then
		JumpController:getInstance():jumpViewByEvtData({
			8,
			BackPackConst.item_tab_type.ELFIN
		});
	elseif slot1 == "evt_privilege" then
		JumpController:getInstance():jumpViewByEvtData({
			7,
			VIPTABCONST.PRIVILEGE
		});
	elseif slot1 == "evt_dialy_gift" then
		JumpController:getInstance():jumpViewByEvtData({
			7,
			VIPTABCONST.DAILY_GIFT
		});
	elseif slot1 == "evt_weekly_gift" then
		JumpController:getInstance():jumpViewByEvtData({
			72
		});
	elseif slot1 == "evt_home_shop_random" then
		JumpController:getInstance():jumpViewByEvtData({
			61,
			3
		});
	elseif slot1 == "evt_home_shop_travel" then
		JumpController:getInstance():jumpViewByEvtData({
			61,
			2
		});
	elseif slot1 == "evt_home_shop_furniture" then
		JumpController:getInstance():jumpViewByEvtData({
			61,
			1
		});
	elseif slot1 == "evt_league_secret_area" then
		JumpController:getInstance():jumpViewByEvtData({
			62
		});
	elseif slot1 == "evt_league_marketplace" then
		JumpController:getInstance():jumpViewByEvtData({
			63
		});
	elseif slot1 == "evt_arena_team" then
		JumpController:getInstance():jumpViewByEvtData({
			65
		});
	elseif slot1 == "evt_arena_peak_champion" then
		JumpController:getInstance():jumpViewByEvtData({
			67
		});
	elseif slot1 == "evt_monopoly" then
		JumpController:getInstance():jumpViewByEvtData({
			66
		});
	elseif slot1 == "evt_monopoly_boss" then
		JumpController:getInstance():jumpViewByEvtData({
			66,
			MonopolyConst.Sub_Type.Boss
		});
	elseif slot1 == "evt_monopoly_1" then
		JumpController:getInstance():jumpViewByEvtData({
			66,
			MonopolyConst.Sub_Type.Step_1
		});
	elseif slot1 == "evt_monopoly_2" then
		JumpController:getInstance():jumpViewByEvtData({
			66,
			MonopolyConst.Sub_Type.Step_2
		});
	elseif slot1 == "evt_monopoly_3" then
		JumpController:getInstance():jumpViewByEvtData({
			66,
			MonopolyConst.Sub_Type.Step_3
		});
	elseif slot1 == "evt_monopoly_4" then
		JumpController:getInstance():jumpViewByEvtData({
			66,
			MonopolyConst.Sub_Type.Step_4
		});
	elseif slot1 == "evt_grow_gift" then
		JumpController:getInstance():jumpViewByEvtData({
			74
		});
	elseif slot1 == "evt_subscribe" then
		JumpController:getInstance():jumpViewByEvtData({
			73
		});
	elseif slot1 == "evt_peak_mall_buy" then
		JumpController:getInstance():jumpViewByEvtData({
			75
		});
	elseif slot1 == "evt_emoguoshi_zhaohuan_source" then
		JumpController:getInstance():jumpViewByEvtData({
			79
		});
	else
		print("error_source_evt_type===>>", slot1);
	end
end

function BackpackController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe();

		slot0.model = nil;
	end
end
