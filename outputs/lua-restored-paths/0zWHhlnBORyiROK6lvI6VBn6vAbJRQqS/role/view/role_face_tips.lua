RoleFaceTips = RoleFaceTips or BaseClass(CommonUI)

function RoleFaceTips.__init(slot0)
	slot0.WIDTH = 366
	slot0.HEIGHT = 300

	slot0:initMainContainer()
end

function RoleFaceTips.initMainContainer(slot0)
	slot1 = cc.size(SCREEN_WIDTH, display.height)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(slot1)
	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setSwallowTouches(false)
	ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0.root_wnd)
	slot0:setCommonUIZOrder(slot0:getRootWnd())

	slot0.main_container = ccui.Widget:create()

	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.main_container:setContentSize(cc.size(slot0.WIDTH, slot0.HEIGHT))
	slot0.main_container:setPosition(cc.p(slot1.width / 2, slot1.height / 2))
	slot0.root_wnd:addChild(slot0.main_container)

	slot0.background = createScale9Sprite(PathTool.getResFrame("common", "common_1056"), 0, 0)

	slot0.background:setContentSize(cc.size(slot0.WIDTH, slot0.HEIGHT))
	slot0.background:setAnchorPoint(cc.p(0, 0))
	slot0.background:setCapInsets(cc.rect(20, 20, 1, 1))
	slot0.main_container:addChild(slot0.background)
end

function RoleFaceTips.setData(slot0, slot1, slot2)
	slot0:registerEvents()

	slot0.type = slot1
	slot0.data = slot2

	if slot1 == 1 then
		-- Nothing
	elseif slot1 == 2 then
		if slot0.head == nil then
			slot0.head = RoleFaceItem.new()

			slot0.main_container:addChild(slot0.head)
		end

		slot0.head:setData(slot2)
		slot0:createHeadInfo()
	elseif slot1 == 3 then
		slot0:createTitleInfo()
	end

	slot0:adjustSize()
end

function RoleFaceTips.createHeadInfo(slot0)
	if slot0.info_con == nil then
		slot0.info_con = ccui.Widget:create()

		slot0.info_con:setAnchorPoint(cc.p(0, 0.5))
		slot0.info_con:setPosition(cc.p(0, slot0.background:getContentSize().height / 2))
		slot0.background:addChild(slot0.info_con)

		slot0.time = createRichLabel(22, 13, cc.p(0, 1), cc.p(30, 175))

		slot0.info_con:addChild(slot0.time)

		slot1 = ""

		slot0.time:setString(TI18N(string.format("使用期限：%s", (slot0.data.expire_time <= 0 or TimeTool.GetTimeFormatDay(slot0.data.expire_time * 60)) and TI18N("永久"))))

		slot0.condition = createRichLabel(22, 1, cc.p(0, 1), cc.p(30, 140), 0, 0, 190)

		slot0.info_con:addChild(slot0.condition)
		slot0.condition:setString(TI18N(string.format("激活条件：%s", slot0.data.desc)))
		slot0.info_con:setContentSize(slot0.WIDTH, math.max(slot0.time:getContentSize().height + slot0.condition:getContentSize().height + 90, 230))
	end
end

function RoleFaceTips.createTitleInfo(slot0)
	if slot0.title_info_con == nil then
		slot0.title_info_con = ccui.Widget:create()

		slot0.title_info_con:setAnchorPoint(cc.p(0, 0.5))
		slot0.title_info_con:setContentSize(cc.size(slot0.WIDTH, slot0.HEIGHT))
		slot0.title_info_con:setPosition(cc.p(0, slot0.main_container:getContentSize().height / 2))
		slot0.main_container:addChild(slot0.title_info_con)

		slot0.icon = createImage(slot0.title_info_con, nil, slot0.WIDTH * 0.5, 260, cc.p(0.5, 1), false)

		if Config.HonorData.data_title[slot0.data.base_id] and slot2.res_id then
			slot0.icon:loadTexture(PathTool.getTargetRes("honor", "txt_cn_honor_" .. slot2.res_id, false, false), LOADTEXT_TYPE)
		end

		slot3 = createRichLabel(22, 175, cc.p(0, 1), cc.p(30, 154))

		slot0.title_info_con:addChild(slot3)
		slot3:setString(TI18N("属性加成："))

		slot4 = ""

		if slot0.data.attr and next(slot0.data.attr) ~= nil then
			for slot8, slot9 in pairs(slot0.data.attr) do
				slot4 = slot4 .. Config.AttrData.data_key_to_name[slot9[1]] .. "+" .. string.format("<div fontcolor=249003>%s</div>", slot9[2]) .. " "
			end
		else
			slot4 = slot4 .. TI18N("无")
		end

		slot0.attr_label = createRichLabel(22, 175, cc.p(0, 1), cc.p(slot3:getPositionX() + slot3:getContentSize().width, 154), 0, 0, 200)

		slot0.title_info_con:addChild(slot0.attr_label)
		slot0.attr_label:setString(slot4)

		slot0.time = createRichLabel(22, 186, cc.p(0, 0), cc.p(30, 162))

		slot0.title_info_con:addChild(slot0.time)

		slot5 = ""

		slot0.time:setString(TI18N(string.format("使用期限：%s", (slot0.data.expire_time <= 0 or (not slot0.data.is_lock or TimeTool.GetTimeFormatDay(slot0.data.expire_time * 60)) and TimeTool.GetTimeFormatDay(slot0.data.expire_time - GameNet:getInstance():getTime())) and TI18N("永久"))))

		slot0.condition = createRichLabel(22, 175, cc.p(0, 1), cc.p(30, slot0.attr_label:getPositionY() - slot0.attr_label:getContentSize().height - 10), 0, 0, 300)

		slot0.title_info_con:addChild(slot0.condition)
		slot0.condition:setString(TI18N(string.format("获得条件：%s", slot0.data.desc)))
	end
end

function RoleFaceTips.adjustSize(slot0)
	if slot0.type == 1 then
		-- Nothing
	elseif slot0.type == 2 then
		slot0.main_container:setContentSize(cc.size(slot0.WIDTH, slot0.info_con:getContentSize().height))
		slot0.background:setContentSize(cc.size(slot0.WIDTH, slot0.info_con:getContentSize().height))
		slot0.info_con:setPosition(cc.p(0, slot0.background:getContentSize().height / 2))
		slot0.head:setAnchorPoint(0, 0.5)
		slot0.head:setPosition(210, slot0.info_con:getContentSize().height / 2)
		slot0.head:setFaceNameBgY(-16)
		slot0.head:showLock(false)
		slot0.time:setPositionY(slot0.info_con:getContentSize().height - 50)
		slot0.condition:setPositionY(slot0.time:getPositionY() - slot0.time:getContentSize().height - 10)
	elseif slot0.type == 3 then
		slot0.main_container:setContentSize(cc.size(slot0.WIDTH, slot0.HEIGHT))
		slot0.background:setContentSize(cc.size(slot0.WIDTH, slot0.HEIGHT))
	end
end

function RoleFaceTips.registerEvents(slot0)
	slot0.root_wnd:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:close()
		end
	end)
end

function RoleFaceTips.getRootWnd(slot0)
	return slot0.root_wnd
end

function RoleFaceTips.unRegisterEvent(slot0)
end

function RoleFaceTips.__close(slot0)
	doRemoveFromParent(slot0:getRootWnd())
end

function RoleFaceTips.close(slot0)
	if tolua.isnull(slot0:getRootWnd()) then
		return
	end

	slot0:unRegisterEvent()
	slot0:__close()
end
