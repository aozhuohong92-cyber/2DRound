GodBattleResultView = GodBattleResultView or BaseClass(BaseView)
slot0 = GodbattleController:getInstance()
slot1 = RoleController:getInstance():getRoleVo()

function GodBattleResultView.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "godbattle/godbattle_result_view"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("godbattle", "godbattle_result"),
			type = ResourcesType.plist
		}
	}
	slot0.is_full_screen = false
	slot0.render_list = {}
end

function GodBattleResultView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.Sprite_6 = slot0.main_container:getChildByName("Sprite_6")

	if slot0.sprite_6_load == nil then
		slot0.sprite_6_load = loadSpriteTextureFromCDN(slot0.Sprite_6, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.sprite_6_load)
	end

	slot0.god_victory = slot0.main_container:getChildByName("god_victory")
	slot0.devil_victory = slot0.main_container:getChildByName("devil_victory")
	slot0.title_container = slot0.main_container:getChildByName("title_container")
	slot1 = nil

	for slot6 = 1, 4 do
		if slot0.title_container:getChildByName("label_" .. slot6) ~= nil then
			slot1:setString(({
				TI18N("排名"),
				TI18N("名字"),
				TI18N("击杀"),
				TI18N("积分")
			})[slot6])
		end
	end

	slot0.my_rank = slot0.main_container:getChildByName("my_rank")
	slot0.my_score = slot0.main_container:getChildByName("my_score")
	slot0.my_kill = slot0.main_container:getChildByName("my_kill")
	slot0.list_view = slot0.main_container:getChildByName("list_view")

	if slot0.scroll_view == nil then
		slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_view, nil, nil, nil, slot0.list_view:getContentSize(), {
			start_y = 7,
			item_width = 720,
			start_x = 0,
			space_x = 0,
			row = 0,
			item_height = 60,
			space_y = 0,
			col = 1,
			need_dynamic = true,
			item_class = GodBattleResultList
		})
	end

	slot0.item = slot0.root_wnd:getChildByName("item")

	slot0.item:setVisible(false)
end

function GodBattleResultView.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:openGodBattleResult(false)
		end
	end)
end

function GodBattleResultView.handleEffect(slot0, slot1)
end

function GodBattleResultView.openRootWnd(slot0)
	slot0:handleEffect(true)

	if uv0:getGodBattleResult() == nil then
		slot1 = {}
	end

	slot0.render_list = deepCopy(slot1.role_list or {})
	slot0.ret = slot1.ret or 0

	slot0.god_victory:setVisible(slot0.ret == GodBattleConstants.camp.god)
	slot0.devil_victory:setVisible(slot0.ret == GodBattleConstants.camp.devil)

	if slot0.render_list ~= nil and next(slot0.render_list) ~= nil then
		table.sort(slot0.render_list, SortTools.tableUpperSorter({
			"score",
			"win_acc"
		}))
	end

	slot2 = nil
	slot3 = 0

	if slot0.render_list then
		slot4 = {}

		for slot8, slot9 in ipairs(slot0.render_list) do
			slot9.rank = slot8

			if getNorKey(uv1.rid, uv1.srv_id) == getNorKey(slot9.rid, slot9.srv_id) then
				slot2 = slot9
				slot3 = slot8
			end

			if slot4[slot9.camp] == nil then
				slot4[slot9.camp] = true
				slot9.is_mvp = true
			end
		end
	end

	if slot2 then
		slot0.my_rank:setString(TI18N("我的排名:") .. slot3)
		slot0.my_kill:setString(TI18N("击杀数:") .. slot2.win_acc)
		slot0.my_score:setString(TI18N("积分:") .. slot2.score)
	end

	slot0.scroll_view:setData(slot0.render_list, nil, nil, slot0.item)
end

function GodBattleResultView.close_callback(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil

	if slot0.sprite_6_load then
		slot0.sprite_6_load:DeleteMe()

		slot0.sprite_6_load = nil
	end

	uv0:openGodBattleResult(false)
	slot0:handleEffect(false)
end

GodBattleResultList = GodBattleResultList or class("GodBattleResultList", function ()
	return ccui.Widget:create()
end)

function GodBattleResultList.ctor(slot0)
end

function GodBattleResultList.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)

		slot0.mvp = slot0.root_wnd:getChildByName("mvp")
		slot0.rank = slot0.root_wnd:getChildByName("rank")
		slot0.rank_img = slot0.root_wnd:getChildByName("rank_img")
		slot0.role_name = slot0.root_wnd:getChildByName("role_name")
		slot0.kill = slot0.root_wnd:getChildByName("kill")
		slot0.score = slot0.root_wnd:getChildByName("score")
		slot0.touch_btn = slot0.root_wnd:getChildByName("touch_btn")

		slot0.touch_btn:setTouchEnabled(true)
		slot0.rank_img:ignoreContentAdaptWithSize(true)
		slot0.mvp:ignoreContentAdaptWithSize(true)
		slot0:registerEvent()
	end
end

function GodBattleResultList.registerEvent(slot0)
	slot0.touch_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and uv0.data then
			RoleController:getInstance():requestWorshipRole(uv0.data.rid, uv0.data.srv_id, uv0.data.rank, WorshipType.godbattle)
			uv0.touch_btn:setTouchEnabled(false)
			setChildUnEnabled(true, uv0.touch_btn, Config.ColorData.data_color4[175])
		end
	end)
end

function GodBattleResultList.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1

	slot0.rank:setString(slot1.rank)
	slot0.role_name:setString(uv0:convertName(slot1))
	slot0.rank:setVisible(slot1.rank > 3)
	slot0.rank_img:setVisible(slot1.rank <= 3)

	if RoleController:getInstance():getRoleVo().rid == slot1.rid and slot2.srv_id == slot1.srv_id then
		slot0.touch_btn:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.touch_btn, Config.ColorData.data_color4[175])
	end

	if slot1.rank <= 3 then
		slot0.rank_img:loadTexture(PathTool.getResFrame("common", "common_300" .. slot1.rank), LOADTEXT_TYPE_PLIST)
	end

	slot3, slot4 = nil

	if slot1.camp == GodBattleConstants.camp.god then
		slot3 = Config.ZsWarData.data_const.god_name

		slot0.role_name:setTextColor(cc.c4b(105, 172, 255, 255))
	else
		slot3 = Config.ZsWarData.data_const.imp_name

		slot0.role_name:setTextColor(cc.c4b(237, 67, 67, 255))
	end

	if slot1.is_mvp then
		slot0.mvp:loadTexture((slot1.camp ~= GodBattleConstants.camp.god or PathTool.getResFrame("godbattle", "godbattle_result_2", "godbattle_result")) and PathTool.getResFrame("godbattle", "godbattle_result_1", "godbattle_result"), LOADTEXT_TYPE_PLIST)
		slot0.mvp:setPositionX(slot0.role_name:getPositionX() + slot0.role_name:getContentSize().width * 0.5 + 2)
	end

	slot0.mvp:setVisible(slot1.is_mvp)
	slot0.score:setString(slot1.score or 0)
	slot0.kill:setString(slot1.win_acc or 0)
end

function GodBattleResultList.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
