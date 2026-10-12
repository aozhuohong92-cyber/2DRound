FriendGloryWindow = FriendGloryWindow or BaseClass(BaseView)

function FriendGloryWindow.__init(slot0)
	slot0.ctrl = FriendController:getInstance()
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "friend/friend_glory_window"
end

function FriendGloryWindow.open_callback(slot0)
	slot0.background_container = slot0.root_wnd:getChildByName("background_container")
	slot0.background = slot0.background_container:getChildByName("background")

	slot0.background_container:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.title_container = slot0.main_panel:getChildByName("title_container")
	slot0.title_label = slot0.title_container:getChildByName("title_label")

	slot0.title_label:setString(TI18N("个人荣誉"))

	slot0.info_con = slot0.main_panel:getChildByName("info_con")
	slot0.name = slot0.info_con:getChildByName("name")

	slot0.info_con:getChildByName("guild_title"):setString(TI18N("公会："))

	slot0.guild = slot0.info_con:getChildByName("guild")

	slot0.guild:setString(TI18N("暂无"))

	slot0.country = slot0.info_con:getChildByName("country")
	slot0.head = PlayerHead.new(PlayerHead.type.circle)

	slot0.head:setAnchorPoint(cc.p(0, 0))
	slot0.head:setPosition(cc.p(10, -5))
	slot0.info_con:addChild(slot0.head)

	slot0.vip_bg = slot0.info_con:getChildByName("Image_2")
	slot0.vip_icon = slot0.info_con:getChildByName("vip")
	slot0.vip_label = CommonNum.new(19, slot0.info_con, 1, -2, cc.p(0, 0.5))

	slot0.vip_label:setPosition(145, 85)
	slot0.vip_label:setNum(0)

	slot0.scrollCon = slot0.main_panel:getChildByName("scrollCon")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.scrollCon, cc.p(7, 6), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(548, slot0.scrollCon:getContentSize().height - 12), {
		start_y = 0,
		item_width = 548,
		start_x = 0,
		space_x = 2,
		row = 0,
		item_height = 94,
		space_y = 2,
		col = 1,
		item_class = FriendGloryItem
	})
end

function FriendGloryWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openFriendGloryWindow(false)
			end
		end)
	end
end

function FriendGloryWindow.updateData(slot0)
	if slot0.data == nil then
		return
	end

	slot0.name:setString(slot0.data.name)
	slot0.country:setPositionX(slot0.name:getPositionX() + slot0.name:getContentSize().width + 5)
	slot0.head:setHeadRes(slot0.data.face_id, false, LOADTEXT_TYPE, slot0.data.face_file, slot0.data.face_update_time)

	if slot0.data.gname ~= "" then
		slot0.guild:setString(slot0.data.gname)
	end

	if Config.AvatarData.data_avatar[slot0.data.avatar_base_id] then
		slot0.head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot1.res_id or 1), false, false), nil, false, slot1.offy)
	end

	slot0.head:setSex(slot0.data.sex, cc.p(70, 4))

	if slot0.data.is_show_vip and slot0.data.is_show_vip == 1 then
		slot0.vip_bg:setVisible(false)
		slot0.vip_icon:setVisible(false)
		slot0.vip_label:setVisible(false)
		slot0.name:setPositionX(120)
	else
		slot0.vip_bg:setVisible(true)
		slot0.vip_icon:setVisible(true)
		slot0.vip_label:setVisible(true)
		slot0.vip_label:setNum(slot0.data.vip_lev)
		slot0.name:setPositionX(172)
	end

	slot2 = slot0.data.honor_list

	table.sort(slot2, SortTools.KeyLowerSorter("type"))
	slot0.item_scrollview:setData(slot2)
end

function FriendGloryWindow.openRootWnd(slot0, slot1)
	slot0.data = slot1

	slot0:updateData()
end

function FriendGloryWindow.close_inheritback(slot0)
	slot0.ctrl:openFriendGloryWindow(false)
end

function FriendGloryWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.vip_label then
		slot0.vip_label:DeleteMe()

		slot0.vip_label = nil
	end

	slot0.ctrl:openFriendGloryWindow(false)
end

FriendGloryItem = class("FriendGloryItem", function ()
	return ccui.Widget:create()
end)

function FriendGloryItem.ctor(slot0)
	slot0:configUI()
end

function FriendGloryItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("friend/friend_glory_item"))

	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(544, 94))

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.my_title = slot0.main_container:getChildByName("my_title")
	slot0.my_val = slot0.main_container:getChildByName("my_val")
	slot1 = slot0.main_container:getChildByName("rank_title")

	slot1:setString(TI18N("全服排行："))

	slot0.rank = CommonNum.new(18, slot0.main_container, 0, -2, cc.p(0, 0.5))

	slot0.rank:setPosition(slot1:getPositionX() + slot1:getContentSize().width, slot1:getPositionY() + 12)

	slot0.no_rank = slot0.main_container:getChildByName("no_rank")

	slot0.no_rank:setVisible(false)

	slot0.power = slot0.main_container:getChildByName("power")

	slot0.power:setVisible(false)
end

function FriendGloryItem.setData(slot0, slot1)
	if slot1.type == 1 then
		slot0.my_title:setString(TI18N("玩家战斗力："))

		if slot0.power_label == nil then
			slot0.power_label = CommonNum.new(20, slot0.power, 0, -2, cc.p(0, 0.5))

			slot0.power_label:setPosition(45, 24)
		end

		slot0.power:setVisible(true)
		slot0.power_label:setNum(slot1.val)
		slot0.my_val:setString("")
	elseif slot1.type == 2 then
		slot0.my_title:setString(TI18N("玩家推图进度："))
		slot0.my_title:setPositionX(slot0.my_title:getPositionX() + 15)

		if Config.DungeonData.data_drama_dungeon_info(slot1.val) then
			slot0.my_val:setString(slot2.name)
		else
			slot0.my_val:setString(TI18N("暂无"))
		end
	elseif slot1.type == 3 then
		slot0.my_title:setString(TI18N("玩家天梯杯数："))
		slot0.my_val:setString(slot1.val)
		slot0.my_title:setPositionX(slot0.my_title:getPositionX() + 15)
	elseif slot1.type == 4 then
		slot0.my_title:setString(TI18N("玩家伙伴数量："))
		slot0.my_title:setPositionX(slot0.my_title:getPositionX() + 15)
		slot0.my_val:setString(slot1.val)
	elseif slot1.type == 5 then
		slot0.my_title:setString(TI18N("海底监狱排行："))
		slot0.my_title:setPositionX(slot0.my_title:getPositionX() + 15)
		slot0.my_val:setString(slot1.val)
	end

	if slot1.rank ~= 0 then
		slot0.no_rank:setVisible(false)
		slot0.rank:setVisible(true)
		slot0.rank:setNum(slot1.rank)
	else
		slot0.rank:setVisible(false)
		slot0.no_rank:setVisible(true)
	end
end

function FriendGloryItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function FriendGloryItem.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.callback then
				uv0:callback()
			end
		end
	end)
end

function FriendGloryItem.DeleteMe(slot0)
	if slot0.rank then
		slot0.rank:DeleteMe()

		slot0.rank = nil
	end

	if slot0.power_label then
		slot0.power_label:DeleteMe()

		slot0.power_label = nil
	end

	if slot0.head then
		slot0.head:DeleteMe()

		slot0.head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
