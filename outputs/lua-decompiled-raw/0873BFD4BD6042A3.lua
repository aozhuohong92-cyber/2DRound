GuildbossResultDpsRankWindow = GuildbossResultDpsRankWindow or BaseClass(BaseView)
slot0 = GuildbossController:getInstance()
slot1 = GuildbossController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort

function GuildbossResultDpsRankWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.effect_cache_list = {}
	slot0.layout_name = "guildboss/guildboss_result_dpsrank_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildboss", "guildboss"),
			type = ResourcesType.plist
		}
	}
end

function GuildbossResultDpsRankWindow.open_callback(slot0)
	slot0.root_wnd:getChildByName("background"):setScale(display.getMaxScale())

	slot2 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot2, 2)
	slot2:getChildByName("win_title"):setString(TI18N("伤害排行"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.list_container = slot2:getChildByName("list_container")
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_container, nil, , , slot0.list_container:getContentSize(), {
		start_y = 0,
		item_width = 558,
		start_x = 4,
		space_x = 4,
		row = 0,
		item_height = 135,
		space_y = 0,
		col = 1,
		item_class = GuildbossResultDpsRankItem
	})
end

function GuildbossResultDpsRankWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGuildbossResultDpsRankWindow(false)
		end
	end)
end

function GuildbossResultDpsRankWindow.openRootWnd(slot0, slot1)
	if slot1 and slot1.partner_dps_list and next(slot1.partner_dps_list) then
		uv0(slot1.partner_dps_list, SortTools.tableUpperSorter({
			"dps"
		}))

		slot6 = nil
		slot7 = 1

		for slot11, slot12 in ipairs(slot1.partner_dps_list) do
			if HeroController:getInstance():getModel():getHeroById(slot12.p_id) ~= nil then
				slot7 = slot7 + 1
			end
		end

		slot0.scroll_view:setData({
			[slot7] = {
				rank = slot7,
				vo = slot6,
				dps = slot12.dps,
				total_dps = slot1.all_dps
			}
		})
	end
end

function GuildbossResultDpsRankWindow.close_callback(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	uv0:openGuildbossResultDpsRankWindow(false)
end

GuildbossResultDpsRankItem = class("GuildbossResultDpsRankItem", function ()
	return ccui.Layout:create()
end)

function GuildbossResultDpsRankItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guildboss/guildboss_result_dpsrank_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.rank_img = slot0.root_wnd:getChildByName("rank_img")
	slot0.rank_value = slot0.root_wnd:getChildByName("rank_value")
	slot0.dps = slot0.root_wnd:getChildByName("dps")
	slot0.role_name = slot0.root_wnd:getChildByName("role_name")
	slot0.best_img = slot0.root_wnd:getChildByName("best_img")
	slot0.progress_bar = slot0.root_wnd:getChildByName("progress_bar")

	slot0.progress_bar:setScale9Enabled(true)

	slot0.partner_item = HeroExhibitionItem.new(1, false)

	slot0.partner_item:setPosition(172, 68)
	slot0.partner_item:setScale(0.9)
	slot0.root_wnd:addChild(slot0.partner_item)
end

function GuildbossResultDpsRankItem.setData(slot0, slot1)
	if slot1 and slot1.vo then
		if slot1.rank <= 3 then
			slot0.rank_value:setVisible(false)
			slot0.rank_img:setVisible(true)

			if slot0.res_id ~= PathTool.getResFrame("common", "common_300" .. slot1.rank) then
				slot0.res_id = slot2

				loadSpriteTexture(slot0.rank_img, slot2, LOADTEXT_TYPE_PLIST)
			end
		else
			slot0.rank_img:setVisible(false)
			slot0.rank_value:setVisible(true)
			slot0.rank_value:setString(slot1.rank)
		end

		slot0.partner_item:setData(slot1.vo)
		slot0.best_img:setVisible(slot1.rank == 1)
		slot0.role_name:setString(slot1.vo.name or "")
		slot0.dps:setString(uv0(TI18N("伤害量：%s"), slot1.dps))
		slot0.progress_bar:setPercent(100 * slot1.dps / slot1.total_dps)
	end
end

function GuildbossResultDpsRankItem.DeleteMe(slot0)
	if slot0.partner_item then
		slot0.partner_item:DeleteMe()

		slot0.partner_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
