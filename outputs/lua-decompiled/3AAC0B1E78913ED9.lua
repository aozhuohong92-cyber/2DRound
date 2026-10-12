LadderRoleItem = class("LadderRoleItem", function ()
	return ccui.Widget:create()
end)
LadderRoleItem.Width = 243
LadderRoleItem.Height = 280
slot1 = LadderController:getInstance():getModel()

function LadderRoleItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function LadderRoleItem.configUI(slot0)
	slot0.size = cc.size(LadderRoleItem.Width, LadderRoleItem.Height)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0.5, 0))

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("ladder/ladder_role_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.touch_layer = slot2:getChildByName("touch_layer")
	slot0.image_line = slot2:getChildByName("image_line")
	slot0.rank_label = slot2:getChildByName("rank_label")
	slot0.name_label = slot2:getChildByName("name_label")
	slot0.attk_label = slot2:getChildByName("attk_label")
	slot0.atk_icon = slot2:getChildByName("atk_icon")
	slot0.pos_role = slot2:getChildByName("pos_role")
	slot0.attk_image = slot2:getChildByName("attk_image")
	slot0.rank_bg = slot2:getChildByName("rank_bg")
end

function LadderRoleItem.register_event(slot0)
	registerButtonEventListener(slot0.touch_layer, handler(slot0, slot0._onClickBtnContainer))
end

function LadderRoleItem._onClickBtnContainer(slot0)
	if uv0:getLadderIsOpen() then
		uv1:openLadderRoleInfoWindow(true, slot0.data)
	elseif Config.SkyLadderData.data_const.close_text then
		message(string.format(TI18N("每%s天梯争霸"), slot2.desc))
	end
end

function LadderRoleItem.setData(slot0, slot1)
	slot0.data = slot1 or {}
	slot2 = uv0:getLadderIsOpen()

	if not slot1.rank or slot1.rank == 0 then
		slot0.rank_label:setFontSize(20)
		slot0.rank_label:setString(TI18N("未上榜"))
	else
		slot0.rank_label:setFontSize(20)
		slot0.rank_label:setString(string.format(TI18N("第%d名"), slot1.rank))
	end

	slot0.rank_bg:setContentSize(cc.size(slot0.rank_label:getContentSize().width + 10, 30))

	if slot2 then
		slot0.name_label:setString(transformNameByServ(slot1.name, slot1.srv_id))
		slot0.attk_label:setString(slot1.power or 0)
		slot0.attk_image:setVisible(true)
		slot0.atk_icon:setVisible(true)
		slot0.atk_icon:setPositionX(121 - slot0.attk_label:getContentSize().width / 2)
	else
		slot0.name_label:setString(TI18N("虚位以待"))

		if Config.SkyLadderData.data_const.close_text then
			slot0.attk_label:setString(slot4.desc)
		end

		slot0.attk_image:setVisible(false)
		slot0.atk_icon:setVisible(false)
	end

	if slot0.role_spine then
		slot0.role_spine:DeleteMe()

		slot0.role_spine = nil
	end

	if slot1.look then
		slot0.role_spine = BaseRole.new(BaseRole.type.role, slot1.look)

		slot0.role_spine:setCascade(true)
		slot0.role_spine:setAnchorPoint(cc.p(0.5, 0))
		slot0.role_spine:setPosition(cc.p(0, 80))
		slot0.role_spine:setScale(0.4)
		slot0.role_spine:setAnimation(0, PlayerAction.show, true)
		slot0.pos_role:addChild(slot0.role_spine)
	end

	if slot0:getRoleBoxResPath(slot1.rank) then
		slot0.image_line:loadTexture(slot4, LOADTEXT_TYPE_PLIST)
		slot0.image_line:setVisible(true)
	else
		slot0.image_line:setVisible(false)
	end
end

function LadderRoleItem.getRoleBoxResPath(slot0, slot1)
	slot2 = nil
	slot4 = 0

	if Config.SkyLadderData.data_const.role_box and slot3.val then
		for slot8, slot9 in pairs(slot3.val) do
			if slot9[1] <= slot1 and (slot1 <= slot9[2] or slot9[2] == 0) then
				slot4 = slot8
			end
		end
	end

	if slot4 == 1 then
		slot2 = PathTool.getResFrame("ladder", "ladder_1019")
	elseif slot4 == 2 then
		slot2 = PathTool.getResFrame("ladder", "ladder_1018")
	elseif slot4 == 3 then
		slot2 = PathTool.getResFrame("ladder", "ladder_1017")
	elseif slot4 == 4 then
		slot2 = PathTool.getResFrame("ladder", "ladder_1016")
	end

	return slot2
end

function LadderRoleItem.DeleteMe(slot0)
	if slot0.role_spine then
		slot0.role_spine:DeleteMe()

		slot0.role_spine = nil
	end
end
