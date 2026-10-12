WelfareTab = WelfareTab or class("WelfareTab", function ()
	return ccui.Widget:create()
end)

function WelfareTab.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/welfare_tab"))

	slot0:setAnchorPoint(cc.p(0, 0.5))
	slot0:setContentSize(cc.size(123, 166))
	slot0:setTouchEnabled(true)
	slot0:setSwallowTouches(false)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.name = slot0.main_container:getChildByName("name")
	slot0.red_point = slot0.main_container:getChildByName("red_point")
	slot0.icon = slot0.main_container:getChildByName("icon")
	slot0.stage = slot0.main_container:getChildByName("stage")
	slot0.select = slot0.main_container:getChildByName("select")

	slot0:registerEvent()
end

function WelfareTab.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.call_back ~= nil then
				uv0:call_back()
			end
		end
	end)
end

function WelfareTab.setData(slot0, slot1)
	if slot1 ~= nil then
		slot0.data = slot1

		slot0.name:setString(slot0.data.title)

		if not slot0.item_load then
			slot0.item_load = createResourcesLoad(PathTool.getTargetRes("welfare/action_icon", "welfare_icon_" .. (slot0.data.ico or 1), false, false), ResourcesType.single, function ()
				if not tolua.isnull(uv0.icon) then
					loadSpriteTexture(uv0.icon, uv1, LOADTEXT_TYPE)
				end
			end, slot0.item_load)
		end
	end
end

function WelfareTab.updateTipsStatus(slot0, slot1)
	slot0.red_point:setVisible(slot1)
end

function WelfareTab.getData(slot0)
	return slot0.data
end

function WelfareTab.setSelecte(slot0, slot1)
	if slot1 then
		slot0.select:setVisible(true)
		loadSpriteTexture(slot0.select, PathTool.getResFrame("welfaretab", "welfaretab_1"), LOADTEXT_TYPE_PLIST)
	else
		slot0.select:setVisible(false)
	end
end

function WelfareTab.setClickCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function WelfareTab.DeleteMe(slot0)
	if slot0.data then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
