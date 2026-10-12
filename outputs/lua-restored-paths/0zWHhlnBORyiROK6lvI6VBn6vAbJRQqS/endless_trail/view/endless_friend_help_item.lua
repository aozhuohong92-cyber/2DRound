EndlessFriendHelpItem = class("EndlessFriendHelpItem", function ()
	return ccui.Layout:create()
end)

function EndlessFriendHelpItem.ctor(slot0)
	slot0.item_list = {}
	slot0.is_init = false
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_friend_help_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.career_name = slot1:getChildByName("career_name")
	slot0.career_icon = slot1:getChildByName("career_icon")
	slot0.return_icon = slot1:getChildByName("return_icon")

	slot0.return_icon:setVisible(false)

	slot0.power_panel = slot1:getChildByName("power_panel")
	slot0.role_power = slot0.power_panel:getChildByName("role_power")
	slot0.role_name = slot1:getChildByName("role_name")
	slot0.help_button = slot1:getChildByName("help_button")
	slot0.help_label = slot0.help_button:getChildByName("help_label")

	slot0.help_label:setString(TI18N("选择"))

	slot0.firend_label = slot1:getChildByName("firend_label")

	slot0.firend_label:setVisible(false)

	slot0.lock_panel = slot1:getChildByName("lock_panel")

	slot0.lock_panel:getChildByName("limit_label"):setString(TI18N("战力超出范围"))
	slot0.lock_panel:setVisible(false)

	slot0.hero_icon = HeroExhibitionItem.new(1)

	slot0.hero_icon:setPosition(80, 75)
	slot0.hero_icon:addCallBack(handler(slot0, slot0.onClickHeroItem))
	slot1:addChild(slot0.hero_icon)
	slot0:registerEvent()
end

function EndlessFriendHelpItem.onClickHeroItem(slot0)
	if slot0.data then
		if RoleController:getInstance():getRoleVo() and slot1.rid == slot0.data.rid and slot1.srv_id == slot0.data.srv_id then
			HeroController:getInstance():openHeroTipsPanel(true, HeroController:getInstance():getModel():getHeroById(slot0.data.id))
		else
			LookController:getInstance():sender11061(slot0.data.rid, slot0.data.srv_id, slot0.data.id)
		end
	end
end

function EndlessFriendHelpItem.registerEvent(slot0)
	if slot0.help_button then
		slot0.help_button:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended and uv0.click_fun and uv0.data then
				if uv0.data.select == true then
					uv0:click_fun(uv0.data, uv0.index, false)
				else
					uv0:click_fun(uv0.data, uv0.index, true)
				end
			end
		end)
	end
end

function EndlessFriendHelpItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot0.data then
		slot0.type = slot0.data.type
		slot0.info_data = slot0.data.info_data
		slot0.index = slot0.data._index

		slot0.hero_icon:setData(slot0.data)
		slot0.firend_label:setString(TI18N("来自好友:") .. slot0.data.name)
		slot0.role_power:setString(slot0.data.power)
		slot0.firend_label:setVisible(true)
		slot0.power_panel:setPosition(181, 43)

		if Config.PartnerData.data_partner_base[slot0.data.bid] then
			slot0.role_name:setString(slot2.name)
		end

		if slot0.data.is_lock == true then
			slot0.lock_panel:setVisible(true)
			slot0.help_button:setVisible(false)
		else
			slot0.lock_panel:setVisible(false)
			slot0.help_button:setVisible(true)
		end

		if slot0.data.is_return == 1 then
			slot0.return_icon:setVisible(true)
		else
			slot0.return_icon:setVisible(false)
		end

		slot0:updateBtnStatus(slot0.data.select)
		loadSpriteTexture(slot0.career_icon, PathTool.getCareerIcon(slot0.info_data.type), LOADTEXT_TYPE_PLIST)
		slot0.career_name:setString("[" .. (PartnerConst.Hero_Type[slot0.info_data.type] or "") .. "]")
	end
end

function EndlessFriendHelpItem.getData(slot0)
	return slot0.data
end

function EndlessFriendHelpItem.addCallBack(slot0, slot1)
	slot0.click_fun = slot1
end

function EndlessFriendHelpItem.updateBtnStatus(slot0, slot1)
	if slot1 == true then
		slot0.help_button:loadTextures(PathTool.getResFrame("common", "common_1017"), PathTool.getResFrame("common", "common_1017"), PathTool.getResFrame("common", "common_1017"), LOADTEXT_TYPE_PLIST)
		slot0.help_label:setString(TI18N("取消选择"))
		slot0.help_label:enableOutline(Config.ColorData.data_color4[264], 2)
	else
		slot0.help_button:loadTextures(PathTool.getResFrame("common", "common_1018"), PathTool.getResFrame("common", "common_1018"), PathTool.getResFrame("common", "common_1018"), LOADTEXT_TYPE_PLIST)
		slot0.help_label:setString(TI18N("选择"))
		slot0.help_label:enableOutline(Config.ColorData.data_color4[263], 2)
	end
end

function EndlessFriendHelpItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
