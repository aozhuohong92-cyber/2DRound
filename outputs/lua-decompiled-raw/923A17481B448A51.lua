GuildwarPositionItem = class("GuildwarPositionItem", function ()
	return ccui.Widget:create()
end)
GuildwarPositionItem.Width = 190
GuildwarPositionItem.Height = 226

function GuildwarPositionItem.ctor(slot0)
	slot0.ctrl = GuildwarController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.star_list = {}

	slot0:configUI()
	slot0:register_event()
end

function GuildwarPositionItem.configUI(slot0)
	slot0.size = cc.size(GuildwarPositionItem.Width, GuildwarPositionItem.Height)

	slot0:setTouchEnabled(true)

	slot6 = 0.5

	slot0:setAnchorPoint(cc.p(slot6, 0))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("guildwar/guildwar_postion_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:setSwallowTouches(false)
	slot0.container:setSwallowTouches(false)

	for slot6 = 1, 3 do
		if slot0.container:getChildByName(string.format("star_%d", slot6)) then
			slot7:setVisible(false)

			slot0.star_list[({
				3,
				2,
				1
			})[slot6]] = slot7
		end
	end

	slot0.build = slot0.container:getChildByName("build")
	slot0.name_label = slot0.container:getChildByName("name_label")
	slot0.attk_label = slot0.container:getChildByName("attk_label")
	slot0.pos_bg = slot0.container:getChildByName("pos_bg")
	slot0.pos_label = slot0.pos_bg:getChildByName("pos_label")
	slot0.image_success = slot0.container:getChildByName("image_success")

	slot0.image_success:getChildByName("success_label"):setString(TI18N("挑战提升"))
	slot0.image_success:setVisible(false)
	slot0.image_success:setLocalZOrder(10)
end

function GuildwarPositionItem.register_event(slot0)
	slot0.container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.cur_position_type == GuildwarConst.positions.others and uv0.data and uv0.data.pos then
					if uv0.model:getGuildWarStatus() == GuildwarConst.status.settlement then
						message(TI18N("本次公会战已结束啦，不能再挑战了哦"))
					else
						uv0.ctrl:openAttkPositionWindow(true, uv0.data.pos)
					end
				elseif uv0.cur_position_type == GuildwarConst.positions.myself and uv0.data and uv0.data.pos and RoleController:getInstance():getRoleVo().gid ~= 0 then
					uv0.ctrl:openDefendLookWindow(true, slot3.gid, slot3.gsrv_id, uv0.data.pos)
				end
			end
		end
	end)
end

function GuildwarPositionItem.setData(slot0, slot1, slot2)
	if slot0.data ~= nil and slot0.update_self_event ~= nil then
		slot0.data:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	if slot1 ~= nil then
		slot0.data = slot1

		if slot0.update_self_event == nil then
			slot0.update_self_event = slot0.data:Bind(GuildwarEvent.UpdateGuildWarPositionDataEvent, function ()
				uv0:refreshPosition()
			end)
		end

		slot0.cur_position_type = slot2

		slot0:refreshPosition()
	end
end

function GuildwarPositionItem.refreshPosition(slot0)
	if slot0.data == nil then
		return
	end

	if slot0.data.hp == 0 then
		slot0.build:loadTexture(PathTool.getResFrame("guildwar", "guildwar_1020"), LOADTEXT_TYPE_PLIST)

		if not slot0.build_fall_effect then
			slot0.build_fall_effect = createEffectSpine(PathTool.getEffectRes(326), cc.p(GuildwarPositionItem.Width / 2 + 30, GuildwarPositionItem.Height / 2 + 10), cc.p(0.5, 0), true, PlayerAction.action)

			slot0.container:addChild(slot0.build_fall_effect)
		end

		slot0.build_fall_effect:setVisible(true)
	else
		slot0.build:loadTexture(PathTool.getResFrame("guildwar", "guildwar_1017"), LOADTEXT_TYPE_PLIST)

		if slot0.build_fall_effect then
			slot0.build_fall_effect:setVisible(false)
		end
	end

	for slot4 = 1, 3 do
		if slot0.data.hp < slot4 then
			slot0.star_list[slot4]:setVisible(true)
		else
			slot5:setVisible(false)
		end
	end

	slot0.pos_label:setString(slot0.data.pos)

	slot3 = 1

	if string.find(slot0.cur_position_type == GuildwarConst.positions.others and (slot0.model:getEnemyGuildWarBaseInfo().g_sid or "") or RoleController:getInstance():getRoleVo().gsrv_id or "", "_") then
		slot3 = string.sub("", slot2 + 1)
	end

	slot0.name_label:setString(string.format("[S%s]%s", slot3, slot0.data.name))
	slot0.attk_label:setString(TI18N(string.format("战力:%d", slot0.data.power)))
	slot0.image_success:setVisible(false)

	if slot0.cur_position_type == GuildwarConst.positions.myself then
		slot0.name_label:setTextColor(cc.c3b(123, 194, 244))
	else
		slot0.name_label:setTextColor(cc.c3b(244, 140, 123))
		slot0.image_success:setVisible(slot0.data.hp <= 0)
	end

	slot0.pos_bg:setPositionX(slot0.name_label:getPositionX() - slot0.name_label:getContentSize().width / 2)
end

function GuildwarPositionItem.getPositionPos(slot0)
	return slot0.data.pos
end

function GuildwarPositionItem.suspendAllActions(slot0)
	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end
end

function GuildwarPositionItem.DeleteMe(slot0)
	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end

	if slot0.build_fall_effect then
		slot0.build_fall_effect:clearTracks()
		slot0.build_fall_effect:removeFromParent()

		slot0.build_fall_effect = nil
	end
end
