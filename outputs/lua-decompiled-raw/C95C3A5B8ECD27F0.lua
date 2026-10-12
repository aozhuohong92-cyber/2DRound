RefFacesUI = RefFacesUI or BaseClass()

function RefFacesUI.__init(slot0, slot1)
	slot0.parent = slot1

	slot0:createRootWnd()
end

function RefFacesUI.createRootWnd(slot0)
	slot0.size = slot0.parent:getContentSize()
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.parent, cc.p(8, 8), nil, , cc.size(slot0.size.width - 16, slot0.size.height - 16), {
		start_y = 2,
		once_num = 5,
		start_x = 18,
		item_width = 46,
		space_x = 20,
		row = 5,
		item_height = 46,
		space_y = 15,
		col = 8,
		need_dynamic = true,
		item_class = RefFacesUIItem
	})
	slot0.face_count = 0

	slot0:setData()

	if not slot0.face_count_evt then
		slot0.face_count_evt = GlobalEvent:getInstance():Bind(ChatEvent.FACE_COUNT_EVENT, function (slot0)
			uv0.face_count = slot0 or 0
		end)
	end
end

function RefFacesUI.setVisible(slot0, slot1)
	if not tolua.isnull(slot0.scroll_view) then
		slot0.scroll_view:setVisible(slot1)
	end
end

function RefFacesUI.setData(slot0)
	slot0.scroll_view:setData(Config.FaceData.data_biaoqing, function (slot0)
		uv0:onFaceTouched(slot0)
	end)
end

function RefFacesUI.onFaceTouched(slot0, slot1)
	slot3 = 0

	if ((RefController:getInstance():getFrom() == ChatConst.ChatInputType.eMessageBoardpanel or slot2 == ChatConst.ChatInputType.eArenateam or slot2 == ChatConst.ChatInputType.eMessageBoardReplyPanel) and (slot0.face_count or 0) or ChatController:getInstance():getTextInputFace()) >= 5 then
		message(TI18N("发言中不能超过5个表情"))
	else
		GlobalEvent:getInstance():Fire(EventId.CHAT_SELECT_FACE, slot1, slot2)
	end
end

function RefFacesUI.__delete(slot0)
	if slot0.face_count_evt then
		GlobalEvent:getInstance():UnBind(slot0.face_count_evt)

		slot0.face_count_evt = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

RefFacesUIItem = class("RefFacesUIItem", function ()
	return ccui.Layout:create()
end)

function RefFacesUIItem.ctor(slot0)
	slot0.effect_spine_name = ""
	slot0.size = cc.size(46, 46)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(0.5, 0.5)
	slot0:setTouchEnabled(true)

	slot0.face_bg = createSprite(PathTool.getResFrame("mainui", "mainui_chat_face_bg"), 23, 23, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

	slot0:registerEvent()
end

function RefFacesUIItem.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if ccui.TouchEventType.ended == slot1 then
			playButtonSound2()

			if uv0.call_back and uv0.effect_spine_name ~= "" then
				uv0.call_back(uv0.effect_spine_name)
			end
		end
	end)
end

function RefFacesUIItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 and slot0.effect_name ~= slot1.name then
		slot0.effect_name = slot1.name

		slot0:clearEffectSpine()

		slot0.effect_spine = createSpineByName(slot1.name)

		slot0.effect_spine:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.effect_spine:setAnimation(0, PlayerAction.action, true)
		slot0.effect_spine:setPosition(23, 23)
		slot0:addChild(slot0.effect_spine)

		slot0.effect_spine_name = "#" .. slot1.id
	end
end

function RefFacesUIItem.clearEffectSpine(slot0)
	if slot0.effect_spine then
		slot0.effect_spine:removeFromParent()

		slot0.effect_spine = nil
		slot0.effect_spine_name = ""
	end
end

function RefFacesUIItem.clearTimeTicket(slot0)
end

function RefFacesUIItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function RefFacesUIItem.suspendAllActions(slot0)
end

function RefFacesUIItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
