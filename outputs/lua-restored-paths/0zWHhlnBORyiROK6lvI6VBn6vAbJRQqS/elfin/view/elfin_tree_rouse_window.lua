slot1 = ElfinController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
ElfinTreeRouseWindow = ElfinTreeRouseWindow or BaseClass(BaseView)

function ElfinTreeRouseWindow.__init(slot0)
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_tree_rouse_window"
end

function ElfinTreeRouseWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.success_bg = slot0.container:getChildByName("success_bg")
	slot0.Sprite_1 = slot0.success_bg:getChildByName("Sprite_1")

	if slot0.sprite_1_load == nil then
		slot0.sprite_1_load = loadSpriteTextureFromCDN(slot0.Sprite_1, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_97"), ResourcesType.single, slot0.sprite_1_load)
	end

	slot0.Sprite_2 = slot0.success_bg:getChildByName("Sprite_2")

	if slot0.sprite_2_load == nil then
		slot0.sprite_2_load = loadSpriteTextureFromCDN(slot0.Sprite_2, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.sprite_2_load)
	end

	slot0.container:getChildByName("step_title"):setString(TI18N("唤醒阶段："))

	slot0.image_tree_icon = slot0.container:getChildByName("image_tree_icon")

	slot0.image_tree_icon:ignoreContentAdaptWithSize(true)
	slot0.image_tree_icon:setScale(0.35)

	slot0.step_txt = slot0.container:getChildByName("step_txt")
	slot1 = slot0.container:getChildByName("attr_panel")
	slot0.attr_objects = {}

	for slot5 = 1, 5 do
		uv0(slot0.attr_objects, {
			attr_name = slot1:getChildByName("attr_label_key" .. slot5),
			attr_right_val = slot1:getChildByName("attr_label_right" .. slot5)
		})
	end
end

function ElfinTreeRouseWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openElfinTreeRouseWindow(false)
	end, false, 2)
end

function ElfinTreeRouseWindow.openRootWnd(slot0, slot1, slot2)
	slot0:handleEffect(true)
	slot0:setData(slot1, slot2)
	playOtherSound("c_get")
end

function ElfinTreeRouseWindow.setData(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	slot3 = slot1.break_lev
	slot5 = Config.SpriteData.data_tree_step[slot3 + 1]

	if not Config.SpriteData.data_tree_step[slot3] or not slot5 then
		return
	end

	slot0.tree_bg_load = loadImageTextureFromCDN(slot0.image_tree_icon, PathTool.getElfinTreeBgRes(slot5.res_id), ResourcesType.single, slot0.tree_bg_load)
	slot10 = StringUtil.numToChinese(slot5.count) .. TI18N("阶")

	slot0.step_txt:setString(slot10)

	for slot10 = 1, 5 do
		if slot0.attr_objects[slot10] then
			if slot10 == 1 then
				slot11.attr_name:setString(TI18N("等级上限： ") .. slot4.lev_max)
				slot11.attr_right_val:setString(slot5.lev_max)
			elseif slot5.all_attr[slot10 - 1] then
				slot11.attr_name:setString(uv0(TI18N("%s： %s"), Config.AttrData.data_key_to_name[slot13], slot1[slot13] or 0))
				slot11.attr_right_val:setString(slot2[slot12[1]] or 0)
			end
		end
	end
end

function ElfinTreeRouseWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(103), cc.p(360, 500), cc.p(0.5, 0.5), false, PlayerAction.action_6)

		slot0.container:addChild(slot0.play_effect, 99)
	end
end

function ElfinTreeRouseWindow.close_callback(slot0)
	if slot0.tree_bg_load then
		slot0.tree_bg_load:DeleteMe()

		slot0.tree_bg_load = nil
	end

	if slot0.sprite_1_load then
		slot0.sprite_1_load:DeleteMe()

		slot0.sprite_1_load = nil
	end

	if slot0.sprite_2_load then
		slot0.sprite_2_load:DeleteMe()

		slot0.sprite_2_load = nil
	end

	slot0:handleEffect(false)
	uv0:openElfinTreeRouseWindow(false)
end
