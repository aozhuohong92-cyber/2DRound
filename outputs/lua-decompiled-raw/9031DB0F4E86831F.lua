RankItem = class("RankItem", function ()
	return ccui.Widget:create()
end)
slot0 = Config.ArenaEliteData.data_elite_level

function RankItem.ctor(slot0, slot1)
	slot0.width = 630
	slot0.height = 120
	slot0.index = slot1 or 1
	slot0.ctrl = RankController:getInstance()

	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(slot0.width, slot0.height))
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(true)

	slot0.rank_type = RankConstant.RankType.drama
	slot0.rank_num = 0

	slot0:configUI()
end

function RankItem.clickHandler(slot0, ...)
	if slot0.call_fun then
		slot0:call_fun(slot0.vo)
	end
end

function RankItem.setTouchFunc(slot0, slot1)
	slot0.call_fun = slot1
end

function RankItem.configUI(slot0, ...)
	slot0.back = ccui.Widget:create()

	slot0.back:setCascadeOpacityEnabled(true)
	slot0.back:setContentSize(cc.size(slot0.width, slot0.height))
	slot0.back:setAnchorPoint(cc.p(0, 0))
	slot0:addChild(slot0.back)

	slot0.background = createImage(slot0.back, PathTool.getResFrame("common", "common_1029"), slot0.width / 2, slot0.height / 2, cc.p(0.5, 0.5), true, 0, true)

	slot0.background:setContentSize(cc.size(slot0.width, slot0.height))
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.rank_type ~= RankConstant.RankType.union then
					uv0:openChatMessage()
				end
			end
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		end
	end)

	slot0.select = ccui.ImageView:create(PathTool.getSelectBg(), LOADTEXT_TYPE_PLIST)

	slot0.select:setScale9Enabled(true)
	slot0.select:setContentSize(cc.size(slot0.width + 10, slot0.height + 10))
	slot0.select:setAnchorPoint(cc.p(0, 0))
	slot0.select:setCapInsets(cc.rect(20, 20, 2, 2))
	slot0.select:setPosition(cc.p(-5, -5))
	slot0.select:setVisible(false)
	slot0:addChild(slot0.select)

	slot0.rank_icon = createImage(slot0, nil, 50, slot0.height / 2, cc.p(0.5, 0.5), true, 1, false)
	slot0.rank_index = createLabel(30, Config.ColorData.data_color4[186], nil, 50, slot0.height / 2, "", slot0, 0, cc.p(0.5, 0.5), "fonts/title.ttf")
	slot0.other_panel = ccui.Widget:create()

	slot0.other_panel:setContentSize(cc.size(slot0.width, slot0.height))
	slot0.other_panel:setAnchorPoint(cc.p(0, 0))
	slot0:addChild(slot0.other_panel)
end

function RankItem.setData(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	slot0.data = slot1
	slot0.index = slot1._index or slot2 or 1

	slot0.rank_index:setString(slot0.index)

	if slot0.index >= 1 and slot0.index <= 3 then
		slot0.rank_index:setVisible(false)
		slot0.rank_icon:setVisible(true)
		slot0.rank_icon:loadTexture(PathTool.getResFrame("common", "common_200" .. slot0.index), LOADTEXT_TYPE_PLIST)
		slot0.rank_icon:setScale(0.7)
	else
		slot0.rank_index:setVisible(true)
		slot0.rank_icon:setVisible(false)
	end

	slot0:updateDataByRankType()
end

function RankItem.setExtendData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.rank_type = slot1.rank_type or RankConstant.RankType.drama
	slot0.is_cluster = slot1.is_cluster or false
end

function RankItem.updateDataByRankType(slot0)
	if not slot0.data then
		return
	end

	slot0.other_panel:removeAllChildren()

	slot1 = slot0.data.name

	if slot0.is_cluster == true then
		slot1 = transformNameByServ(slot0.data.name, slot0.data.srv_id or slot0.data.leader_srvid)
	end

	if slot0.rank_type ~= RankConstant.RankType.union then
		slot0.play_head = slot0:createPlayerHead(105, 60)
		slot2 = slot0.data.face_id or slot0.data.face

		if Config.AvatarData.data_avatar[slot0.data.avatar_bid] then
			slot0.play_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot4.res_id or 1), false, false), nil, false, slot4.offy)
		end

		slot0.play_head:setHeadRes(slot2, false, LOADTEXT_TYPE, slot0.data.face_file, slot0.data.face_update_time)
		slot0.play_head:setLev(slot0.data.lev)
	end

	if slot0.rank_type == RankConstant.RankType.power or slot0.rank_type == RankConstant.RankType.action_power then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)
		slot0.other_panel:addChild(createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0.5, 0.5), cc.p(480, slot0.height / 2), 0, 0, 500))
		slot3:setString(string.format("<img src='%s' /> %s", PathTool.getResFrame("common", "common_90002"), slot0.data.val1 or 0))
	elseif slot0.rank_type == RankConstant.RankType.union_boss then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)
		slot0.other_panel:addChild(createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0.5, 0.5), cc.p(505, slot0.height / 2 + 30), 0, 0, 500))
		slot3:setString(slot0.data.all_dps or 0)
		slot0:addPraise(slot0.data)
	elseif slot0.rank_type == RankConstant.RankType.drama or slot0.rank_type == RankConstant.RankType.action_drama then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)

		if Config.DungeonData.data_drama_dungeon_info(slot0.data.val1) then
			str = slot4.name

			createLabel(24, Config.ColorData.data_color4[175], nil, 495, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0.5, 0.5)):setString(str)
		end
	elseif slot0.rank_type == RankConstant.RankType.union then
		slot2 = math.min(math.max(slot0.data.step or 0, 1), 11)

		createLabel(24, Config.ColorData.data_color4[175], nil, 204, 80, "", slot0.other_panel, 0, cc.p(0.5, 0.5)):setString(slot1)
		createLabel(20, Config.ColorData.data_color4[186], nil, 204, 50, "", slot0.other_panel, 0, cc.p(0.5, 0.5)):setString(TI18N("会长：") .. (slot0.data.leader_name or ""))
		createLabel(24, Config.ColorData.data_color4[175], nil, 342, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0.5, 0.5)):setString(slot0.data.lev or 313)
		createLabel(24, Config.ColorData.data_color4[175], nil, 425, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0.5, 0.5)):setString((slot0.data.members_num or 0) .. "/" .. (slot0.data.members_max or 0))

		slot9 = createRichLabel(24, Config.ColorData.data_color4[186], cc.p(0.5, 0.5), cc.p(525, slot0.height / 2), 0, 0, 500)

		slot0.other_panel:addChild(slot9)

		slot10 = PathTool.getResFrame("common", "common_90002")

		slot9:setString(slot0.data.power or 0)
	elseif slot0.rank_type == RankConstant.RankType.tower or slot0.rank_type == RankConstant.RankType.action_tower then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)
		createLabel(24, Config.ColorData.data_color4[186], nil, 398, 61, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot0.data.val1 or 0)
		createLabel(24, Config.ColorData.data_color4[175], nil, 500, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(TimeTool.GetTimeMS(slot0.data.val2 or 0, true))
	elseif slot0.rank_type == RankConstant.RankType.arena or slot0.rank_type == RankConstant.RankType.action_arena then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)
		slot0.other_panel:addChild(createRichLabel(24, Config.ColorData.data_color4[186], cc.p(0.5, 0.5), cc.p(495, slot0.height / 2), 0, 0, 500))
		slot3:setString(string.format("<img src='%s' scale=0.35 /> %s", PathTool.getItemRes("8"), slot0.data.score or slot0.data.val1 or 0))
	elseif slot0.rank_type == RankConstant.RankType.action_adventure then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)
		createLabel(24, Config.ColorData.data_color4[186], nil, 460, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot0.data.val1 or 0)
	elseif slot0.rank_type == RankConstant.RankType.action_partner then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)

		slot0.hero_item = HeroExhibitionItem.new(0.8, true)

		slot0.hero_item:setPosition(cc.p(403, 60))
		slot0.other_panel:addChild(slot0.hero_item)
		slot0.hero_item:addCallBack(function (slot0)
			if slot0:getData() and next(slot1) ~= nil then
				LookController:sender11061(uv0.data.rid or uv0.data.r_rid, uv0.data.srv_id or uv0.data.r_srvid, slot1.partner_id)
			end
		end)
		slot0.hero_item:setData(slot0:createPartnerVo())
		createLabel(24, Config.ColorData.data_color4[186], nil, 485, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot0.data.power or 0)
	elseif slot0.rank_type == RankConstant.RankType.action_star or slot0.rank_type == RankConstant.RankType.star_power or slot0.rank_type == RankConstant.RankType.hallows_power or slot0.rank_type == RankConstant.RankType.treasure or slot0.rank_type == RankConstant.RankType.colors_tone or slot0.rank_type == RankConstant.RankType.gemstone or slot0.rank_type == RankConstant.RankType.pointglod or slot0.rank_type == RankConstant.RankType.speed_fight or slot0.rank_type == RankConstant.RankType.voyage or slot0.rank_type == RankConstant.RankType.hero_expedit then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)
		createLabel(24, Config.ColorData.data_color4[186], nil, 455, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot0.data.val1 or 0)
	elseif slot0.rank_type == RankConstant.RankType.guild_war then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)
		createLabel(24, Config.ColorData.data_color4[175], nil, 402, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot0.data.star or 0)
		createLabel(24, Config.ColorData.data_color4[186], nil, 525, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot0.data.war_score or 0)
	elseif slot0.rank_type == RankConstant.RankType.endless or slot0.rank_type == RankConstant.RankType.endless_old or slot0.rank_type == RankConstant.RankType.adventure or slot0.rank_type == RankConstant.RankType.adventure_muster then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)
		createLabel(24, Config.ColorData.data_color4[186], nil, 403, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0.5, 0.5)):setString(slot0.data.val1 or 0)
		createLabel(24, Config.ColorData.data_color4[186], nil, 535, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0.5, 0.5)):setString(slot0.data.val2 or 0)
	elseif slot0.rank_type == RankConstant.RankType.holy_device or slot0.rank_type == RankConstant.RankType.star_master or slot0.rank_type == RankConstant.RankType.summon or slot0.rank_type == RankConstant.RankType.strong_battle or slot0.rank_type == RankConstant.RankType.consumption or slot0.rank_type == RankConstant.RankType.summon_prophet then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)
		createLabel(24, Config.ColorData.data_color4[186], nil, 480, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0.5, 0.5)):setString(slot0.data.val1 or 0)
	elseif slot0.rank_type == RankConstant.RankType.holy_device_1 then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)
		createLabel(24, Config.ColorData.data_color4[186], nil, 480, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0.5, 0.5)):setString(slot0.data.val1 or 0)
	elseif slot0.rank_type == RankConstant.RankType.elite then
		createLabel(24, Config.ColorData.data_color4[175], nil, 198, slot0.height / 2 + 20, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(string.format("[%s]%s", getServerName(slot0.data.srv_id), slot0.data.name))

		slot5 = createImage(slot0.other_panel, PathTool.getResFrame("common", "common_90003"), 198, 46, cc.p(0, 0.5), true, 0, true)

		slot5:setCapInsets(cc.rect(20, 15, 1, 1))
		slot5:setContentSize(cc.size(159, 31))
		createSprite(PathTool.getResFrame("common", "common_90001"), 29, 16, slot5, cc.p(0.5, 0.5))
		createLabel(22, cc.c4b(255, 238, 172, 255), nil, 48, 16, "", slot5, 0, cc.p(0, 0.5)):setString(slot0.data.power)

		if not slot0.elite_load then
			slot0.elite_load = loadSpriteTextureFromCDN(createSprite("", 439, slot0.height / 2, slot0.other_panel, cc.p(0.5, 0.5), LOADTEXT_TYPE), PathTool.getPlistImgForDownLoad("elitematch/elitematch_icon", uv0[slot0.data.elite_lev or 1].little_ico, false), ResourcesType.single, slot0.elite_load)
		end

		if slot0.elite_load then
			loadSpriteTexture(slot7, slot9, LOADTEXT_TYPE)
		end

		createLabel(24, Config.ColorData.data_color4[175], nil, 509, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot0.data.score)
	elseif slot0.rank_type == RankConstant.RankType.ladder then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2 + 18, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)

		if slot0.data.guild_name == nil or slot3 == "" then
			createLabel(24, Config.ColorData.data_color4[175], nil, 480, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0.5, 0.5)):setString(TI18N("暂未加入公会"))
		else
			slot4:setString(slot3)
		end

		slot0.other_panel:addChild(createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0, 0.5), cc.p(190, slot0.height / 2 - 18), 0, 0, 500))
		slot5:setString(string.format("<img src='%s' /> %s", PathTool.getResFrame("common", "common_90002"), slot0.data.val1 or 0))
	elseif slot0.rank_type == RankConstant.RankType.heaven then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)
		createLabel(24, Config.ColorData.data_color4[186], nil, 465, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0.5, 0.5)):setString(slot0.data.val1 or 0)
	elseif slot0.rank_type == RankConstant.RankType.fans then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)
		createLabel(24, Config.ColorData.data_color4[175], nil, 428, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot0.data.fans_num or 0)
	elseif slot0.rank_type == RankConstant.RankType.planes_rank or slot0.rank_type == RankConstant.RankType.sweet then
		createLabel(24, Config.ColorData.data_color4[175], nil, 190, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot1)
		createLabel(24, Config.ColorData.data_color4[175], nil, 428, slot0.height / 2, "", slot0.other_panel, 0, cc.p(0, 0.5)):setString(slot0.data.val1 or 0)
	end
end

function RankItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function RankItem.addPraise(slot0, slot1)
	slot0._btnPraise = createButton(slot0.other_panel, nil, 504, 43, cc.size(137, 49), PathTool.getResFrame("common", "common_1027"), 24, Config.ColorData.data_color4[1])
	slot0._praise = createSprite(PathTool.getResFrame("common", "common_1045"), 31, 28, slot0._btnPraise, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

	slot0._praise:setAnchorPoint(cc.p(0.5, 0.5))
	slot0._btnPraise:addChild(slot0._praise, 1)

	if slot0.index <= 3 then
		slot0._btnPraise:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.call_back ~= nil then
					uv0:call_back()
				end

				RoleController:getInstance():requestWorshipRole(uv1.r_rid, uv1.r_srvid, uv0.index, 2)
			end
		end)
	else
		slot0._btnPraise:setBright(false)
		setChildUnEnabled(true, slot0._praise)
	end

	slot0._labelPraise = createLabel(24, Config.ColorData.data_color4[1], nil, 85, 26, "", slot0._btnPraise, 0, cc.p(0.5, 0.5))

	slot0._labelPraise:setString(slot1.worship or 0)
	slot0._btnPraise:addChild(slot0._labelPraise)
	slot0._labelPraise:enableOutline(Config.ColorData.data_color4[264], 2)

	if slot1.worship_status == 1 then
		slot0._btnPraise:setBright(false)
		setChildUnEnabled(true, slot0._praise)
	end
end

function RankItem.updateWorshipStatus(slot0)
	if slot0.data ~= nil then
		slot0.data.worship = slot0.data.worship + 1
		slot0.data.worship_status = TRUE

		slot0._labelPraise:setString(slot0.data.worship)
		slot0._btnPraise:setBright(false)
		setChildUnEnabled(true, slot0._praise)
	end
end

function RankItem.openChatMessage(slot0)
	if not slot0.data then
		return
	end

	slot0.ctrl:openChatMessage(slot0.data.rid or slot0.data.r_rid, slot0.data.srv_id or slot0.data.r_srvid, slot0.data.is_robot)
end

function RankItem.createPartnerVo(slot0)
	slot1 = HeroVo.New()

	slot1:updateHeroVo({
		partner_id = slot0.data.pid,
		bid = slot0.data.pbid,
		lev = slot0.data.plev,
		star = slot0.data.pstar
	})

	return slot1
end

function RankItem.createPlayerHead(slot0, slot1, slot2)
	slot3 = PlayerHead.new(PlayerHead.type.circle)

	slot0.other_panel:addChild(slot3)
	slot3:setPosition(cc.p(slot1, slot2))
	slot3:setAnchorPoint(cc.p(0, 0.5))
	slot3:setTouchEnabled(false)
	slot3:setScale(0.8)

	return slot3
end

function RankItem.setSelected(slot0, slot1)
	slot0.select:setVisible(slot1)

	if slot1 == true then
		slot3 = cc.Blink:create(2, 1)

		slot0.select:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeIn:create(0.7), cc.FadeOut:create(0.7))))
	else
		slot0.select:stopAllActions()
	end
end

function RankItem.reset(slot0)
	if slot0.num then
		slot0.num:setVisible(false)
	end

	slot0.vo = nil
end

function RankItem.isHaveData(slot0)
	if slot0.vo then
		return true
	end

	return false
end

function RankItem.getData(slot0)
	return slot0.vo
end

function RankItem.DeleteMe(slot0)
	if slot0.play_head then
		slot0.play_head:DeleteMe()

		slot0.play_head = nil
	end

	if slot0.hero_item then
		slot0.hero_item:DeleteMe()
	end

	slot0.hero_item = nil

	if slot0.elite_load then
		slot0.elite_load:DeleteMe()
	end

	slot0.elite_load = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()

	slot0.vo = nil
end
