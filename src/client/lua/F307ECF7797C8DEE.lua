slot1 = PartnerComboCtrl:getInstance():getModel()
slot2 = string.format
slot3 = 5
PartnerComboCard = class("PartnerComboCard", function ()
	return ccui.Layout:create()
end)

function PartnerComboCard.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()
end

function PartnerComboCard.configUI(slot0)
	slot0.size = cc.size(295, 176)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("partnercombo/ui_partner_combo_card"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0.container:setSwallowTouches(false)

	slot0.quality_bg = slot0.container:getChildByName("quality_bg")
	slot0.card_img = slot0.container:getChildByName("card_img")
	slot0.title_lb = slot0.container:getChildByName("title_lb")
	slot0.level_lb = slot0.container:getChildByName("level_lb")
	slot0.redpoint = slot0.root_wnd:getChildByName("redpoint")
	slot0.mask = slot0.container:getChildByName("mask")
end

function PartnerComboCard.registerEvent(slot0)
	slot0.container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					if uv0.data.quality < uv1 then
						uv0:callback()
					elseif RoleController:getInstance():getRoleVo().lev >= 100 then
						uv0:callback()
					else
						message(string.format("玩家%d级可进行激活", 100))
					end
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
	slot0.mask:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					if uv0.data.quality < uv1 then
						uv0:callback()
					elseif RoleController:getInstance():getRoleVo().lev >= 100 then
						uv0:callback()
					else
						message(string.format("玩家%d级可进行激活", 100))
					end
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function PartnerComboCard.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function PartnerComboCard.setData(slot0, slot1)
	slot0.data = slot1
	slot2 = PathTool.getPlistImgForDownLoad("hero/photo", slot1.desc, false)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0.item_load = loadImageTextureFromCDN(slot0.card_img, slot2, ResourcesType.single, slot0.item_load)

	slot0.title_lb:setString(slot0.data.name)

	if uv0:getActivetedLevel(slot0.data.gid) == 0 then
		if RoleController:getInstance():getRoleVo().lev >= 100 or slot1.quality < uv1 then
			slot0.level_lb:setString(TI18N("未激活"))
			slot0.level_lb:setTextColor(cc.c4b(255, 255, 255, 255))
		else
			slot0.level_lb:setString(TI18N(string.format("%d级开放", 100)))
			slot0.level_lb:setTextColor(cc.c4b(255, 255, 255, 255))
		end

		slot0.title_lb:setTextColor(cc.c4b(60, 60, 60, 255))
		slot0.mask:setVisible(true)
	else
		slot0.mask:setVisible(false)
		slot0.title_lb:setTextColor(cc.c4b(59, 38, 15, 255))

		if Config.PartnerCatalogData.data_get_update[uv2("%s_%s", slot0.data.gid, slot3)].next_lev == 9999 then
			slot0.level_lb:setString(TI18N("满"))
		else
			slot0.level_lb:setString(TI18N(uv2("%s级", slot3)))
		end

		slot0.level_lb:setTextColor(cc.c4b(60, 60, 60, 255))
	end

	slot0.redpoint:setVisible(uv0:getRedpointRecord()[slot0.data.gid])
end

function PartnerComboCard.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
