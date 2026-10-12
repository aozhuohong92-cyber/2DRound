PlayerHead = PlayerHead or class("PlayerHead", function ()
	return ccui.Widget:create()
end)
PlayerHead.type = {
	other = 3,
	circle = 1,
	square = 2
}

function PlayerHead.ctor(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = nil
	slot0.is_plist = true

	if slot6 ~= nil then
		slot0.is_plist = slot6
	end

	if slot1 == PlayerHead.type.square then
		slot0.vSize = cc.size(104, 104)
		slot7 = PathTool.getNormalCell()
	elseif slot1 == PlayerHead.type.circle then
		slot0.vSize = cc.size(108, 108)
		slot7 = PathTool.getResFrame("common", "common_1031")
		slot0.mask_res = PathTool.getResFrame("common", "common_1032")
		slot0.is_plist = true
	elseif slot1 == PlayerHead.type.other then
		slot0.vSize = slot3 or cc.size(108, 108)
		slot7 = slot4
		slot0.mask_res = slot5 or PathTool.getResFrame("common", "common_1032")
	end

	if slot7 == nil or slot7 == "" then
		print("==============> PlayerHead:ctor Error")

		return
	end

	slot0.offest_y = slot2 or -2

	slot0:buildLayout(slot0.vSize, slot7)
end

function PlayerHead.buildLayout(slot0, slot1, slot2)
	slot0.head_panel = ccui.Widget:create()

	slot0.head_panel:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.head_panel:setContentSize(slot0.vSize)
	slot0.head_panel:setPosition(slot0.vSize.width / 2, slot0.vSize.height / 2)
	slot0.head_panel:setCascadeOpacityEnabled(true)
	slot0:addChild(slot0.head_panel)
	slot0:setContentSize(slot0.vSize)
	slot0:setCascadeOpacityEnabled(true)

	if slot0.mask_res ~= nil then
		slot0.mark_bg = createSprite(slot0.mask_res, slot0.vSize.width / 2, slot0.vSize.height / 2, slot0.head_panel, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)
		slot0.mask = createSprite(slot0.mask_res, slot0.vSize.width / 2, slot0.vSize.height / 2, nil, cc.p(0.5, 0.5))
		slot0.clipNode = cc.ClippingNode:create(slot0.mask)

		slot0.clipNode:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.clipNode:setContentSize(slot0.vSize)
		slot0.clipNode:setCascadeOpacityEnabled(true)
		slot0.clipNode:setPosition(slot0.vSize.width / 2, slot0.vSize.height / 2 + slot0.offest_y)
		slot0.clipNode:setAlphaThreshold(0)
		slot0.head_panel:addChild(slot0.clipNode, 2)

		slot0.icon = ccui.ImageView:create()

		slot0.icon:setCascadeOpacityEnabled(true)
		slot0.icon:setAnchorPoint(0.5, 0.5)
		slot0.icon:setPosition(slot0.vSize.width / 2, slot0.vSize.height / 2 + 2)
		slot0.clipNode:addChild(slot0.icon, 3)
	else
		slot0.icon = ccui.ImageView:create()

		slot0.icon:setCascadeOpacityEnabled(true)
		slot0.icon:setAnchorPoint(0.5, 0.5)
		slot0.icon:setPosition(slot0.vSize.width / 2, slot0.vSize.height / 2 + 2)
		slot0.head_panel:addChild(slot0.icon)
	end

	if slot2 and slot2 ~= "" then
		slot0:showBg(slot2, slot1)
	end
end

function PlayerHead.setHeadLayerScale(slot0, slot1)
	slot0.head_panel_scale = slot1 or 1

	if slot0.head_panel then
		slot0.head_panel:setScale(slot1)
	end
end

function PlayerHead.getHeadLayer(slot0)
	return slot0.head_panel
end

function PlayerHead.showBg(slot0, slot1, slot2, slot3, slot4)
	slot4 = slot4 or 0

	if not slot1 then
		if slot0.headbg then
			slot0.headbg:setVisible(false)
		end

		return
	end

	if type(slot1) == "number" then
		slot1 = PathTool.getHeadcircle(slot1)
	end

	if slot3 ~= nil then
		slot0.is_plist = slot3
	end

	if not slot0.bgRes or slot0.bgRes ~= slot1 then
		if not slot0.headbg then
			slot2 = slot2 or slot0.vSize
			slot5 = -1

			if slot0.mask ~= nil then
				slot5 = 3
			end

			slot0.headbg = createSprite(nil, slot0.vSize.width / 4, slot0.vSize.height / 2, slot0.head_panel, cc.p(0.5, 0.5), nil, slot5)

			if slot0.is_plist == false then
				if not slot0.item_load then
					slot0.item_load = createResourcesLoad(slot1, ResourcesType.single, function ()
						if not tolua.isnull(uv0.headbg) then
							loadSpriteTexture(uv0.headbg, uv1, LOADTEXT_TYPE)
						end
					end, slot0.item_load)
				end

				slot0:setHeadBgScale(0.8547008547008547)
			else
				loadSpriteTexture(slot0.headbg, slot1, LOADTEXT_TYPE_PLIST)
			end

			slot0.headbg:setCascadeOpacityEnabled(true)
		else
			slot0.headbg:setVisible(true)

			if slot0.is_plist == false then
				loadSpriteTexture(slot0.headbg, slot1, LOADTEXT_TYPE)
				slot0:setHeadBgScale(0.8547008547008547)
			else
				loadSpriteTexture(slot0.headbg, slot1, LOADTEXT_TYPE_PLIST)
				slot0:setHeadBgScale(1)
			end
		end
	end

	slot0:setHeadBgOffy(slot4)

	slot5 = string.find
	slot6, slot7 = slot5(slot1, "txt_cn_headcircle_")
	slot8 = slot5(slot1, ".png")

	if slot7 ~= nil and slot8 ~= nil then
		if Config.AvatarData.data_avatar_effect[tonumber(string.sub(slot1, slot7 + 1, slot8 - 1))] and slot10.effect_id ~= "" then
			slot0:showBgEffect(true, slot10)
		else
			slot0:showBgEffect(false)
		end
	else
		slot0:showBgEffect(false)
	end
end

function PlayerHead.showBgEffect(slot0, slot1, slot2)
	if not slot0.headbg then
		return
	end

	if slot1 == false then
		if slot0.bg_effect then
			slot0.bg_effect:clearTracks()
			slot0.bg_effect:removeFromParent()

			slot0.bg_effect = nil
		end
	else
		if slot2.is_only_effect == 1 then
			slot0.headbg:setVisible(false)
		else
			slot0.headbg:setVisible(true)
		end

		if slot0.bg_effect ~= nil and slot0.effect_id ~= slot2.effect_id then
			slot0:showBgEffect(false)
		end

		if slot0.bg_effect == nil then
			slot3 = 0
			slot4 = 0
			slot3 = slot2.effect_pos_x == 0 and 55 or slot2.effect_pos_x
			slot4 = slot2.effect_pos_y == 0 and 55 or slot2.effect_pos_y
			slot5 = -1

			if slot0.mask ~= nil then
				slot5 = 3
			end

			slot0.bg_effect = createEffectSpine(slot2.effect_id, cc.p(slot3, slot4), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.head_panel:addChild(slot0.bg_effect, slot5)
			slot0.bg_effect:setScale(slot0.headbg_scale or 1)

			slot0.effect_id = slot2.effect_id
		else
			slot0.bg_effect:setVisible(true)
		end
	end
end

function PlayerHead.setHeadBgOffy(slot0, slot1)
	slot0.headbg:setPosition(cc.p(slot0.vSize.width / 2, slot0.vSize.height / 2 + slot1))
end

function PlayerHead.setHeadBgScale(slot0, slot1)
	if slot0.headbg then
		slot0.headbg:setScale(slot1)

		slot0.headbg_scale = slot1
	end
end

function PlayerHead.setEffectBgScale(slot0, slot1)
	if slot0.bg_effect then
		slot0.bg_effect:setScale(slot1)
	end
end

function PlayerHead.hideHeadBg(slot0)
	slot0.headbg:setVisible(false)
end

function PlayerHead.setHeadIconStatus(slot0, slot1)
	if slot0.icon == nil then
		return
	end

	setChildUnEnabled(slot1, slot0.icon)
end

function PlayerHead.showClose(slot0)
	if not tolua.isnull(slot0.close_btn) then
		-- Nothing
	end
end

function PlayerHead.setGray(slot0, slot1)
	if slot0.headbg then
		setChildUnEnabled(slot1, slot0.icon)
	end
end

function PlayerHead.setSex(slot0, slot1, slot2)
	if slot1 == nil or type(slot1) ~= "number" then
		return
	end

	if slot1 >= 2 then
		return
	end

	if slot0.sex_icon == nil then
		slot0.sex_icon = createSprite(PathTool.getResFrame("common", "common_sex" .. slot1), 4, 4, LOADTEXT_TYPE_PLIST)

		slot0.sex_icon:setAnchorPoint(cc.p(0, 0))
		slot0:addChild(slot0.sex_icon, 1)
	else
		loadSpriteTexture(slot0.sex_icon, PathTool.getResFrame("common", "common_sex" .. slot1), LOADTEXT_TYPE_PLIST)
	end

	if slot2 ~= nil and slot0.sex_icon ~= nil then
		slot0.sex_icon:setPosition(slot2)
	end
end

function PlayerHead.setLev(slot0, slot1, slot2)
	if not slot0.txtLev then
		if not slot0.levBg then
			slot0.levBg = createSprite(PathTool.getResFrame("common", "common_1030"), 6, 66, LOADTEXT_TYPE_PLIST)

			slot0.levBg:setCascadeOpacityEnabled(true)
		else
			slot0.levBg:setVisible(true)
		end

		slot0.levBg:setAnchorPoint(cc.p(0, 0))
		slot0:addChild(slot0.levBg, 1)
		slot0.levBg:setScale(slot0.head_panel_scale or 1)

		slot0.txtLev = createLabel(18, Config.ColorData.data_color4[1], Config.ColorData.data_color4[152], slot0.levBg:getContentSize().width / 2 - 2, slot0.levBg:getContentSize().height / 2 + 1, "", slot0.levBg, 1, cc.p(0.5, 0.5))

		slot0.txtLev:setLocalZOrder(1)
	end

	if slot0.levBg then
		slot0.levBg:setVisible(true)
	end

	slot0.txtLev:setString(slot1)

	if slot2 ~= nil and slot0.levBg ~= nil then
		slot0.levBg:setPosition(slot2)
	end
end

function PlayerHead.showLevBg(slot0, slot1)
	if slot0.levBg then
		loadSpriteTexture(slot0.levBg, slot1, LOADTEXT_TYPE)
	end
end

function PlayerHead.setLevScale(slot0, slot1)
	if slot0.levBg then
		slot0.levBg:setScale(slot1)
	end
end

function PlayerHead.setLevPositon(slot0, slot1)
	if slot0.levBg then
		slot0.levBg:setPosition(slot1)
	else
		slot0.lev_pos = slot1
	end
end

function PlayerHead.closeLev(slot0)
	if slot0.levBg then
		slot0.levBg:setVisible(false)
	end

	if slot0.txtLev then
		slot0.txtLev:setString("")
	end
end

function PlayerHead.setName(slot0, slot1, slot2)
end

function PlayerHead.setNamePosition(slot0, slot1)
end

function PlayerHead.addDesc(slot0, slot1, slot2, slot3)
	if slot1 then
		if slot0.desc == nil then
			slot0.desc = createLabel(20, cc.c4b(251, 228, 199, 255), nil, slot0.vSize.width * 0.5, slot0.vSize.height * 0.5, slot2 or TI18N("待加入"), slot0.head_panel, nil, cc.p(0.5, 0.5))

			slot0.desc:setZOrder(1)
		else
			slot0.desc:setVisible(true)
			slot0.desc:setString(slot4)
		end
	elseif slot0.desc then
		slot0.desc:setVisible(false)
	end
end

function PlayerHead.showLeader(slot0, slot1, slot2, slot3)
	if slot1 then
		if slot0.leader_icon == nil then
			slot0.leader_icon = createSprite(PathTool.getResFrame("arenateam", "txt_cn_arenateam_18"), slot2 or 80, slot3 or 84, LOADTEXT_TYPE_PLIST)

			slot0.leader_icon:setAnchorPoint(cc.p(0.5, 0.5))
			slot0:addChild(slot0.leader_icon, 1)
		else
			slot0.leader_icon:setVisible(true)
		end
	elseif slot0.leader_icon then
		slot0.leader_icon:setVisible(false)
	end
end

function PlayerHead.showOnline(slot0, slot1, slot2)
	if slot1 then
		if slot0.online_bg == nil then
			slot3 = x or 74
			slot4 = y or 20
			slot0.online_bg = createSprite(PathTool.getResFrame("mainui", "mainui_round_bg"), slot3, slot4, LOADTEXT_TYPE_PLIST)

			slot0.online_bg:setScale(1.5)
			slot0.online_bg:setAnchorPoint(cc.p(0.5, 0.5))
			slot0:addChild(slot0.online_bg, 2)

			slot0.online_text = createLabel(18, cc.c4b(138, 255, 163, 255), nil, slot3, slot4, "", slot0, nil, cc.p(0.5, 0.5))

			slot0.online_text:setZOrder(3)
		else
			slot0.online_bg:setVisible(true)
			slot0.online_text:setVisible(true)
		end

		if slot0.online_text then
			if slot2 then
				slot0.online_text:setString(TI18N("在线"))
				slot0.online_text:setTextColor(cc.c4b(138, 255, 163, 255))
			else
				slot0.online_text:setString(TI18N("离线"))
				slot0.online_text:setTextColor(cc.c4b(241, 99, 92, 255))
			end
		end
	elseif slot0.online_bg then
		slot0.online_bg:setVisible(false)
		slot0.online_text:setVisible(false)
	end
end

function PlayerHead.setHeadRes(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot1 == nil or slot1 == "" then
		return
	end

	if slot4 and slot4 ~= "" and (slot6 or slot5 and slot5 ~= 0) then
		TencentCos:getInstance():downLoadHeadFile(slot4, slot5, function (slot0)
			if not tolua.isnull(uv0.icon) then
				uv0:setHeadRes(slot0, true)
			end
		end)
	else
		slot3 = slot3 or LOADTEXT_TYPE

		slot0:showReturnIcon(false)

		if (slot2 or false) == false then
			if slot1 > 10000000 then
				if ReturnActionController:getInstance():getModel():getLessTime() > 0 then
					slot0:showReturnIcon(true)
				end

				slot1 = slot1 / 10000
			end

			slot1 = PathTool.getHeadIcon(slot1)
		end

		if tolua.isnull(slot0.icon) then
			return
		end

		slot0.icon:loadTexture(slot1, slot3)
		slot0.icon:setVisible(true)

		slot7 = slot0.icon:getContentSize()
		slot8 = 1

		if slot0.mask ~= nil then
			slot9 = cc.size(90, 90)

			if slot0.mark_bg ~= nil then
				slot9 = slot0.mark_bg:getContentSize()
			end

			slot8 = slot9.width / slot7.width > slot9.height / slot7.height and slot9.height / slot7.height or slot9.width / slot7.width
		end

		slot0.icon:setScale(slot8)

		if slot0.bg_effect then
			-- Nothing
		end
	end
end

function PlayerHead.setHeadResScale(slot0, slot1)
	if slot0.icon then
		slot0.icon:setScale(slot1)
	end
end

function PlayerHead.clearHead(slot0)
	slot0.icon:setVisible(false)
end

function PlayerHead.resetTime(slot0)
	if slot0.clickTimer then
		GlobalTimeTicket:getInstance():remove(slot0.clickTimer)

		slot0.clickTimer = nil
	end
end

function PlayerHead.showHeadwear(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot1 > 0

	if Config.HeadSurface[slot1] == nil then
		return
	end

	if not slot6 then
		if slot0.wearHead then
			if not tolua.isnull(slot0.wearHead) then
				slot0.wearHead:removeFromParent()
			end

			slot0.wearHead = nil
		end

		slot0.wearRes = nil
	else
		slot7 = slot2 or 0
		slot8 = slot3 or 1
		slot11 = PathTool.getHeadWearRes(slot1)

		if not slot0.wearRes or slot0.wearRes ~= slot11 then
			slot0.wearRes = slot11

			if not slot0.wearHead then
				slot0.wearHead = createImage(slot0, slot11, slot4 or -4, slot5 or -2, cc.p(0, 0))

				slot0.wearHead:setScale9Enabled(true)
				slot0.wearHead:loadTexture(slot11)
			else
				slot0.wearHead:loadTexture(slot11)
			end

			slot0.wearHead:setCapInsets(cc.rect(30, 30, 4, 4))
			slot0.wearHead:setContentSize(cc.size(slot0.vSize.width + 8, slot0.vSize.height + 8))
			slot0.wearHead:setLocalZOrder(slot7)
			slot0.wearHead:setScale(slot8)
		end
	end
end

function PlayerHead.addCallBack(slot0, slot1, slot2)
	slot0:setTouchEnabled(true)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			if uv0 == true and uv1.head_data then
				if uv1.clickTimer then
					GlobalTimeTicket:getInstance():remove(uv1.clickTimer)

					uv1.clickTimer = nil
				end

				if not uv1.clickTimer then
					uv1.clickTimer = GlobalTimeTicket:getInstance():add(function ()
						if uv0.long_callback then
							uv0.long_callback(uv0.head_data)
						end

						uv0.is_open_tips = true

						if uv0.clickTimer then
							GlobalTimeTicket:getInstance():remove(uv0.clickTimer)

							uv0.clickTimer = nil
						end
					end, 1)
				end
			end
		elseif slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv1.clickTimer then
				GlobalTimeTicket:getInstance():remove(uv1.clickTimer)

				uv1.clickTimer = nil
			end

			if uv1.is_open_tips == true then
				uv1.is_open_tips = false

				return
			end

			if uv2 then
				uv2(uv1)
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.canceled and uv1.clickTimer then
			GlobalTimeTicket:getInstance():remove(uv1.clickTimer)

			uv1.clickTimer = nil
		end
	end)
end

function PlayerHead.longCliCallback(slot0, slot1)
	slot0.long_callback = slot1
end

function PlayerHead.setHeadData(slot0, slot1)
	slot0.head_data = slot1
end

function PlayerHead.getData(slot0)
	return slot0.head_data
end

function PlayerHead.showBattleResultIcon(slot0, slot1)
	slot2 = PathTool.getResFrame("common", "txt_cn_common_90013")

	if slot1 == 1 then
		slot2 = PathTool.getResFrame("common", "txt_cn_common_90012")
	end

	if not slot0.result_icon then
		slot0.result_icon = createSprite(slot2, 20, slot0.vSize.height * (slot0.head_panel_scale or 1), slot0, cc.p(0.5, 0.5), nil, 1)
	else
		loadSpriteTexture(slot0.result_icon, slot2, LOADTEXT_TYPE_PLIST)
	end
end

function PlayerHead.showReturnIcon(slot0, slot1)
	if slot1 == true then
		if not slot0.return_icon then
			slot0.return_icon = createSprite(PathTool.getResFrame("common", "txt_cn_common_90024"), slot0.vSize.width / 2, 5, slot0.head_panel, cc.p(1, 0), nil, 99)
		else
			loadSpriteTexture(slot0.return_icon, slot2, LOADTEXT_TYPE_PLIST)
		end

		slot0.return_icon:setVisible(true)
	elseif slot0.return_icon then
		slot0.return_icon:setVisible(false)
	end
end

function PlayerHead.DeleteMe(slot0)
	slot0:showBgEffect(false)

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.clickTimer then
		GlobalTimeTicket:getInstance():remove(slot0.clickTimer)

		slot0.clickTimer = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
