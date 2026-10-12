HallowsActivityWindow = HallowsActivityWindow or BaseClass(BaseView)
slot1 = HallowsController:getInstance():getModel()
slot2 = string.format

function HallowsActivityWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hallows", "hallows"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("levupgrade", "levupgrade"),
			type = ResourcesType.plist
		}
	}
	slot0.is_csb_action = true
	slot0.layout_name = "hallows/hallows_activity_window"
end

function HallowsActivityWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_container = slot0.main_container:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.hallows_name = slot0.main_container:getChildByName("hallows_name")
	slot0.desc = slot0.main_container:getChildByName("desc")

	slot0.desc:setString(TI18N("全体上阵英雄"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")

	slot0.close_btn:getChildByName("label"):enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.close_btn:getChildByName("label"):setString(TI18N("关闭"))

	slot0.goto_btn = slot0.main_container:getChildByName("goto_btn")

	slot0.goto_btn:getChildByName("label"):enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.goto_btn:getChildByName("label"):setString(TI18N("前往转换"))

	slot1 = slot0.root_wnd:getChildByName("item_1")
	slot0.attr_1 = createRichLabel(24, cc.c3b(255, 232, 183), cc.p(0, 0.5), cc.p(160, 20))

	slot1:addChild(slot0.attr_1)

	slot0.attr_2 = createRichLabel(24, cc.c3b(255, 232, 183), cc.p(0, 0.5), cc.p(430, 20))

	slot1:addChild(slot0.attr_2)
end

function HallowsActivityWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openHallowsActivityWindow(false)
		end
	end)
	registerButtonEventListener(slot0.goto_btn, function ()
		if uv0.step_config then
			if uv0.step_config.is_item == 2 then
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.hallows, nil, {
					0,
					HallowsConst.Tab_Index.uplv,
					uv0.step_config.id
				})
			end

			uv1:openHallowsActivityWindow(false)
		end
	end, true)
end

function HallowsActivityWindow.openRootWnd(slot0, slot1, slot2)
	slot0.data = slot1
	slot0.open_type = slot2 or HallowsConst.Activity_Type.Hallows

	playOtherSound("c_get")
	slot0:handleEffect(true)

	if slot1 then
		if slot0.open_type == HallowsConst.Activity_Type.Hallows then
			slot0.step_config = Config.HallowsData.data_info(getNorKey(slot1.id, slot1.step))

			slot0.desc:setString(TI18N("全体上阵英雄"))
			slot0.goto_btn:setVisible(false)
			slot0.close_btn:setPositionX(360)
		elseif slot0.open_type == HallowsConst.Activity_Type.Magic then
			slot0.step_config = Config.HallowsData.data_magic[slot1.id]

			slot0.desc:setString(TI18N("全神技对英雄属性提升"))
			slot0.goto_btn:setVisible(true)
			slot0.close_btn:setPositionX(216)
		end

		if slot0.step_config then
			slot0.hallows_name:setString(slot0.step_config.name)

			slot3 = slot0.step_config.attr

			for slot7 = 1, 2 do
				slot0["attr_" .. slot7]:setString("")
			end

			if slot3 and next(slot3) then
				for slot7, slot8 in ipairs(slot3) do
					if slot7 > 2 then
						break
					end

					if Config.AttrData.data_key_to_name[slot8[1]] then
						if PartnerCalculate.isShowPerByStr(slot9) then
							slot10 = slot8[2] / 10 .. "%"
						end

						slot0["attr_" .. slot7]:setString(uv0("%s<div fontcolor=#ffffff>    +%s</div>", slot11, slot10))
					end
				end
			end

			slot0:updateHallowsBaseInfo()
		end
	end
end

function HallowsActivityWindow.updateHallowsBaseInfo(slot0)
	if slot0.step_config == nil then
		return
	end

	print("------------------", json.encode(slot0.step_config))

	slot0.hallows_model = createEffectSpine(slot0.step_config.effect, cc.p(360, 400), cc.p(0.5, 0.5), true, PlayerAction.action_2)

	slot0.hallows_model:setScale(0.3)
	slot0.main_container:addChild(slot0.hallows_model)
end

function HallowsActivityWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	else
		slot2 = 549
		slot3 = PlayerAction.action_1

		if slot0.open_type == HallowsConst.Activity_Type.Magic then
			slot3 = PlayerAction.action_2
		end

		if not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(slot2), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, slot3)

			slot0.title_container:addChild(slot0.play_effect, 1)
		end
	end
end

function HallowsActivityWindow.close_callback(slot0)
	slot0:handleEffect(false)
	uv0:openHallowsActivityWindow(false)
end
