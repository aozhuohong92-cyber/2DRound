ChooseFacePanel = ChooseFacePanel or BaseClass(BaseView)
slot0 = ElitematchController:getInstance()

function ChooseFacePanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "elitematch/choose_face_panel"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
end

function ChooseFacePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.share_panel = slot0.root_wnd:getChildByName("share_panel")
	slot0.share_bg = slot0.share_panel:getChildByName("share_bg")
	slot1 = slot0.share_bg:getChildByName("face_list")
	slot0.face_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		item_width = 235,
		start_x = 0,
		space_x = 2,
		row = 0,
		item_height = 121,
		space_y = 0,
		col = 2,
		need_dynamic = true,
		item_class = ChooseFaceItem
	})

	slot0.face_scrollview:setSwallowTouches(false)
end

function ChooseFacePanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 1)
end

function ChooseFacePanel.onClickCloseBtn(slot0)
	uv0:openChooseFacePanel(false)
end

function ChooseFacePanel.setSelectCheckBox(slot0)
	if not slot0.face_scrollview then
		return
	end

	for slot5, slot6 in pairs(slot0.face_scrollview:getItemList()) do
		slot6:setCurFaceId(slot0.select_checkbox)

		if slot6:getFaceIndex() == slot0.select_checkbox then
			slot6:setSelectStatus(true)
		else
			slot6:setSelectStatus(false)
		end
	end
end

function ChooseFacePanel._onClickFaceItem(slot0, slot1)
	slot0.select_checkbox = slot1

	if Config.ArenaEliteData.data_face[slot1] then
		GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_Declaration_Face_Event, slot0.index, slot2[slot1])
	end

	slot0:setSelectCheckBox()
end

function ChooseFacePanel.openRootWnd(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	if not slot3 then
		return
	end

	slot0.index = slot1
	slot0.select_checkbox = slot2

	slot0.face_scrollview:setData(Config.ArenaEliteData.data_face, handler(slot0, slot0._onClickFaceItem), nil, {
		msg_type = slot4
	})
	slot0.face_scrollview:addEndCallBack(function ()
		uv0:setSelectCheckBox()
	end)

	if slot0.share_panel:convertToNodeSpace(slot3) then
		slot0.share_bg:setPosition(cc.p(slot7.x - 191, slot7.y))
	end
end

function ChooseFacePanel.close_callback(slot0)
	if slot0.spine_list then
		for slot4, slot5 in ipairs(slot0.spine_list) do
			slot5:clearTracks()
			slot5:removeFromParent()
		end
	end

	if slot0.face_scrollview then
		slot0.face_scrollview:DeleteMe()

		slot0.face_scrollview = nil
	end

	slot0.spine_list = nil

	uv0:openChooseFacePanel(false)
end

ChooseFaceItem = class("ChooseFaceItem", function ()
	return ccui.Widget:create()
end)

function ChooseFaceItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ChooseFaceItem.configUI(slot0)
	slot0.size = cc.size(235, 121)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("elitematch/choose_face_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.checkbox = slot0.container:getChildByName("checkbox")

	slot0.checkbox:setSelected(false)
	slot0.checkbox:setPositionX(170)

	slot0.name = slot0.checkbox:getChildByName("name")
end

function ChooseFaceItem.setExtendData(slot0, slot1)
	slot0.msg_type = slot1.msg_type
end

function ChooseFaceItem.register_event(slot0)
	slot0.checkbox:addEventListener(function (slot0, slot1)
		playButtonSound2()

		if uv0.call_back and uv0.data then
			uv0.call_back(uv0.data.id)
		end
	end)
end

function ChooseFaceItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function ChooseFaceItem.getFaceIndex(slot0)
	if slot0.data then
		return slot0.data.id
	end
end

function ChooseFaceItem.setSelectStatus(slot0, slot1)
	if slot0.checkbox then
		slot0.checkbox:setSelected(slot1)
	end
end

function ChooseFaceItem.setCurFaceId(slot0, slot1)
	slot0.cur_face_id = slot1
end

function ChooseFaceItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot0.msg_type == ElitematchConst.MsgType.eYearMonster then
		slot0.name:setString(slot1.text or TI18N("恭喜发财"))
	else
		slot0.name:setString(slot1.name)
	end

	if slot0.cur_face_id == slot1.id then
		slot0.checkbox:setSelected(true)
	else
		slot0.checkbox:setSelected(false)
	end

	if slot0.face_spine then
		slot0.face_spine:clearTracks()
		slot0.face_spine:removeFromParent()

		slot0.face_spine = nil
	end

	slot0.face_spine = createEffectSpine(slot1.msg, cc.p(75, slot0.size.height / 2), cc.p(0.5, 0.5), false, PlayerAction.action)

	slot0.container:addChild(slot0.face_spine)
end

function ChooseFaceItem.DeleteMe(slot0)
	if slot0.face_spine then
		slot0.face_spine:clearTracks()
		slot0.face_spine:removeFromParent()

		slot0.face_spine = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
