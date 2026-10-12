MatchImgPanel = class("MatchImgPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ArenapeakchampionController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format

function MatchImgPanel.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function MatchImgPanel.config(slot0)
	slot0.play_effect_list = {}
end

function MatchImgPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenapeakchampion/match_img_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.cetre_panel = slot0.container:getChildByName("cetre_panel")
	slot0.cetre_node = slot0.cetre_panel:getChildByName("head_node")
	slot5 = 3

	slot0.cetre_node:setZOrder(slot5)

	slot0.fight_line_list = {}

	for slot5 = 1, 12 do
		slot0.fight_line_list[slot5] = slot0.container:getChildByName("fight_line_" .. slot5)
	end

	slot0.fight_line_list[13] = slot0.cetre_panel:getChildByName("fight_line_13")
	slot3 = slot0.cetre_panel
	slot5 = slot3
	slot0.fight_line_list[14] = slot3.getChildByName(slot5, "fight_line_14")
	slot0.match_head_item_list = {}

	for slot5 = 1, 14 do
		slot6 = slot0.container:getChildByName("head_node_" .. slot5)

		slot6:setZOrder(3)

		slot0.match_head_item_list[slot5] = MatchHeadItem.new()

		slot0.match_head_item_list[slot5]:addCallBack(function ()
			uv0:onPlayBtn(uv1)
		end)
		slot6:addChild(slot0.match_head_item_list[slot5])
	end

	slot0.match_head_item_list[15] = MatchHeadItem.new()

	slot0.match_head_item_list[15]:addCallBack(function ()
		uv0:onPlayBtn(15)
	end)
	slot0.cetre_node:addChild(slot0.match_head_item_list[15])
end

function MatchImgPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.look_btn, function ()
		uv0:onClickLookBtn()
	end, true, 1)
end

function MatchImgPanel.onPlayBtn(slot0, slot1)
	if not slot0.pos_list then
		return
	end

	if not slot0.zone_id then
		return
	end

	if not slot0.group then
		return
	end

	slot2 = 1

	if slot0.match_type == 64 then
		slot2 = 2
	elseif slot0.match_type == 8 then
		slot2 = 3
		slot0.group = 0
	end

	if slot0.pos_list[slot1] then
		uv0:sender27712(slot0.zone_id, slot2, slot0.group, slot3.pos)
	end
end

function MatchImgPanel.setExtendDdata(slot0, slot1, slot2)
	slot0.zone_id = slot1
	slot0.group = slot2 or 0
end

function MatchImgPanel.setData(slot0, slot1, slot2)
	if not uv0:getMainData() then
		return
	end

	if not slot2 then
		return
	end

	for slot7, slot8 in ipairs(slot0.fight_line_list) do
		slot8:setVisible(false)
	end

	for slot7, slot8 in pairs(slot0.play_effect_list) do
		slot8:setVisible(false)
	end

	slot0.match_type = slot2
	slot0.pos_list = slot1
	slot4 = 1

	doStopAllActions(slot0.container)

	for slot8, slot9 in ipairs(slot0.match_head_item_list) do
		if slot1 and slot1[slot8] then
			slot9:setData(slot1[slot8], slot2, slot8)

			if slot8 == 9 then
				slot0:setFightlineShow(1, slot1[1])
			elseif slot8 == 10 then
				slot0:setFightlineShow(3, slot1[3])
			elseif slot8 == 11 then
				slot0:setFightlineShow(5, slot1[5])
			elseif slot8 == 12 then
				slot0:setFightlineShow(7, slot1[7])
			elseif slot8 == 13 then
				slot0:setFightlineShow(9, slot1[9])
			elseif slot8 == 14 then
				slot0:setFightlineShow(11, slot1[10])
			elseif slot8 == 15 then
				slot0:setFightlineShow(13, slot1[13])
			end

			if slot1[slot8].ret == 0 and slot3.round_status ~= 1 then
				delayRun(slot0.container, slot4 * 0.05, function ()
					uv0:showEffectLine(uv1, true)
				end)

				slot4 = slot4 + 1
			end
		else
			slot9:setData(nil, slot2, slot8)
		end
	end
end

function MatchImgPanel.showEffectLine(slot0, slot1, slot2)
	if not slot0.play_effect_list then
		return
	end

	if slot2 == true then
		if slot0.play_effect_list[slot1] == nil then
			slot3 = slot0.container:getContentSize()
			slot4 = nil
			slot4 = (slot1 > 8 or PlayerAction.action_1) and (slot1 <= 8 or slot1 > 12 or PlayerAction.action_2) and PlayerAction.action_3
			slot5, slot6, slot7 = slot0:getPosAndScale(slot1)

			if not slot5 then
				return
			end

			slot0.play_effect_list[slot1] = createEffectSpine("E27402", cc.p(200, 200), cc.p(0.5, 0.5), true, slot4)

			slot0.play_effect_list[slot1]:setPosition(slot5)
			slot0.play_effect_list[slot1]:setScale(slot6, slot7)

			if slot1 >= 13 then
				slot0.cetre_panel:addChild(slot0.play_effect_list[slot1], 1)
			else
				slot0.container:addChild(slot0.play_effect_list[slot1], 1)
			end
		else
			slot0.play_effect_list[slot1]:setVisible(true)
		end
	elseif slot0.play_effect_list[slot1] then
		slot0.play_effect_list[slot1]:setVisible(false)
		slot0.play_effect_list[slot1]:removeFromParent()

		slot0.play_effect_list[slot1] = nil
	end
end

function MatchImgPanel.getPosAndScale(slot0, slot1)
	if slot1 == 1 then
		return cc.p(154, 692), -1, 1
	elseif slot1 == 2 then
		return cc.p(154, 543), -1, -1
	elseif slot1 == 3 then
		return cc.p(154, 265), -1, 1
	elseif slot1 == 4 then
		return cc.p(154, 116), -1, -1
	elseif slot1 == 5 then
		return cc.p(567, 692), 1, 1
	elseif slot1 == 6 then
		return cc.p(567, 543), 1, -1
	elseif slot1 == 7 then
		return cc.p(567, 265), 1, 1
	elseif slot1 == 8 then
		return cc.p(567, 116), 1, -1
	elseif slot1 == 9 then
		return cc.p(264, 617), -1, 1
	elseif slot1 == 10 then
		return cc.p(264, 190), -1, 1
	elseif slot1 == 11 then
		return cc.p(450, 617), 1, 1
	elseif slot1 == 12 then
		return cc.p(450, 190), 1, 1
	elseif slot1 == 13 then
		return cc.p(96, 240), 1, -1
	elseif slot1 == 14 then
		return cc.p(96, 0), 1, 1
	end
end

function MatchImgPanel.setFightlineShow(slot0, slot1, slot2)
	if not slot0.fight_line_list[slot1] and not slot0.fight_line_list[slot1 + 1] then
		return
	end

	if slot2.ret == 1 then
		slot0.fight_line_list[slot1]:setVisible(true)
	elseif slot2.ret == 2 then
		slot0.fight_line_list[slot1 + 1]:setVisible(true)
	end
end

function MatchImgPanel.setCetrePanelVisible(slot0, slot1)
	if slot0.cetre_panel then
		slot0.cetre_panel:setVisible(slot1 or false)
	end
end

function MatchImgPanel.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.match_head_item_list) do
		slot5:DeleteMe()
	end

	doStopAllActions(slot0.container)

	for slot4 = 1, 14 do
		slot0:showEffectLine(false, slot4)
	end

	slot0.match_head_item_list = {}
end

MatchHeadItem = class("MatchHeadItem", function ()
	return ccui.Widget:create()
end)

function MatchHeadItem.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:configUI()
	slot0:register_event()
end

function MatchHeadItem.configUI(slot0)
	slot1 = 130
	slot2 = 150
	slot0.size = cc.size(slot1, slot2)

	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenapeakchampion/match_head_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.bg = slot0.container:getChildByName("bg")
	slot0.head_img = slot0.container:getChildByName("head_img")

	slot0.head_img:setPosition(52, 87)

	slot0.name = slot0.container:getChildByName("name")
	slot0.svr_name = slot0.container:getChildByName("svr_name")
	slot0.index = slot0.container:getChildByName("index")

	slot0.index:setVisible(false)

	slot0.play_btn = slot0.container:getChildByName("play_btn")
	slot0.head = PlayerHead.new(PlayerHead.type.circle)

	slot0.head:setHeadLayerScale(0.8)
	slot0.head:setLev(99)
	slot0.head:addCallBack(function ()
		uv0:onClickHead()
	end)
	slot0.container:getChildByName("node"):addChild(slot0.head)
end

function MatchHeadItem.register_event(slot0)
	registerButtonEventListener(slot0.play_btn, function ()
		uv0:onPlayBtn()
	end, true, 2, nil, nil, 1)
end

function MatchHeadItem.onClickHead(slot0)
	if not slot0.data then
		return
	end

	slot2 = slot0.data.srv_id

	if RoleController:getInstance():getRoleVo() and slot0.data.rid == slot3.rid and slot2 == slot3.srv_id then
		message(TI18N("这是你自己~"))

		return
	end

	if slot2 == "" then
		message(TI18N("角色信息丢失在异域中"))

		return
	end

	FriendController:getInstance():openFriendCheckPanel(true, {
		srv_id = slot2,
		rid = slot1
	})
end

function MatchHeadItem.onPlayBtn(slot0)
	if not slot0.data then
		return
	end

	if slot0.callback then
		slot0:callback()
	end
end

function MatchHeadItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function MatchHeadItem.showEffect(slot0, slot1, slot2)
	if not slot0.container then
		return
	end

	if slot1 == true then
		if slot0.play_effect == nil then
			slot3 = slot0.container:getContentSize()
			slot0.play_effect = createEffectSpine("E27403", cc.p(slot3.width * 0.5, slot3.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action_1)

			slot0.container:addChild(slot0.play_effect, 1)
		end
	elseif slot0.play_effect then
		slot0.play_effect:setVisible(false)
		slot0.play_effect:removeFromParent()

		slot0.play_effect = nil
	end
end

function MatchHeadItem.getNumIndex(slot0, slot1, slot2)
	if slot2 >= 1 and slot2 <= 8 then
		return slot1
	elseif slot2 >= 9 and slot2 <= 12 then
		return slot1 / 2
	elseif slot2 == 13 or slot2 == 14 then
		return slot1 / 4
	else
		return slot1 / 8
	end
end

function MatchHeadItem.showHeadImg(slot0, slot1)
	slot0.head:setHeadLayerScale(0.9)

	slot2 = nil

	if slot1 == 64 or slot1 == 256 then
		slot2 = PathTool.getResFrame("arenapeakchampion", "arenapeakchampion_promotion_05", false, "arenapeak_guessing")
	elseif slot1 == 8 then
		slot2 = PathTool.getResFrame("arenapeakchampion", "arenapeakchampion_promotion_01", false, "arenapeak_guessing")
	end

	if slot2 then
		slot0.head_img:setVisible(true)
		loadSpriteTexture(slot0.head_img, slot2, LOADTEXT_TYPE_PLIST)
		slot0:showEffect(true)
	end
end

function MatchHeadItem.setData(slot0, slot1, slot2, slot3)
	slot4 = false

	slot0:setLev(false)

	if slot3 == 15 then
		slot4 = true

		slot0:showHeadImg(slot2)
	elseif slot2 == 256 and (slot3 == 13 or slot3 == 14) then
		slot4 = true

		slot0:showHeadImg(slot2)
	else
		slot0.head:setHeadLayerScale(0.8)
		slot0.head_img:setVisible(false)
		slot0:showEffect(false)
	end

	if slot1 == nil then
		slot0.data = nil

		slot0.head:clearHead()
		slot0.head:closeLev()
		slot0.head:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
		slot0.play_btn:setVisible(false)
		slot0.bg:setVisible(false)
		slot0.name:setVisible(false)
		slot0.svr_name:setVisible(false)
		slot0.index:setVisible(true)
		slot0.index:setString(slot0:getNumIndex(slot2, slot3))
		setChildUnEnabled(false, slot0.container)

		return
	end

	if not slot1 then
		return
	end

	slot0.index:setVisible(false)

	slot0.data = slot1

	if (slot0.data.new_pos or slot0.data.pos) > 8 then
		slot0.play_btn:setVisible(true)
	else
		slot0.play_btn:setVisible(false)
	end

	slot0:setHeadInfo(slot4)

	if slot0.data.ret == 1 then
		slot0:setNameInfoVisible(false)
		slot0:setPlayBtnPos(true)
		setChildUnEnabled(false, slot0.container)
	elseif slot0.data.ret == 2 then
		slot0:setNameInfoVisible(true)
		slot0:setNameinfo()
		slot0:setPlayBtnPos(false)
		setChildUnEnabled(true, slot0.container)
	else
		slot0:setNameInfoVisible(true)
		slot0:setNameinfo()
		slot0:setPlayBtnPos(false)
		setChildUnEnabled(false, slot0.container)
	end
end

function MatchHeadItem.setNameinfo(slot0)
	if not slot0.data then
		return
	end

	slot0.name:setString(slot0.data.name)

	if getServerName(slot0.data.srv_id) == "" then
		slot1 = TI18N("异域")
	end

	slot0.svr_name:setString(uv0("[%s]", slot1))
end

function MatchHeadItem.setLev(slot0, slot1, slot2, slot3)
	if slot1 then
		if not slot0.txtLev then
			if not slot0.levBg then
				slot0.levBg = createSprite(PathTool.getResFrame("common", "common_1030"), 10, 84, LOADTEXT_TYPE_PLIST)

				slot0.levBg:setCascadeOpacityEnabled(true)
			else
				slot0.levBg:setVisible(true)
			end

			slot0.levBg:setAnchorPoint(cc.p(0, 0))
			slot0:addChild(slot0.levBg, 1)
			slot0.levBg:setScale(0.9)

			slot0.txtLev = createLabel(18, Config.ColorData.data_color4[1], Config.ColorData.data_color4[152], slot0.levBg:getContentSize().width / 2 - 2, slot0.levBg:getContentSize().height / 2 + 1, "", slot0.levBg, 1, cc.p(0.5, 0.5))

			slot0.txtLev:setLocalZOrder(1)
		end

		if slot0.levBg then
			slot0.levBg:setVisible(true)
		end

		slot0.txtLev:setString(slot2)

		if slot3 ~= nil and slot0.levBg ~= nil then
			slot0.levBg:setPosition(slot3)
		end
	elseif slot0.levBg then
		slot0.levBg:setVisible(false)
	end
end

function MatchHeadItem.setHeadInfo(slot0, slot1)
	if not slot0.data then
		return
	end

	slot2, slot3 = nil

	if slot0.data.ext and next(slot0.data.ext) ~= nil then
		for slot7, slot8 in ipairs(slot0.data.ext) do
			if slot8.ext_type == 1 then
				slot3 = slot8.ext_val
				slot2 = slot8.ext_str_val
			end
		end
	end

	slot0.head:setHeadRes(slot0.data.face_id or 1001, false, LOADTEXT_TYPE, slot2, slot3)

	if slot1 then
		slot0.head:closeLev()
		slot0:setLev(true, slot0.data.lev or 1)
	else
		slot0.head:setLev(slot0.data.lev or 1)
	end

	slot5 = slot0.data.avatar_bid or 1000

	if slot0.record_res_bid == nil or slot0.record_res_bid ~= slot5 then
		slot0.record_res_bid = slot5

		if Config.AvatarData.data_avatar[slot5] then
			slot0.head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot6.res_id or 1), false, false), nil, false, slot6.offy)
		else
			slot0.head:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
		end
	end
end

function MatchHeadItem.setPlayBtnPos(slot0, slot1)
	if slot1 then
		slot0.play_btn:setPositionX(52)
	else
		slot0.play_btn:setPositionX(52 - slot0.name:getContentSize().width * 0.5 - 15)
	end
end

function MatchHeadItem.setNameInfoVisible(slot0, slot1)
	if slot1 then
		slot0.bg:setVisible(true)
		slot0.name:setVisible(true)
		slot0.svr_name:setVisible(true)
	else
		slot0.bg:setVisible(false)
		slot0.name:setVisible(false)
		slot0.svr_name:setVisible(false)
	end
end

function MatchHeadItem.setUnEnabled(slot0, slot1)
	if slot1 then
		setChildUnEnabled(true, slot0.container)
		slot0.name:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.svr_name:disableEffect(cc.LabelEffect.OUTLINE)
	else
		setChildUnEnabled(false, slot0.container)
		slot0.name:enableOutline(cc.c4b(0, 0, 0, 255), 2)
		slot0.svr_name:enableOutline(cc.c4b(0, 0, 0, 255), 2)
	end
end

function MatchHeadItem.DeleteMe(slot0)
	slot0:showEffect(false)

	if slot0.head then
		slot0.head:DeleteMe()

		slot0.head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
