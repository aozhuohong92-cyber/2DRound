slot1 = HeavenController:getInstance():getModel()
slot2 = table.insert
HeavenCustomsItem = class("HeavenCustomsItem", function ()
	return ccui.Widget:create()
end)

function HeavenCustomsItem.ctor(slot0, slot1)
	slot0.call_back = slot1
	slot0.star_list = {}

	slot0:configUI()
	slot0:register_event()
end

function HeavenCustomsItem.configUI(slot0)
	slot0.size = cc.size(120, 180)

	slot0:setTouchEnabled(false)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("heaven/heaven_customs_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.customs_icon = slot2:getChildByName("customs_icon")

	slot0.customs_icon:ignoreContentAdaptWithSize(true)

	slot0.customs_num = slot0.root_wnd:getChildByName("customs_num")
	slot0.boss_sp = slot0.root_wnd:getChildByName("boss_sp")

	slot0.boss_sp:setVisible(false)

	slot0.arrow_sp = slot2:getChildByName("arrow_sp")
	slot6 = false

	slot0.arrow_sp:setVisible(slot6)

	for slot6 = 1, 3 do
		if slot2:getChildByName("star_" .. slot6) then
			uv0(slot0.star_list, slot7)
		end
	end

	slot2:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveBy:create(1, cc.p(0, 8)), cc.MoveBy:create(1, cc.p(0, -8)))))
end

function HeavenCustomsItem.register_event(slot0)
	registerButtonEventListener(slot0.container, function ()
		if uv0.select_status and uv0.customs_vo then
			if uv0.customs_vo.star == 3 then
				message(TI18N("本关已经完美通关啦"))
			elseif uv0.cfg_data then
				if uv0.cfg_data.type == 1 then
					HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.HeavenBoss, {
						chapter_id = uv0.cfg_data.id,
						customs_id = uv0.cfg_data.order_id
					})
				else
					HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.Heaven, {
						chapter_id = uv0.cfg_data.id,
						customs_id = uv0.cfg_data.order_id
					})
				end
			end
		elseif uv0.call_back then
			uv0:call_back()
		end
	end)
end

function HeavenCustomsItem.setData(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	if slot0.customs_vo ~= nil and slot0.update_self_event ~= nil then
		slot0.customs_vo:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	slot0.cfg_data = slot2
	slot0.customs_vo = slot1

	if slot0.customs_vo and slot0.update_self_event == nil then
		slot0.update_self_event = slot0.customs_vo:Bind(HeavenEvent.Update_Customs_Vo_Event, function ()
			uv0:updateStarInfo()
		end)
	end

	slot0:updateCustomsItem()
end

function HeavenCustomsItem.updateCustomsItem(slot0)
	if not slot0.cfg_data then
		return
	end

	if not slot0.icon_res_id or slot0.icon_res_id ~= slot0.cfg_data.res_id then
		slot0.icon_res_id = slot0.cfg_data.res_id
		slot0.res_load = loadImageTextureFromCDN(slot0.customs_icon, PathTool.getHeavenCustomsIconRes(slot0.cfg_data.res_id), ResourcesType.single, slot0.res_load)
	end

	if slot0.cfg_data.type == 1 then
		slot0.customs_num:setVisible(false)
		slot0.boss_sp:setVisible(true)
	else
		slot0.boss_sp:setVisible(false)
		slot0.customs_num:setVisible(true)
		slot0.customs_num:setString(slot0.cfg_data.id .. "-" .. slot0.cfg_data.order_id)
	end

	slot0:updateStarInfo()
end

function HeavenCustomsItem.updateStarInfo(slot0)
	slot1 = 0

	if slot0.customs_vo then
		slot1 = slot0.customs_vo.star
	end

	for slot5, slot6 in ipairs(slot0.star_list) do
		slot6:setVisible(slot5 <= slot1)
	end
end

function HeavenCustomsItem.setSelected(slot0, slot1)
	if slot1 == true then
		slot0.container:setScale(1.1)
		slot0.arrow_sp:setVisible(true)
		slot0:setLocalZOrder(99)
	else
		slot0.container:setScale(1)
		slot0.arrow_sp:setVisible(false)
		slot0:setLocalZOrder(1)
	end

	slot0.select_status = slot1
end

function HeavenCustomsItem.getData(slot0)
	return slot0.cfg_data
end

function HeavenCustomsItem.getCustomsId(slot0)
	if slot0.cfg_data then
		return slot0.cfg_data.order_id
	end
end

function HeavenCustomsItem.DeleteMe(slot0)
	if slot0.res_load then
		slot0.res_load:DeleteMe()

		slot0.res_load = nil
	end

	if slot0.customs_vo ~= nil and slot0.update_self_event ~= nil then
		slot0.customs_vo:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
