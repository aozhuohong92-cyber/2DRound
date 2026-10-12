PrimusChallengeRecordItem = class("PrimusChallengeRecordItem", function ()
	return ccui.Widget:create()
end)

function PrimusChallengeRecordItem.ctor(slot0)
	slot0.ctrl = GuildwarController:getInstance()
	slot0.item_list = {}

	slot0:configUI()
	slot0:register_event()
end

function PrimusChallengeRecordItem.configUI(slot0)
	slot0.size = cc.size(616, 218)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("primus/primus_challenge_record_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.name_label = slot0.container:getChildByName("name_label")
	slot0.time_label = slot0.container:getChildByName("time_label")
	slot0.attk_label = slot0.container:getChildByName("attk_label")
	slot0.magic_label = slot0.container:getChildByName("magic_label")
	slot0.result_label = createRichLabel(22, 1, cc.p(1, 0.5), cc.p(0, 0))

	slot0.container:getChildByName("result_node"):addChild(slot0.result_label)

	slot0.vedio_btn = slot0.container:getChildByName("vedio_btn")
	slot0.role_list = slot0.container:getChildByName("role_list")

	slot0.role_list:setTouchEnabled(false)

	slot3 = slot0.role_list:getContentSize()
	slot0.scroll_view_size = cc.size(slot3.width - 10, slot3.height)
	slot0.scroll_view = createScrollView(slot0.scroll_view_size.width, slot0.scroll_view_size.height, 8, 0, slot0.role_list, ccui.ScrollViewDir.horizontal)

	slot0.scroll_view:setSwallowTouches(false)
end

function PrimusChallengeRecordItem.register_event(slot0)
	slot0.vedio_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.data.replay_id then
				BattleController:getInstance():csRecordBattle(uv0.data.replay_id)
			end
		end
	end)
end

function PrimusChallengeRecordItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.name_label:setString(string.format(TI18N("挑战者：%s"), slot1.name))
	slot0.attk_label:setString(string.format(TI18N("战力：%d"), slot1.power))
	slot0.time_label:setString(TimeTool.getYMDHMS(slot1.time))

	if Config.FormationData.data_form_data[slot1.formation_type] then
		slot0.magic_label:setString(slot2.name)
	end

	slot3 = slot1.num or 0

	slot0.result_label:setString(string.format(TI18N("<div fontColor=##955322>挑战进化<div fontcolor=#249003>%s次</div>成功</div>"), slot1.num))

	slot4 = {}

	for slot8, slot9 in pairs(slot1.partner_list) do
		slot10 = HeroVo.New()

		slot10:updateHeroVo(slot9)
		table.insert(slot4, slot10)
	end

	slot7 = #slot4
	slot9 = 0
	slot14 = cc.size

	slot0.scroll_view:setInnerContainerSize(slot14(math.max(slot7 * HeroExhibitionItem.Width * 0.8 + (slot7 - 1) * 6, slot0.scroll_view_size.width), slot0.scroll_view_size.height))

	for slot14, slot15 in ipairs(slot4) do
		delayRun(slot0.container, slot14 * 4 / 60, function ()
			slot0 = HeroExhibitionItem.new(uv0, false)

			slot0:setPosition(uv1 + uv2 * uv0 * 0.5 + (uv3 - 1) * (uv2 * uv0 + 6), uv4.scroll_view_size.height * 0.5)
			slot0:setData(uv5, nil, is_spec)
			uv4.scroll_view:addChild(slot0)
			table.insert(uv4.item_list, slot0)
		end)
	end
end

function PrimusChallengeRecordItem.DeleteMe(slot0)
	doStopAllActions(slot0.container)

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end
end
