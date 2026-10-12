BarrageItemList = BarrageItemList or class("BarrageItemList", function ()
	return ccui.Widget:create()
end)
slot0 = BarrageController:getInstance()
slot1 = RoleController:getInstance():getRoleVo()

function BarrageItemList.ctor(slot0, slot1)
	slot0.id = slot1
	slot0.max_size = 30
	slot0.min_size = 25

	if Config.SubtitleData.data_const.sub_font and slot2.val then
		slot0.max_size = slot2.val[2] or 30
		slot0.min_size = slot2.val[1] or 25
	end

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("barrage/barrage_item_list"))
	slot0.content = slot0.root_wnd:getChildByName("content")

	slot0:addChild(slot0.root_wnd)
	slot0:retain()
	slot0:setContentSize(cc.size(100, 30))
	slot0:setAnchorPoint(cc.p(0, 0.5))
end

function BarrageItemList.createAction(slot0, slot1)
	if slot0.content ~= nil and not tolua.isnull(slot0.content) then
		slot0:runAction(cc.Sequence:create(cc.MoveBy:create(slot1, cc.p(-display.width - slot0.size.width - 30, 15)), cc.CallFunc:create(function ()
			if uv0.action_call_back ~= nil then
				uv0:action_call_back()
			end
		end)))
	end
end

function BarrageItemList.actionFinishCallBack(slot0, slot1)
	slot0.action_call_back = slot1
end

function BarrageItemList.update(slot0, slot1)
	if slot1 == nil or slot1.msg == "" then
		return
	end

	slot0.content:setFontSize(math.ceil(math.random(slot0.min_size, slot0.max_size)))

	if Config.SubtitleData.data_const.sub_color == nil then
		slot3 = {
			val = {
				91,
				97
			}
		}
	end

	slot0.content:setTextColor(Config.ColorData.data_color4[math.ceil(math.random(slot3.val[1], slot3.val[2]))])
	slot0.content:setString(string.gsub(slot1.msg, "\n", ""))

	slot0.size = slot0.content:getContentSize()

	slot0.root_wnd:setPositionY(slot0.size.height / 2)
	slot0:setContentSize(slot0.size)
	slot0:checkSelfBarrage(slot1)

	if Config.SubtitleData.data_const.sub_speed == nil then
		slot6 = {
			val = {
				14,
				20
			}
		}
	end

	slot0:createAction(math.ceil(math.random(slot6.val[1], slot6.val[2])))
end

function BarrageItemList.checkSelfBarrage(slot0, slot1)
	slot2 = false

	if slot1 == nil or slot1.rid == 0 or slot1.srv_id == "" then
		slot2 = false
	elseif uv0 == nil then
		slot2 = false
	else
		if_self = getNorKey(slot1.rid, slot1.srv_id) == getNorKey(uv0.rid, uv0.srv_id)
	end

	if if_self == true then
		if slot0.self_notice_frame == nil then
			slot0.self_notice_frame = createImage(slot0.root_wnd, PathTool.getResFrame("common", "common_1055"), slot0.content:getPositionX() - 6, slot0.content:getPositionY() - 2, cc.p(0, 0.5), true, -1, true)
		end

		slot0.self_notice_frame:setContentSize(cc.size(slot0.size.width + 16, slot0.size.height + 8))
	elseif slot0.self_notice_frame ~= nil then
		slot0.self_notice_frame:removeFromParent()

		slot0.self_notice_frame = nil
	end
end

function BarrageItemList.clearInfo(slot0)
	doStopAllActions(slot0)
	slot0:removeFromParent()
end

function BarrageItemList.DeleteMe(slot0)
	doStopAllActions(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
	slot0:release()
end
