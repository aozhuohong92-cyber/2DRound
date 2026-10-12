slot1 = PetardActionController:getInstance():getModel()
slot2 = string.format
PetardRedbagInfoItem = class("PetardRedbagInfoItem", function ()
	return ccui.Widget:create()
end)

function PetardRedbagInfoItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function PetardRedbagInfoItem.configUI(slot0)
	slot0.size = cc.size(453, 92)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("petard/petard_redbag_info_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot2
	slot0.image_bg = slot2:getChildByName("image_bg")
	slot0.time_txt = slot2:getChildByName("time_txt")

	slot0.time_txt:setTextColor(cc.c4b(255, 255, 255, 255))
	slot0.time_txt:setPosition(cc.p(102, 30))

	slot0.name_txt = createRichLabel(24, cc.c4b(255, 234, 150, 255), cc.p(0, 0.5), cc.p(102, 62))

	slot2:addChild(slot0.name_txt)

	slot0.award_txt = createRichLabel(24, 1, cc.p(1, 0.5), cc.p(425, 46))

	slot2:addChild(slot0.award_txt)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setScale(0.8)
	slot0.role_head:setPosition(cc.p(50, 46))
	slot2:addChild(slot0.role_head)
end

function PetardRedbagInfoItem.register_event(slot0)
end

function PetardRedbagInfoItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.role_head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)

	if RoleController:getInstance():getRoleVo().rid == slot1.r_rid and slot2.srv_id == slot1.r_srvid then
		slot0.is_myself = true

		slot0.name_txt:setString(uv0("%s  <img src='%s' scale=1.0 />", slot1.name, PathTool.getResFrame("actionpetard", "txt_cn_petard_myself")))
		slot0.image_bg:setVisible(true)
		slot0.image_bg:loadTexture(PathTool.getResFrame("actionpetard", "actionpetard_1009"), LOADTEXT_TYPE_PLIST)
	else
		slot0.is_myself = false

		slot0.name_txt:setString(slot1.name)
	end

	slot0.time_txt:setString(TimeTool.getMDHMS(slot1.time))

	for slot7, slot8 in ipairs(slot1.item or {}) do
		if Config.ItemData.data_get_data(slot8.item_id) then
			slot3 = "" .. uv0("<img src='%s' scale=0.3 /> %d", PathTool.getItemRes(slot11.icon), slot8.num or 0)
		end
	end

	slot0.award_txt:setString(slot3)
end

function PetardRedbagInfoItem.setIndex(slot0, slot1)
	if slot0.is_myself or not slot1 then
		return
	end

	if slot1 % 2 == 0 then
		slot0.image_bg:setVisible(false)
	else
		slot0.image_bg:setVisible(true)
		slot0.image_bg:loadTexture(PathTool.getResFrame("actionpetard", "actionpetard_1008"), LOADTEXT_TYPE_PLIST)
	end
end

function PetardRedbagInfoItem.DeleteMe(slot0)
	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
