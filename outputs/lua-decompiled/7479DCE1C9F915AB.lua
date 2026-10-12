CommonSubBtnList = class("CommonSubBtnList", function ()
	return ccui.Widget:create()
end)

function CommonSubBtnList.ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.btn_objects = {}
	slot0.call_back = slot5
	slot0.init_flag = true

	if slot1 ~= nil then
		slot1:addChild(slot0)
	end

	slot0:setAnchorPoint(slot2 or cc.p(0.5, 0.5))

	if slot3 ~= nil then
		slot0:setPosition(slot3)
	end

	slot0.btn_size = slot4 or cc.size(129, 54)
end

function CommonSubBtnList.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.btn_num = #slot1

	slot0:setContentSize(cc.size(slot0.btn_num * slot0.btn_size.width + 6, slot0.btn_size.height))

	if not slot0.image_bg then
		slot0.image_bg = createImage(slot0, PathTool.getResFrame("common", "common_2020"), 0, 0, cc.p(0, 0), true, nil, true)
	end

	slot7 = slot3

	slot0.image_bg:setContentSize(slot7)

	for slot7, slot8 in pairs(slot0.btn_objects) do
		if slot8.btn then
			slot8.btn:setVisible(false)
		end
	end

	for slot7, slot8 in ipairs(slot1) do
		if not slot0.btn_objects[slot7] then
			slot0.btn_objects[slot7] = slot0:createSubButton(slot8.index)
		end

		slot9.btn:setVisible(true)

		if slot8.status ~= nil then
			slot0:setBtnOpenStatus(slot9.btn, slot8.status)
		end

		slot9.btn:setPosition(cc.p(3 + (slot7 - 1) * slot0.btn_size.width, 0))
		slot9.normal_bg:loadTexture(slot0:getBtnResByIndex(slot7, false), LOADTEXT_TYPE_PLIST)
		slot9.select_bg:loadTexture(slot0:getBtnResByIndex(slot7, true), LOADTEXT_TYPE_PLIST)

		slot9.title = slot8.title

		slot9.label:setString(string.format("<div fontcolor=#D7E2E3 outline=2,#020019>%s</div>", slot9.title))

		if slot7 == 1 then
			slot9.normal_bg:setScaleX(-1)
			slot9.select_bg:setScaleX(-1)
		else
			slot9.normal_bg:setScaleX(1)
			slot9.select_bg:setScaleX(1)
		end
	end

	if slot0.init_flag or slot2 then
		slot0.init_flag = false
		slot0.cur_index = nil

		slot0:_onClickSubBtnByIndex(slot2 or 1)
	end
end

function CommonSubBtnList.getBtnResByIndex(slot0, slot1, slot2)
	slot3 = PathTool.getResFrame("common", "common_2022")

	if slot1 == 1 or slot1 == slot0.btn_num then
		if slot2 then
			slot3 = PathTool.getResFrame("common", "common_2021")
		else
			slot3 = PathTool.getResFrame("common", "common_2023")
		end
	elseif slot2 then
		slot3 = PathTool.getResFrame("common", "common_2024")
	end

	return slot3
end

function CommonSubBtnList.createSubButton(slot0, slot1)
	slot2 = {
		btn = ccui.Widget:create()
	}

	slot2.btn:setCascadeOpacityEnabled(true)
	slot2.btn:setTouchEnabled(true)
	slot2.btn:setAnchorPoint(cc.p(0, 0))
	slot2.btn:setContentSize(slot0.btn_size)
	slot0:addChild(slot2.btn)
	registerButtonEventListener(slot2.btn, function ()
		uv0:_onClickSubBtnByIndex(uv1)
	end, false)

	slot2.normal_bg = createImage(slot2.btn, nil, slot0.btn_size.width * 0.5, slot0.btn_size.height * 0.5, cc.p(0.5, 0.5), true, nil, true)

	slot2.normal_bg:setContentSize(slot0.btn_size)
	slot2.normal_bg:setCapInsets(CCRectMake(5, 11, 4, 27))

	slot2.select_bg = createImage(slot2.btn, nil, slot0.btn_size.width * 0.5, slot0.btn_size.height * 0.5, cc.p(0.5, 0.5), true, nil, true)

	slot2.select_bg:setContentSize(slot0.btn_size)
	slot2.select_bg:setCapInsets(CCRectMake(5, 11, 4, 27))

	slot2.label = createRichLabel(24, cc.c4b(105, 55, 5, 255), cc.p(0.5, 0.5), cc.p(slot0.btn_size.width * 0.5, slot0.btn_size.height * 0.5))

	slot2.btn:addChild(slot2.label)

	slot2.index = slot1

	return slot2
end

function CommonSubBtnList._onClickSubBtnByIndex(slot0, slot1)
	if slot0.cur_index and slot0.cur_index == slot1 then
		return
	end

	for slot5, slot6 in ipairs(slot0.data) do
		if slot6.index == slot1 and slot6.status ~= nil and slot6.status == false then
			if slot6.tips ~= nil then
				message(slot6.tips)
			end

			return
		end
	end

	slot0.cur_index = slot1

	for slot5, slot6 in ipairs(slot0.btn_objects) do
		if slot6.index == slot1 then
			slot6.normal_bg:setVisible(false)
			slot6.select_bg:setVisible(true)

			if slot6.title then
				slot6.label:setString(string.format("<div fontcolor=#FFFFFF outline=2,#020019>%s</div>", slot6.title))
			end
		else
			slot6.normal_bg:setVisible(true)
			slot6.select_bg:setVisible(false)

			if slot6.title then
				slot6.label:setString(string.format("<div fontcolor=#D7E2E3 outline=2,#020019>%s</div>", slot6.title))
			end
		end
	end

	if slot0.call_back then
		slot0.call_back(slot1)
	end
end

function CommonSubBtnList.setBtnOpenStatus(slot0, slot1, slot2)
	setChildUnEnabled(not slot2, slot1)
end

function CommonSubBtnList.setGuideName(slot0, slot1)
	for slot5, slot6 in pairs(slot0.btn_objects) do
		slot6.btn:setName("guide_btn_" .. slot1 .. slot5)
	end
end

function CommonSubBtnList.setBtnRedStatus(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot0.btn_objects) do
		if slot7.index == slot1 then
			addRedPointToNodeByStatus(slot7.btn, slot2, 2, 8)

			break
		end
	end
end

function CommonSubBtnList.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
