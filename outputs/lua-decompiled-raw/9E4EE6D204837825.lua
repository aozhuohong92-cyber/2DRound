GodBattleInfoView = GodBattleInfoView or BaseClass(BaseView)
slot1 = GodbattleController:getInstance():getModel()
slot2 = RoleController:getInstance():getRoleVo()

function GodBattleInfoView.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "godbattle/godbattle_info_view"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("godbattle", "godbattle_result"),
			type = ResourcesType.plist
		}
	}
	slot0.role_list = {}
end

function GodBattleInfoView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.Sprite_6 = slot0.main_container:getChildByName("Sprite_6")

	if slot0.sprite_6_load == nil then
		slot0.sprite_6_load = loadSpriteTextureFromCDN(slot0.Sprite_6, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.sprite_6_load)
	end

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
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_view, nil, , , slot0.list_view:getContentSize(), {
		start_y = 7,
		item_width = 720,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 60,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = GodBattleInfoList
	})
	slot0.item = slot0.root_wnd:getChildByName("item")

	slot0.item:setVisible(false)
end

function GodBattleInfoView.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:openGodBattleInfoView(false)
		end
	end)
end

function GodBattleInfoView.openRootWnd(slot0)
	for slot5, slot6 in pairs(uv0:getGodBattleRoleList() or {}) do
		table.insert(slot0.role_list, slot6)
	end

	if slot0.role_list ~= nil and next(slot0.role_list) ~= nil then
		table.sort(slot0.role_list, SortTools.tableUpperSorter({
			"score",
			"win_acc"
		}))
	end

	slot2 = nil
	slot3 = 0

	if slot0.role_list then
		for slot7, slot8 in ipairs(slot0.role_list) do
			slot8.rank = slot7

			if getNorKey(uv1.rid, uv1.srv_id) == getNorKey(slot8.rid, slot8.srv_id) then
				slot2 = slot8
				slot3 = slot7
			end
		end
	end

	if slot2 then
		slot0.my_rank:setString(TI18N("我的排名:") .. slot3)
		slot0.my_kill:setString(TI18N("击杀数:") .. slot2.win_acc)
		slot0.my_score:setString(TI18N("积分:") .. slot2.score)
	end

	slot0.scroll_view:setData(slot0.role_list, nil, , slot0.item)
end

function GodBattleInfoView.close_callback(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil

	if slot0.sprite_6_load then
		slot0.sprite_6_load:DeleteMe()

		slot0.sprite_6_load = nil
	end

	uv0:openGodBattleInfoView(false)
end

GodBattleInfoList = GodBattleInfoList or class("GodBattleInfoList", function ()
	return ccui.Widget:create()
end)

function GodBattleInfoList.ctor(slot0)
end

function GodBattleInfoList.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)

		slot0.rank = slot0.root_wnd:getChildByName("rank")
		slot0.rank_img = slot0.root_wnd:getChildByName("rank_img")
		slot0.role_name = slot0.root_wnd:getChildByName("role_name")
		slot0.kill = slot0.root_wnd:getChildByName("kill")
		slot0.score = slot0.root_wnd:getChildByName("score")

		slot0.rank_img:ignoreContentAdaptWithSize(true)
	end
end

function GodBattleInfoList.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.rank:setString(slot1.rank)
	slot0.role_name:setString(uv0:convertName(slot1))
	slot0.rank:setVisible(slot1.rank > 3)
	slot0.rank_img:setVisible(slot1.rank <= 3)

	if slot1.rank <= 3 then
		slot0.rank_img:loadTexture(PathTool.getResFrame("common", "common_300" .. slot1.rank), LOADTEXT_TYPE_PLIST)
	end

	slot2, slot3 = nil

	if slot1.camp == GodBattleConstants.camp.god then
		slot2 = Config.ZsWarData.data_const.god_name

		slot0.role_name:setTextColor(cc.c4b(105, 172, 255, 255))
	else
		slot2 = Config.ZsWarData.data_const.imp_name

		slot0.role_name:setTextColor(cc.c4b(237, 67, 67, 255))
	end

	slot0.score:setString(slot1.score or 0)
	slot0.kill:setString(slot1.win_acc or 0)
end

function GodBattleInfoList.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
