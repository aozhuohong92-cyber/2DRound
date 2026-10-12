CustomButton = CustomButton or BaseClass()

function CustomButton.__init(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.load_type = slot5 or LOADTEXT_TYPE_PLIST
	slot0.parent_wnd = slot1
	slot0.normal_res = slot2
	slot0.press_res = slot3
	slot0.disable_res = slot4
	slot0.is_other_sound = false
	slot0.btn_scale = 1
	slot0.font_type = slot6 or DEFAULT_FONT

	slot0:initView()
	slot0:registerEvent()
end

function CustomButton.initView(slot0)
	slot0.layout = ccui.Widget:create()

	slot0.layout:setCascadeOpacityEnabled(true)
	slot0.layout:setAnchorPoint(cc.p(0.5, 0.5))

	if slot0.parent_wnd ~= nil then
		slot0.parent_wnd:addChild(slot0.layout)
	end

	slot0.btn = ccui.Button:create()

	slot0.btn:setTouchEnabled(true)
	slot0.layout:addChild(slot0.btn)
	slot0:setBtnStateImg(slot0.normal_res, slot0.press_res or slot0.normal_res, slot0.disable_res or "")
end

function CustomButton.setBtnStateImg(slot0, slot1, slot2, slot3)
	if slot1 and slot2 then
		slot0.normal_res = slot1
		slot0.press_res = slot2
		slot0.disable_res = slot3

		slot0.btn:loadTextures(slot0.normal_res, slot0.press_res or slot0.normal_res, slot0.disable_res or "", slot0.load_type)

		slot4 = slot0.btn:getContentSize()

		slot0.btn:setPosition(cc.p(slot4.width / 2, slot4.height / 2))
		slot0:setSize(slot4)
	end
end

function CustomButton.loadTextures(slot0, slot1, slot2, slot3)
	if slot0.btn and slot1 then
		slot0.btn:loadTextures(slot1, slot2 or slot1, slot3 or "", slot0.load_type)
	end
end

function CustomButton.setBtnLabel(slot0, slot1, slot2)
	if slot0.btn_image_label and slot0.btn_image_label:isVisible() then
		slot0.btn_image_label:setVisible(false)
	end

	if slot0.rich_label and slot0.rich_label:isVisible() then
		slot0.rich_label:setVisible(false)
	end

	if slot0.btn_label == nil then
		slot0.font_size = slot0.font_size or 20
		slot0.btn_label = createLabel(slot0.font_size, nil, nil, slot0:getSize().width / 2, slot0:getSize().height / 2 + 1, "", slot0.layout, nil, cc.p(0.5, 0.5), slot2)

		slot0.btn_label:setLocalZOrder(10)

		if slot0.font_color4 then
			slot0.btn_label:setTextColor(slot0.font_color4)
		elseif slot0.font_color then
			slot0.btn_label:setColor(slot0.font_color)
		end
	elseif slot0.btn_label and not tolua.isnull(slot0.btn_label) and slot0.btn_label:isVisible() == false then
		slot0.btn_label:setVisible(true)
	end

	slot0.btn_label:setString(slot1)
end

function CustomButton.setBright(slot0, slot1)
	slot0.btn:setBright(slot1)
end

function CustomButton.setImageLabel(slot0, slot1, slot2, slot3)
	slot3 = slot3 or LOADTEXT_TYPE
	slot4 = slot2 or 1

	if slot0.btn_label and slot0.btn_label:isVisible() then
		slot0.btn_label:setVisible(false)
	end

	if slot0.rich_label then
		slot0.rich_label:setVisible(false)
	end

	if slot0.btn_image_label == nil then
		slot0.btn_image_label = ccui.ImageView:create()

		slot0.btn_image_label:setPosition(slot0:getSize().width / 2, slot0:getSize().height / 2)
		slot0.btn_image_label:setScale(slot4)
		slot0.layout:addChild(slot0.btn_image_label)
	elseif slot0.btn_image_label:isVisible() == false then
		slot0.btn_image_label:setVisible(true)
	end

	slot0.btn_image_label:loadTexture(slot1, slot3)
end

function CustomButton.setRichText(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0.btn_label then
		slot0.btn_label:setVisible(false)
	end

	if slot0.btn_image_label then
		slot0.btn_image_label:setVisible(false)
	end

	if not slot0.rich_label then
		slot0.rich_label = createRichLabel(slot2, slot3 or 1, slot5 or cc.p(0, 1), cc.p(0, 0), 5, 0, slot4 or slot0:getSize().width)

		slot0.layout:addChild(slot0.rich_label)
	end

	slot0.rich_label:setVisible(true)
	slot0.rich_label:setString(slot1)
	slot0.rich_label:setPosition((slot0:getSize().width - slot0.rich_label:getContentSize().width) / 2, slot0:getSize().height / 2 + slot0.rich_label:getContentSize().height / 2 + 1)
end

function CustomButton.setLabelColor(slot0, slot1, slot2, slot3)
	slot0.font_color = cc.c3b(slot1, slot2, slot3)

	if slot0.btn_label then
		slot0.btn_label:setColor(slot0.font_color)
	end
end

function CustomButton.setBtnLableColor(slot0, slot1)
	slot0.font_color4 = slot1

	if slot0.btn_label then
		slot0.btn_label:setTextColor(slot1)
	end
end

function CustomButton.setLabelSize(slot0, slot1)
	if slot0.font_size == nil or slot0.font_size ~= slot1 then
		if slot0.btn_label then
			slot0.btn_label:setSystemFontSize(slot1)
		end

		slot0.font_size = slot1
	end
end

function CustomButton.setLabelPosition(slot0, slot1, slot2)
	if slot0.btn_image_label and slot0.btn_image_label:isVisible() then
		slot0.btn_image_label:setPosition(cc.p(slot1, slot2))
	end

	if slot0.btn_label and slot0.btn_label:isVisible() then
		slot0.btn_label:setPosition(cc.p(slot1, slot2))
	end
end

function CustomButton.setRichLabelPosition(slot0, slot1, slot2)
	if slot0.rich_label and not tolua.isnull(slot0.rich_label) then
		slot0.rich_label:setPosition(cc.p(slot1, slot2))
	end
end

function CustomButton.setRotation(slot0, slot1)
	slot0.btn:setRotation(slot1)
end

function CustomButton.setZOrder(slot0, slot1)
	slot0.layout:setZOrder(slot1)
end

function CustomButton.enableOutline(slot0, slot1, slot2)
	if slot0.btn_label then
		slot0.btn_label:enableOutline(slot1, slot2)
	end
end

function CustomButton.setOffsetPos(slot0, slot1, slot2)
	slot0:setLabelPosition(slot0:getSize().width / 2 + slot1, slot0:getSize().height / 2 + slot2)
end

function CustomButton.getSize(slot0)
	return slot0.layout:getContentSize()
end

function CustomButton.getContentSize(slot0)
	return slot0.layout:getContentSize()
end

function CustomButton.addTouchEventListener(slot0, slot1, slot2)
	slot0.btn:addTouchEventListener(function (slot0, slot1)
		if uv0.is_open and not uv1 == true then
			customClickAction(uv0.layout, slot1, uv0.btn_scale)
		end

		if uv2 ~= nil then
			uv2(slot0, slot1)
		end

		if slot1 == ccui.TouchEventType.began then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.ended then
			if uv0.is_other_sound == false then
				playButtonSound2()
			end
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function CustomButton.setSize(slot0, slot1)
	if slot0:getSize().width <= slot1.width and slot0:getSize().height <= slot1.height then
		slot0.btn:setScale9Enabled(true)
	end

	slot0.btn:setContentSize(slot1)
	slot0.layout:setContentSize(slot1)

	if slot0.btn_image_label then
		slot0.btn_image_label:setPosition(cc.p(slot1.width / 2, slot1.height / 2))
	end

	if slot0.btn_label then
		slot0.btn_label:setPosition(cc.p(slot1.width / 2, slot1.height / 2))
	end

	slot0:getButton():setPosition(cc.p(slot0:getSize().width / 2, slot0:getSize().height / 2))
end

function CustomButton.setCapInsets(slot0, slot1)
	slot0.btn:setCapInsets(slot1)
end

function CustomButton.playSound(slot0, slot1)
	slot0.is_other_sound = slot1 or false
end

function CustomButton.showRedPoint(slot0, slot1, slot2, slot3, slot4)
	if not slot0.red_point then
		slot0.red_point = createSprite(PathTool.getResFrame("mainui", "mainui_1009"), 0, 0, slot0.layout, cc.p(1, 1))

		slot0.red_point:setVisible(false)
	end

	if slot4 ~= nil and slot4 > 0 then
		if not slot0.red_num then
			slot0.red_num = createLabel(20, 1, nil, slot0.red_point:getContentSize().width / 2 - 1, slot0.red_point:getContentSize().height / 2 + 2, slot4, slot0.red_point, 1, cc.p(0.5, 0.5))
		end

		slot0.red_num:setVisible(true)
		slot0.red_num:setString(slot4)
	elseif slot0.red_num then
		slot0.red_num:setVisible(false)
	end

	slot0.red_point:setPosition(slot2 or slot0:getSize().width, slot3 or slot0:getSize().height)
	slot0.red_point:setVisible(slot1)
end

function CustomButton.setBtnSize(slot0, slot1)
	if slot1 then
		slot0.btn:setContentSize(slot1)
	end
end

function CustomButton.setAnchorPoint(slot0, slot1, slot2)
	slot0.layout:setAnchorPoint(cc.p(slot1, slot2))
end

function CustomButton.setName(slot0, slot1)
	slot0.btn:setName(slot1)
end

function CustomButton.getButton(slot0)
	return slot0.btn
end

function CustomButton.setBtnPosition(slot0, slot1)
	slot2 = slot0.btn:getContentSize()

	slot0.btn:setPosition(slot1 or cc.p(slot2.width / 2, slot2.height / 2))
end

function CustomButton.getLabel(slot0)
	return slot0.btn_label
end

function CustomButton.getImageLabel(slot0)
	return slot0.btn_image_label
end

function CustomButton.getRoot(slot0)
	return slot0.layout
end

function CustomButton.setCascade(slot0, slot1)
	slot0.layout:setCascadeOpacityEnabled(slot1)

	if slot1 == true then
		slot0.layout:setOpacity(140)
	else
		slot0.layout:setOpacity(255)
	end
end

function CustomButton.setScale(slot0, slot1)
	if slot0.btn_scale ~= slot1 then
		slot0.btn_scale = slot1

		slot0:getRoot():setScale(slot1)
	end
end

function CustomButton.removeFromParent(slot0)
	if slot0.layout and slot0.layout:getParent() then
		slot0.layout:removeFromParent()
	end
end

function CustomButton.setVisible(slot0, slot1)
	slot0.layout:setVisible(slot1)
end

function CustomButton.isVisible(slot0, ...)
	return slot0.layout:isVisible()
end

function CustomButton.setTouchEnabled(slot0, slot1)
	slot0.btn:setTouchEnabled(slot1)
end

function CustomButton.setGrayAndUnClick(slot0, slot1, slot2, slot3)
	setChildUnEnabled(slot1, slot0:getRoot())

	slot4 = slot3 or Config.ColorData.data_color4[1]

	if (slot2 or TRUE) == TRUE and not tolua.isnull(slot0:getButton()) then
		slot0:getButton():setTouchEnabled(not slot1)
	end

	if slot1 then
		if not tolua.isnull(slot0:getLabel()) then
			slot0:getLabel():setTextColor(slot4)
		end
	else
		if slot0.font_color then
			if not tolua.isnull(slot0:getLabel()) then
				slot0:getLabel():setColor(slot0.font_color)
			end

			return
		end

		if slot0.font_color4 then
			if not tolua.isnull(slot0:getLabel()) then
				slot0:getLabel():setTextColor(slot0.font_color4)
			end

			return
		end

		if not tolua.isnull(slot0:getLabel()) then
			slot0:getLabel():setTextColor(Config.ColorData.data_color4[1])
		end
	end
end

function CustomButton.setLocalZOrder(slot0, slot1)
	slot0.layout:setLocalZOrder(slot1)
end

function CustomButton.setGlobalZOrder(slot0, slot1)
	slot0.layout:setGlobalZOrder(slot1)
end

function CustomButton.addToParent(slot0, slot1)
	slot0.parent_wnd = slot1

	if slot0.layout:getParent() then
		slot0.layout:removeFromParent()
	end

	slot0.parent_wnd:addChild(slot0.layout)
end

function CustomButton.addChild(slot0, slot1)
	if slot1 ~= nil then
		slot0.layout:addChild(slot1)
	end
end

function CustomButton.setPosition(slot0, slot1, slot2)
	slot0.layout:setPosition(cc.p(slot1, slot2))
end

function CustomButton.setPositionY(slot0, slot1)
	slot0.layout:setPositionY(slot1)
end

function CustomButton.setPositionX(slot0, slot1)
	slot0.layout:setPositionX(slot1)
end

function CustomButton.setScaleX(slot0, slot1)
	slot0.layout:setScaleX(slot1)
end

function CustomButton.setScaleY(slot0, slot1)
	slot0.layout:setScaleY(slot1)
end

function CustomButton.getPosition(slot0)
	return slot0.layout:getPosition()
end

function CustomButton.getPositionX(slot0)
	return slot0.layout:getPositionX()
end

function CustomButton.getPositionY(slot0)
	return slot0.layout:getPositionY()
end

function CustomButton.setEnabled(slot0, slot1)
	if slot0.btn then
		slot0.btn:setEnabled(slot1)
	end
end

function CustomButton.__delete(slot0)
	slot0.is_open = false

	slot0.layout:removeAllChildren()
	slot0:removeFromParent()

	slot0.btn_label = nil
	slot0.btn_image_label = nil
	slot0.btn = nil
	slot0.layout = nil
end

function CustomButton.registerEvent(slot0)
	slot0.is_open = true

	slot0:registerNodeScriptHandler()
end

function CustomButton.registerNodeScriptHandler(slot0)
	slot0.layout:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			if uv0.onEnter then
				uv0:onEnter()
			end
		elseif slot0 == "exit" then
			uv0.is_open = false

			if uv0.onExit then
				uv0:onExit()
			end
		end
	end)
end
