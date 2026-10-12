AdventureMineFightPanel = AdventureMineFightPanel or BaseClass(BaseView)
slot1 = AdventureController:getInstance():getUiModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function AdventureMineFightPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "adventure/adventure_mine_fight_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventuremine"),
			type = ResourcesType.plist
		}
	}
	slot0.hero_item_list = {}

	if Config.AdventureMineData.data_const.diamond_attack then
		slot0.max_buy_count = slot1.val
	else
		slot0.max_buy_count = 3
	end
end

function AdventureMineFightPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")
	slot0.fight_label = CommonNum.new(20, slot0.main_container:getChildByName("power_click"), 0, -2, cc.p(0.5, 0.5))

	slot0.fight_label:setPosition(103, 28)

	slot0.mine_icon = slot0.main_container:getChildByName("mine_icon")
	slot0.mine_name = slot0.main_container:getChildByName("mine_name")
	slot0.player_name_key = slot0.main_container:getChildByName("player_name_key")
	slot0.player_name = slot0.main_container:getChildByName("player_name")
	slot0.put_info_key = slot0.main_container:getChildByName("put_info_key")

	slot0.put_info_key:setString(TI18N("灵矿产出："))

	slot0.put_info = createRichLabel(24, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(435, 526), 6, nil, 900)

	slot0.main_container:addChild(slot0.put_info)

	slot0.desc1 = slot0.main_container:getChildByName("desc1")
	slot0.desc2 = slot0.main_container:getChildByName("desc2")
	slot0.fight_count = createRichLabel(22, cc.c4b(255, 242, 199, 255), cc.p(1, 0.5), cc.p(652, 256), 6, nil, 900)

	slot0.main_container:addChild(slot0.fight_count)

	slot0.challenge_btn = slot0.main_container:getChildByName("challenge_btn")

	slot0.challenge_btn:getChildByName("label"):setString(TI18N("挑 战"))

	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("放弃占领"))

	slot0.center_btn = slot0.main_container:getChildByName("center_btn")

	slot0.center_btn:getChildByName("label"):setString(TI18N("防守布阵"))

	slot0.hero_node = slot0.main_container:getChildByName("hero_node")
	slot0.item_scrollview = slot0.main_container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	slot0.empty_label = createLabel(26, Config.ColorData.data_color4[175], nil, 350, 170, TI18N("暂无收益"), slot0.main_container, 0, cc.p(0.5, 0.5))
end

function AdventureMineFightPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.challenge_btn, handler(slot0, slot0.onClickBtnChallenge), true, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnLeft), true, 2)
	registerButtonEventListener(slot0.center_btn, handler(slot0, slot0.onClickBtnCenter), true, 2)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_SINGLE_INFO_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_GIVE_UP_OCCUPY_EVENT, function (slot0)
		uv0:onClickBtnClose()
	end)
	slot0:addGlobalEvent(AdventureEvent.ADVENTURE_MINE_SAVE_BACK_EVENT, function (slot0, slot1, slot2)
		if not slot0 then
			return
		end

		for slot6, slot7 in ipairs(slot0) do
			if HeroController:getInstance():getModel():getHeroById(slot7.id) then
				slot7.id = slot8.id
				slot7.bid = slot8.bid
				slot7.lev = slot8.lev
				slot7.star = slot8.star
				slot7.use_skin = slot8.use_skin
			end
		end

		if uv0.scdata then
			uv0.scdata.defense = slot0
			uv0.scdata.id = slot1
			uv0.scdata.hallows_id = slot2

			uv0:updateHeroList()
		end
	end)
end

function AdventureMineFightPanel.onClickBtnClose(slot0)
	uv0:openAdventureMineFightPanel(false)
end

function AdventureMineFightPanel.onClickBtnChallenge(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if not slot0.floor then
		return
	end

	if not slot0.room_id then
		return
	end

	if slot0:checkTimeInfo() then
		return
	end

	if not slot0.max_buy_count then
		return
	end

	if not uv0:getMineBuyCount() then
		return
	end

	if uv0:getChallengeCount() == 0 and slot0.max_buy_count <= slot2 then
		message(TI18N("已达到今日挑战次数上限"))

		return
	end

	if not (slot1 or {}).is_occupy_count and slot0:checkMaxOccupyInfo() then
		return
	end

	if not slot4.is_buy_count and uv0:getChallengeCount() == 0 then
		slot0:onBuyBtn()

		return
	end

	if slot0:checkLayerInfo() then
		return
	end

	slot0:onFormGoFight()
end

function AdventureMineFightPanel.onFormGoFight(slot0)
	HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.Adventure_Mine, {
		floor = slot0.floor,
		room_id = slot0.room_id
	})
end

function AdventureMineFightPanel.checkTimeInfo(slot0)
	if not slot0.scdata then
		return
	end

	if Config.AdventureMineData.data_const.protect_time and slot1.val * 60 - (GameNet:getInstance():getTime() - slot0.scdata.occupy_time) > 0 then
		if math.floor(slot3 / 60) > 0 then
			message(uv0(TI18N("该灵矿现在还不能进攻哦，%s分钟后再来吧！"), slot4))
		else
			message(uv0(TI18N("该灵矿现在还不能进攻哦，%s秒后再来吧！"), math.floor(slot3 % 60)))
		end

		return true
	end

	return false
end

function AdventureMineFightPanel.checkMaxOccupyInfo(slot0)
	if (uv0:getMineOccupyCount() or 0) >= (uv0:getMineLockCount() or 0) then
		CommonAlert.show(TI18N("当前灵矿占领数量已达上限,确定进攻吗?"), TI18N("确定"), function ()
			uv0:onClickBtnChallenge({
				is_occupy_count = true
			})
		end, TI18N("取消"), nil, , , {
			title = TI18N("提示")
		}, nil, )

		return true
	end

	return false
end

function AdventureMineFightPanel.onBuyBtn(slot0)
	slot1 = Config.ItemData.data_assets_label2id.gold
	slot2 = 50

	if Config.AdventureMineData.data_const.diamond_cost then
		slot2 = slot3.val
	end

	CommonAlert.show(uv0(TI18N("挑战次数不足, 是否花费 <img src='%s' scale=0.3 /> %s购买一次挑战次数？"), PathTool.getItemRes(Config.ItemData.data_get_data(slot1).icon), slot2), TI18N("确定"), function ()
		uv0:send20655()
	end, TI18N("取消"), nil, CommonAlert.type.rich)
end

function AdventureMineFightPanel.checkLayerInfo(slot0)
	if not slot0.config then
		return
	end

	if not slot0.floor then
		return
	end

	if next(slot0.config.hook_items) == nil then
		return
	end

	slot1 = slot0.config.hook_items[1][2]
	slot2, slot3 = uv0:getMineRate(slot0.floor, slot1)

	if slot1 - slot2 > 0 then
		slot0.alert = CommonAlert.show(TI18N("确定进攻该层灵矿吗？"), TI18N("确定"), function ()
			uv0:onFormGoFight()

			if uv0.alert then
				uv0.alert:close()

				uv0.alert = nil
			end
		end, TI18N("取消"), nil, , , {
			extend_offy = -5,
			off_y = 43,
			title = TI18N("提示"),
			extend_str = uv1(TI18N("(因层数过低, 该层灵矿收益将会减少%s%%)"), (slot3 or 0) / 10),
			extend_aligment = cc.TEXT_ALIGNMENT_CENTER
		}, nil, )

		return true
	end

	return false
end

function AdventureMineFightPanel.onClickBtnLeft(slot0)
	if not slot0.scdata then
		return
	end

	if not slot0.floor then
		return
	end

	if not slot0.room_id then
		return
	end

	CommonAlert.show(TI18N("确定要放弃占领吗？"), TI18N("确定"), function ()
		uv0:send20651(uv1.floor, uv1.room_id)
	end, TI18N("取消"), nil, , , {
		timer = 3,
		timer_for = true,
		extend_offy = -5,
		off_y = 43,
		title = TI18N("提示"),
		extend_str = TI18N("(放弃后只能获得当前累积收益)"),
		extend_aligment = cc.TEXT_ALIGNMENT_CENTER
	}, nil, )
end

function AdventureMineFightPanel.onClickBtnCenter(slot0)
	if not slot0.scdata then
		return
	end

	if not slot0.floor then
		return
	end

	if not slot0.room_id then
		return
	end

	HeroController:getInstance():openAdventureMineFormGoFightPanel(true, PartnerConst.Fun_Form.Adventure_Mine_Def, {
		floor = slot0.floor,
		room_id = slot0.room_id,
		defense = slot0.scdata.defense,
		formation_type = slot0.scdata.id,
		hallows_id = slot0.scdata.hallows_id
	}, HeroConst.FormShowType.eFormSave)
end

function AdventureMineFightPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.show_type = slot2.show_type or 1
	slot0.floor = slot2.floor
	slot0.room_id = slot2.room_id

	if not slot0.floor or not slot0.room_id then
		return
	end

	uv0:send20641(slot0.floor, slot0.room_id)
end

function AdventureMineFightPanel.setData(slot0, slot1)
	slot0.scdata = slot1
	slot0.config = Config.AdventureMineData.data_mine_data(slot0.scdata.mine_id)

	if not slot0.config then
		return
	end

	if slot0.config.res_id == nil or slot2 == "" then
		slot2 = 1001
	end

	slot3 = PathTool.getPlistImgForDownLoad("adventure/mine_icon", slot2, false)

	if slot0.record_res == nil or slot0.record_res ~= slot3 then
		slot0.record_res = slot3
		slot0.item_load = loadSpriteTextureFromCDN(slot0.mine_icon, slot3, ResourcesType.single, slot0.item_load)
	end

	slot0.mine_name:setString(slot0.config.name)
	slot0.fight_label:setNum(slot0.scdata.power)

	if next(slot0.config.hook_items) ~= nil then
		slot5 = slot0.config.hook_items[1][2]
		slot0.base_data = uv0:getAdventureBaseData()

		if slot0.base_data then
			if slot5 - uv0:getMineRate(slot0.floor, slot5) and slot8 > 0 then
				slot0.put_info:setString(uv1(TI18N("<img src=%s scale=0.3 /><div fontcolor=#d95014>%s/m(-%s)</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot0.config.hook_items[1][1]).icon), slot5, slot8))
			else
				slot0.put_info:setString(uv1(TI18N("<img src=%s scale=0.3 /><div fontcolor=#643223>%s/m</div>"), slot7, slot5))
			end
		else
			slot0.put_info:setString(uv1(TI18N("<img src=%s scale=0.3 /><div fontcolor=#643223>%s/m</div>"), slot7, slot5))
		end
	end

	if slot0.show_type == 1 or slot0.show_type == 0 then
		slot0.title:setString(TI18N("准备进攻"))
		slot0.player_name_key:setString(TI18N("当前领主："))
		slot0.player_name:setString(slot0.scdata.name)
		slot0.desc1:setString(TI18N("敌方阵容"))

		if slot0.show_type == 0 then
			slot0.desc2:setVisible(false)
			slot0.fight_count:setVisible(false)
		else
			slot0.desc2:setString(TI18N("可掠夺资源"))
			slot0.fight_count:setString(uv1(TI18N("剩余可掠夺次数：<div fontcolor=#92ff75>%s</div>"), slot0.scdata.plunder_count))
		end

		slot0.challenge_btn:setVisible(true)
		slot0.left_btn:setVisible(false)
		slot0.center_btn:setVisible(false)
	else
		slot0.title:setString(TI18N("矿脉管理"))
		slot0.player_name_key:setString(TI18N("已占领："))
		slot0:setLessTime(GameNet:getInstance():getTime() - slot0.scdata.occupy_time)
		slot0.desc1:setString(TI18N("防守阵容"))
		slot0.desc2:setString(TI18N("当前累计收益"))
		slot0.fight_count:setString(uv1(TI18N("被掠夺次数：<div fontcolor=#92ff75>%s</div>"), slot0.scdata.plunder_count))
		slot0.challenge_btn:setVisible(false)
		slot0.left_btn:setVisible(true)
		slot0.center_btn:setVisible(true)
	end

	slot0:updateHeroList()
	slot0:updateItem()
end

function AdventureMineFightPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.player_name) then
		return
	end

	doStopAllActions(slot0.player_name)
	slot0.player_name:setString(TimeTool.GetTimeForFunction(slot1))
	slot0.player_name:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
		uv0 = uv0 + 1

		uv1.player_name:setString(TimeTool.GetTimeForFunction(uv0))
	end))))
end

function AdventureMineFightPanel.updateHeroList(slot0)
	if not slot0.hero_node then
		return
	end

	if not slot0.scdata then
		return
	end

	slot0.hero_list = slot0.scdata.defense

	if not slot0.hero_list then
		return
	end

	function slot4(slot0, slot1)
		return slot0.pos < slot1.pos
	end

	table.sort(slot0.hero_list, slot4)

	for slot4, slot5 in ipairs(slot0.hero_list) do
		slot5.rid = slot0.scdata.rid
		slot5.srv_id = slot0.scdata.srv_id
	end

	for slot4, slot5 in ipairs(slot0.hero_item_list) do
		slot5:setVisible(false)
	end

	slot1 = 124

	for slot6, slot7 in ipairs(slot0.hero_list) do
		if slot0.hero_item_list[slot6] == nil then
			slot0.hero_item_list[slot6] = HeroExhibitionItem.new(0.9, true)

			slot0.hero_item_list[slot6]:setPosition(-slot1 * 5 * 0.5 + slot1 * 0.5 + (slot6 - 1) * slot1, 0)
			slot0.hero_item_list[slot6]:addCallBack(function ()
				uv0:onClickHeroItemByIndex(uv1)
			end)
			slot0.hero_node:addChild(slot0.hero_item_list[slot6])
		else
			slot0.hero_item_list[slot6]:setVisible(true)
		end

		slot0.hero_item_list[slot6]:setData(slot7)
	end
end

function AdventureMineFightPanel.onClickHeroItemByIndex(slot0, slot1)
	if not slot0.hero_list[slot1] then
		return
	end

	if slot0.show_type == 0 then
		-- Nothing
	elseif slot0.show_type == 1 then
		LookController:getInstance():sender11061(slot2.rid, slot2.srv_id, slot2.id)
	elseif HeroController:getInstance():getModel():getHeroById(slot2.id) then
		HeroController:getInstance():openHeroTipsPanel(true, slot3)
	end
end

function AdventureMineFightPanel.updateItem(slot0)
	if not slot0.scdata then
		return
	end

	slot1 = {}

	for slot5, slot6 in ipairs(slot0.scdata.items) do
		uv0(slot1, {
			slot6.item_id,
			slot6.num
		})
	end

	slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot1, {
		scale = 0.9,
		max_count = 5,
		is_center = true
	})

	if #slot1 == 0 then
		slot0.empty_label:setVisible(true)
	else
		slot0.empty_label:setVisible(false)
	end
end

function AdventureMineFightPanel.close_callback(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.fight_label then
		slot0.fight_label:DeleteMe()
	end

	slot0.fight_label = nil

	if slot0.hero_item_list then
		for slot4, slot5 in ipairs(slot0.hero_item_list) do
			slot5:DeleteMe()
		end

		slot0.hero_item_list = nil
	end

	if slot0.item_list ~= nil then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end

	doStopAllActions(slot0.player_name)
	uv0:openAdventureMineFightPanel(false)
end
