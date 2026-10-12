TabSelectBtn = TabSelectBtn or BaseClass()

function TabSelectBtn.__init(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12)
	slot0.select_status = false
	slot0.parent_wnd = slot1
	slot0.locatzorder = slot9
	slot0.unselect_path = slot3
	slot0.select_path = slot2
	slot0.arrow_path = slot5
	slot0.icon_path = slot4
	slot0.call_back = slot6
	slot0.font_size = slot7 or 24
	slot0.size = slot8
	slot0.extend_name = slot12 or "default"
	slot0.load_type = LOADTEXT_TYPE_PLIST

	slot0:setLoadType(slot11)

	if slot10 == nil then
		slot0.scale = true
	else
		slot0.scale = slot10
	end

	slot0.offX = 0
	slot0.offY = 0

	slot0:initView()
	slot0:registerEvent()
end

function TabSelectBtn.initView(slot0)
	slot0.item_layout = ccui.Widget:create()

	slot0.item_layout:setCascadeOpacityEnabled(true)
	slot0.item_layout:setAnchorPoint(cc.p(0, 0))
	slot0.parent_wnd:addChild(slot0.item_layout, slot0.locatzorder)
	slot0.item_layout:setTouchEnabled(true)
	slot0.item_layout:setName(slot0.extend_name)
	slot0:createSelectItem()
end

function TabSelectBtn.registerEvent(slot0)
	slot0.item_layout:setTouchEnabled(true)
	slot0.item_layout:addTouchEventListener(function (slot0, slot1)
		if uv0.scale == true then
			customClickAction(slot0, slot1)
		end

		if slot1 == ccui.TouchEventType.began then
			-- Nothing
		elseif slot1 ~= ccui.TouchEventType.ended and slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.call_back ~= nil then
				uv0:call_back(slot0, slot1)
			end
		end
	end)
end

function TabSelectBtn.createSelectItem(slot0, slot1, slot2)
	if slot2 and slot1 then
		slot0.unselect_path = slot2
		slot0.select_path = slot1
	end

	if slot0.select_icon == nil then
		slot0.select_icon = ccui.ImageView:create(slot0.select_path, slot0.load_type)

		slot0.select_icon:setAnchorPoint(cc.p(0, 0))
		slot0.item_layout:addChild(slot0.select_icon, 1)
		slot0.select_icon:setVisible(false)
	else
		slot0.select_icon:loadTexture(slot0.select_path, slot0.load_type)
	end

	if slot0.size then
		slot0.select_icon:setScale9Enabled(true)
		slot0.select_icon:setContentSize(slot0.size)
	end

	if slot0.arrow_path and string.len(slot0.arrow_path) > 0 then
		if slot0.arrow_icon == nil then
			slot0.arrow_icon = createSprite(slot0.arrow_path, slot0.select_icon:getContentSize().width * 0.5, -7, slot0.select_icon, cc.p(0.5, 0), slot0.load_type)
		else
			loadSpriteTexture(slot0.arrow_icon, slot0.arrow_path, slot0.load_type)
		end
	end

	if slot0.unselect_path and string.len(slot0.unselect_path) > 0 then
		if slot0.unselect_icon == nil then
			slot0.unselect_icon = ccui.ImageView:create(slot0.unselect_path, slot0.load_type)

			slot0.unselect_icon:setAnchorPoint(cc.p(0, 0))
			slot0.item_layout:addChild(slot0.unselect_icon, 0)
		else
			slot0.unselect_icon:loadTexture(slot0.unselect_path, slot0.load_type)
		end

		if slot0.size then
			slot0.unselect_icon:setScale9Enabled(true)
			slot0.unselect_icon:setContentSize(slot0.size)
		end
	end

	if slot0:getContentSize() ~= nil then
		slot0.item_layout:setContentSize(slot3)
	end
end

function TabSelectBtn.setLoadType(slot0, slot1)
	if slot1 == false then
		slot0.load_type = LOADTEXT_TYPE
	else
		slot0.load_type = LOADTEXT_TYPE_PLIST
	end
end

function TabSelectBtn.createSelectIcon(slot0, slot1, slot2)
	slot3 = slot0:getContentSize()

	if slot1 and slot2 then
		slot0.unselect_icon_path = slot2
		slot0.select_icon_path = slot1
	end

	if slot0.select_icon_path ~= nil and slot0.select_icon_path ~= "" then
		if slot0.select_item_icon == nil then
			slot0.select_item_icon = ccui.ImageView:create(slot0.select_icon_path, slot0.load_type)

			slot0.select_item_icon:setPosition(slot3.width / 2 - 10, slot3.height / 2)
			slot0.item_layout:addChild(slot0.select_item_icon, 3)
			slot0.select_item_icon:setVisible(false)
		else
			slot0.select_icon:loadTexture(slot0.select_icon_path, slot0.load_type)
		end
	end

	if slot0.unselect_icon_path ~= nil and slot0.unselect_icon_path ~= "" then
		if slot0.unselect_item_icon == nil then
			slot0.unselect_item_icon = ccui.ImageView:create(slot0.unselect_icon_path, slot0.load_type)

			slot0.unselect_item_icon:setPosition(slot3.width / 2 - 10, slot3.height / 2)
			slot0.item_layout:addChild(slot0.unselect_item_icon, 3)
			slot0.unselect_item_icon:setVisible(true)
		else
			slot0.unselect_item_icon:loadTexture(slot0.unselect_icon_path, slot0.load_type)
		end
	end
end

function TabSelectBtn.createTxtIcon(slot0, slot1)
	slot2 = slot0:getContentSize()
	slot0.btn_txt_icon = createSprite(slot1, slot2.width / 2, slot2.height / 2)

	slot0.item_layout:addChild(slot0.btn_txt_icon, 4)
end

function TabSelectBtn.setSelected(slot0, slot1)
	slot0.select_status = slot1

	slot0.select_icon:setVisible(slot0.select_status)
	slot0.unselect_icon:setVisible(not slot0.select_status)

	if slot0.select_item_icon then
		slot0.select_item_icon:setVisible(slot0.select_status)
	end

	if slot0.unselect_item_icon then
		slot0.unselect_item_icon:setVisible(not slot0.select_status)
	end
end

function TabSelectBtn.setIconScale(slot0, slot1, slot2)
	if slot0.select_icon then
		slot0.select_icon:setScaleX(slot1 or 1)
		slot0.select_icon:setScaleY(slot2 or 1)
	end

	if slot0.unselect_icon then
		slot0.unselect_icon:setScaleX(slot1)
		slot0.unselect_icon:setScaleY(slot2)
	end
end

function TabSelectBtn.isSelected(slot0)
	return slot0.select_status
end

function TabSelectBtn.showCirclePoint(slot0, slot1)
	if slot0.icon_path and string.len(slot0.icon_path) > 0 then
		if slot1 then
			if not slot0.circle_icon then
				slot0.circle_icon = ccui.ImageView:create(slot0.icon_path, LOADTEXT_TYPE_PLIST)

				slot0.item_layout:addChild(slot0.circle_icon, 10)
			else
				slot0.circle_icon:loadTexture(slot0.icon_path, LOADTEXT_TYPE_PLIST)
			end

			slot0.circle_icon:setVisible(slot1)

			slot2 = slot0.circle_icon:getContentSize()

			slot0.circle_icon:setPosition(cc.p(slot0:getContentSize().width - slot2.width / 2 + 5 + slot0.offX, slot0:getContentSize().height - slot2.height / 2 + 5 + slot0.offY))
		elseif slot0.circle_icon then
			slot0.circle_icon:setVisible(slot1)

			slot2 = slot0.circle_icon:getContentSize()

			slot0.circle_icon:setPosition(cc.p(slot0:getContentSize().width - slot2.width / 2 + 5 + slot0.offX, slot0:getContentSize().height - slot2.height / 2 + 5 + slot0.offY))
		end
	else
		print("tishi icon_path is nil!!!")
	end
end

function TabSelectBtn.setCirclePointOffset(slot0, slot1, slot2)
	slot0.offX = slot1
	slot0.offY = slot2
end

function TabSelectBtn.showActivityIcon(slot0, slot1)
	if slot1 then
		if not slot0.activityIcon then
			slot0.activityIcon = ccui.ImageView:create(slot1, LOADTEXT_TYPE_PLIST)
			slot2 = slot0.activityIcon:getContentSize()

			slot0.activityIcon:setPosition(cc.p(slot0:getContentSize().width - slot2.width / 2 + 5, slot0:getContentSize().height - slot2.height / 2 + 5))
			slot0.item_layout:addChild(slot0.activityIcon, 10)
		else
			slot0.activityIcon:loadTexture(slot1, LOADTEXT_TYPE_PLIST)
		end

		slot0.activityIcon:setVisible(true)
	elseif slot0.activityIcon then
		slot0.activityIcon:setVisible(false)
	end
end

function TabSelectBtn.showCircleLabel(slot0, slot1)
	if slot1 > 0 then
		slot0:showCirclePoint(true)

		if not slot0.circle_num then
			slot0.circle_num = createLabel(20, Config.ColorData.data_color4[1])

			slot0.circle_num:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.item_layout:addChild(slot0.circle_num, 20)
			slot0.circle_num:setPosition(cc.p(slot0.circle_icon:getPositionX() - 1, slot0.circle_icon:getPositionY() + 2))
		end

		slot0.circle_num:setString(slot1)
	else
		slot0:showCirclePoint(false)

		if slot0.circle_num then
			slot0.circle_num:setString("")
		end
	end
end

function TabSelectBtn.setVisible(slot0, slot1)
	if slot0.item_layout then
		slot0.item_layout:setVisible(slot1)
	end
end

function TabSelectBtn.getContentSize(slot0)
	if slot0.unselect_icon then
		return slot0.unselect_icon:getContentSize()
	end

	if slot0.select_icon then
		return slot0.select_icon:getContentSize()
	end
end

function TabSelectBtn.enableOutline(slot0, slot1, slot2)
	if slot0.label then
		slot0.label:enableOutline(slot1, slot2)
	end
end

function TabSelectBtn.setLocalZOrder(slot0, slot1)
	slot0.item_layout:setLocalZOrder(slot1)
end

function TabSelectBtn.setAnchorPoint(slot0, slot1, slot2)
	slot0.item_layout:setAnchorPoint(cc.p(slot1, slot2))
end

function TabSelectBtn.addToParent(slot0, slot1)
	slot0.parent_wnd = slot1

	if not tolua.isnull(slot0.item_layout) and slot0.item_layout:getParent() then
		slot0.item_layout:removeFromParent()
	end

	slot0.parent_wnd:addChild(slot0.item_layout)
end

function TabSelectBtn.setPosition(slot0, slot1, slot2)
	slot0.item_layout:setPosition(cc.p(slot1, slot2))
end

function TabSelectBtn.setCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function TabSelectBtn.getLabel(slot0)
	return slot0.label
end

function TabSelectBtn.getPositionX(slot0)
	return slot0.item_layout:getPositionX()
end

function TabSelectBtn.getPositionY(slot0)
	return slot0.item_layout:getPositionY()
end

function TabSelectBtn.setSelectTabPos(slot0, slot1, slot2)
	if slot0.select_icon then
		slot0.select_icon:setPosition(cc.p(slot1, slot2))
	end
end

function TabSelectBtn.setSelectTabAnchorPos(slot0, slot1, slot2)
	if slot0.select_icon then
		slot0.select_icon:setAnchorPoint(cc.p(slot1, slot2))
	end
end

function TabSelectBtn.setTitleOffset(slot0, slot1, slot2)
	if slot0:getContentSize() and slot0.label then
		slot0.label:setPosition(cc.p(slot3.width / 2 + slot1, slot3.height / 2 + slot2))
	end
end

function TabSelectBtn.setTxtIconOffset(slot0, slot1, slot2)
	if slot0.btn_txt_icon then
		slot3 = slot0:getContentSize()

		slot0.btn_txt_icon:setPosition(cc.p(slot3.width / 2 + slot1, slot3.height / 2 + slot2))
	end
end

function TabSelectBtn.setFontSize(slot0, slot1)
	slot0.font_size = slot1
end

function TabSelectBtn.setString(slot0, slot1)
	if slot0.label == nil then
		slot0.label = createLabel(slot0.font_size, nil, nil, slot0:getContentSize().width / 2, slot0:getContentSize().height / 2, nil, slot0.item_layout, nil, cc.p(0.5, 0.5), "fonts/title.ttf")

		slot0.label:setAlignment(cc.TEXT_ALIGNMENT_CENTER)
	elseif slot0.label:isVisible() == false then
		slot0.label:setVisible(true)
	end

	slot0.label:setLocalZOrder(10)
	slot0.label:setString(slot1)
end

function TabSelectBtn.setTitleColor(slot0, slot1)
	if slot0.label then
		slot0.label:setTextColor(slot1)
	end
end

function TabSelectBtn.setTitlePosition(slot0, slot1, slot2)
	if slot0.label then
		slot0.label:setPosition(cc.p(slot1, slot2))
	end
end

function TabSelectBtn.setBtnContenSize(slot0, slot1)
	if slot1 then
		slot0.select_icon:setScale9Enabled(true)
		slot0.select_icon:setContentSize(slot1)
		slot0.unselect_icon:setScale9Enabled(true)
		slot0.unselect_icon:setContentSize(slot1)
		slot0.label:setPosition(slot1.width / 2, slot1.height / 2)
	end
end

function TabSelectBtn.setName(slot0, slot1)
	slot0.name = slot1
end

function TabSelectBtn.getName(slot0)
	return slot0.name
end

function TabSelectBtn.getRoot(slot0)
	return slot0.item_layout
end

function TabSelectBtn.__delete(slot0)
	slot0.item_layout:removeAllChildren()

	slot0.label = nil
	slot0.call_back = nil
	slot0.unselect_icon = nil
	slot0.select_icon = nil
	slot0.btn_txt_icon = nil
	slot0.item_layout = nil
	slot0.parent_wnd = nil
end
