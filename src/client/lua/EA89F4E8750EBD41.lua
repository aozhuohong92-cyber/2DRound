HeavenController = HeavenController or BaseClass(BaseController)

function HeavenController.config(slot0)
	slot0.model = HeavenModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function HeavenController.getModel(slot0)
	return slot0.model
end

function HeavenController.registerEvents(slot0)
	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			uv0.model:clearData()
			uv0:sender25200()
			uv0:sender25219()
		end)
	end
end

function HeavenController.sender25200(slot0)
	slot0:SendProtocal(25200, {})
end

function HeavenController.sender25201(slot0, slot1)
	slot0:SendProtocal(25201, {
		id = slot1
	})
end

function HeavenController.sender25205(slot0, slot1, slot2)
	slot0:SendProtocal(25205, {
		id = slot1,
		order_id = slot2
	})
end

function HeavenController.sender25207(slot0)
	slot0:SendProtocal(25207, {})
end

function HeavenController.sender25208(slot0, slot1, slot2)
	slot0:SendProtocal(25208, {
		id = slot1,
		order_id = slot2
	})
end

function HeavenController.sender25210(slot0, slot1)
	slot0:SendProtocal(25210, {
		type = slot1
	})
end

function HeavenController.sender25211(slot0, slot1, slot2)
	slot0:SendProtocal(25211, {
		type = slot1,
		formations = slot2
	})
end

function HeavenController.sender25215(slot0, slot1, slot2)
	slot0:SendProtocal(25215, {
		id = slot1,
		award_id = slot2
	})
end

function HeavenController.sender25217(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(25217, {
		group_id = slot1,
		times = slot2,
		recruit_type = slot3
	})
end

function HeavenController.sender25218(slot0, slot1, slot2)
	slot0:SendProtocal(25218, {
		type = slot1,
		group_id = slot2
	})
end

function HeavenController.sender25219(slot0)
	slot0:SendProtocal(25219, {})
end

function HeavenController.registerProtocals(slot0)
	slot0:RegisterProtocal(25200, "handle25200")
	slot0:RegisterProtocal(25201, "handle25201")
	slot0:RegisterProtocal(25203, "handle25203")
	slot0:RegisterProtocal(25204, "handle25204")
	slot0:RegisterProtocal(25205, "handle25205")
	slot0:RegisterProtocal(25206, "handle25206")
	slot0:RegisterProtocal(25207, "handle25207")
	slot0:RegisterProtocal(25208, "handle25208")
	slot0:RegisterProtocal(25210, "handle25210")
	slot0:RegisterProtocal(25211, "handle25211")
	slot0:RegisterProtocal(25215, "handle25215")
	slot0:RegisterProtocal(25216, "handle25216")
	slot0:RegisterProtocal(25217, "handle25217")
	slot0:RegisterProtocal(25218, "handle25218")
	slot0:RegisterProtocal(25219, "handle25219")
	slot0:RegisterProtocal(25230, "handle25230")
	slot0:RegisterProtocal(25231, "handle25231")
	slot0:RegisterProtocal(25232, "handle25232")
end

function HeavenController.handle25200(slot0, slot1)
	if slot1 then
		if slot1.count then
			slot0.model:setLeftChallengeCount(slot1.count)
		end

		if slot1.buy_count then
			slot0.model:setTodayBuyCount(slot1.buy_count)
		end

		if slot1.max_dun_id then
			slot0.model:setMaxDunId(slot1.max_dun_id)
		end

		if slot1.chapter_info then
			slot0.model:setChapterData(slot1.chapter_info)
		end

		GlobalEvent:getInstance():Fire(HeavenEvent.Get_Chapter_Data_Event)
	end
end

function HeavenController.handle25201(slot0, slot1)
	if slot1 then
		if slot1.dun_info then
			slot0.model:setCustomsData(slot1.dun_info, slot1.id)
		end

		GlobalEvent:getInstance():Fire(HeavenEvent.Update_Chapter_Basedata_Event)
	end
end

function HeavenController.handle25203(slot0, slot1)
	if slot1 then
		if slot1.count then
			slot0.model:setLeftChallengeCount(slot1.count)
		end

		if slot1.buy_count then
			slot0.model:setTodayBuyCount(slot1.buy_count)
		end

		if slot1.max_dun_id then
			slot0.model:setMaxDunId(slot1.max_dun_id)
		end

		if slot1.chapter_info then
			slot0.model:updateChapterData(slot1.chapter_info)
		end

		GlobalEvent:getInstance():Fire(HeavenEvent.Update_Chapter_Count_Event)
	end
end

function HeavenController.handle25204(slot0, slot1)
	if slot1 and slot1.dun_info then
		slot0.model:updateCustomsData(slot1.dun_info, slot1.id)
		GlobalEvent:getInstance():Fire(HeavenEvent.Update_Chapter_Basedata_Event)
	end
end

function HeavenController.handle25205(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function HeavenController.handle25206(slot0, slot1)
	if slot1 then
		BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.HeavenWar, slot1)
	end
end

function HeavenController.handle25207(slot0, slot1)
	if slot1 then
		message(slot1.msg)

		if slot1.count then
			slot0.model:setLeftChallengeCount(slot1.count)
		end

		if slot1.buy_count then
			slot0.model:setTodayBuyCount(slot1.buy_count)
		end

		if slot1.code == 1 and slot0._temp_type and slot0._temp_formations then
			slot0:sender25211(slot0._temp_type, slot0._temp_formations)

			slot0._temp_type = nil
			slot0._temp_formations = nil
		elseif slot1.code == 1 and slot0._temp_id and slot0._temp_order_id then
			slot0:sender25208(slot0._temp_id, slot0._temp_order_id)

			slot0._temp_id = nil
			slot0._temp_order_id = nil
		end

		GlobalEvent:getInstance():Fire(HeavenEvent.Update_Chapter_Count_Event)
	end
end

function HeavenController.handle25208(slot0, slot1)
	if slot1 then
		message(slot1.msg)

		if slot1.count then
			slot0.model:setLeftChallengeCount(slot1.count)
		end

		GlobalEvent:getInstance():Fire(HeavenEvent.Update_Chapter_Count_Event)
	end
end

function HeavenController.handle25210(slot0, slot1)
	GlobalEvent:getInstance():Fire(HeavenEvent.Update_Heaven_Fun_Form, slot1)
end

function HeavenController.handle25211(slot0, slot1)
	if slot1 then
		message(slot1.msg)
		GlobalEvent:getInstance():Fire(HeavenEvent.Save_Heaven_Fun_Form, slot1)
	end
end

function HeavenController.handle25215(slot0, slot1)
	if slot1 then
		message(slot1.msg)
		slot0.model:updateOneChapterDataById(slot1.id, {
			award_info = slot1.award_info
		})
		GlobalEvent:getInstance():Fire(HeavenEvent.Get_Chapter_Award_Event)
	end
end

function HeavenController.handle25216(slot0, slot1)
	if slot1 then
		BattleController:getInstance():getModel():setUnfinishedWarStatus(slot1.combat_type, slot1.flag)

		if slot1.flag == 0 then
			MainuiController:getInstance():openRelevanceWindowAtOnce(slot1.combat_type)
		end
	end
end

function HeavenController.handle25217(slot0, slot1)
	if slot1 then
		slot2 = {
			[slot6] = {}
		}

		for slot6, slot7 in ipairs(slot1.rewards or {}) do
			slot2[slot6].bid = slot7.base_id
			slot2[slot6].num = slot7.num
			slot2[slot6].id = slot7.id
		end

		MainuiController:getInstance():openGetItemView(true, slot2, 0, {
			is_backpack = true,
			times = slot1.times,
			group_id = slot1.group_id
		}, MainuiConst.item_open_type.heavendial)
	end
end

function HeavenController.handle25218(slot0, slot1)
	if slot1 then
		if slot1.type == 1 then
			slot0.model:setMyselfDialRecordData(slot1.log_list)
		elseif slot1.type == 2 then
			slot0.model:setAllDialRecordData(slot1.log_list, slot1.group_id)
		end

		GlobalEvent:getInstance():Fire(HeavenEvent.Update_Dial_Record_Data, slot1.type, slot1.group_id)
	end
end

function HeavenController.handle25219(slot0, slot1)
	if slot1 then
		slot0.model:setHeavenDailData(slot1.recruit_list)
		GlobalEvent:getInstance():Fire(HeavenEvent.Update_Dial_Base_Data)
	end
end

function HeavenController.sender25230(slot0, slot1, slot2)
	slot0:SendProtocal(25230, {
		group_id = slot1,
		lucky_holy_eqm = slot2
	})
end

function HeavenController.handle25230(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function HeavenController.sender25231(slot0, slot1, slot2)
	slot0:SendProtocal(25231, {
		group_id = slot1,
		id = slot2
	})
end

function HeavenController.handle25231(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function HeavenController.sender25232(slot0)
	slot0:SendProtocal(25232, {})
end

function HeavenController.handle25232(slot0, slot1)
	if slot1 then
		slot0.model:setAllScore(slot1.score)
	end
end

function HeavenController.checkJoinHeavenBattle(slot0, slot1, slot2)
	if slot0.model:getLeftChallengeCount() > 0 then
		slot0:sender25211(slot1, slot2)
	elseif slot0.model:getTodayLeftBuyCount() > 0 then
		if Config.DungeonHeavenData.data_count_buy[slot0.model:getTodayBuyCount() + 1] then
			CommonAlert.show(string.format(TI18N("挑战次数不足，是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数并且进入战斗？"), PathTool.getItemRes(3), slot4.cost), TI18N("确定"), function ()
				uv0._temp_type = uv1
				uv0._temp_formations = uv2

				uv0:sender25207()
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		end
	else
		message(TI18N("挑战次数不足"))
		HeroController:getInstance():openFormGoFightPanel(false)
	end
end

function HeavenController.checkHeavenSweep(slot0, slot1, slot2)
	if slot0.model:getLeftChallengeCount() > 0 then
		slot0:sender25208(slot1, slot2)
	elseif slot0.model:getTodayLeftBuyCount() > 0 then
		if Config.DungeonHeavenData.data_count_buy[slot0.model:getTodayBuyCount() + 1] then
			CommonAlert.show(string.format(TI18N("挑战次数不足，是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数并且进行扫荡？"), PathTool.getItemRes(3), slot4.cost), TI18N("确定"), function ()
				uv0._temp_id = uv1
				uv0._temp_order_id = uv2

				uv0:sender25207()
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		end
	else
		message(TI18N("挑战次数不足"))
	end
end

function HeavenController.openHeavenMainWindow(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == true then
		if not slot0.model:checkHeavenIsOpen() then
			return
		end

		if slot3 and slot3 == HeavenConst.Tab_Index.DialRecord then
			if not slot0.model:checkHeavenDialIsOpen() then
				return
			end

			if slot4 and not slot0.model:checkHeavenDialIsOpenByGId(slot4) then
				if Config.HolyEqmLotteryData.data_group[slot4] then
					message(slot6.open_desc .. slot6.name)
				end

				return
			end
		end

		if not slot0.heaven_main_wnd then
			slot0.heaven_main_wnd = HeavenMainWindow.New(slot3)
		end

		if slot0.heaven_main_wnd:isOpen() == false then
			slot0.heaven_main_wnd:open({
				group_id = slot4,
				index = slot3,
				is_open_chapter = slot5,
				chapter_id = slot2
			})
		elseif slot0.heaven_main_wnd:isOpen() == true and slot3 and slot0.heaven_main_wnd.changeSelectedTab then
			slot0.heaven_main_wnd:changeSelectedTab(slot3)
		end

		if slot3 and slot3 == HeavenConst.Tab_Index.DialRecord then
			return
		end
	elseif slot0.heaven_main_wnd then
		slot0.heaven_main_wnd:close()

		slot0.heaven_main_wnd = nil
	end
end

function HeavenController.openHeavenChapterWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.heaven_chapter_wnd then
			slot0.heaven_chapter_wnd = HeavenChapterWindow.New()
		end

		if slot0.heaven_chapter_wnd:isOpen() == false then
			slot0.heaven_chapter_wnd:open(slot2)
		end
	elseif slot0.heaven_chapter_wnd then
		slot0.heaven_chapter_wnd:close()

		slot0.heaven_chapter_wnd = nil
	end
end

function HeavenController.openHeavenRankWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.heaven_rank_wnd then
			slot0.heaven_rank_wnd = HeavenRankWindow.New()
		end

		if slot0.heaven_rank_wnd:isOpen() == false then
			slot0.heaven_rank_wnd:open()
		end
	elseif slot0.heaven_rank_wnd then
		slot0.heaven_rank_wnd:close()

		slot0.heaven_rank_wnd = nil
	end
end

function HeavenController.openHeavenStarAwardWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.star_award_wnd then
			slot0.star_award_wnd = HeavenStarAwardWindow.New()
		end

		if slot0.star_award_wnd:isOpen() == false then
			slot0.star_award_wnd:open(slot2)
		end
	elseif slot0.star_award_wnd then
		slot0.star_award_wnd:close()

		slot0.star_award_wnd = nil
	end
end

function HeavenController.openHeavenBattleWinView(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.battle_win_view then
			slot0.battle_win_view = HeavenBattleWinView.New()
		end

		if slot0.battle_win_view:isOpen() == false then
			slot0.battle_win_view:open(slot2)
		end
	elseif slot0.battle_win_view then
		slot0.battle_win_view:close()

		slot0.battle_win_view = nil
	end
end

function HeavenController.openHeavenDialWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.model:checkHeavenDialIsOpen() then
			return
		end

		if slot2 and (not Config.HolyEqmLotteryData.data_group[slot2] or not slot0.model:checkHeavenDialIsOpenByGId(slot2)) then
			message(slot3.open_desc .. slot3.name)

			return
		end

		if not slot0.heaven_dial_wnd then
			slot0.heaven_dial_wnd = HeavenDialWindow.New()
		end

		if slot0.heaven_dial_wnd:isOpen() == false then
			slot0.heaven_dial_wnd:open(slot2)
		end
	elseif slot0.heaven_dial_wnd then
		slot0.heaven_dial_wnd:close()

		slot0.heaven_dial_wnd = nil
	end
end

function HeavenController.openHeavenDialRecordWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.dial_record_wnd then
			slot0.dial_record_wnd = HeavenDialRecordWindow.New()
		end

		if slot0.dial_record_wnd:isOpen() == false then
			slot0.dial_record_wnd:open(slot2)
		end
	elseif slot0.dial_record_wnd then
		slot0.dial_record_wnd:close()

		slot0.dial_record_wnd = nil
	end
end

function HeavenController.openHeavenDialWishWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.dial_wish_wnd then
			slot0.dial_wish_wnd = HeavenDialWishWindow.New()
		end

		if slot0.dial_wish_wnd:isOpen() == false then
			slot0.dial_wish_wnd:open(slot2, slot3)
		end
	elseif slot0.dial_wish_wnd then
		slot0.dial_wish_wnd:close()

		slot0.dial_wish_wnd = nil
	end
end

function HeavenController.getHeavenMainWindowRoot(slot0)
	if slot0.heaven_main_wnd ~= nil then
		return slot0.heaven_main_wnd.root_wnd
	end
end

function HeavenController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
