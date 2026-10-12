slot0 = ElitematchController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort
ElitematchFightRecordItem = class("ElitematchFightRecordItem", function ()
	return ccui.Widget:create()
end)

function ElitematchFightRecordItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ElitematchFightRecordItem.configUI(slot0)
	slot0.size = cc.size(628, 244)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("elitematch/elitematch_fight_record_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.result_win = slot2:getChildByName("result_win")
	slot0.result_loss = slot2:getChildByName("result_loss")
	slot0.result_win_x = slot0.result_win:getPositionX()
	slot0.result_loss_x = slot0.result_loss:getPositionX()
	slot0.play_btn = slot2:getChildByName("play_btn")
	slot0.centre_scroe = slot2:getChildByName("centre_scroe")
	slot0.centre_war_name = slot2:getChildByName("centre_war_name")
	slot0.centre_time = slot2:getChildByName("centre_time")

	function slot3(slot0)
		slot1 = {
			area_name = uv0:getChildByName(slot0 .. "area_name"),
			name = uv0:getChildByName(slot0 .. "name"),
			rank_key = uv0:getChildByName(slot0 .. "rank_key")
		}

		slot1.rank_key:setString("排行")

		slot1.rank_value = uv0:getChildByName(slot0 .. "rank_value")
		slot1.level_key = uv0:getChildByName(slot0 .. "level_key")

		slot1.level_key:setString("等级")

		slot1.level_value = uv0:getChildByName(slot0 .. "level_value")
		slot1.level_icon = uv0:getChildByName(slot0 .. "level_icon")
		slot1.level_icon_1 = uv0:getChildByName(slot0 .. "level_icon_1")
		slot1.head_node = uv0:getChildByName(slot0 .. "head_node")
		slot1.player_head = PlayerHead.new(PlayerHead.type.circle)

		slot1.head_node:addChild(slot1.player_head)

		return slot1
	end

	slot0.left_item = slot3("left_")
	slot0.right_item = slot3("right_")
end

function ElitematchFightRecordItem.register_event(slot0)
	registerButtonEventListener(slot0.play_btn, handler(slot0, slot0.onClickPlayBtn), true, 2)
	slot0.left_item.player_head:addCallBack(function ()
		if not uv0.data then
			return
		end

		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = uv0.data.srv_id,
			rid = uv0.data.rid
		})
	end)
	slot0.right_item.player_head:addCallBack(function ()
		if not uv0.data then
			return
		end

		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = uv0.data.def_srv_id,
			rid = uv0.data.def_rid
		})
	end)
end

function ElitematchFightRecordItem.onClickPlayBtn(slot0)
	if not slot0.data then
		return
	end

	if not slot0.index then
		return
	end

	uv0:openElitematchFightVedioPanel(true, slot0.data, slot0.index)
end

function ElitematchFightRecordItem.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.index = slot2

	if slot1.combat_type == BattleConst.Fight_Type.EliteMatchWar then
		slot0.centre_war_name:setString(TI18N("常规赛"))
		slot0.centre_war_name:setTextColor(cc.c4b(58, 120, 196, 255))
		slot0.centre_scroe:setString("")
	else
		slot0.centre_war_name:setString(TI18N("王者赛"))
		slot0.centre_war_name:setTextColor(cc.c4b(217, 80, 20, 255))
		slot0.centre_scroe:setString(uv0("%s:%s", slot1.win_count, slot1.lose_count))
	end

	slot0.centre_time:setString(TimeTool.getYMDHM(slot1.time))

	if slot1.ret == 1 then
		slot0.result_win:setPositionX(slot0.result_win_x)
		slot0.result_loss:setPositionX(slot0.result_loss_x)
	else
		slot0.result_loss:setPositionX(slot0.result_win_x)
		slot0.result_win:setPositionX(slot0.result_loss_x)
	end

	slot0:initItemInfo(slot0.left_item, slot1.srv_id, slot1.atk_name, slot1.atk_rank, slot1.atk_lev, slot1.atk_elite_lev, slot1.atk_face, slot1.atk_face_file, slot1.atk_face_update_time)
	slot0:initItemInfo(slot0.right_item, slot1.def_srv_id, slot1.def_name, slot1.def_rank, slot1.def_lev, slot1.def_elite_lev, slot1.def_face, slot1.def_face_file, slot1.def_face_update_time)
end

function ElitematchFightRecordItem.initItemInfo(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot1.area_name:setString(uv0("[%s]", getServerName(slot2)))
	slot1.name:setString(slot3)

	if slot4 == 0 then
		slot1.rank_value:setString(TI18N("暂无"))
	else
		slot1.rank_value:setString(slot4)
	end

	slot1.level_value:setString(slot5)

	if Config.ArenaEliteData.data_elite_level[slot6] then
		if slot11.little_ico == nil or slot12 == "" then
			slot12 = "icon_iron"
		end

		slot1.item_load = loadSpriteTextureFromCDN(slot1.level_icon, PathTool.getPlistImgForDownLoad("elitematch/elitematch_icon", slot12, false), ResourcesType.single, slot1.item_load)

		if slot11.little_name_ico == nil or slot12 == "" then
			slot12 = "num_1_1"
		end

		slot1.item_load_1 = loadSpriteTextureFromCDN(slot1.level_icon_1, PathTool.getPlistImgForDownLoad("elitematch/elitematch_icon", slot12, false), ResourcesType.single, slot1.item_load_1)
	end

	slot1.player_head:setHeadRes(slot7, false, LOADTEXT_TYPE, slot8, slot9)
end

function ElitematchFightRecordItem.DeleteMe(slot0)
	if slot0.left_item.item_load then
		slot0.left_item.item_load:DeleteMe()

		slot0.left_item.item_load = nil
	end

	if slot0.right_item.item_load then
		slot0.right_item.item_load:DeleteMe()

		slot0.right_item.item_load = nil
	end

	if slot0.left_item.item_load_1 then
		slot0.left_item.item_load_1:DeleteMe()

		slot0.left_item.item_load_1 = nil
	end

	if slot0.right_item.item_load_1 then
		slot0.right_item.item_load_1:DeleteMe()

		slot0.right_item.item_load_1 = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
