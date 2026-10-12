FriendCheckInfoWindow = FriendCheckInfoWindow or BaseClass(BaseView)
slot0 = Config.ArenaEliteData.data_elite_level

function FriendCheckInfoWindow.__init(slot0)
	slot0.ctrl = FriendController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "friend/friend_check_info"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("friendinfo", "friendinfo"),
			type = ResourcesType.plist
		}
	}
	slot0.item_list = {}
	slot0.honor_item_load = {}
	slot0.elfin_list = {}
end

function FriendCheckInfoWindow.open_callback(slot0)
	slot0.background_container = slot0.root_wnd:getChildByName("background_container")
	slot0.background = slot0.background_container:getChildByName("background")

	slot0.background_container:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.report_btn = slot0.main_panel:getChildByName("report_btn")
	slot0.report_btn_label = slot0.report_btn:getChildByName("label")
	slot0.friend_btn = slot0.main_panel:getChildByName("friend_btn")
	slot0.friend_btn_label = slot0.friend_btn:getChildByName("label")
	slot0.black_btn = slot0.main_panel:getChildByName("black_btn")
	slot0.black_btn_label = slot0.black_btn:getChildByName("label")
	slot0.pk_btn = slot0.main_panel:getChildByName("pk_btn")

	slot0.pk_btn:getChildByName("label"):setString(TI18N("切磋"))

	slot0.title_container = slot0.main_panel:getChildByName("title_container")
	slot0.title_label = slot0.title_container:getChildByName("title_label")

	slot0.title_label:setString(TI18N("个人信息"))

	slot0.info_con = slot0.main_panel:getChildByName("info_con")
	slot0.name = slot0.info_con:getChildByName("name")

	slot0.info_con:getChildByName("rank_title"):setString(TI18N("段位："))

	slot0.rank = slot0.info_con:getChildByName("rank")

	slot0.rank:setString(TI18N("暂无"))
	slot0.info_con:getChildByName("guild_title"):setString(TI18N("公会："))

	slot0.guild = slot0.info_con:getChildByName("guild")

	slot0.guild:setString(TI18N("暂无"))

	slot0.glory_btn = slot0.info_con:getChildByName("glory_btn")
	slot0.at_btn = slot0.info_con:getChildByName("at_btn")

	slot0.at_btn:setVisible(false)

	slot0.country = slot0.info_con:getChildByName("country")
	slot0.head = PlayerHead.new(PlayerHead.type.circle)

	slot0.head:setAnchorPoint(cc.p(0, 0))
	slot0.head:setPosition(cc.p(10, -5))
	slot0.info_con:addChild(slot0.head)

	slot0.vip_bg = slot0.info_con:getChildByName("Image_2")
	slot0.vip_icon = slot0.info_con:getChildByName("vip")
	slot0.vip_label = CommonNum.new(19, slot0.info_con, 0, -2, cc.p(0, 0.5))

	slot0.vip_label:setPosition(145, 85)

	slot0.main_container = slot0.main_panel:getChildByName("main_container")
	slot3 = slot0.main_container:getChildByName("fight_title")

	slot3:setString(TI18N("剧情战斗阵容"))
	slot3:setPositionX(20)

	slot0.elfin_tree_lv = slot0.main_container:getChildByName("elfin_tree_lv")
	slot0.elfin_skill_panel = slot0.main_container:getChildByName("elfin_skill_panel")
	slot0.fight_label = CommonNum.new(20, slot0.main_container, 0, -2, cc.p(0, 0.5))

	slot0.fight_label:setPosition(420, 280)

	slot0.scrollCon = slot0.main_container:getChildByName("scrollCon")
	slot0.scroll_view_size = slot0.scrollCon:getContentSize()
	slot7 = slot0.scroll_view_size.height
	slot0.scroll_view = createScrollView(slot0.scroll_view_size.width - 10, slot7, 5, 0, slot0.scrollCon, ccui.ScrollViewDir.horizontal)
	slot0.honor_item_list = {}

	for slot7 = 1, 3 do
		slot0.honor_item_list[slot7] = RoleHonorItem.new(0.5, true)

		slot0.main_panel:getChildByName("item_node_" .. slot7):addChild(slot0.honor_item_list[slot7])
	end
end

function FriendCheckInfoWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openFriendCheckPanel(false)
			end
		end)
	end

	if slot0.glory_btn then
		slot0.glory_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				RoleController:getInstance():openRolePersonalSpacePanel(true, {
					role_type = RoleConst.role_type.eOther,
					other_data = uv0.data
				})
			end
		end)
	end

	if slot0.at_btn then
		slot0.at_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				slot2 = RoleController:getInstance():getRoleVo()
				slot4 = 30
				slot5 = ""

				if Config.SayData.data_const and slot3.at_condition then
					slot4 = slot3.at_condition.val
					slot5 = slot3.at_condition.desc
				end

				if slot2.lev < slot4 then
					message(slot5)

					return
				end

				playButtonSound2()

				if uv0.data and uv0.data.name then
					if uv0.flag == "chat_msg" then
						ChatController:getInstance():chatAtPeople(uv0.data.name, uv0.data.srv_id)
					elseif uv0.flag == "mainchatmsg" then
						MainuiController:getInstance():mainChatAtPeople(uv0.data.name, uv0.data.srv_id)
					end

					uv0.ctrl:openFriendCheckPanel(false)
				end
			end
		end)
	end

	for slot4, slot5 in ipairs(slot0.honor_item_list) do
		slot5:addCallBack(function ()
			uv0:onClickByPos(uv1)
		end)
	end

	registerButtonEventListener(slot0.report_btn, handler(slot0, slot0.onClickReportBtn), true, 1)

	if slot0.friend_btn then
		slot0.friend_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.data then
					if uv0.model:isFriend(uv0.data.srv_id, uv0.data.rid) then
						ChatController:getInstance():openChatPanel(ChatConst.Channel.Friend, "friend", uv0.data)
						uv0.ctrl:openFriendCheckPanel(false)
					else
						uv0.ctrl:addOther(uv0.data.srv_id, uv0.data.rid)
						uv0.ctrl:openFriendCheckPanel(false)
					end
				end
			end
		end)
	end

	if slot0.pk_btn then
		slot0.pk_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.data then
					if not BattleController:getInstance():getWatchReplayStatus() and not BattleController:getInstance():getModel():isInFight() then
						slot2 = 0

						if uv0.channel and uv0.channel == ChatConst.Channel.Cross then
							slot2 = 1
						end

						BattleController:getInstance():csBattlePk(uv0.data.rid, uv0.data.srv_id, slot2)
					else
						message(TI18N("正在观看录像或者切磋中,请先退出"))
					end
				end
			end
		end)
	end

	if slot0.black_btn then
		slot0.black_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.data then
					if uv0.model:isBlack(uv0.data.rid, uv0.data.srv_id) then
						ChatController:getInstance():closeChatUseAction()
						uv0.ctrl:openFriendCheckPanel(false)
						uv0.ctrl:openFriendWindow(true, FriendConst.Type.BlackList)
					else
						CommonAlert.show(string.format(TI18N("被列入黑名单后将无法接收到该玩家发出的消息\n是否确认将<div fontColor=#289b14 fontsize= 26>%s</div>列入黑名单？\n（若为好友则会把该玩家从好友列表里删除）"), uv0.data.name), TI18N("确定"), function ()
							uv0.ctrl:addToBlackList(uv0.data.rid, uv0.data.srv_id)
							uv0.ctrl:openFriendCheckPanel(false)
						end, TI18N("取消"), nil, CommonAlert.type.rich, nil)
					end
				end
			end
		end)
	end

	if slot0.updateEvent == nil then
		slot0.updateEvent = GlobalEvent:getInstance():Bind(RoleEvent.DISPATCH_PLAYER_VO_EVENT, function (slot0)
			if slot0 and slot0.rid == uv0.rid and slot0.srv_id == uv0.srv_id then
				uv0:updateData(slot0)
			end
		end)
	end
end

function FriendCheckInfoWindow.onClickReportBtn(slot0)
	if not slot0.data then
		return
	end

	if Config.RoleData.data_role_const.role_reported_lev_limit and ((RoleController:getInstance():getRoleVo() or {}).lev or 0) < slot1.val then
		message(slot1.val .. TI18N("级开放举报功能"))

		return
	end

	RoleController:getInstance():openRoleReportedPanel(true, slot0.data.rid, slot0.data.srv_id, slot0.data.name)
end

function FriendCheckInfoWindow.onClickByPos(slot0, slot1)
	if slot0.dic_use_badges and slot0.dic_use_badges[slot1] then
		TipsController:getInstance():openHonorIconTips(true, {
			id = slot0.dic_use_badges[slot1].id,
			show_type = RoleConst.role_type.eOther,
			have_name = slot0.data.name,
			have_time = slot0.dic_use_badges[slot1].time
		})
	end
end

function FriendCheckInfoWindow.updateData(slot0, slot1)
	slot0.data = slot1

	slot0.name:setString(transformNameByServ(slot1.name, slot1.srv_id))
	slot0.country:setPositionX(slot0.name:getPositionX() + slot0.name:getContentSize().width + 5)
	slot0.head:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)

	if slot1.gname ~= "" then
		slot0.guild:setString(slot1.gname)
	end

	if slot0.data.elite_lev and slot0.data.elite_lev ~= 0 and uv0[slot0.data.elite_lev] then
		slot0.rank:setString(uv0[slot0.data.elite_lev].name)
	else
		slot0.rank:setString(TI18N("暂无"))
	end

	if Config.AvatarData.data_avatar[slot1.avatar_bid] then
		slot0.head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot2.res_id or 1), false, false), nil, false, slot2.offy)
	end

	slot0.head:setLev(slot1.lev)
	slot0.head:setSex(slot1.sex, cc.p(70, 4))
	slot0.fight_label:setNum(slot1.power)

	if slot1.is_show_vip and slot1.is_show_vip == 1 then
		slot0.vip_bg:setVisible(false)
		slot0.vip_icon:setVisible(false)
		slot0.vip_label:setVisible(false)
		slot0.name:setPositionX(120)
	else
		slot0.vip_bg:setVisible(true)
		slot0.vip_icon:setVisible(true)
		slot0.vip_label:setVisible(true)
		slot0.vip_label:setNum(slot1.vip_lev)
		slot0.name:setPositionX(172)
	end

	slot0.report_btn_label:setString(TI18N("举 报"))

	if slot0.model:isFriend(slot1.srv_id, slot1.rid) then
		slot0.friend_btn_label:setString(TI18N("私聊"))
	else
		slot0.friend_btn_label:setString(TI18N("加为好友"))
	end

	if slot0.model:isBlack(slot1.rid, slot1.srv_id) then
		slot0.black_btn_label:setString(TI18N("黑名单"))
	else
		slot0.black_btn_label:setString(TI18N("加黑名单"))
	end

	slot0:createPartnerList(slot1.partner_list)

	slot0.dic_use_badges = {}

	if slot1.use_badges and next(slot1.use_badges) ~= nil then
		for slot6, slot7 in ipairs(slot1.use_badges) do
			if slot0.honor_item_list[slot7.pos] then
				slot0.dic_use_badges[slot7.pos] = slot7

				slot0.honor_item_list[slot7.pos]:setData(slot7)
				slot0.honor_item_list[slot7.pos]:setShowEffect(true)
			end
		end
	end

	slot0.elfin_tree_lv:setString(TI18N("佩罗娜等级：") .. (slot0.data.sprite_lev or 0))

	for slot7 = 1, 4 do
		if not slot0.elfin_list[slot7] then
			slot8 = SkillItem.new(true, true, false, 0.7, true)

			slot8:setPosition(cc.p(50 + (slot7 - 1) * 100, 42))
			slot0.elfin_skill_panel:addChild(slot8)

			slot0.elfin_list[slot7] = slot8
		end

		slot0:setElfinSkillItemData(slot8, slot0.data.sprites, slot7)
	end
end

function FriendCheckInfoWindow.getElfinBidByPos(slot0, slot1, slot2)
	if not slot1 or next(slot1) == nil then
		return
	end

	for slot6, slot7 in pairs(slot1) do
		if slot7.pos == slot2 then
			return slot7.item_bid
		end
	end
end

function FriendCheckInfoWindow.setElfinSkillItemData(slot0, slot1, slot2, slot3)
	if slot0:getElfinBidByPos(slot2, slot3) then
		slot1:showLockIcon(false)

		if slot4 == 0 or not Config.SpriteData.data_elfin_data(slot4) then
			slot1:setData()
			slot1:showLevel(false)
		elseif Config.SkillData.data_get_skill(slot5.skill) then
			slot1:addCallBack(function ()
				TipsManager:getInstance():showElfinTips(uv0)
			end)
			slot1:showLevel(true)
			slot1:setData(slot6)
		end
	else
		slot1:setData()
		slot1:showLevel(false)
		slot1:showLockIcon(true)
	end
end

function FriendCheckInfoWindow.createPartnerList(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		slot8 = HeroVo.New()

		slot8:updateHeroVo(slot7)
		table.insert(slot2, slot8)
	end

	slot6 = 0
	slot7 = nil
	slot12 = cc.size

	slot0.scroll_view:setInnerContainerSize(slot12(math.max(#slot2 * 106, slot0.scroll_view_size.width), slot0.scroll_view_size.height))

	for slot12, slot13 in ipairs(slot2) do
		delayRun(slot0.main_panel, slot12 / 60, function ()
			if uv0.item_list[uv1] == nil then
				uv2 = HeroExhibitionItem.new(0.8, true)

				uv2:setPosition(uv3 + uv4 * 0.5 + (uv1 - 1) * uv4, uv0.scroll_view_size.height * 0.5)
				uv2:setData(uv5)
				uv0.scroll_view:addChild(uv2)

				uv0.item_list[uv1] = uv2

				uv2:addCallBack(function (slot0)
					if slot0:getData() and next(slot1) ~= nil then
						if slot1.partner_id == 0 then
							slot2 = slot1.id
						end

						LookController:getInstance():sender11061(uv0.data.rid, uv0.data.srv_id, slot2)
					end
				end)
			end
		end)
	end
end

function FriendCheckInfoWindow.openRootWnd(slot0, slot1)
	if slot1 then
		slot0.rid = slot1.rid
		slot0.srv_id = slot1.srv_id
		slot0.flag = slot1.flag
		slot0.channel = slot1.channel

		if slot1 and slot1.rid and slot1.srv_id then
			RoleController:getInstance():requestRoleInfo(slot1.rid, slot1.srv_id)
		end

		if slot1.flag then
			slot0.at_btn:setVisible(true)
		end
	end
end

function FriendCheckInfoWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	for slot4, slot5 in pairs(slot0.elfin_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.updateEvent then
		GlobalEvent:getInstance():UnBind(slot0.updateEvent)

		slot0.updateEvent = nil
	end

	if slot0.fight_label then
		slot0.fight_label:DeleteMe()

		slot0.fight_label = nil
	end

	if slot0.vip_label then
		slot0.vip_label:DeleteMe()

		slot0.vip_label = nil
	end

	if slot0.head then
		slot0.head:DeleteMe()

		slot0.head = nil
	end

	if slot0.honor_item_load then
		for slot4, slot5 in pairs(slot0.honor_item_load) do
			slot5:DeleteMe()
		end

		slot0.honor_item_load = nil
	end

	slot0.ctrl:openFriendCheckPanel(false)
end
