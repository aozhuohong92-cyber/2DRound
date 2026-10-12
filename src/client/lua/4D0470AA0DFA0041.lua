HallowsPreviewWindow = HallowsPreviewWindow or BaseClass(BaseView)
slot0 = HallowsController:getInstance()
slot1 = HallowsController:getInstance():getModel()

function HallowsPreviewWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hallows", "hallows"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_69", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_70"),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "hallows/hallows_preview_window"
	slot0.hallows_list = {}
	slot0.pos_nodes = {}
end

function HallowsPreviewWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_69", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.main_panel = slot1
	slot2 = slot1:getChildByName("title_layout")

	slot2:getChildByName("win_title"):setString(TI18N("终结技"))

	slot0.close_btn = slot1:getChildByName("close_btn")

	slot2:setPositionY(display.getTop(slot1) - 170)
end

function HallowsPreviewWindow.refreshView(slot0)
	for slot5 = 1, Config.HallowsData.data_base_length do
		if slot0.main_panel:getChildByName("pos_node_" .. slot5) then
			slot0.pos_nodes[slot5] = slot6

			delayRun(slot6, slot5 * 3 / 60, function ()
				if uv0.hallows_list[uv1] == nil then
					slot0 = HallowsPreviewItem.new()

					uv2:addChild(slot0)

					uv0.hallows_list[uv1] = slot0
				end

				slot0:setData(Config.HallowsData.data_base[uv1] or {})
			end)
		end
	end
end

function HallowsPreviewWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickCloseBtn), nil, 2)
end

function HallowsPreviewWindow._onClickCloseBtn(slot0)
	uv0:openHallowsPreviewWindow(false)
end

function HallowsPreviewWindow.openRootWnd(slot0)
	slot0:refreshView()
end

function HallowsPreviewWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.pos_nodes) do
		slot5:stopAllActions()
	end

	for slot4, slot5 in pairs(slot0.hallows_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openHallowsPreviewWindow(false)
end

HallowsPreviewItem = class("HallowsPreviewItem", function ()
	return ccui.Widget:create()
end)

function HallowsPreviewItem.ctor(slot0)
	slot0.hallows_status = HallowsConst.Status.close

	slot0:configUI()
	slot0:register_event()
end

function HallowsPreviewItem.configUI(slot0)
	slot0.size = cc.size(250, 250)

	slot0:setTouchEnabled(false)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hallows/hallows_preview_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.hallows_pos_node = slot2:getChildByName("hallows_pos_node")
	slot0.name_label = slot2:getChildByName("name_label")
	slot0.hallows_bg = slot2:getChildByName("bg")
end

function HallowsPreviewItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.container:setName("hallows_" .. slot1.id)
	slot0.name_label:setString(slot1.name)

	slot3 = PlayerAction.action_2

	if slot0.hallows_model then
		slot0.hallows_model:removeFromParent()

		slot0.hallows_model = nil
	end

	slot0.hallows_model = createEffectSpine(slot1.c_res_id, cc.p(0, 0), cc.p(0, 0), true, slot3)

	slot0.hallows_model:setScale(0.45)
	slot0.hallows_pos_node:addChild(slot0.hallows_model)

	if uv0:getCurActivityHallowsId() == slot2 then
		slot0.hallows_status = HallowsConst.Status.underway

		setChildUnEnabled(true, slot0.hallows_model)
		slot0.hallows_model:setAnimation(0, PlayerAction.action_1, true)
		slot0:handleEffect(true)
	elseif uv0:getHallowsById(slot2) then
		slot0.hallows_status = HallowsConst.Status.open

		setChildUnEnabled(false, slot0.hallows_model)
		slot0.hallows_model:setAnimation(0, PlayerAction.action_2, true)
	else
		slot0.hallows_status = HallowsConst.Status.close

		setChildUnEnabled(true, slot0.hallows_model)
		slot0.hallows_model:setAnimation(0, PlayerAction.action_1, true)
	end
end

function HallowsPreviewItem.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end

		if slot0.hallows_model then
			slot0.hallows_model:clearTracks()
			slot0.hallows_model:removeFromParent()

			slot0.hallows_model = nil
		end
	elseif not tolua.isnull(slot0.hallows_bg) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[546], cc.p(72, 72), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.hallows_bg:addChild(slot0.play_effect)
	elseif slot0.play_effect then
		slot0.play_effect:setAnimation(0, PlayerAction.action, true)
	end
end

function HallowsPreviewItem.register_event(slot0)
	registerButtonEventListener(slot0.container, handler(slot0, slot0._onClickContainer))
end

function HallowsPreviewItem._onClickContainer(slot0)
	if slot0.hallows_status == HallowsConst.Status.close then
		message(TI18N("解锁上一神技后开启"))
	else
		if uv0:getHallowsRoot() then
			GlobalEvent:getInstance():Fire(HallowsEvent.UndateHallowsInfoEvent, slot0.data.id)
		else
			uv0:openHallowsMainWindow(true, slot0.data.id)
		end

		uv0:openHallowsPreviewWindow(false)
	end
end

function HallowsPreviewItem.DeleteMe(slot0)
	slot0:handleEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
