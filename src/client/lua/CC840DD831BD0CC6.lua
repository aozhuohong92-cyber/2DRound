HalidomUnlockWindow = HalidomUnlockWindow or BaseClass(BaseView)
slot1 = HalidomController:getInstance():getModel()
slot2 = string.format

function HalidomUnlockWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("levupgrade", "levupgrade"),
			type = ResourcesType.plist
		}
	}
	slot0.is_csb_action = true
	slot0.layout_name = "hallows/hallows_activity_window"
end

function HalidomUnlockWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_container = slot0.main_container:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.hallows_name = slot0.main_container:getChildByName("hallows_name")
	slot0.desc = slot0.main_container:getChildByName("desc")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")

	slot0.close_btn:setPositionX(360)
	slot0.close_btn:getChildByName("label"):enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.close_btn:getChildByName("label"):setString(TI18N("关闭"))

	slot0.goto_btn = slot0.main_container:getChildByName("goto_btn")

	slot0.goto_btn:setVisible(false)

	slot1 = slot0.root_wnd:getChildByName("item_1")
	slot0.attr_1 = createRichLabel(24, cc.c3b(90, 58, 38), cc.p(0, 0.5), cc.p(160, 20))

	slot1:addChild(slot0.attr_1)

	slot0.attr_2 = createRichLabel(24, cc.c3b(90, 58, 38), cc.p(0, 0.5), cc.p(430, 20))

	slot1:addChild(slot0.attr_2)
	UITool.SetLightColor(slot0.desc)
end

function HalidomUnlockWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openHalidomUnlockWindow(false)
		end
	end)
end

function HalidomUnlockWindow.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.base_cfg = Config.HalidomData.data_base[slot1]
	slot0.halidom_vo = uv0:getHalidomDataById(slot1)

	if slot0.base_cfg and slot0.halidom_vo then
		slot0:setData()
	end
end

function HalidomUnlockWindow.setData(slot0)
	if not slot0.base_cfg or not slot0.halidom_vo then
		return
	end

	if not Config.HalidomData.data_lvup[slot0.halidom_vo.id] then
		return
	end

	if not slot1[slot0.halidom_vo.lev] then
		return
	end

	playOtherSound("c_get")
	slot0:handleEffect(true)
	slot0.hallows_name:setString(slot0.base_cfg.name)

	slot7 = uv0

	slot0.desc:setString(slot7(TI18N("对所有%s系英雄属性提升"), HeroConst.CampName[slot0.base_cfg.camp]))

	for slot7 = 1, 2 do
		slot0["attr_" .. slot7]:setString("")
	end

	if slot2.attr and next(slot2.attr) then
		for slot7, slot8 in ipairs(slot2.attr) do
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

	if slot0.base_cfg.effect_id then
		slot0.halidom_model = createEffectSpine(PathTool.getEffectRes(slot0.base_cfg.effect_id), cc.p(360, 380), cc.p(0.5, 0.5), true, PlayerAction.action_2)

		slot0.main_container:addChild(slot0.halidom_model)
	end
end

function HalidomUnlockWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(549), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_3)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function HalidomUnlockWindow.close_callback(slot0)
	slot0:handleEffect(false)

	if slot0.halidom_model then
		slot0.halidom_model:clearTracks()
		slot0.halidom_model:removeFromParent()

		slot0.halidom_model = nil
	end

	uv0:openHalidomUnlockWindow(false)
end
