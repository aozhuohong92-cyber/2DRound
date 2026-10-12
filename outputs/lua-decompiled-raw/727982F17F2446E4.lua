slot0 = class("ViewBase", cc.Node)

function slot0.ctor(slot0, slot1, slot2)
	slot0:enableNodeEvents()

	slot0.app_ = slot1
	slot0.name_ = slot2

	if rawget(slot0.class, "RESOURCE_FILENAME") then
		slot0:createResourceNode(slot3)
	end

	slot4 = rawget(slot0.class, "RESOURCE_BINDING")

	if slot3 and slot4 then
		slot0:createResourceBinding(slot4)
	end

	if slot0.onCreate then
		slot0:onCreate()
	end
end

function slot0.getApp(slot0)
	return slot0.app_
end

function slot0.getName(slot0)
	return slot0.name_
end

function slot0.getResourceNode(slot0)
	return slot0.resourceNode_
end

function slot0.createResourceNode(slot0, slot1)
	if slot0.resourceNode_ then
		slot0.resourceNode_:removeSelf()

		slot0.resourceNode_ = nil
	end

	slot0.resourceNode_ = cc.CSLoader:createNode(slot1)

	assert(slot0.resourceNode_, string.format("ViewBase:createResourceNode() - load resouce node from file \"%s\" failed", slot1))
	slot0:addChild(slot0.resourceNode_)
end

function slot0.createResourceBinding(slot0, slot1)
	slot5 = "ViewBase:createResourceBinding() - not load resource node"

	assert(slot0.resourceNode_, slot5)

	for slot5, slot6 in pairs(slot1) do
		if slot6.varname then
			slot0[slot6.varname] = slot0.resourceNode_:getChildByName(slot5)
		end

		for slot11, slot12 in ipairs(slot6.events or {}) do
			if slot12.event == "touch" then
				slot7:onTouch(handler(slot0, slot0[slot12.method]))
			end
		end
	end
end

function slot0.showWithScene(slot0, slot1, slot2, slot3)
	slot0:setVisible(true)

	slot4 = display.newScene(slot0.name_)

	slot4:addChild(slot0)
	display.runScene(slot4, slot1, slot2, slot3)

	return slot0
end

return slot0
