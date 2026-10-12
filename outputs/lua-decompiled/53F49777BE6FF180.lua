SingleRankPanel = class("SingleRankPanel", function ()
	return ccui.Layout:create()
end)
slot0 = table.sort
slot1 = string.format

function SingleRankPanel.ctor(slot0)
	slot0.is_init = true
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_rank_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.scroll_container = slot0.root_wnd:getChildByName("scroll_container")
	slot0.empty_bg = slot0.scroll_container:getChildByName("empty_bg")

	slot0.empty_bg:setVisible(false)
	slot0.empty_bg:setScale(0.9)
	loadSpriteTexture(slot0.empty_bg, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), LOADTEXT_TYPE)

	slot0.desc_label = slot0.empty_bg:getChildByName("desc_label")

	slot0.desc_label:setPosition(slot0.empty_bg:getContentSize().width / 2, -29)
	slot0.desc_label:setString(TI18N("暂无记录"))

	slot1 = slot0.scroll_container:getContentSize()
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.scroll_container, nil, nil, nil, cc.size(slot1.width, slot1.height - 10), {
		start_y = 0,
		item_width = 614,
		start_x = 4,
		space_x = 4,
		row = 0,
		item_height = 125,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = SingleRankItem
	})
	slot4 = slot0.root_wnd:getChildByName("my_container")
	slot5 = slot4:getChildByName("my_rank_title")
	slot0.rank_img = slot4:getChildByName("rank_img")

	slot0.rank_img:setVisible(false)

	slot0.rank_x = slot0.rank_img:getPositionX()
	slot0.rank_y = slot0.rank_img:getPositionY()
	slot0.role_name = slot4:getChildByName("role_name")
	slot0.role_power = slot4:getChildByName("role_power")
	slot0.no_rank = slot4:getChildByName("no_rank")

	slot0.no_rank:setString(TI18N("未上榜"))
	slot0.no_rank:setVisible(false)

	slot0.power_bg = slot4:getChildByName("Image_1")
	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(150, 65)
	slot0.role_head:setLev(99)
	slot4:addChild(slot0.role_head)

	slot0.my_container = slot4

	slot0:registerEvent()
end

function SingleRankPanel.registerEvent(slot0)
	if slot0.update_rank_event == nil then
		slot0.update_rank_event = GlobalEvent:getInstance():Bind(RankEvent.RankEvent_Get_Rank_data, function (slot0)
			if not slot0 then
				return
			end

			if slot0.type == uv0.rank_type then
				uv0:updateRankList(slot0)
			end
		end)
	end

	if slot0.guildsecretarea_update_rank_event == nil then
		slot0.guildsecretarea_update_rank_event = GlobalEvent:getInstance():Bind(GuildsecretareaEvent.GUILD_SECRET_AREA_RANK_COUNT_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if uv0.rank_type == RankConstant.RankType.guild_secretarea then
				uv0:updateRankList(slot0)
			end
		end)
	end

	if slot0.arenapeakchampion_current_rank_event == nil then
		slot0.arenapeakchampion_current_rank_event = GlobalEvent:getInstance():Bind(ArenapeakchampionEvent.ARENAPEAKCHAMPION_CURRENT_RANK_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if uv0.rank_type == RankConstant.RankType.arena_peak_champion then
				uv0:updateRankList(slot0)
			end
		end)
	end

	if slot0.year_rank_info_event == nil then
		slot0.year_rank_info_event = GlobalEvent:getInstance():Bind(ActionyearmonsterEvent.Year_Rank_Info_Event, function (slot0)
			if not slot0 then
				return
			end

			if uv0.rank_type == RankConstant.RankType.year_monster then
				uv0:updateRankList(slot0)
			end
		end)
	end

	if slot0.role_worship_event == nil then
		slot0.role_worship_event = GlobalEvent:getInstance():Bind(RoleEvent.WorshipOtherRole, function (slot0, slot1, slot2, slot3)
			if not uv0.rank_type then
				return
			end

			uv0:updateWorshipInfo(slot0, slot1, slot2, slot3)
		end)
	end
end

function SingleRankPanel.updateWorshipInfo(slot0, slot1, slot2, slot3, slot4)
	if slot0.rank_type == RankConstant.RankType.arena_peak_champion then
		if slot0.scroll_view then
			slot5 = false

			if not slot0.scroll_view:getItemList() then
				return
			end

			for slot10, slot11 in pairs(slot6) do
				if slot11:getData() and slot12.rid == slot1 and slot12.srv_id == slot2 then
					slot12.worship_status = 1
					slot5 = true

					slot11:updateOneBtnInfo()

					break
				end
			end

			if not slot5 then
				for slot11, slot12 in ipairs(slot0.scroll_view.data_list) do
					if slot12.rid == slot1 and slot12.srv_id == slot2 then
						slot12.worship_status = 1

						break
					end
				end
			end
		end

		slot0.day_worship = slot0.day_worship + 1

		ArenapeakchampionController:getInstance():getModel():setWorshipRedPoint(slot0.day_worship)
	end
end

function SingleRankPanel.setNodeVisible(slot0, slot1)
	slot0:setVisible(slot1)
end

function SingleRankPanel.addToParent(slot0, slot1)
	slot0.rank_type = (slot1 or {}).rank_type or RankConstant.RankType.element

	if slot0.is_init == true then
		if slot0.rank_type == RankConstant.RankType.guild_secretarea then
			if slot2.boss_id then
				GuildsecretareaController:getInstance():sender26806(slot3, 1)
			end
		elseif slot0.rank_type == RankConstant.RankType.arena_peak_champion then
			if slot2.zone_id then
				ArenapeakchampionController:getInstance():sender27714(slot3, 1, 256)
			end
		elseif slot0.rank_type == RankConstant.RankType.year_monster then
			if slot2.type then
				ActionyearmonsterController:getInstance():sender28213(slot2.type, 1)
			end
		elseif slot0.rank_type == RankConstant.RankType.sweet then
			RankController:send_12900(slot0.rank_type, 1, 25)
		else
			RankController:send_12900(slot0.rank_type)
		end

		slot0.is_init = false
	end
end

function SingleRankPanel.updateRankList(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()

	if slot1 and slot2 then
		slot0:updateOtherInfo(slot1, slot2)

		if (slot1.power or 0) == 0 then
			slot3 = slot2.power
		end

		slot0.role_name:setString(slot2.name)
		slot0.role_power:setString(slot3)
		slot0.power_bg:setContentSize(cc.size(slot0.role_power:getContentSize().width + 75, slot0.power_bg:getContentSize().height))

		if slot1.my_idx and slot1.my_idx <= 3 then
			if slot0.rank_num ~= nil then
				slot0.rank_num:setVisible(false)
			end

			if slot1.my_idx == 0 then
				slot0.rank_img:setVisible(false)
				slot0.no_rank:setVisible(true)
			else
				slot0.no_rank:setVisible(false)

				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.my_idx)) then
					slot0.rank_res_id = slot6

					loadSpriteTexture(slot0.rank_img, slot6, LOADTEXT_TYPE_PLIST)
				end

				slot0.rank_img:setVisible(true)
			end
		else
			if slot0.rank_num == nil then
				slot0.rank_num = CommonNum.new(1, slot0.my_container, 1, -2, cc.p(0.5, 0.5))

				slot0.rank_num:setPosition(59, 77)
			end

			slot0.rank_num:setVisible(true)
			slot0.rank_num:setNum(slot1.my_idx)
			slot0.rank_img:setVisible(false)
		end

		slot0.role_head:setHeadRes(slot2.face_id, false, LOADTEXT_TYPE, slot2.face_file, slot2.face_update_time)
		slot0.role_head:setLev(slot2.lev)

		if Config.AvatarData.data_avatar[slot2.avatar_base_id] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot7.res_id or 1), false, false), nil, false, slot7.offy)
		end

		if slot1.rank_list ~= nil and next(slot1.rank_list) ~= nil then
			slot0.rank_list = slot1.rank_list

			slot0.scroll_view:setData(slot1.rank_list, nil, nil, {
				rank_type = slot0.rank_type
			})
			slot0.empty_bg:setVisible(false)
		else
			slot0.empty_bg:setVisible(true)
		end
	end
end

function SingleRankPanel.updateOtherInfo(slot0, slot1, slot2)
	if slot0.rank_type == RankConstant.RankType.sandybeach_boss_fight or slot0.rank_type == RankConstant.RankType.sweet then
		slot3 = string.format(TI18N("<div>%s</div><div fontcolor=#249003 fontsize=22>%s</div>"), TI18N("当前积分:"), slot1.my_val1 or 0)

		if slot0.my_score_info == nil then
			slot0.my_score_info = createRichLabel(20, 175, cc.p(0.5, 0.5), cc.p(520, 65), nil, nil, 300)

			slot0.my_container:addChild(slot0.my_score_info)
		end

		slot0.my_score_info:setString(slot3)
	elseif slot0.rank_type == RankConstant.RankType.guild_secretarea then
		slot3 = 0
		slot7 = SortTools.KeyLowerSorter

		uv0(slot1.dps_list, slot7("rank"))

		slot1.my_idx = 0

		for slot7, slot8 in ipairs(slot1.dps_list) do
			if slot2 and slot2.rid == slot8.rid and slot2.srv_id == slot8.srv_id then
				slot1.my_idx = slot8.rank
				slot3 = slot8.dps

				break
			end
		end

		slot1.rank_list = slot1.dps_list

		if slot0.my_score_info == nil then
			slot0.my_score_info = createLabel(22, cc.c4b(36, 144, 3, 255), nil, 520, 65, slot3, slot0.my_container, nil, cc.p(0.5, 0.5))
		else
			slot0.my_score_info:setString(slot3)
		end
	elseif slot0.rank_type == RankConstant.RankType.year_monster then
		slot3 = 0
		slot7 = SortTools.KeyLowerSorter

		uv0(slot1.dps_list, slot7("rank"))

		slot1.my_idx = 0

		for slot7, slot8 in ipairs(slot1.dps_list) do
			if slot2 and slot2.rid == slot8.rid and slot2.srv_id == slot8.srv_id then
				slot1.my_idx = slot8.rank
				slot3 = slot8.dps

				break
			end
		end

		slot1.rank_list = slot1.dps_list

		if slot0.my_score_info == nil then
			slot0.my_score_info = createLabel(22, cc.c4b(36, 144, 3, 255), nil, 520, 65, slot3, slot0.my_container, nil, cc.p(0.5, 0.5))
		else
			slot0.my_score_info:setString(slot3)
		end
	elseif slot0.rank_type == RankConstant.RankType.arena_peak_champion then
		slot3 = slot1.worship or 0
		slot4 = slot1.score or 0
		slot1.my_idx = slot1.rank
		slot0.day_worship = slot1.day_worship

		if slot0.good_btn == nil then
			slot0.good_btn = createImage(slot0.my_container, PathTool.getResFrame("common", "common_1027"), 520, 74, cc.p(0.5, 0.5), true, 1, true)

			slot0.good_btn:setContentSize(cc.size(137, 49))
			createImage(slot0.good_btn, PathTool.getResFrame("common", "common_1045"), 32, 28, cc.p(0.5, 0.5), true, 1, false)

			slot0.my_worship_info = createLabel(22, cc.c4b(104, 69, 42, 255), nil, 90, 28, slot3, slot0.good_btn, nil, cc.p(0.5, 0.5))

			slot0.my_worship_info:setString(slot3)
		elseif slot0.my_worship_info then
			slot0.my_worship_info:setString(slot3)
		end

		if slot0.my_score_info == nil then
			slot0.my_score_info = createRichLabel(20, cc.c4b(100, 50, 3, 255), cc.p(0.5, 0.5), cc.p(520, 34), nil, nil, 300)

			slot0.my_container:addChild(slot0.my_score_info)
		end

		slot0.my_score_info:setString(uv1(TI18N("选拔赛分数:<div fontcolor=#249003>%s</div>"), slot4))
	end
end

function SingleRankPanel.onClickBtn(slot0)
	if slot0.rank_type == RankConstant.RankType.arena_peak_champion then
		-- Nothing
	end
end

function SingleRankPanel.DeleteMe(slot0)
	if slot0.update_rank_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_rank_event)

		slot0.update_rank_event = nil
	end

	if slot0.guildsecretarea_update_rank_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.guildsecretarea_update_rank_event)

		slot0.guildsecretarea_update_rank_event = nil
	end

	if slot0.arenapeakchampion_current_rank_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.arenapeakchampion_current_rank_event)

		slot0.arenapeakchampion_current_rank_event = nil
	end

	if slot0.year_rank_info_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.year_rank_info_event)

		slot0.year_rank_info_event = nil
	end

	if slot0.role_worship_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.role_worship_event)

		slot0.role_worship_event = nil
	end

	if slot0.rank_num then
		slot0.rank_num:DeleteMe()

		slot0.rank_num = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

SingleRankItem = class("SingleRankItem", function ()
	return ccui.Layout:create()
end)

function SingleRankItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_rank_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.rank_img = slot1:getChildByName("rank_img")
	slot0.role_name = slot1:getChildByName("role_name")
	slot0.role_power = slot1:getChildByName("role_power")
	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(150, 65)
	slot1:addChild(slot0.role_head)
	slot0.role_head:setLev(99)

	slot0.container = slot1

	slot0:registerEvent()
end

function SingleRankItem.registerEvent(slot0)
	slot0.role_head:addCallBack(function ()
		if uv0.data ~= nil then
			FriendController:getInstance():openFriendCheckPanel(true, {
				srv_id = uv0.data.srv_id,
				rid = uv0.data.rid
			})
		end
	end, false)
end

function SingleRankItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function SingleRankItem.setExtendData(slot0, slot1)
	slot0.rank_type = (slot1 or {}).rank_type or RankConstant.RankType.element
end

function SingleRankItem.setData(slot0, slot1)
	if slot1 and RoleController:getInstance():getRoleVo() then
		slot0.data = slot1

		slot0:updateOtherInfo(slot1)
		slot0.role_name:setString(slot1.name)
		slot0.role_power:setString(slot1.val3)
		slot0.role_head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
		slot0.role_head:setLev(slot1.lev)

		if Config.AvatarData.data_avatar[slot1.avatar_id] then
			slot0.role_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot4.res_id or 1), false, false), nil, false, slot4.offy)
		end

		if slot1.idx <= 3 then
			if slot0.rank_num ~= nil then
				slot0.rank_num:setVisible(false)
			end

			if slot1.idx == 0 then
				slot0.rank_img:setVisible(false)
			else
				if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.idx)) then
					slot0.rank_res_id = slot5

					loadSpriteTexture(slot0.rank_img, slot5, LOADTEXT_TYPE_PLIST)
				end

				slot0.rank_img:setVisible(true)
			end
		else
			if slot0.rank_num == nil then
				slot0.rank_num = CommonNum.new(1, slot0.container, 1, -2, cc.p(0.5, 0.5))

				slot0.rank_num:setPosition(59, 77)
			end

			slot0.rank_num:setVisible(true)
			slot0.rank_num:setNum(slot1.idx)
			slot0.rank_img:setVisible(false)
		end
	end
end

function SingleRankItem.getData(slot0)
	return slot0.data
end

function SingleRankItem.updateOtherInfo(slot0, slot1)
	if slot0.rank_type == RankConstant.RankType.sandybeach_boss_fight or slot0.rank_type == RankConstant.RankType.sweet then
		slot2 = string.format(TI18N("<div>%s</div><div fontcolor=#249003 fontsize=22>%s</div>"), TI18N("当前积分:"), slot1.val1 or 0)

		if slot0.score_info == nil then
			slot0.score_info = createRichLabel(20, 175, cc.p(0.5, 0.5), cc.p(520, 60), nil, nil, 300)

			slot0.container:addChild(slot0.score_info)
		end

		slot0.score_info:setString(slot2)
	elseif slot0.rank_type == RankConstant.RankType.guild_secretarea then
		if slot0.score_info == nil then
			slot0.score_info = createLabel(22, cc.c4b(36, 144, 3, 255), nil, 520, 60, slot1.dps, slot0.container, nil, cc.p(0.5, 0.5))
		else
			slot0.score_info:setString(slot1.dps)
		end

		slot1.val3 = slot1.power
		slot1.idx = slot1.rank
	elseif slot0.rank_type == RankConstant.RankType.year_monster then
		if slot0.score_info == nil then
			slot0.score_info = createLabel(22, cc.c4b(36, 144, 3, 255), nil, 520, 60, slot1.dps, slot0.container, nil, cc.p(0.5, 0.5))
		else
			slot0.score_info:setString(slot1.dps)
		end

		slot1.val3 = slot1.power
		slot1.idx = slot1.rank
	elseif slot0.rank_type == RankConstant.RankType.arena_peak_champion then
		slot2 = slot1.worship or 0
		slot3 = slot1.score or 0
		slot1.val3 = slot1.power
		slot1.idx = slot1.rank

		if slot0.good_btn == nil then
			slot0.good_btn = createImage(slot0.container, PathTool.getResFrame("common", "common_1027"), 520, 74, cc.p(0.5, 0.5), true, 1, true)

			slot0.good_btn:setContentSize(cc.size(137, 49))
			slot0.good_btn:setTouchEnabled(true)
			createImage(slot0.good_btn, PathTool.getResFrame("common", "common_1045"), 32, 28, cc.p(0.5, 0.5), true, 1, false)

			slot0.my_worship_info = createLabel(22, cc.c4b(104, 69, 42, 255), nil, 90, 28, slot2, slot0.good_btn, nil, cc.p(0.5, 0.5))

			registerButtonEventListener(slot0.good_btn, handler(slot0, slot0.onClickOneBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
			slot0.my_worship_info:setString(slot2)
		elseif slot0.my_worship_info then
			slot0.my_worship_info:setString(slot2)
		end

		if slot0.my_score_info == nil then
			slot0.my_score_info = createRichLabel(20, cc.c4b(100, 50, 3, 255), cc.p(0.5, 0.5), cc.p(520, 34), nil, nil, 300)

			slot0.container:addChild(slot0.my_score_info)
		end

		slot0.my_score_info:setString(uv0(TI18N("选拔赛分数:<div fontcolor=#249003>%s</div>"), slot3))
		slot0:updateOneBtnInfo()
	end
end

function SingleRankItem.updateOneBtnInfo(slot0)
	if not slot0.data then
		return
	end

	if slot0.rank_type == RankConstant.RankType.arena_peak_champion then
		if slot0.data.worship_status == 0 then
			setChildUnEnabled(false, slot0.good_btn)
			slot0.good_btn:setTouchEnabled(true)
		else
			setChildUnEnabled(true, slot0.good_btn)
			slot0.good_btn:setTouchEnabled(false)
		end
	end
end

function SingleRankItem.onClickOneBtn(slot0)
	if not slot0.data then
		return
	end

	if slot0.rank_type == RankConstant.RankType.arena_peak_champion then
		RoleController:getInstance():requestWorshipRole(slot0.data.rid, slot0.data.srv_id, slot0.data.rank, WorshipType.peakchampion)
	end
end

function SingleRankItem.DeleteMe(slot0)
	if slot0.rank_num ~= nil then
		slot0.rank_num:DeleteMe()

		slot0.rank_num = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
