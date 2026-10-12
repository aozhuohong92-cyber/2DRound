ArenateamDeletePlayerPanel = ArenateamDeletePlayerPanel or BaseClass(BaseView)
slot0 = ArenateamController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ArenateamDeletePlayerPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "arenateam/arenateam_delete_player_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arenateam_hall", "arenateam_hall"),
			type = ResourcesType.plist
		}
	}
end

function ArenateamDeletePlayerPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("踢除队员"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")

	slot0.main_container:getChildByName("tips"):setString(TI18N("您将踢除该成员:"))

	slot1 = slot0.main_container:getChildByName("team_item")
	slot0.player_name = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(132, 177), slot9, nil, 800)

	slot1:addChild(slot0.player_name)

	slot0.power = slot1:getChildByName("power")
	slot0.head = PlayerHead.new(PlayerHead.type.circle)

	slot0.head:setHeadLayerScale(0.8)
	slot0.head:setPosition(56, 160)
	slot0.head:setLev(99)
	slot1:addChild(slot0.head)

	slot0.hero_item_list = {}
	slot3 = HeroExhibitionItem.Width * 0.8 + 10

	for slot9 = 1, 5 do
		slot0.hero_item_list[slot9] = HeroExhibitionItem.new(0.8, true)

		slot0.hero_item_list[slot9]:setSwallowTouches(false)
		slot0.hero_item_list[slot9]:setPosition(slot1:getContentSize().width * 0.5 - slot3 * 5 * 0.5 + slot3 * 0.5 + (slot9 - 1) * slot3, 58)
		slot0.hero_item_list[slot9]:addCallBack(function ()
			uv0:onClickHeroItemByIndex(uv1)
		end)
		slot1:addChild(slot0.hero_item_list[slot9])
	end

	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("确 定"))
end

function ArenateamDeletePlayerPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickBtnRight), true, 1)
end

function ArenateamDeletePlayerPanel.onClickHeroItemByIndex(slot0, slot1)
	if not slot0.member_data then
		return
	end
end

function ArenateamDeletePlayerPanel.onClickBtnRight(slot0)
	if not slot0.member_data then
		return
	end

	uv0:sender27212(slot0.member_data.rid, slot0.member_data.sid)
end

function ArenateamDeletePlayerPanel.onClickBtnClose(slot0)
	uv0:openArenateamDeletePlayerPanel(false)
end

function ArenateamDeletePlayerPanel.openRootWnd(slot0, slot1)
	slot0.member_data = (slot1 or {}).member_data

	if not slot0.member_data then
		return
	end

	slot0.player_name:setString(slot0.member_data.name)
	slot0.power:setString(slot0.member_data.power)
	slot0.head:setHeadRes(slot0.member_data.face_id, false, LOADTEXT_TYPE, slot0.member_data.face_file, slot0.member_data.face_update_time)
	slot0.head:setLev(slot0.member_data.lev)

	slot3 = slot0.member_data.avatar_bid

	if slot0.record_res_bid == nil or slot0.record_res_bid ~= slot3 then
		slot0.record_res_bid = slot3

		if Config.AvatarData.data_avatar[slot3] then
			slot0.head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot4.res_id or 1), false, false), nil, false, slot4.offy)
		end
	end

	function slot7(slot0, slot1)
		return slot0.pos < slot1.pos
	end

	uv0(slot0.member_data.team_partner, slot7)

	for slot7, slot8 in ipairs(slot0.hero_item_list) do
		slot8:setData(slot0.member_data.team_partner[slot7])
	end
end

function ArenateamDeletePlayerPanel.close_callback(slot0)
	uv0:openArenateamDeletePlayerPanel(false)
end
