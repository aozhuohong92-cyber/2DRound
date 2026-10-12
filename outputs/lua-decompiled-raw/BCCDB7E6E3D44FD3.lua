ViewManager = ViewManager or BaseClass()
ViewMgrTag = {
	BATTLE_LAYER_TAG = 2,
	UI_TAG = 4,
	DEBUG_TAG = 12,
	RECONNECT_TAG = 9,
	LOADING_TAG = 11,
	DIALOGUE_TAG = 7,
	EFFECT_TAG = 3,
	WIN_TAG = 5,
	TOP_TAG = 6,
	Scene_LAYER_TAG = 1,
	MSG_TAG = 8
}

function ViewManager.addToLayerByTag(slot0, slot1, slot2, slot3)
	if slot0.layout_list[slot2] == nil then
		slot4 = slot0.ui_layer
	end

	if slot4.zorder == nil then
		slot4.zorder = 0
	end

	slot4.zorder = slot4.zorder + 1

	slot4:addChild(slot1, slot3 or slot4.zorder)
end

function ViewManager.getLayerByTag(slot0, slot1)
	if slot1 == nil then
		return slot0.ui_layer
	end

	if slot0.layout_list[slot1] then
		return slot2
	else
		return slot0.ui_layer
	end
end

function ViewManager.getBaseLayout(slot0)
	return slot0.base_layout
end

function ViewManager.setLayerVisible(slot0, slot1, slot2)
	if slot2 == nil then
		return
	end

	if slot0.layout_list[slot2] then
		slot3:setVisible(slot1)
		slot3:setEnabled(slot1)
	else
		error("没有相应层给你设置显示状态 .." .. slot2)
	end
end

function ViewManager.getMainScene(slot0)
	return slot0.main_scene
end

function ViewManager.initMainFunBar(slot0)
	GmCmd:add_gm_button(slot0.gm_layer)
end

function ViewManager.getInstance(slot0)
	if not slot0.is_init then
		slot0.current_layer = 0
		slot0.last_layer = 0
		slot0.total_layer = 0
		slot0.scene_layer = ccui.Widget:create()
		slot0.battle_layer = ccui.Widget:create()
		slot0.effect_layer = ccui.Widget:create()
		slot0.ui_layer = ccui.Widget:create()
		slot0.win_layer = ccui.Widget:create()
		slot0.top_layer = ccui.Widget:create()
		slot0.dialogue_layer = ccui.Widget:create()
		slot0.msg_layer = ccui.Widget:create()
		slot0.reconnect_layer = ccui.Widget:create()
		slot0.loading_layer = ccui.Widget:create()
		slot0.gm_layer = ccui.Layout:create()
		slot0.main_scene = cc.Scene:create()

		slot0.main_scene:retain()

		slot0.base_layout = ccui.Layout:create()

		slot0.base_layout:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
		slot0.base_layout:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.base_layout:setPosition(display.width * 0.5, display.height * 0.5)
		slot0.main_scene:addChild(slot0.base_layout)
		slot0.base_layout:addChild(slot0.scene_layer, ViewMgrTag.Scene_LAYER_TAG, ViewMgrTag.Scene_LAYER_TAG)
		slot0.base_layout:addChild(slot0.battle_layer, ViewMgrTag.BATTLE_LAYER_TAG, ViewMgrTag.BATTLE_LAYER_TAG)
		slot0.base_layout:addChild(slot0.effect_layer, ViewMgrTag.EFFECT_TAG, ViewMgrTag.EFFECT_TAG)
		slot0.base_layout:addChild(slot0.ui_layer, ViewMgrTag.UI_TAG, ViewMgrTag.UI_TAG)
		slot0.base_layout:addChild(slot0.win_layer, ViewMgrTag.WIN_TAG, ViewMgrTag.WIN_TAG)
		slot0.base_layout:addChild(slot0.top_layer, ViewMgrTag.TOP_TAG, ViewMgrTag.TOP_TAG)
		slot0.base_layout:addChild(slot0.dialogue_layer, ViewMgrTag.DIALOGUE_TAG, ViewMgrTag.DIALOGUE_TAG)
		slot0.base_layout:addChild(slot0.msg_layer, ViewMgrTag.MSG_TAG, ViewMgrTag.MSG_TAG)
		slot0.base_layout:addChild(slot0.reconnect_layer, ViewMgrTag.RECONNECT_TAG, ViewMgrTag.RECONNECT_TAG)
		slot0.base_layout:addChild(slot0.loading_layer, ViewMgrTag.LOADING_TAG, ViewMgrTag.LOADING_TAG)
		slot0.base_layout:addChild(slot0.gm_layer, ViewMgrTag.DEBUG_TAG, ViewMgrTag.DEBUG_TAG)

		slot0.layout_list = {
			[ViewMgrTag.Scene_LAYER_TAG] = slot0.scene_layer,
			[ViewMgrTag.BATTLE_LAYER_TAG] = slot0.battle_layer,
			[ViewMgrTag.EFFECT_TAG] = slot0.effect_layer,
			[ViewMgrTag.UI_TAG] = slot0.ui_Layer,
			[ViewMgrTag.WIN_TAG] = slot0.win_layer,
			[ViewMgrTag.TOP_TAG] = slot0.top_layer,
			[ViewMgrTag.DIALOGUE_TAG] = slot0.dialogue_layer,
			[ViewMgrTag.MSG_TAG] = slot0.msg_layer,
			[ViewMgrTag.RECONNECT_TAG] = slot0.reconnect_layer,
			[ViewMgrTag.LOADING_TAG] = slot0.loading_layer,
			[ViewMgrTag.DEBUG_TAG] = slot0.gm_layer
		}
		slot0.is_init = true
	end

	return slot0
end

function ViewManager.initEvent(slot0)
end

function ViewManager.DeleteMe(slot0)
	if slot0.main_scene ~= nil then
		slot0.main_scene:release()
		slot0.main_scene:removeAllChildren()

		slot0.main_scene = nil
	end

	slot0.is_init = nil
end
