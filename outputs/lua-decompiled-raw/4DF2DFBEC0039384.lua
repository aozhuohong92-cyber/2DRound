CommonTabBtn = class("CommonTabBtn", function ()
	return ccui.Widget:create()
end)

function CommonTabBtn.ctor(slot0)
	slot0.index = 0
	slot0.open_status = true

	slot0:configUI()
	slot0:register_event()
end

function CommonTabBtn.configUI(slot0)
	slot0.size = cc.size(147, 64)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("common/common_tab_btn"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0.container:setSwallowTouches(false)

	slot0.unselect_bg = slot0.container:getChildByName("unselect_bg")
	slot0.select_bg = slot0.container:getChildByName("select_bg")
	slot0.title = slot0.container:getChildByName("title")
	slot0.tab_tips = slot0.container:getChildByName("tab_tips")

	slot0.tab_tips:setVisible(false)

	slot0.red_num = slot0.container:getChildByName("red_num")

	slot0.red_num:setVisible(false)
	slot0:setBtnSelectStatus(false)
end

function CommonTabBtn.register_event(slot0)
	registerButtonEventListener(slot0.container, function ()
		if not uv0.open_status then
			if uv0.data and uv0.data.notice then
				message(uv0.data.notice)
			end
		elseif uv0.clickCallBack then
			uv0:clickCallBack()
		end
	end, false, 3, nil, , , true)
end

function CommonTabBtn.addCallBack(slot0, slot1)
	slot0.clickCallBack = slot1
end

function CommonTabBtn.setExtendData(slot0, slot1)
	if slot1 then
		if slot1.tab_name then
			slot0.tabExtendName = slot1.tab_name
		end

		slot0.default_index = slot1.default_index
		slot0.red_offset = slot1.red_offset or cc.p(0, 0)
		slot0.red_scale = slot1.red_scale or 1

		slot0.tab_tips:setScale(slot0.red_scale)

		slot0.title_offset = slot1.title_offset or cc.p(0, 0)
		slot0.select_color = slot1.select_color or cc.c4b(255, 255, 255, 255)
		slot0.select_outline = slot1.select_outline or cc.c4b(2, 0, 25, 255)
		slot0.normal_color = slot1.normal_color or cc.c4b(248, 194, 60, 255)
		slot0.normal_outline = slot1.normal_outline or cc.c4b(2, 0, 25, 255)

		if slot1.select_res then
			slot0.select_bg:loadTexture(slot1.select_res, LOADTEXT_TYPE_PLIST)
		end

		if slot1.normal_res then
			slot0.unselect_bg:loadTexture(slot1.normal_res, LOADTEXT_TYPE_PLIST)
		end

		if slot1.img_rect then
			slot0.select_bg:setCapInsets(slot1.img_rect)
			slot0.unselect_bg:setCapInsets(slot1.img_rect)
		end

		if slot1.tab_size then
			slot0.size = slot1.tab_size

			slot0:setContentSize(slot0.size)
			slot0.root_wnd:setContentSize(slot0.size)
			slot0.container:setContentSize(slot0.size)
			slot0.unselect_bg:setContentSize(slot0.size)
			slot0.select_bg:setContentSize(slot0.size)
			slot0.tab_tips:setPosition(cc.p(slot0.size.width * 0.88 + slot0.red_offset.x, slot0.size.height * 0.9 + slot0.red_offset.y))
			slot0.red_num:setPosition(cc.p(slot0.size.width * 0.88 - 2 + slot0.red_offset.x, slot0.size.height * 0.9 + slot0.red_offset.y))
			slot0.title:setPosition(cc.p(slot0.size.width / 2 + slot0.title_offset.x, slot0.size.height / 2 + slot0.title_offset.y))
			slot0.unselect_bg:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
			slot0.select_bg:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
		end
	end
end

function CommonTabBtn.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.tabExtendName then
		slot0.container:setName(slot0.tabExtendName .. (slot1.index or 0))
	end

	slot0.data = slot1
	slot0.index = slot1.index

	if slot0.default_index then
		slot0:setBtnSelectStatus(slot0.index == slot0.default_index)
	end

	slot0.title:setString(slot1.title)

	if slot0.default_index and slot0.default_index == slot1.index then
		slot0.default_index = nil

		if slot0.clickCallBack then
			slot0:clickCallBack()
		end
	end
end

function CommonTabBtn.setBtnSelectStatus(slot0, slot1)
	if slot1 then
		slot0.unselect_bg:setVisible(false)
		slot0.select_bg:setVisible(true)
		slot0.title:setTextColor(slot0.select_color or cc.c4b(255, 255, 255, 255))
		slot0.title:enableOutline(slot0.select_outline or cc.c4b(2, 0, 25, 255), 2)
	else
		slot0.unselect_bg:setVisible(true)
		slot0.select_bg:setVisible(false)
		slot0.title:setTextColor(slot0.normal_color or cc.c4b(248, 194, 60, 255))
		slot0.title:enableOutline(slot0.normal_outline or cc.c4b(2, 0, 25, 255), 2)
	end
end

function CommonTabBtn.setBtnOpenStatus(slot0, slot1)
	slot0.open_status = slot1

	setChildUnEnabled(not slot1, slot0)
end

function CommonTabBtn.setRedStatus(slot0, slot1, slot2)
	if slot1 then
		slot0.tab_tips:setVisible(true)

		if slot2 and slot2 > 0 then
			slot0.red_num:setVisible(true)

			if slot2 > 99 then
				slot0.red_num:setString("99")
			else
				slot0.red_num:setString(slot2)
			end
		else
			slot0.red_num:setVisible(false)
		end
	else
		slot0.tab_tips:setVisible(false)
		slot0.red_num:setVisible(false)
	end
end

function CommonTabBtn.getIndex(slot0)
	return slot0.index
end

function CommonTabBtn.DeleteMe(slot0)
end
