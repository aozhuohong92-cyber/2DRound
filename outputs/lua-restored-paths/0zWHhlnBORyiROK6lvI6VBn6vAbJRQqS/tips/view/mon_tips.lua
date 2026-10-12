MonTips = class("MonTips", function ()
	return ccui.Layout:create()
end)

function MonTips.ctor(slot0)
	slot0:setTouchEnabled(true)
	slot0:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	showLayoutRect(slot0)
	slot0:initView()
	slot0:registerEvents()
end

function MonTips.initView(slot0)
	slot0.main_container = ccui.Widget:create()

	slot0.main_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.main_container:setPosition(cc.p(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5))
	slot0:addChild(slot0.main_container)

	slot0.background = ccui.ImageView:create(PathTool.getBgRes("bg_9"), LOADTEXT_TYPE)

	slot0.background:setScale9Enabled(true)
	slot0.background:setCapInsets(cc.rect(80, 20, 10, 10))
	slot0.background:setContentSize(cc.size(350, 200))
	slot0.background:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.background:setPosition(cc.p(0, 0))
	slot0.background:setTouchEnabled(true)
	slot0.main_container:addChild(slot0.background)

	slot0.close_btn = ccui.Button:create(PathTool.getBtnRes("close"), "", "", LOADTEXT_TYPE)

	slot0.close_btn:setPosition(cc.p(135, 65))
	slot0.close_btn:setScale(0.8)
	slot0.main_container:addChild(slot0.close_btn)

	slot0.mon_head = CommonHead.new()

	slot0.mon_head:setScale(0.7)
	slot0.mon_head:setPosition(cc.p(-106, 38))
	slot0.main_container:addChild(slot0.mon_head)

	slot0.mon_name = CustomTool.createLabel(Config.Color4[15], Config.Color4[119], 20, cc.p(0, 0.5))

	slot0.mon_name:setPosition(cc.p(-62, 58))
	slot0.mon_name:setString("")
	slot0.main_container:addChild(slot0.mon_name)

	slot0.mon_boss = CustomTool.createLabel(Config.Color4[44], Config.Color4[119], 20, cc.p(0, 0.5))

	slot0.mon_boss:setPosition(cc.p(-62, 25))
	slot0.mon_boss:setString("Boss")
	slot0.main_container:addChild(slot0.mon_boss)

	slot0.mon_desc = CustomTool.createLabel(Config.Color4[15], Config.Color4[119], 20, cc.p(0, 0.5))

	slot0.mon_desc:setPosition(cc.p(-132, -50))
	slot0.mon_desc:setWidth(280)
	slot0.main_container:addChild(slot0.mon_desc)
end

function MonTips.setMonData(slot0, slot1)
	if slot1.bid and Config.Mon[slot1.bid] then
		slot0.mon_head:setHeadData({
			quality = slot2.quality,
			res_id = slot2.res_id
		})
		slot0.mon_name:setString(slot2.name .. " LV." .. slot2.lev)
		slot0.mon_desc:setString(slot2.desc)

		if slot2.type == 4 then
			slot0.mon_boss:setVisible(true)
		else
			slot0.mon_boss:setVisible(false)
		end
	end
end

function MonTips.registerEvents(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:close()
		end
	end)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:close()
		end
	end)
end

function MonTips.close(slot0)
	if slot0:getParent() then
		slot0:removeAllChildren()
		slot0:removeFromParent()

		slot0 = nil
	end
end
