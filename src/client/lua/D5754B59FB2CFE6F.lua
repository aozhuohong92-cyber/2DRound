slot1 = ElfinController:getInstance():getModel()
ElfinLvUpWindow = ElfinLvUpWindow or BaseClass(BaseView)

function ElfinLvUpWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_up_lv_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elfin", "elfin"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("elfin", "elfin_egg_icon"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("elfin", "elfin_bottom_bg"),
			type = ResourcesType.single
		}
	}
end

function ElfinLvUpWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.bottom_image = slot1:getChildByName("bottom_image")

	slot0.bottom_image:ignoreContentAdaptWithSize(true)
	slot0.bottom_image:loadTexture(PathTool.getPlistImgForDownLoad("elfin", "elfin_bottom_bg"), LOADTEXT_TYPE)

	slot0.pos_node = slot1:getChildByName("pos_node")
	slot0.up_lv_txt = slot1:getChildByName("up_lv_txt")
end

function ElfinLvUpWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openElfinLvUpWindow(false)
	end, false, 2)
end

function ElfinLvUpWindow.openRootWnd(slot0, slot1)
	playOtherSound("c_get")

	if slot1 and Config.SpriteData.data_hatch_data[slot1] then
		slot0.up_lv_txt:setString(slot2.name)
	end

	slot0:handleLightEffect(true)
	slot0:handleTitleEffect(true)
end

function ElfinLvUpWindow.handleTitleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.title_effect then
			slot0.title_effect:clearTracks()
			slot0.title_effect:removeFromParent()

			slot0.title_effect = nil
		end
	elseif not tolua.isnull(slot0.pos_node) and slot0.title_effect == nil then
		slot0.title_effect = createEffectSpine(Config.EffectData.data_effect_info[1355], cc.p(0, -320), cc.p(0.5, 0.5), false, PlayerAction.action_1)

		slot0.pos_node:addChild(slot0.title_effect)
	end
end

function ElfinLvUpWindow.handleLightEffect(slot0, slot1)
	if slot1 == false then
		if slot0.light_effect then
			slot0.light_effect:clearTracks()
			slot0.light_effect:removeFromParent()

			slot0.light_effect = nil
		end
	elseif not tolua.isnull(slot0.pos_node) and slot0.light_effect == nil then
		slot0.light_effect = createEffectSpine(Config.EffectData.data_effect_info[1355], cc.p(0, -320), cc.p(0.5, 0.5), true, PlayerAction.action_2)

		slot0.pos_node:addChild(slot0.light_effect)
	end
end

function ElfinLvUpWindow.close_callback(slot0)
	slot0:handleTitleEffect(false)
	slot0:handleLightEffect(false)
	uv0:openElfinLvUpWindow(false)
end
