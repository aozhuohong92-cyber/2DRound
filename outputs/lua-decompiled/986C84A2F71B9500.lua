UITemplate = UITemplate or BaseClass()

function UITemplate.__init(slot0)
	slot0.template_name = ""
	slot0.resource_path = nil
	slot0.is_opening = false
	slot0.___enabled = true
	slot0.___visible = true
end

function UITemplate.__delete(slot0)
	if slot0.root_wnd and not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:removeAllChildren()
		slot0.root_wnd:removeFromParent()

		if slot0:getReferenceCount() > 1 then
			slot0.root_wnd:release()
		end

		slot0.root_wnd = nil
	end

	slot0.is_opening = false

	slot0:removeTemplate()
end

function UITemplate.InitTemplateInfo(slot0, slot1, slot2)
	slot0.is_opening = true

	if slot2 ~= nil then
		slot0.template_name = slot2
	end

	slot3 = nil

	if not slot0:__isClone() then
		slot0:addTemplate(ccs.GUIReader:getInstance():widgetFromJsonFile(slot0.template_name))
	end

	slot0.root_wnd = slot0:__clone()

	slot0.root_wnd:retain()
	slot0:registerNodeScriptHandler()
	slot0:setParent(slot1)
end

function UITemplate.registerNodeScriptHandler(slot0)
	slot0.root_wnd:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			if uv0.onEnter then
				uv0:onEnter()
			end
		elseif slot0 == "exit" and uv0.onExit then
			uv0:onExit()
		end
	end)
end

function UITemplate.setParent(slot0, slot1)
	if slot0.root_wnd and not tolua.isnull(slot0.root_wnd) and slot0.root_wnd:getParent() then
		slot0.root_wnd:removeFromParent()
	end

	if slot1 ~= nil and slot0.root_wnd ~= nil then
		slot1:addChild(slot0.root_wnd)
	end
end

function UITemplate.setEnabled(slot0, slot1)
	if slot0.___enabled == slot1 or slot0.root_wnd == nil then
		return
	end

	slot0.root_wnd:setEnabled(slot1)

	slot0.___enabled = slot1
end

function UITemplate.setVisible(slot0, slot1)
	if slot0.___visible == slot1 or slot0.root_wnd == nil then
		return
	end

	slot0.root_wnd:setVisible(slot1)

	if slot1 == false then
		slot0.___enabled = slot0.root_wnd:isEnabled()

		slot0.root_wnd:setEnabled(false)
	else
		slot0.root_wnd:setEnabled(slot0.___enabled)
	end
end

function UITemplate.getVisible(slot0)
	return slot0.___visible
end

function UITemplate.getEnabled(slot0)
	return slot0.___enabled
end

function UITemplate.getReferenceCount(slot0)
	return slot0.root_wnd:getReferenceCount()
end

UITemplate.template_list = {}
UITemplate.template_count = {}

function UITemplate.addTemplate(slot0, slot1)
	if not UITemplate.template_count[slot0.template_name] then
		UITemplate.template_count[slot0.template_name] = 1
		UITemplate.template_list[slot0.template_name] = slot1

		slot1:retain()
	else
		UITemplate.template_count[slot0.template_name] = UITemplate.template_count[slot0.template_name] + 1
	end
end

function UITemplate.removeTemplate(slot0)
	if UITemplate.template_count[slot0.template_name] then
		UITemplate.template_count[slot0.template_name] = UITemplate.template_count[slot0.template_name] - 1

		if UITemplate.template_count[slot0.template_name] <= 0 then
			if UITemplate.template_list[slot0.template_name] and not tolua.isnull(slot1) and slot1.getReferenceCount and slot1:getReferenceCount() > 1 then
				UITemplate.template_list[slot0.template_name]:release()
			end

			UITemplate.template_list[slot0.template_name] = nil
			UITemplate.template_count[slot0.template_name] = nil
		end
	end
end

function UITemplate.__clone(slot0)
	return UITemplate.template_list[slot0.template_name]:clone()
end

function UITemplate.__isClone(slot0)
	if not UITemplate.template_list[slot0.template_name] then
		return false
	end

	if not UITemplate.template_count[slot0.template_name] then
		return false
	end

	return true
end

function UITemplate.addChild(slot0, slot1)
	slot0.root_wnd:addChild(slot1)
end

function UITemplate.removeChild(slot0, slot1)
	slot0.root_wnd:removeChild(slot1)
end

function UITemplate.removeAllChildren(slot0)
	slot0.root_wnd:removeAllChildren()
end

function UITemplate.setPosition(slot0, slot1)
	slot0.root_wnd:setPosition(slot1)
end

function UITemplate.getPosition(slot0)
	slot0.root_wnd:getPosition()
end
