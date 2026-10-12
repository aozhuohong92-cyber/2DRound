HalidomUpStepWindow = HalidomUpStepWindow or BaseClass(BaseView)
slot1 = HalidomController:getInstance():getModel()

function HalidomUpStepWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.layout_name = "hero/skill_unlock"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_28"),
			type = ResourcesType.single
		}
	}
	slot0.is_can_close = false
end

function HalidomUpStepWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:setVisible(true)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0.main_panel:setTouchEnabled(false)
	loadSpriteTexture(slot0.main_panel:getChildByName("title_panel"):getChildByName("title"), PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_28"), LOADTEXT_TYPE)

	slot4 = slot0.main_panel:getContentSize()
	slot0.icon_kuang = createSprite(PathTool.getResFrame("common", "common_1005"), slot4.width / 2, 530, slot0.main_panel, cc.p(0.5, 0.5))
	slot0.skill_icon = createSprite(nil, 59.5, 59.5, slot0.icon_kuang, cc.p(0.5, 0.5), LOADTEXT_TYPE)
	slot0.level_bg = createSprite(PathTool.getResFrame("common", "common_2018"), 119, 119, slot0.icon_kuang, cc.p(0.5, 0.5))
	slot0.level_txt = createLabel(20, cc.c4b(100, 50, 35, 255), nil, 16, 16, "1", slot0.level_bg, nil, cc.p(0.5, 0.5))
	slot0.name_txt = createLabel(26, Config.ColorData.data_color4[1], Config.ColorData.data_color4[9], slot4.width / 2, 430, "", slot0.main_panel, 2, cc.p(0.5, 0))
	slot0.desc_txt = createRichLabel(20, cc.c4b(255, 215, 155, 255), cc.p(0.5, 1), cc.p(slot4.width / 2, 415), nil, nil, 570)

	slot0.main_panel:addChild(slot0.desc_txt)
end

function HalidomUpStepWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()

			if uv0.is_can_close == true then
				uv1:openHalidomUpStepWindow(false)
			end
		end
	end)
end

function HalidomUpStepWindow.setData(slot0)
	if not slot0.halidom_id then
		return
	end

	if not Config.HalidomData.data_step[slot0.halidom_id] then
		return
	end

	if not slot1[uv0:getHalidomDataById(slot0.halidom_id).step] then
		return
	end

	if not Config.HalidomData.data_skill[slot3.skill_icon] then
		return
	end

	if slot0.skill_icon then
		loadSpriteTexture(slot0.skill_icon, PathTool.getSkillRes(slot4.res_id), LOADTEXT_TYPE)
	end

	if slot0.level_txt then
		slot0.level_txt:setString(slot4.lev)
	end

	if slot0.name_txt then
		slot0.name_txt:setString(slot4.name)
	end

	if slot0.desc_txt then
		for slot9, slot10 in ipairs(slot3.dynamic_attr) do
			table.insert({}, slot10)
		end

		for slot9, slot10 in ipairs(slot3.fixed_attr) do
			table.insert(slot5, slot10)
		end

		slot6 = ""

		for slot10, slot11 in ipairs(slot5) do
			if Config.AttrData.data_key_to_name[slot11[1]] then
				if PartnerCalculate.isShowPerByStr(slot12) == true then
					slot13 = (slot11[2] or 0) / 10 .. "%"
				end

				slot6 = (slot6 ~= "" or string.format(TI18N("%s的%s属性额外提升%s"), slot4.name, slot14, tostring(slot13))) and string.format(TI18N("%s的%s属性额外提升%s"), slot4.name, slot14, tostring(slot13)) .. "\n" .. string.format(TI18N("%s的%s属性额外提升%s"), slot4.name, slot14, tostring(slot13))
			end
		end

		slot0.desc_txt:setString(string.format("<div outline=2,#000000>%s</div>", slot6))
	end
end

function HalidomUpStepWindow.openRootWnd(slot0, slot1)
	slot0.halidom_id = slot1

	playOtherSound("c_get")
	slot0:handleEffect(true)
	slot0:setData()
	delayOnce(function ()
		uv0.is_can_close = true
	end, 1)
end

function HalidomUpStepWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	else
		slot2 = slot0.main_panel:getContentSize()

		if not tolua.isnull(slot0.main_panel) and slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(145), cc.p(slot2.width * 0.5, slot2.height * 0.5 + 40), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.main_panel:addChild(slot0.play_effect, -1)
		end
	end
end

function HalidomUpStepWindow.close_callback(slot0)
	slot0:handleEffect(false)
	uv0:openHalidomUpStepWindow(false)
end
