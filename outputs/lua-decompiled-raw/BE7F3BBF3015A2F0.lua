GodBattleKillNoticeView = GodBattleKillNoticeView or BaseClass(BaseView)
slot0 = GodbattleController:getInstance()

function GodBattleKillNoticeView.__init(slot0)
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "godbattle/godbattle_kill_notice_view"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("godbattle", "godbattle"),
			type = ResourcesType.plist
		}
	}
end

function GodBattleKillNoticeView.open_callback(slot0)
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.left_head = slot0.main_container:getChildByName("left_head")
	slot0.left_role = PlayerHead.new(PlayerHead.type.circle)

	slot0.left_role:setAnchorPoint(0.5, 0.5)
	slot0.left_role:setScale(0.5)
	slot0.left_role:setPosition(slot0.left_head:getContentSize().width / 2, slot0.left_head:getContentSize().height / 2)
	slot0.left_head:addChild(slot0.left_role)

	slot0.right_head = slot0.main_container:getChildByName("right_head")
	slot0.right_role = PlayerHead.new(PlayerHead.type.circle)

	slot0.right_role:setAnchorPoint(0.5, 0.5)
	slot0.right_role:setScale(0.5)
	slot0.right_role:setPosition(slot0.right_head:getContentSize().width / 2, slot0.right_head:getContentSize().height / 2)
	slot0.right_head:addChild(slot0.right_role)

	slot0.top_img = slot0.main_container:getChildByName("top_img")
	slot0.bottom_img = slot0.main_container:getChildByName("bottom_img")
	slot0.left_frame = slot0.main_container:getChildByName("left_frame")
	slot0.right_frame = slot0.main_container:getChildByName("right_frame")
	slot0.notice_txt = slot0.main_container:getChildByName("notice_txt")
	slot0.left_name = slot0.main_container:getChildByName("left_name")
	slot0.right_name = slot0.main_container:getChildByName("right_name")
end

function GodBattleKillNoticeView.register_event(slot0)
end

function GodBattleKillNoticeView.openRootWnd(slot0, slot1)
	slot0.data = slot1
	slot2 = nil

	if slot1.type <= 6 then
		slot2 = PathTool.getResFrame("godbattle", "txt_cn_godbattle_" .. slot1.type)
	end

	if slot2 ~= nil then
		loadSpriteTexture(slot0.notice_txt, slot2, LOADTEXT_TYPE_PLIST)
	end

	if slot1.camp1 == GodBattleConstants.camp.god then
		loadSpriteTexture(slot0.top_img, PathTool.getResFrame("godbattle", "godbattle_15"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.bottom_img, PathTool.getResFrame("godbattle", "godbattle_15"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.left_frame, PathTool.getResFrame("godbattle", "godbattle_17"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.right_frame, PathTool.getResFrame("godbattle", "godbattle_18"), LOADTEXT_TYPE_PLIST)
	else
		loadSpriteTexture(slot0.top_img, PathTool.getResFrame("godbattle", "godbattle_16"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.bottom_img, PathTool.getResFrame("godbattle", "godbattle_16"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.left_frame, PathTool.getResFrame("godbattle", "godbattle_18"), LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.right_frame, PathTool.getResFrame("godbattle", "godbattle_17"), LOADTEXT_TYPE_PLIST)
	end

	slot0.left_role:setHeadRes(slot1.face1)
	slot0.left_name:setString(transformNameByServ(slot1.name1, slot1.srv_id1))
	slot0.right_role:setHeadRes(slot1.face2)
	slot0.right_name:setString(slot1.name2)
	slot0.right_name:setString(transformNameByServ(slot1.name2, slot1.srv_id2))
	setChildUnEnabled(true, slot0.right_role)
	slot0:timeCountDown()
end

function GodBattleKillNoticeView.timeCountDown(slot0)
	if slot0.timer == nil then
		slot0.timer = GlobalTimeTicket:getInstance():add(function ()
			uv0:close()
		end, 2)
	end
end

function GodBattleKillNoticeView.clearTimer(slot0)
	if slot0.timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.timer)

		slot0.timer = nil
	end
end

function GodBattleKillNoticeView.close_callback(slot0)
	if slot0.left_role then
		slot0.left_role:DeleteMe()
	end

	slot0.left_role = nil

	if slot0.right_role then
		slot0.right_role:DeleteMe()
	end

	slot0.right_role = nil

	uv0:openGodBattleKillNoticeView(false)
	slot0:clearTimer()
end
