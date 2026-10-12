RadioButton = class("RadioButton", function ()
	return ccui.Layout:create()
end)
RadioButtonDir = {
	LEFT = 1,
	RIGHT = 2
}

function RadioButton.ctor(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.parent_wnd = slot1
	slot0.background_path = slot2
	slot0.select_path = slot3
	slot0.string_label = slot4
	slot0.dir = slot6 or RadioButtonDir.RIGHT
	slot0.font_size = slot7 or 25
	slot0.font_offset = slot5 or 10

	slot0:initView()
end

function RadioButton.initView(slot0)
	slot0:setEnabled(true)
	slot0.parent_wnd:addChild(slot0)
	slot0:loadAllTextures(slot0.background_path, slot0.select_path, slot0.string_label, slot0.dir)
end

function RadioButton.loadAllTextures(slot0, slot1, slot2, slot3, slot4)
	slot0.background_path = slot1 or slot0.background_path
	slot0.select_path = slot2 or slot0.select_path
	slot0.string_label = slot3 or slot0.string_label
	slot0.dir = slot4 or slot0.dir
	slot0.background = createSprite(slot0.background_path, 0, 0)

	slot0.background:setScale(0.8)
	slot0:addChild(slot0.background)

	slot0.select_icon = createSprite(slot0.select_path, 0, 0)

	slot0:addChild(slot0.select_icon)

	slot0.label = createWithSystemFont(slot0.string_label, DEFAULT_FONT, slot0.font_size)

	slot0.label:setAnchorPoint(cc.p(0, 0.5))
	slot0:addChild(slot0.label)
	slot0:adjustContentSize()
	slot0:setSelected(false)
end

function RadioButton.adjustContentSize(slot0)
	slot1 = slot0.background:getContentSize()
	slot2 = slot0.select_icon:getContentSize()
	slot3 = slot0.label:getContentSize()

	slot0:setContentSize(cc.size(math.max(slot1.width, slot2.width) + slot3.width / 2 + slot0.font_offset, math.max(slot1.height, slot2.height, slot3.height)))

	slot4 = math.max(slot1.width, slot2.width)

	if slot0.dir == RadioButtonDir.RIGHT then
		slot0.background:setPosition(cc.p(slot4 / 2, slot5 / 2))
		slot0.select_icon:setPosition(cc.p(slot4 / 2, slot5 / 2))
		slot0.label:setPosition(cc.p(slot4 + slot0.font_offset, slot5 / 2))
	else
		slot0.label:setPosition(cc.p(0, slot5 / 2))

		slot6 = slot0.label:getContentSize().width / 2 + slot0.font_offset + slot4 / 2

		slot0.background:setPosition(cc.p(slot6, slot5 / 2))
		slot0.select_icon:setPosition(cc.p(slot6, slot5 / 2))
	end
end

function RadioButton.setBgScale(slot0, slot1, slot2)
	slot0.background:setScaleX(slot1)
	slot0.background:setScaleY(slot2)
end

function RadioButton.getLabel(slot0)
	return slot0.label
end

function RadioButton.setString(slot0, slot1)
	slot0.label:setString(slot1)
	slot0:adjustContentSize()
end

function RadioButton.setBackground(slot0, slot1)
	loadSpriteTexture(slot0.background, slot1, LOADTEXT_TYPE)
	slot0:adjustContentSize()
end

function RadioButton.setSelectIcon(slot0, slot1)
	loadSpriteTexture(slot0.select_icon, slot1, LOADTEXT_TYPE)
	slot0:adjustContentSize()
end

function RadioButton.setSelected(slot0, slot1)
	slot0.select_icon:setVisible(slot1)
end

function RadioButton.isSelected(slot0)
	return slot0.select_icon:isVisible()
end

function RadioButton.getSelectIcon(slot0)
	return slot0.select_icon
end

function RadioButton.setFontSize(slot0, slot1)
	slot0.font_size = slot1

	if slot0.label then
		slot0.label:setSystemFontSize(slot1)
	end
end

function RadioButton.setTitleColor(slot0, slot1)
	slot0.font_color4 = slot1

	if slot0.label then
		slot0.label:setTextColor(slot1)
	end
end

function RadioButton.setTitlePosition(slot0, slot1, slot2)
	if slot0.label then
		slot0.label:setPosition(cc.p(slot1, slot2))
	end
end

function RadioButton.setName(slot0, slot1)
	slot0.name = slot1
end

function RadioButton.getName(slot0)
	return slot0.name
end

function RadioButton.enableOutline(slot0, slot1, slot2)
	if slot0.label then
		slot0.label:enableOutline(slot1, slot2)
	end
end

function RadioButton.setEnabled(slot0, slot1)
	slot0.isEnabled = slot1

	slot0:setTouchEnabled(slot1)
	setChildUnEnabled(not slot1, slot0)
end

function RadioButton.isEnabled(slot0)
	return slot0.isEnabled
end

function RadioButton.setGrayAndUnClick(slot0, slot1)
	slot0:setChildUnEnabled(slot1, slot0)
	slot0:setTouchEnabled(not slot1)

	if slot1 then
		slot0:getLabel():setTextColor(Config.Color4[3])
	elseif slot0.font_color4 then
		slot0:getLabel():setTextColor(slot0.font_color4)
	end
end

function RadioButton.setChildUnEnabled(slot0, slot1, slot2)
	setChildUnEnabled(slot1, slot2)
end
