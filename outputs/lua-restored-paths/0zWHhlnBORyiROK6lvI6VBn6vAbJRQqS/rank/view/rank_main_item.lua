RankMainItem = class("RankMainItem", function ()
	return ccui.Widget:create()
end)

function RankMainItem.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function RankMainItem.config(slot0)
	slot0.size = cc.size(602, 162)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)
end

function RankMainItem.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("rank/rank_main_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.label_panel = slot0.main_panel:getChildByName("label_panel")
	slot0.bg = slot0.main_panel:getChildByName("bg")
	slot0.first_icon = slot0.root_wnd:getChildByName("first_icon")
	slot0.name = slot0.main_panel:getChildByName("name")
	slot0.rank_label = createRichLabel(26, cc.c4b(255, 244, 218, 255), cc.p(0, 0), cc.p(151, 35), 0, 0, 400)

	slot0.main_panel:addChild(slot0.rank_label)
end

function RankMainItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:showActionIcon(false)

	slot0.data = slot1.rank_vo or {}
	slot0.rank_type = slot1.rank_type or 1

	if slot0.item_res_id ~= PathTool.getPlistImgForDownLoad("bigbg/rank", "txt_cn_rank_" .. slot0.rank_type) then
		slot0.item_res_id = slot2
		slot0.item_load = loadSpriteTextureFromCDN(slot0.bg, slot2, ResourcesType.single, slot0.item_load)
	end

	if slot0.data.val1 ~= 0 then
		slot0.first_icon:setVisible(true)

		if slot0.data.name == "" then
			TI18N("暂无排名")
		elseif slot0.is_cluster == true then
			slot3 = transformNameByServ(slot0.data.name, slot0.data.srv_id)
		end

		slot0.name:setString(slot3)

		if not slot0.data or next(slot0.data) == nil then
			return
		end

		if slot0.rank_type ~= RankConstant.RankType.union then
			if not slot0.player_head then
				slot0.player_head = PlayerHead.new(PlayerHead.type.circle)

				slot0.player_head:setPosition(79, 90)
				slot0.main_panel:addChild(slot0.player_head)
			end

			slot0.player_head:setHeadRes(slot0.data.face_id, false, LOADTEXT_TYPE, slot0.data.face_file, slot0.data.face_update_time)

			if Config.AvatarData.data_avatar[slot0.data.avatar_bid] then
				slot0.player_head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot5.res_id or 1), false, false), nil, false, slot5.offy)
			end

			if slot0.union_icon then
				slot0.union_icon:setVisible(false)
			end

			slot0.player_head:setVisible(true)
		else
			if not slot0.union_icon then
				slot0.union_icon = createImage(slot0.main_panel, nil, 79, 90, cc.p(0.5, 0.5), true)

				if not slot0.qizi_load then
					slot0.qizi_load = loadImageTextureFromCDN(slot0.union_icon, PathTool.getPlistImgForDownLoad("bigbg/rank", "rank_3"), ResourcesType.single, slot0.qizi_load)
				end
			end

			slot0.union_icon:setVisible(true)

			if slot0.player_head then
				slot0.player_head:setVisible(false)
			end
		end

		slot4 = ""

		if slot0.rank_type == RankConstant.RankType.arena then
			slot4 = string.format("<img src='%s' scale=0.3 /><div outline=2,#1f1309>%s</div>", PathTool.getItemRes("8"), slot0.data.val1 or 0)
		elseif slot0.rank_type == RankConstant.RankType.drama then
			if Config.DungeonData.data_drama_dungeon_info(slot0.data.val1 or 0) then
				slot4 = string.format(TI18N("<div outline=2,#1f1309>%s</div>"), slot6.name)
			end
		elseif slot0.rank_type == RankConstant.RankType.power or slot0.rank_type == RankConstant.RankType.ladder or slot0.rank_type == RankConstant.RankType.action_partner or slot0.rank_type == RankConstant.RankType.colors_tone then
			slot4 = string.format("<img src='%s' scale=0.9 /><div outline=2,#1f1309>%s</div>", PathTool.getResFrame("common", "common_90001"), slot0.data.val1 or 0)

			if slot0.rank_type == RankConstant.RankType.action_partner then
				slot0:showActionIcon(true)
			end
		elseif slot0.rank_type == RankConstant.RankType.tower then
			slot4 = string.format(TI18N("<div outline=2,#1f1309>通关层数：%s</div>"), slot0.data.val1 or 0)
		elseif slot0.rank_type == RankConstant.RankType.union then
			slot3 = (slot0.is_cluster ~= true or transformNameByServ(slot0.data.guild_name, slot0.data.srv_id)) and (slot0.data.guild_name or "")
			slot4 = string.format(TI18N("<div outline=2,#1f1309>总战力：%s</div>"), slot0.data.val1 or 0)
		elseif slot0.rank_type == RankConstant.RankType.star_power then
			slot4 = string.format(TI18N("<div outline=2,#1f1309>评分：%s</div>"), slot0.data.val1 or 0)
		elseif slot0.rank_type == RankConstant.RankType.action_star then
			slot4 = string.format(TI18N("<div outline=2,#1f1309>评分：%s</div>"), slot0.data.val1 or 0)

			slot0:showActionIcon(true)
		elseif slot0.rank_type == RankConstant.RankType.action_adventure then
			slot4 = string.format(TI18N("<div outline=2,#1f1309>神界探索度：%s</div>"), slot0.data.val1 or 0)

			slot0:showActionIcon(true)
		elseif slot0.rank_type == RankConstant.RankType.hallows_power then
			slot4 = string.format(TI18N("<div outline=2,#1f1309>圣器战力：%s</div>"), slot0.data.val1 or 0)
		end

		slot0.name:setString(slot3)
		slot0.rank_label:setString(slot4)
	else
		slot0.name:setString(TI18N("虚位以待"))
		slot0.rank_label:setString("")
		slot0.first_icon:setVisible(false)

		if slot0.union_icon then
			slot0.union_icon:setVisible(false)
		end

		if slot0.player_head then
			slot0.player_head:setVisible(false)
		end
	end
end

function RankMainItem.setExtendData(slot0, slot1)
	slot0.is_cluster = slot1
end

function RankMainItem.showActionIcon(slot0, slot1)
	if slot1 == false and not slot0.action_icon then
		return
	end

	if not slot0.action_icon then
		slot0.action_icon = createImage(slot0.main_panel, PathTool.getResFrame("common", "common_90015"), 33, 133, cc.p(0.5, 0.5), true, 10, true)
		slot0.action_label = createLabel(20, Config.ColorData.data_color4[1], Config.ColorData.data_color4[9], 29, 25, "", slot0.action_icon, 2, cc.p(0.5, 0))

		slot0.action_label:setRotation(-45)
	end

	slot0.action_label:setString(TI18N("活动"))
	slot0.action_icon:setVisible(slot1)
end

function RankMainItem.registerEvents(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if not uv0.data or next(uv0.data) == nil then
					message(TI18N("暂无排名数据"))

					return
				end

				if uv0.call_fun then
					uv0:call_fun(uv0.data)
				end
			end
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		end
	end)
end

function RankMainItem.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.data)
	end
end

function RankMainItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function RankMainItem.setSelectStatus(slot0, slot1)
	slot0.select_bg:setVisible(slot1)
end

function RankMainItem.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function RankMainItem.getRankIndex(slot0)
	return slot0.rank_type or 1
end

function RankMainItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	if slot0.qizi_load then
		slot0.qizi_load:DeleteMe()
	end

	if slot0.player_head then
		slot0.player_head:DeleteMe()
	end

	slot0.player_head = nil
	slot0.item_load = nil
end
