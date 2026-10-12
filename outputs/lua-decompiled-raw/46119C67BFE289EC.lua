slot1 = PetardActionController:getInstance():getModel()
slot2 = string.format
PetardRedbagMsgItem = class("PetardRedbagMsgItem", function ()
	return ccui.Widget:create()
end)

function PetardRedbagMsgItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function PetardRedbagMsgItem.configUI(slot0)
	slot0.size = cc.size(596, 123)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("petard/petard_redbag_msg_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot2
	slot0.time_txt = slot2:getChildByName("time_txt")

	slot0.time_txt:setPosition(cc.p(126, 36))

	slot0.msg_txt = createRichLabel(24, 274, cc.p(0, 0.5), cc.p(126, 90))

	slot2:addChild(slot0.msg_txt)

	slot0.award_txt = createRichLabel(26, cc.c4b(149, 83, 34, 255), cc.p(1, 0.5), cc.p(560, 61.5))

	slot2:addChild(slot0.award_txt)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setPosition(cc.p(64, 61.5))
	slot2:addChild(slot0.role_head)
end

function PetardRedbagMsgItem.register_event(slot0)
end

function PetardRedbagMsgItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.role_head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
	slot0.role_head:setLev(slot1.lev)
	slot0.msg_txt:setString(uv0(TI18N("<div fontcolor=249003>%s</div> 拆开红包获得"), slot1.name))
	slot0.time_txt:setString(TimeTool.getYMDHM(slot1.time))

	for slot6, slot7 in ipairs(slot1.item or {}) do
		if Config.ItemData.data_get_data(slot7.item_id) then
			slot2 = "" .. uv0("<img src='%s' scale=0.3 /> %d", PathTool.getItemRes(slot10.icon), slot7.num or 0)
		end
	end

	slot0.award_txt:setString(slot2)
end

function PetardRedbagMsgItem.DeleteMe(slot0)
	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
