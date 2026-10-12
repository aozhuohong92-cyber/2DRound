EndlessFriendHelpItem2 = class("EndlessFriendHelpItem2", function ()
	return ccui.Layout:create()
end)

function EndlessFriendHelpItem2.ctor(slot0)
	slot0.item_list = {}
	slot0.is_init = false
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_friend_help_item_2"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.career_name = slot1:getChildByName("career_name")
	slot0.career_icon = slot1:getChildByName("career_icon")
	slot0.power_panel = slot1:getChildByName("power_panel")
	slot0.role_power = slot0.power_panel:getChildByName("role_power")
	slot0.role_name = slot1:getChildByName("role_name")
	slot0.help_button = slot1:getChildByName("help_button")
	slot0.help_label = slot0.help_button:getChildByName("help_label")

	slot0.help_label:setString(TI18N("选择"))

	slot0.hero_icon = HeroExhibitionItem.new(0.8)

	slot0.hero_icon:setPosition(68, 63)
	slot0.hero_icon:addCallBack(handler(slot0, slot0.onClickHeroItem))
	slot1:addChild(slot0.hero_icon)
	slot0:registerEvent()
end

function EndlessFriendHelpItem2.onClickHeroItem(slot0)
	if slot0.data and slot0.data.info_data then
		HeroController:getInstance():openHeroTipsPanel(true, slot0.data.info_data)
	end
end

function EndlessFriendHelpItem2.registerEvent(slot0)
	if slot0.help_button then
		slot0.help_button:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended and uv0.click_fun then
				if uv0.select_status == true then
					uv0:click_fun(uv0.data, uv0.index, false)
				else
					uv0:click_fun(uv0.data, uv0.index, true)
				end
			end
		end)
	end
end

function EndlessFriendHelpItem2.setData(slot0, slot1)
	slot0.data = slot1

	if slot0.data then
		slot0.type = slot0.data.type
		slot0.info_data = slot0.data.info_data
		slot0.index = slot0.data._index

		slot0.role_name:setString(slot0.info_data.name)
		slot0.role_power:setString(slot0.info_data.power)
		slot0.hero_icon:setData(slot0.info_data)
		loadSpriteTexture(slot0.career_icon, PathTool.getCareerIcon(slot0.info_data.type), LOADTEXT_TYPE_PLIST)
		slot0.career_name:setString("[" .. (PartnerConst.Hero_Type[slot0.info_data.type] or "") .. "]")
	end
end

function EndlessFriendHelpItem2.addCallBack(slot0, slot1)
	slot0.click_fun = slot1
end

function EndlessFriendHelpItem2.updateBtnStatus(slot0, slot1)
	slot0.select_status = slot1

	if slot1 == true then
		-- Nothing
	end
end

function EndlessFriendHelpItem2.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
