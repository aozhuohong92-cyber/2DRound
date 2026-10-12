slot1 = ElfinController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
ElfinGainWindow = ElfinGainWindow or BaseClass(BaseView)

function ElfinGainWindow.__init(slot0)
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_gain_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elfin", "elfin"),
			type = ResourcesType.plist
		}
	}
end

function ElfinGainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.con_size = slot0.container:getContentSize()
	slot0.cancel_btn = slot0.container:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("关  闭"))

	slot0.confirm_btn = slot0.container:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("前往查看"))

	slot0.quality_icon = slot0.container:getChildByName("quality_icon")
	slot0.quality_txt = slot0.container:getChildByName("quality_txt")
	slot0.elfin_name_txt = slot0.container:getChildByName("elfin_name_txt")
	slot0.elfin_desc_txt = slot0.container:getChildByName("elfin_desc_txt")

	slot0.container:getChildByName("score_title"):setString(TI18N("评分："))

	slot0.power_label = CommonNum.new(1, slot0.container, 1, -2, cc.p(0, 0))

	slot0.power_label:setPosition(cc.p(630, 223))
	slot0.power_label:setNum(0)
	slot0.power_label:setScale(0.8)
end

function ElfinGainWindow.register_event(slot0)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0.onClickCloseBtn), true)
	registerButtonEventListener(slot0.confirm_btn, handler(slot0, slot0.onClickCheckBtn), true)
end

function ElfinGainWindow.onClickCloseBtn(slot0)
	uv0:openElfGainWindow(false)
end

function ElfinGainWindow.onClickCheckBtn(slot0)
	MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.backpack, BackPackConst.item_tab_type.ELFIN)
	uv0:openElfGainWindow(false)
end

function ElfinGainWindow.openRootWnd(slot0, slot1)
	playOtherSound("c_get")
	slot0:handleTopEffect(true)
	slot0:setData(slot1)
end

function ElfinGainWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = nil
	slot3 = ""
	slot4 = 0
	slot5 = ""
	slot6 = {}

	for slot10, slot11 in pairs(slot1) do
		if Config.ItemData.data_get_data(slot11.item_bid) then
			if BackPackConst.checkIsElfin(slot12.type) then
				slot3 = slot12.name
				slot4 = slot12.quality
				slot5 = slot12.use_desc
				slot2 = Config.SpriteData.data_elfin_data(slot11.item_bid)
			else
				uv0(slot6, {
					item_num = slot11.item_num,
					item_cfg = slot12
				})
			end
		end
	end

	if slot5 and slot5 ~= "" then
		slot0.elfin_desc_txt:setString(slot5)
	end

	slot0:showBottomEffect(true, slot4)

	if slot2 then
		if slot0.power_label then
			slot0.power_label:setNum(slot2.power)
		end

		delayRun(slot0.container, 0.3, function ()
			if not uv1.elfin_spine then
				uv1.elfin_spine = createEffectSpine(uv0.effect_id or "E70001", cc.p(uv1.con_size.width * 0.5, uv1.con_size.height * 0.5 - 45 + (tonumber(uv0.offset_y) or 0)), cc.p(0.5, 0.5), false, PlayerAction.action_1, handler(uv1, uv1.onAniEndCallBack))

				uv1.container:addChild(uv1.elfin_spine)
			end

			if uv0.scale_val and uv0.scale_val > 0 then
				uv1.elfin_spine:setScale(uv0.scale_val)
			end
		end)
	end

	slot0.elfin_name_txt:setString(slot3)
	slot0.elfin_name_txt:setTextColor(BackPackConst.getBlackQualityColorC4B(slot4))
	slot0.elfin_desc_txt:setTextColor(BackPackConst.getBlackQualityColorC4B(slot4))

	if ElfinConst.Elfin_Quality_Res[slot4] then
		slot0.quality_icon:loadTexture(PathTool.getResFrame("elfin", ElfinConst.Elfin_Quality_Res[slot4]), LOADTEXT_TYPE_PLIST)
	end

	if ElfinConst.Elfin_Quality_Name[slot4] then
		slot0.quality_txt:setString(ElfinConst.Elfin_Quality_Name[slot4])

		if ElfinConst.Elfin_Quality_Outline[slot4] then
			slot0.quality_txt:enableOutline(ElfinConst.Elfin_Quality_Outline[slot4], 2)
		end
	end

	if slot6 and next(slot6) ~= nil then
		if not slot0.extra_txt then
			slot0.extra_txt = createRichLabel(24, cc.p(255, 232, 183, 255), cc.p(0.5, 0.5), cc.p(360, 32))

			slot0.container:addChild(slot0.extra_txt)
		end

		for slot11, slot12 in ipairs(slot6) do
			slot7 = TI18N("<div fontcolor=#ffe8b7>同时获得</div>") .. uv1("<div fontcolor=#ffe8b7>+</div> <img src='%s' scale=0.3 /> <div fontcolor=#ffe8b7>%d</div>", PathTool.getItemRes(slot12.item_cfg.icon), slot12.item_num)
		end

		slot0.extra_txt:setString(slot7)
	end
end

function ElfinGainWindow.onAniEndCallBack(slot0)
	if not slot0.ani_flag and slot0.elfin_spine then
		slot0.ani_flag = true

		slot0.elfin_spine:setToSetupPose()
		slot0.elfin_spine:setAnimation(0, PlayerAction.stand, true)
	end
end

function ElfinGainWindow.handleTopEffect(slot0, slot1)
	if slot1 == false then
		if slot0.top_effect then
			slot0.top_effect:clearTracks()
			slot0.top_effect:removeFromParent()

			slot0.top_effect = nil
		end
	elseif not tolua.isnull(slot0.container) and slot0.top_effect == nil then
		slot0.top_effect = createEffectSpine(Config.EffectData.data_effect_info[1352], cc.p(slot0.con_size.width * 0.5, 410), cc.p(0.5, 0.5), false, PlayerAction.action_1)

		slot0.container:addChild(slot0.top_effect)
	end
end

function ElfinGainWindow.showBottomEffect(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.bottom_effect then
			slot0.bottom_effect:clearTracks()
			slot0.bottom_effect:removeFromParent()

			slot0.bottom_effect = nil
		end
	else
		slot3 = PlayerAction.action_1

		if BackPackConst.quality.orange <= (slot2 or 0) then
			slot3 = PlayerAction.action_3
		elseif slot2 == BackPackConst.quality.purple then
			slot3 = PlayerAction.action_2
		end

		if not tolua.isnull(slot0.container) and slot0.bottom_effect == nil then
			slot0.bottom_effect = createEffectSpine(Config.EffectData.data_effect_info[1354], cc.p(slot0.con_size.width * 0.5, 110), cc.p(0.5, 0), true, slot3)

			slot0.container:addChild(slot0.bottom_effect)
		end
	end
end

function ElfinGainWindow.close_callback(slot0)
	doStopAllActions(slot0.container)

	if slot0.power_label then
		slot0.power_label:DeleteMe()

		slot0.power_label = nil
	end

	if slot0.elfin_spine then
		slot0.elfin_spine:clearTracks()
		slot0.elfin_spine:removeFromParent()

		slot0.elfin_spine = nil
	end

	slot0:handleTopEffect(false)
	slot0:showBottomEffect(false)
	uv0:openElfGainWindow(false)
end
