slot1 = HomeworldController:getInstance():getModel()
HomeworldMyPlanItem = class("HomeworldMyPlanItem", function ()
	return ccui.Widget:create()
end)

function HomeworldMyPlanItem.ctor(slot0, slot1)
	slot0.open_type = slot1

	slot0:configUI()
	slot0:register_event()
end

function HomeworldMyPlanItem.configUI(slot0)
	slot0.size = cc.size(155, 196)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("homeworld/homeworld_my_plan_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0.container:setSwallowTouches(false)

	slot0.name_txt = slot0.container:getChildByName("name_txt")
	slot0.use_sp = slot0.container:getChildByName("use_sp")

	slot0.use_sp:setVisible(false)

	slot0.image_bg = createSprite(PathTool.getResFrame("common", "common_1005"), slot0.size.width * 0.5, slot0.size.height * 0.5 + 20, slot0.container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
end

function HomeworldMyPlanItem.register_event(slot0)
	registerButtonEventListener(slot0.container, function ()
		if uv0.data and uv0.open_type == 1 then
			uv1:openHomeworldSuitWindow(true, uv0.data.set_id)
		end
	end, true, 1, nil, nil, nil, true)

	if not slot0.update_red_status_event and slot0.open_type == 1 then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(HomeworldEvent.Update_Red_Status_Data, function (slot0, slot1)
			if slot0 == HomeworldConst.Red_Index.Suit then
				uv0:updateSuitAwardRedStatus()
			end
		end)
	end
end

function HomeworldMyPlanItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.name_txt:setString(slot1.name)

	if not slot0.image_icon then
		slot0.image_icon = createSprite(nil, slot0.size.width * 0.5, slot0.size.height * 0.5 + 20, slot0.container, cc.p(0.5, 0.5), LOADTEXT_TYPE)
	end

	if not slot0.cur_res_id or slot0.cur_res_id ~= slot1.res_id then
		slot0.cur_res_id = slot1.res_id
		slot0.icon_load = loadSpriteTextureFromCDN(slot0.image_icon, PathTool.getSuitIconRes(slot1.res_id), ResourcesType.single, slot0.icon_load)
	end

	if slot0.open_type == 1 then
		slot0:updateSuitAwardRedStatus()
	end
end

function HomeworldMyPlanItem.updateSuitAwardRedStatus(slot0)
	if slot0.data then
		addRedPointToNodeByStatus(slot0.container, uv0:checkSuitAwardRedStatus(slot0.data.set_id))
	end
end

function HomeworldMyPlanItem.suspendAllActions(slot0)
end

function HomeworldMyPlanItem.DeleteMe(slot0)
	if slot0.icon_load then
		slot0.icon_load:DeleteMe()

		slot0.icon_load = nil
	end

	if slot0.update_red_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_red_status_event)

		slot0.update_red_status_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
