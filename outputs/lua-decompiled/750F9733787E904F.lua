HolyEqmAtlasTab = class("HolyEqmAtlasTab", function ()
	return ccui.Widget:create()
end)
HolyEqmAtlasTab.Width = 100
HolyEqmAtlasTab.Height = 50

function HolyEqmAtlasTab.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HolyEqmAtlasTab.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/holy_eqm_atlas_tab"))

	slot0.root_wnd:setContentSize(cc.size(HolyEqmAtlasTab.Width, HolyEqmAtlasTab.Height))
	slot0:addChild(slot0.root_wnd)
	slot0:setTouchEnabled(true)
	slot0:setContentSize(cc.size(HolyEqmAtlasTab.Width, HolyEqmAtlasTab.Height))

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.select = slot1:getChildByName("select")

	slot0.select:setScaleX(-1)

	slot0.normal = slot1:getChildByName("normal")

	slot0.normal:setScaleX(-1)
	slot0.normal:setVisible(false)

	slot0.name = slot1:getChildByName("name")

	slot0.name:setString("")
	slot0.name:setTextColor(cc.c4b(206, 223, 255, 255))
	slot0.name:enableOutline(cc.c4b(57, 91, 142, 255), 2)
end

function HolyEqmAtlasTab.setSelect(slot0, slot1)
	if slot0.select then
		slot0.select:setVisible(slot1)
	end

	if slot0.name then
		if slot1 then
			slot0.name:setTextColor(cc.c4b(206, 223, 255, 255))
			slot0.name:enableOutline(cc.c4b(57, 91, 142, 255), 2)
		else
			slot0.name:setTextColor(cc.c4b(255, 255, 255, 255))
			slot0.name:enableOutline(cc.c4b(189, 70, 2, 255), 2)
		end
	end
end

function HolyEqmAtlasTab.setNormal(slot0, slot1)
	if slot0.normal then
		slot0.normal:setVisible(slot1)
	end
end

function HolyEqmAtlasTab.setName(slot0, slot1)
end

function HolyEqmAtlasTab.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function HolyEqmAtlasTab.register_event(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 then
				playTabButtonSound()

				if uv0.callback and uv0.data_index then
					uv0.callback(uv0.data_index)
				end
			end
		end
	end)
end

function HolyEqmAtlasTab.setData(slot0, slot1, slot2, slot3)
	slot0.data_index = slot1

	slot0.select:setFlippedX(false)
	slot0.normal:setFlippedX(false)

	if slot1 == 1 then
		slot0.select:loadTexture(PathTool.getResFrame("common", "common_1042"), LOADTEXT_TYPE_PLIST)
		slot0.select:setFlippedX(true)
		slot0.normal:loadTexture(PathTool.getResFrame("common", "common_1050"), LOADTEXT_TYPE_PLIST)
		slot0.normal:setFlippedX(true)
	elseif slot1 == slot2 then
		slot0.select:loadTexture(PathTool.getResFrame("common", "common_1042"), LOADTEXT_TYPE_PLIST)
		slot0.normal:loadTexture(PathTool.getResFrame("common", "common_1050"), LOADTEXT_TYPE_PLIST)
	end

	if slot3 and slot3.name then
		slot0.name:setString(string.sub(slot3.name, 1, 6))
	end

	if slot1 == 1 or slot1 == slot2 then
		slot0.select:setCapInsets(cc.rect(20, 0, 109, 58))
		slot0.normal:setCapInsets(cc.rect(20, 0, 109, 58))
	else
		slot0.select:setCapInsets(cc.rect(20, 20, 112, 18))
		slot0.normal:setCapInsets(cc.rect(20, 20, 112, 18))
	end
end

function HolyEqmAtlasTab.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
