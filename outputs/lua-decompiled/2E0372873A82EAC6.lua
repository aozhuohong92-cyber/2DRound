HalidomSkillTips = HalidomSkillTips or BaseClass(BaseView)
slot0 = string.format

function HalidomSkillTips.__init(slot0, ...)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "tips/skill_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
end

function HalidomSkillTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.container_init_size = slot0.container:getContentSize()
	slot0.base_panel = slot0.container:getChildByName("base_panel")
	slot0.base_panel_height = slot0.base_panel:getContentSize().height
	slot0.skill_icon = slot0.base_panel:getChildByName("skill_icon")
	slot0.skill_name = slot0.base_panel:getChildByName("name")
	slot0.skill_type = slot0.base_panel:getChildByName("skill_type")
	slot0.line = slot0.container:getChildByName("line")
end

function HalidomSkillTips.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:close()
			end
		end)
	end
end

function HalidomSkillTips.setData(slot0, slot1)
	if not Config.HalidomData.data_skill[slot1] then
		return
	end

	slot0.skill_name:setString(slot2.name .. "  Lv." .. slot2.lev)
	loadSpriteTexture(slot0.skill_icon, PathTool.getSkillRes(slot2.res_id), LOADTEXT_TYPE)
	slot0.skill_type:setString(TI18N("类型：信念被动"))

	slot3 = 4 + slot0.base_panel_height
	slot4 = 0

	if slot2.desc ~= "" then
		if slot0.skill_desc == nil then
			slot0.skill_desc = createRichLabel(22, cc.c4b(254, 238, 186, 255), cc.p(0, 1), cc.p(22, 10), 4, nil, 370)

			slot0.container:addChild(slot0.skill_desc)
		end

		slot0.skill_desc:setString(slot2.desc)

		slot3 = slot3 + slot0.skill_desc:getContentSize().height + 2
	end

	slot3 = slot3 + 20

	slot0.container:setContentSize(cc.size(slot0.container_init_size.width, slot3))
	slot0.base_panel:setPositionY(slot3 - 4)
	slot0.line:setPositionY(slot3 - 4 - slot0.base_panel_height)
	slot0.skill_desc:setPositionY(slot3 - 6 - slot0.base_panel_height)
end

function HalidomSkillTips.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
	delayRun(slot0.root_wnd, 114, function ()
		TipsManager:getInstance():hideTips()
	end)
end

function HalidomSkillTips.close_callback(slot0)
end
