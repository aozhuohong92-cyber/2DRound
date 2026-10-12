LadderRoleInfoWindow = LadderRoleInfoWindow or BaseClass(BaseView)
slot1 = LadderController:getInstance():getModel()

function LadderRoleInfoWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "ladder/ladder_role_info"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("friend", "friend"),
			type = ResourcesType.plist
		}
	}
	slot0.item_list = {}
end

function LadderRoleInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.challenge_btn = slot0.main_panel:getChildByName("challenge_btn")

	slot0.challenge_btn:getChildByName("label"):setString(TI18N("挑战"))

	slot0.black_btn = slot0.main_panel:getChildByName("black_btn")

	slot0.black_btn:getChildByName("label"):setString(TI18N("防守阵容"))

	slot0.title_container = slot0.main_panel:getChildByName("title_container")

	slot0.title_container:getChildByName("title_label"):setString(TI18N("挑战对手"))

	slot0.info_con = slot0.main_panel:getChildByName("info_con")
	slot0.name = slot0.info_con:getChildByName("name")

	slot0.info_con:getChildByName("rank_title"):setString(TI18N("排名："))

	slot0.rank = slot0.info_con:getChildByName("rank")

	slot0.rank:setString(TI18N("暂无"))
	slot0.info_con:getChildByName("guild_title"):setString(TI18N("公会："))

	slot0.guild = slot0.info_con:getChildByName("guild")

	slot0.guild:setString(TI18N("暂无"))

	slot0.head = PlayerHead.new(PlayerHead.type.circle)

	slot0.head:setAnchorPoint(cc.p(0, 0))
	slot0.head:setPosition(cc.p(10, -5))
	slot0.info_con:addChild(slot0.head)

	slot0.vip_label = CommonNum.new(19, slot0.info_con, 0, -2, cc.p(0, 0.5))

	slot0.vip_label:setPosition(145, 85)

	slot0.main_container = slot0.main_panel:getChildByName("main_container")

	slot0.main_container:getChildByName("fight_title"):setString(TI18N("战斗阵容"))

	slot0.fight_label = CommonNum.new(20, slot0.main_container, 0, -2, cc.p(0, 0.5))

	slot0.fight_label:setPosition(420, 178)

	slot0.scrollCon = slot0.main_container:getChildByName("scrollCon")
	slot0.scroll_view_size = slot0.scrollCon:getContentSize()
	slot0.scroll_view = createScrollView(slot0.scroll_view_size.width, slot0.scroll_view_size.height, 0, 0, slot0.scrollCon, ccui.ScrollViewDir.horizontal)
end

function LadderRoleInfoWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.black_btn, handler(slot0, slot0._onClickAdjustRoleForm))
	registerButtonEventListener(slot0.challenge_btn, handler(slot0, slot0._onClickBtnChallenge))

	if slot0.ladder_enemy_data_event == nil then
		slot0.ladder_enemy_data_event = GlobalEvent:getInstance():Bind(LadderEvent.GetLadderEnemyData, function (slot0)
			uv0:setData(slot0)
		end)
	end
end

function LadderRoleInfoWindow._onClickBtnClose(slot0)
	uv0:openLadderRoleInfoWindow(false)
end

function LadderRoleInfoWindow._onClickAdjustRoleForm(slot0)
	HeroController:getInstance():openFormMainWindow(true, PartnerConst.Fun_Form.Ladder)
end

function LadderRoleInfoWindow._onClickBtnChallenge(slot0)
	if slot0.data and slot0.data.rid and slot0.data.srv_id then
		uv0:checkJoinLadderBattle(slot0.data.rid, slot0.data.srv_id)
	end
end

function LadderRoleInfoWindow.setData(slot0, slot1)
	slot0.data = slot1

	slot0.name:setString(transformNameByServ(slot1.name, slot1.srv_id))
	slot0.head:setHeadRes(slot1.face, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)

	if slot1.gname and slot1.gname ~= "" then
		slot0.guild:setString(slot1.gname)
	end

	if Config.AvatarData.data_avatar[slot1.avatar_id or 0] then
		slot0.head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot2.res_id or 1), false, false), nil, false, slot2.offy)
	end

	slot0.head:setLev(slot1.lev)
	slot0.rank:setString(string.format(TI18N("%d名"), slot1.rank or 0))
	slot0.head:setSex(slot1.sex, cc.p(70, 4))
	slot0.vip_label:setNum(slot1.vip_lev)
	slot0.fight_label:setNum(slot1.power)
	slot0:createPartnerList(slot1.p_list)
end

function LadderRoleInfoWindow.createPartnerList(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		slot8 = HeroVo.New()
		slot9 = deepCopy(slot7)
		slot9.use_skin = slot9.quality
		slot9.partner_id = slot7.id

		slot8:updateHeroVo(slot9)
		table.insert(slot2, slot8)
	end

	slot3 = #slot2
	slot5 = 7
	slot10 = cc.size

	slot0.scroll_view:setInnerContainerSize(slot10(math.max(slot3 * 104 + (slot3 - 1) * 6, slot0.scroll_view_size.width), slot0.scroll_view_size.height))

	for slot10, slot11 in ipairs(slot2) do
		delayRun(slot0.main_panel, slot10 / 60, function ()
			if uv0.item_list[uv1] == nil then
				slot0 = HeroExhibitionItem.new(0.88, true)

				slot0:setPosition(uv2 + 52 + (uv1 - 1) * 110, uv0.scroll_view_size.height * 0.5)
				slot0:setData(uv3)
				slot0:addCallBack(function (slot0)
					if slot0:getData() and next(slot1) ~= nil then
						slot2 = slot1.partner_id

						LadderController:getInstance():requestCheckRoleInfo(uv0.data.rid, uv0.data.srv_id, slot1.pos)
					end
				end)
				uv0.scroll_view:addChild(slot0)

				uv0.item_list[uv1] = slot0
			end
		end)
	end
end

function LadderRoleInfoWindow.openRootWnd(slot0, slot1)
	if slot1 and slot1.rid and slot1.srv_id then
		uv0:requestLadderEnemyData(slot1.rid, slot1.srv_id)
	end
end

function LadderRoleInfoWindow.close_callback(slot0)
	if slot0.ladder_enemy_data_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.ladder_enemy_data_event)

		slot0.ladder_enemy_data_event = nil
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

	uv0:openLadderRoleInfoWindow(false)
end
