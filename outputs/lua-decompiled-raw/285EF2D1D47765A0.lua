EmoguoshiController = EmoguoshiController or BaseClass(BaseController)

function EmoguoshiController.config(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.is_get_data = false
	slot0.guoshi_info = {}
	slot0.shop_times = {}
	slot0.shop_jifen = 0
	slot0.have_random_times = 0
	slot0.effect_list = {}
end

function EmoguoshiController.checkGetData(slot0, ...)
	if slot0.is_get_data then
		return
	end

	slot0.is_get_data = true

	slot0:reqAllInfo()
	slot0:reqAllShopInfo()
	slot0:reqShopJiFen()
	slot0:reqAllZhanLingInfo()
	slot0:reqChouJiangTimes()
end

function EmoguoshiController.getGuoShiIcon(slot0, slot1)
	if Config.ItemData.data_get_data(slot0:getGuoShiItemId(slot1)) then
		return PathTool.getItemRes(slot3.icon)
	end
end

function EmoguoshiController.getGuoShiColor(slot0, slot1)
	slot4 = 0

	if Config.ItemData.data_get_data(slot0:getGuoShiItemId(slot1)) and slot3.quality >= 0 and slot3.quality <= 5 then
		slot4 = slot3.quality
	end

	return BackPackConst.getBlackQualityColorC4B(slot4)
end

function EmoguoshiController.getGuoShiQuality(slot0, slot1)
	slot4 = 0

	if Config.ItemData.data_get_data(slot0:getGuoShiItemId(slot1)) and slot3.quality >= 0 and slot3.quality <= 5 then
		slot4 = slot3.quality
	end

	return slot4
end

slot0 = {}

function EmoguoshiController.getGuoShiItemId(slot0, slot1)
	if not uv0[slot1] then
		slot3 = 0

		for slot7, slot8 in pairs(slot0:getPropLevel(slot1, 1).need_items) do
			slot3 = slot8[1]

			break
		end

		uv0[slot1] = slot3
	end

	return uv0[slot1]
end

function EmoguoshiController.getPropLevel(slot0, slot1, slot2)
	return Config.EmoguoshitujianData.data_get_emoguoshitujian_level[slot1 .. "_" .. slot2]
end

function EmoguoshiController.getGuoShiLevel(slot0, slot1)
	if slot0.guoshi_info[slot1] then
		return slot0.guoshi_info[slot1].level
	end

	return 0
end

slot1 = {}

function EmoguoshiController.getMaxLevel(slot0, slot1)
	if uv0[slot1] then
		return uv0[slot1]
	end

	slot2 = 0

	for slot6 = 1, 200 do
		if not slot0:getPropLevel(slot1, slot6) then
			break
		end

		slot2 = slot6
	end

	uv0[slot1] = slot2

	return uv0[slot1]
end

function EmoguoshiController.getGuoShiName(slot0, slot1)
	if slot0:getPropLevel(slot1, 1) then
		return TI18N(slot2.name)
	end
end

function EmoguoshiController.getPropStar(slot0, slot1, slot2)
	return Config.EmoguoshitujianData.data_get_emoguoshitujian_star[slot1 .. "_" .. slot2]
end

function EmoguoshiController.getGuoShiStar(slot0, slot1)
	if slot0.guoshi_info[slot1] then
		return slot0.guoshi_info[slot1].star
	end

	if slot0:getGuoShiLevel(slot1) <= 0 then
		return 0
	end

	return 1
end

slot2 = {}

function EmoguoshiController.getMaxStar(slot0, slot1)
	if uv0[slot1] then
		return uv0[slot1]
	end

	slot2 = 0

	for slot6 = 1, 200 do
		if not slot0:getPropStar(slot1, slot6) then
			break
		end

		slot2 = slot6
	end

	uv0[slot1] = slot2

	return uv0[slot1]
end

function EmoguoshiController.getPropJueXing(slot0, slot1)
	return Config.EmoguoshitujianData.data_get_emoguoshitujian_juexing[slot1]
end

function EmoguoshiController.isHadJueXing(slot0, slot1)
	if slot0.guoshi_info[slot1] then
		return slot0.guoshi_info[slot1].juexing > 0
	end

	return false
end

slot3 = nil

function EmoguoshiController.getSuiPianMap(slot0, ...)
	if not uv0 then
		uv0 = {}

		for slot5, slot6 in pairs(Config.EmoguoshitujianData.data_get_emoguoshitujian_star) do
			if function (slot0)
				for slot4, slot5 in pairs(slot0) do
					return slot5[1]
				end
			end(slot6.need_items) then
				uv0[slot7] = slot6.id
			end
		end
	end

	return uv0
end

function EmoguoshiController.getSuiPianToGuoShi(slot0, slot1)
	return slot0:getSuiPianMap()[slot1]
end

function EmoguoshiController.isSuiPian(slot0, slot1)
	if slot0:getSuiPianMap()[slot1] then
		return true
	end

	return false
end

function EmoguoshiController.isWanNengSuiPian(slot0, slot1)
	if slot0:getSuiPianMap()[slot1] then
		return slot0:isFullStar(slot2[slot1])
	end

	return false
end

function EmoguoshiController.isFullStar(slot0, slot1)
	if slot0:getPropStar(slot1, slot0:getGuoShiStar(slot1) + 1) then
		return false
	end

	return true
end

function EmoguoshiController.getEffectValue(slot0, slot1)
	for slot5, slot6 in pairs(slot0.effect_list) do
		if slot6.type == slot1 then
			return slot6.val
		end
	end

	return 0
end

function EmoguoshiController.getModel(slot0)
	return slot0.model
end

function EmoguoshiController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil

			uv0:checkGetData()
		end)
	end
end

function EmoguoshiController.registerProtocals(slot0)
	slot0:RegisterProtocal(31101, "handle31101")
	slot0:RegisterProtocal(31102, "handle31102")
	slot0:RegisterProtocal(31103, "handle31103")
	slot0:RegisterProtocal(31104, "handle31104")
	slot0:RegisterProtocal(31105, "handle31105")
	slot0:RegisterProtocal(31106, "handle31106")
	slot0:RegisterProtocal(31107, "handle31107")
	slot0:RegisterProtocal(31108, "handle31108")
	slot0:RegisterProtocal(31109, "handle31109")
	slot0:RegisterProtocal(31115, "handle31115")
	slot0:RegisterProtocal(31116, "handle31116")
	slot0:RegisterProtocal(31120, "handle31120")
	slot0:RegisterProtocal(31121, "handle31121")
	slot0:RegisterProtocal(31122, "handle31122")
	slot0:RegisterProtocal(31123, "handle31123")
	slot0:RegisterProtocal(31127, "handle31127")
	slot0:RegisterProtocal(31130, "handle31130")
end

function EmoguoshiController.reqLevelUp(slot0, slot1)
	slot0:SendProtocal(31101, {
		id = slot1
	})
end

function EmoguoshiController.handle31101(slot0, slot1)
	message(TI18N(slot1.msg))
end

function EmoguoshiController.handle31127(slot0, slot1)
	slot0.effect_list = slot1.effect

	slot0.dispather:Fire(EmoguoshiEvent.EFFECT_CHANGE)
end

function EmoguoshiController.reqOneInfo(slot0, slot1)
	slot0:SendProtocal(31102, {
		id = slot1
	})
end

function EmoguoshiController.handle31102(slot0, slot1)
	slot0.guoshi_info[slot1.id] = slot1

	slot0.dispather:Fire(EmoguoshiEvent.ONE_INFO, slot1.id)
end

function EmoguoshiController.reqAllInfo(slot0)
	slot0:SendProtocal(31103, {})
end

function EmoguoshiController.handle31103(slot0, slot1)
	slot0.guoshi_info = {}

	for slot5, slot6 in pairs(slot1.list) do
		slot0.guoshi_info[slot6.id] = slot6
	end

	slot0.dispather:Fire(EmoguoshiEvent.All_INFO)
end

function EmoguoshiController.reqStarUp(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(31104, {
		id = slot1,
		use_list = slot2,
		items = slot3
	})
end

function EmoguoshiController.handle31104(slot0, slot1)
	message(TI18N(slot1.msg))
end

function EmoguoshiController.reqJueXing(slot0, slot1, slot2)
	slot0:SendProtocal(31105, {
		id = slot1,
		use_list = slot2
	})
end

function EmoguoshiController.handle31105(slot0, slot1)
	message(TI18N(slot1.msg))
end

function EmoguoshiController.reqBuy(slot0, slot1, slot2)
	slot0:SendProtocal(31106, {
		id = slot1,
		num = slot2
	})
end

function EmoguoshiController.handle31106(slot0, slot1)
	message(TI18N(slot1.msg))
end

function EmoguoshiController.handle31107(slot0, slot1)
	slot0.shop_times[slot1.id] = slot1.times

	slot0.dispather:Fire(EmoguoshiEvent.ONE_SHOP_INFO, slot1.id)
end

function EmoguoshiController.reqAllShopInfo(slot0)
	slot0:SendProtocal(31108, {})
end

function EmoguoshiController.handle31108(slot0, slot1)
	slot0.shop_times = {}

	for slot5, slot6 in pairs(slot1.list) do
		slot0.shop_times[slot6.id] = slot6.times
	end
end

function EmoguoshiController.reqShopJiFen(slot0)
	slot0:SendProtocal(31109, {})
end

function EmoguoshiController.handle31109(slot0, slot1)
	slot0.shop_jifen = slot1.jifen

	slot0.dispather:Fire(EmoguoshiEvent.SHOP_JIFEN, slot0.shop_jifen)
end

function EmoguoshiController.getShopJiFen(slot0, ...)
	return slot0.shop_jifen
end

function EmoguoshiController.getShopBuyTimes(slot0, slot1)
	return slot0.shop_times[slot1] or 0
end

function EmoguoshiController.getTanEMoSeeNum(slot0, ...)
	return RoleController:getInstance():getRoleVo().emzz or 0
end

function EmoguoshiController.isCanLevelUp(slot0, slot1)
	if not slot0:getPropLevel(slot1, slot0:getGuoShiLevel(slot1) + 1) then
		return false
	end

	if slot2 > 0 and slot0:getGuoShiStar(slot1) < slot3.need_star then
		return false
	end

	for slot7, slot8 in pairs(slot3.need_items) do
		if BackpackController:getInstance():getModel():getItemNumByBid(slot8[1]) < slot8[2] then
			return false
		end
	end

	return true
end

function EmoguoshiController.isCanStarUp(slot0, slot1)
	if slot0:getGuoShiLevel(slot1) <= 0 then
		return false
	end

	if not slot0:getPropStar(slot1, slot0:getGuoShiStar(slot1) + 1) then
		return false
	end

	for slot7, slot8 in pairs(slot3.need_items) do
		if BackpackController:getInstance():getModel():getItemNumByBid(slot8[1]) < slot8[2] then
			return false
		end
	end

	slot5 = HeroController:getInstance():getModel():getAllHeroArray():GetSize()
	slot7 = {}

	for slot11, slot12 in pairs(BackpackController:getInstance():getModel():getHeroHunList()) do
		if slot12.config and slot12.config.eqm_jie then
			if not slot7[slot12.config.eqm_jie] then
				slot7[slot12.config.eqm_jie] = 0
			end

			slot7[slot12.config.eqm_jie] = slot7[slot12.config.eqm_jie] + 1
		end
	end

	for slot11, slot12 in pairs(slot3.need_partner) do
		for slot17 = 1, slot5 do
			if slot4:Get(slot17 - 1) and not slot18:isResonateHero() and (slot18.bid == slot12[1] or slot12[1] == 0) and slot18.star == slot12[2] then
				slot13 = (slot7[slot12[2]] or 0) + 1
			end
		end

		if slot13 < slot12[3] then
			return false
		end
	end

	return true
end

function EmoguoshiController.isCanJueXing(slot0, slot1)
	if not slot0:getPropJueXing(slot1) then
		return false
	end

	if slot0:isHadJueXing(slot1) then
		return false
	end

	if slot0:getGuoShiStar(slot1) < slot0:getMaxStar(slot1) then
		return false
	end

	for slot6, slot7 in pairs(slot2.need_items1) do
		if BackpackController:getInstance():getModel():getItemNumByBid(slot7[1]) < slot7[2] then
			return false
		end
	end

	slot8 = true

	for slot8, slot9 in pairs(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.EMOGUOSHI, slot8)) do
		if slot0:isWanNengSuiPian(slot9.base_id) then
			slot3 = 0 + slot9.quantity
		end
	end

	for slot8, slot9 in pairs(slot2.need_items2) do
		if slot3 < slot9[2] then
			return false
		end
	end

	return true
end

function EmoguoshiController.isCanUp(slot0)
	for slot4, slot5 in pairs(Config.EmoguoshitujianData.data_get_emoguoshitujian_data) do
		if slot0:isCanLevelUp(slot4) then
			return true
		end

		if slot0:isCanStarUp(slot4) then
			return true
		end

		if slot0:isCanJueXing(slot4) then
			return true
		end
	end

	return false
end

function EmoguoshiController.reqChouJiang(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(31115, {
		id = slot1,
		type = slot2,
		up_id = slot3
	})
end

function EmoguoshiController.handle31115(slot0, slot1)
	message(TI18N(slot1.msg))
	slot0.dispather:Fire(EmoguoshiEvent.CHOUJIANG_RET, slot1)
end

function EmoguoshiController.reqChouJiangTimes(slot0)
	slot0:SendProtocal(31116, {})
end

function EmoguoshiController.handle31116(slot0, slot1)
	slot0.have_random_times = slot1.times

	slot0.dispather:Fire(EmoguoshiEvent.CHOUJIANG_TIMES, slot1.times)
end

function EmoguoshiController.getHaveChouJiangTimes(slot0, ...)
	return slot0.have_random_times
end

slot4 = nil
slot5 = {}
slot6 = false
slot7 = false

function EmoguoshiController.checkLoadChouJiangData(slot0, ...)
	if uv0 then
		return
	end

	uv0 = true
	slot1 = SysEnv:getInstance():get(SysEnv.keys.emoguoshi_zhaohuan, {})
	uv1 = slot1.last

	if slot1.skip and slot1.skip > 0 then
		uv2 = true
	end

	for slot5, slot6 in pairs(slot1) do
		if type(slot6) == "table" then
			for slot13, slot14 in pairs(Config.EmoguoshitujianData.data_get_random_group_data[slot6[2]]) do
				if slot14.id == slot6[1] then
					uv3[slot5] = slot14
				end
			end
		end
	end
end

function EmoguoshiController.getLastSelectChouJiangBid(slot0, ...)
	slot0:checkLoadChouJiangData()

	return uv0
end

function EmoguoshiController.setLastSelectChouJiangBid(slot0, slot1)
	slot0:checkLoadChouJiangData()

	uv0 = slot1
end

function EmoguoshiController.getLastUpItem(slot0, slot1)
	slot0:checkLoadChouJiangData()

	return uv0[slot1]
end

function EmoguoshiController.setLastUpItem(slot0, slot1, slot2)
	slot0:checkLoadChouJiangData()

	uv0[slot1] = slot2
end

function EmoguoshiController.checkSaveChouJiangData(slot0, ...)
	if uv1 then
		-- Nothing
	end

	for slot5, slot6 in pairs(uv2) do
		slot1[slot5] = {
			slot6.id,
			slot6.group_id
		}
	end

	SysEnv:getInstance():set(SysEnv.keys.emoguoshi_zhaohuan, {
		skip = 0,
		last = uv0,
		skip = 1
	}, false)
end

function EmoguoshiController.getChouJiangSkillTag(slot0, ...)
	return uv0
end

function EmoguoshiController.setChouJiangSkillTag(slot0, slot1)
	uv0 = slot1
end

function EmoguoshiController.getZhanLingNowRunId(slot0, ...)
	if slot0.zhanling_info then
		return slot0.zhanling_info.open_id
	end

	return 0
end

function EmoguoshiController.getZhanLingHuoYueDu(slot0, ...)
	if slot0.zhanling_info then
		return slot0.zhanling_info.value
	end

	return 0
end

function EmoguoshiController.isZhanLingCharge(slot0, ...)
	if slot0.zhanling_info then
		return slot0.zhanling_info.charge_tag > 0
	end

	return false
end

function EmoguoshiController.getZhanLingEndTime(slot0, ...)
	if slot0.zhanling_info then
		return slot0.zhanling_info.end_time
	end

	return 0
end

function EmoguoshiController.getZhanLingGetTag(slot0, slot1, slot2)
	if slot0.zhanling_info then
		for slot6, slot7 in pairs(slot0.zhanling_info.list) do
			if slot7.index == slot1 then
				if slot2 == 1 then
					return slot7.tag1
				end

				return slot7.tag2
			end
		end
	end

	return 0
end

function EmoguoshiController.getZhanLingChargeId(slot0, slot1)
	return Config.EmoguoshitujianData.data_get_zhanling_data[slot1][1].charge_id
end

function EmoguoshiController.getZhanLingUnlockItem(slot0, slot1)
	return Config.EmoguoshitujianData.data_get_zhanling_data[slot1][1].unlock_items
end

function EmoguoshiController.isHaveZhanLingReward(slot0, ...)
	if not Config.EmoguoshitujianData.data_get_zhanling_data[slot0:getZhanLingNowRunId()] then
		return false
	end

	slot4 = slot0:isZhanLingCharge()

	for slot8, slot9 in pairs(slot2) do
		if slot9.process <= slot0:getZhanLingHuoYueDu() then
			if slot0:getZhanLingGetTag(slot8, 1) <= 0 then
				return true
			end

			if slot4 and slot0:getZhanLingGetTag(slot8, 2) <= 0 then
				return true
			end
		end
	end

	return false
end

function EmoguoshiController.isZhanLingUnlock(slot0, ...)
	if slot0.zhanling_info then
		return slot0.zhanling_info.unlock_tag > 0
	end

	return false
end

function EmoguoshiController.reqAllZhanLingInfo(slot0)
	slot0:SendProtocal(31120, {})
end

function EmoguoshiController.handle31120(slot0, slot1)
	slot0.zhanling_info = slot1

	slot0.dispather:Fire(EmoguoshiEvent.ZHANLING_ALL_INFO)
end

function EmoguoshiController.handle31121(slot0, slot1)
	if slot0.zhanling_info then
		slot0.zhanling_info.value = slot1.num
	end

	slot0.dispather:Fire(EmoguoshiEvent.ZHANLING_HUOYUEDU)
end

function EmoguoshiController.reqGetZhanLingReward(slot0, slot1, slot2)
	slot0:SendProtocal(31122, {
		index = slot1,
		type = slot2
	})
end

function EmoguoshiController.handle31122(slot0, slot1)
	message(TI18N(slot1.msg))
end

function EmoguoshiController.reqZhanLingUnlock(slot0)
	slot0:SendProtocal(31123, {})
end

function EmoguoshiController.handle31123(slot0, slot1)
	message(TI18N(slot1.msg))
end

function EmoguoshiController.reqFenJie(slot0, slot1, slot2)
	slot0:SendProtocal(31130, {
		id = slot1,
		num = slot2
	})
end

function EmoguoshiController.handle31130(slot0, slot1)
	message(TI18N(slot1.msg))
end

function EmoguoshiController.openUpView(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.emoguoshi_up_window ~= nil then
			slot0.emoguoshi_up_window:close()

			slot0.emoguoshi_up_window = nil
		end
	else
		if slot0.emoguoshi_up_window == nil then
			slot0.emoguoshi_up_window = EmoguoshiUpView.New()
		end

		slot0.emoguoshi_up_window:open(slot2, slot3)
	end
end

function EmoguoshiController.openEmoguoshiSuipianSelectView(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == false then
		if slot0.emoguoshi_select_suipian_window ~= nil then
			slot0.emoguoshi_select_suipian_window:close()

			slot0.emoguoshi_select_suipian_window = nil
		end
	else
		if slot0.emoguoshi_select_suipian_window == nil then
			slot0.emoguoshi_select_suipian_window = EmoguoshiSuipianSelectView.New()
		end

		slot0.emoguoshi_select_suipian_window:open(slot2, slot3, slot4, slot5)
	end
end

function EmoguoshiController.openEmoguoMainView(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.emoguoshi_main_window ~= nil then
			slot0.emoguoshi_main_window:close()

			slot0.emoguoshi_main_window = nil
		end
	else
		if slot0.emoguoshi_main_window == nil then
			slot0.emoguoshi_main_window = EmoguoshiMainView.New()
		end

		if slot0.emoguoshi_main_window:isOpen() then
			if slot2 then
				slot0.emoguoshi_main_window:changeView(slot2, slot3)
			end
		else
			slot0.emoguoshi_main_window:open(slot2, slot3)
		end
	end
end

function EmoguoshiController.openEmoguoBagView(slot0, slot1)
	if slot1 == false then
		if slot0.emoguoshi_bag_window ~= nil then
			slot0.emoguoshi_bag_window:close()

			slot0.emoguoshi_bag_window = nil
		end
	else
		if slot0.emoguoshi_bag_window == nil then
			slot0.emoguoshi_bag_window = EmoguoshiBagView.New()
		end

		slot0.emoguoshi_bag_window:open()
	end
end

function EmoguoshiController.openEmoguoShopView(slot0, slot1)
	if slot1 == false then
		if slot0.emoguoshi_shop_window ~= nil then
			slot0.emoguoshi_shop_window:close()

			slot0.emoguoshi_shop_window = nil
		end
	else
		if slot0.emoguoshi_shop_window == nil then
			slot0.emoguoshi_shop_window = EmoguoshiShopView.New()
		end

		slot0.emoguoshi_shop_window:open()
	end
end

function EmoguoshiController.openEmoguoTipsView(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.emoguoshi_tips_window ~= nil then
			slot0.emoguoshi_tips_window:close()

			slot0.emoguoshi_tips_window = nil
		end
	else
		if slot0.emoguoshi_tips_window == nil then
			slot0.emoguoshi_tips_window = EmoguoshiTipsView.New()
		end

		slot0.emoguoshi_tips_window:open(slot2, slot3)
	end
end

function EmoguoshiController.openEmoguoStarTipsView(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.emoguoshi_star_tips_window ~= nil then
			slot0.emoguoshi_star_tips_window:close()

			slot0.emoguoshi_star_tips_window = nil
		end
	else
		if slot0.emoguoshi_star_tips_window == nil then
			slot0.emoguoshi_star_tips_window = EmoguoshiStarTipsView.New()
		end

		slot0.emoguoshi_star_tips_window:open(slot2, slot3)
	end
end

function EmoguoshiController.openEmoguoTuJianView(slot0, slot1)
	if slot1 == false then
		if slot0.emoguoshi_tujian_window ~= nil then
			slot0.emoguoshi_tujian_window:close()

			slot0.emoguoshi_tujian_window = nil
		end
	else
		if slot0.emoguoshi_tujian_window == nil then
			slot0.emoguoshi_tujian_window = EmoguoshiTujianView.New()
		end

		slot0.emoguoshi_tujian_window:open()
	end
end

function EmoguoshiController.openEmoguoRandomView(slot0, slot1)
	if slot1 == false then
		-- Nothing
	elseif slot0.emoguoshi_main_window then
		slot0.emoguoshi_main_window:showChouJiang()
	end
end

function EmoguoshiController.openEmoguoRandomShowView(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.emoguoshi_random_show_window ~= nil then
			slot0.emoguoshi_random_show_window:close()

			slot0.emoguoshi_random_show_window = nil
		end
	else
		if slot0.emoguoshi_random_show_window == nil then
			slot0.emoguoshi_random_show_window = EmoguoshiRandomShowView.New()
		end

		slot0.emoguoshi_random_show_window:open(slot2)
	end
end

function EmoguoshiController.openEmoguoRandomSelectUpView(slot0, slot1, slot2, slot3, slot4)
	if slot1 == false then
		if slot0.emoguoshi_random_select_up_window ~= nil then
			slot0.emoguoshi_random_select_up_window:close()

			slot0.emoguoshi_random_select_up_window = nil
		end
	else
		if slot0.emoguoshi_random_select_up_window == nil then
			slot0.emoguoshi_random_select_up_window = EmoguoshiRandomSelectUpView.New()
		end

		slot0.emoguoshi_random_select_up_window:open(slot2, slot3, slot4)
	end
end

function EmoguoshiController.openEmoguoZhanLingView(slot0, slot1)
	if slot1 == false then
		if slot0.emoguoshi_zhanling_window ~= nil then
			slot0.emoguoshi_zhanling_window:close()

			slot0.emoguoshi_zhanling_window = nil
		end
	else
		if slot0.emoguoshi_zhanling_window == nil then
			slot0.emoguoshi_zhanling_window = EmoguoshiZhanLingView.New()
		end

		slot0.emoguoshi_zhanling_window:open()
	end
end

function EmoguoshiController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end

	if slot0.re_link_game_event then
		GlobalEvent:getInstance():UnBind(slot0.re_link_game_event)

		slot0.re_link_game_event = nil
	end
end
