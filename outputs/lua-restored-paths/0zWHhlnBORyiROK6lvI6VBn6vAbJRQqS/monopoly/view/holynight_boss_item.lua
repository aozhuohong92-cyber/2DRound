slot1 = MonopolyController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
HolynightBossItem = class("HolynightBossItem", function ()
	return ccui.Layout:create()
end)

function HolynightBossItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()
end

function HolynightBossItem.configUI(slot0)
	slot0.size = cc.size(617, 142)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("monopoly/holynight_boss_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0.container:getChildByName("award_title"):setString(TI18N("击杀奖励"))

	slot0.btn_challenge = slot0.container:getChildByName("btn_challenge")
	slot2 = slot0.btn_challenge:getContentSize()
	slot0.btn_challenge_label = createRichLabel(26, cc.c4b(37, 85, 5, 255), cc.p(0.5, 0.5), cc.p(slot2.width * 0.5, slot2.height * 0.5))

	slot0.btn_challenge:addChild(slot0.btn_challenge_label)

	if Config.MonopolyMapsData.data_const.monopoly_gold_id and Config.ItemData.data_get_data(slot3.val) then
		slot0.gold_item_res = PathTool.getItemRes(slot4.icon)

		slot0.btn_challenge_label:setString(uv0(TI18N("<img src='%s' scale=0.3 /> 1 挑战"), slot0.gold_item_res))
	end

	slot0.pass_sp = slot0.container:getChildByName("pass_sp")
	slot0.pos_node = slot0.container:getChildByName("pos_node")
	slot0.name_txt = slot0.container:getChildByName("name_txt")
	slot0.lock_txt = slot0.container:getChildByName("lock_txt")

	slot0.lock_txt:setVisible(false)

	slot0.pass_txt = slot0.container:getChildByName("pass_txt")

	slot0.pass_txt:setString(TI18N("已击杀"))

	slot0.zhuiji_sp = slot0.container:getChildByName("zhuiji_sp")
	slot0.progress = cc.ProgressTimer:create(createSprite(PathTool.getResFrame("monopoly", "monopolyboss_1004", false, "monopolyboss"), 110, 105, nil, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST))

	slot0.progress:setReverseProgress(true)
	slot0.progress:setPosition(70, 86)
	slot0.progress:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
	slot0.container:addChild(slot0.progress)

	slot0.progress_2 = cc.ProgressTimer:create(createSprite(PathTool.getResFrame("monopoly", "monopolyboss_1013", false, "monopolyboss"), 110, 105, nil, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST))

	slot0.progress_2:setReverseProgress(true)
	slot0.progress_2:setPosition(70, 86)
	slot0.progress_2:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
	slot0.progress_2:setVisible(false)
	slot0.container:addChild(slot0.progress_2)

	slot4 = slot0.container:getChildByName("item_list")
	slot0.goods_scrollview = CommonScrollViewLayout.new(slot4, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot4:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 5,
		row = 1,
		space_y = 0,
		col = 1,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.goods_scrollview:setSwallowTouches(false)
end

function HolynightBossItem.registerEvent(slot0)
	registerButtonEventListener(slot0.btn_challenge, handler(slot0, slot0.onClickChallengeBtn), true)
end

function HolynightBossItem.onClickChallengeBtn(slot0)
	if slot0.data and (slot0.data.state == 2 or slot0.data.state == 4) then
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.Monopoly_Boss, {
			step_id = slot0.data.id,
			boss_id = slot0.data.boss_id
		})
	end
end

function HolynightBossItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.name_txt:setString(slot1.boss_name or "")

	if not slot0.hero_icon then
		slot0.hero_icon = PlayerHead.new(PlayerHead.type.circle)

		slot0.pos_node:addChild(slot0.hero_icon)
	end

	slot0.hero_icon:setHeadRes(slot1.head_id)

	slot4 = (slot1.hp or 0) / (slot1.max_hp or 1) * 100

	slot0.progress:setPercentage(slot4)
	slot0.progress_2:setPercentage(slot4)

	slot5 = {}

	for slot9, slot10 in pairs(slot1.reward) do
		if deepCopy(Config.ItemData.data_get_data(slot10[1])) then
			slot13.quantity = slot10[2]

			uv0(slot5, slot13)
		end
	end

	slot0.goods_scrollview:setData(slot5)
	slot0.goods_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.goods_scrollview:getItemList()) do
			slot5:setDefaultTip(true)
		end
	end)
	slot0.lock_txt:setVisible(slot1.state == 1)
	slot0.btn_challenge:setVisible(slot1.state == 2 or slot1.state == 4)
	slot0.pass_txt:setVisible(slot1.state == 3)
	slot0.pass_sp:setVisible(slot1.state == 3)
	slot0.progress:setVisible(slot1.state ~= 4)
	slot0.progress_2:setVisible(slot1.state == 4)
	slot0.zhuiji_sp:setVisible(slot1.state == 4)

	if slot1.state == 1 then
		slot0.progress:setPercentage(100)
		slot0.lock_txt:setString(uv1(TI18N("%d探索值解锁"), slot1.develop))
	elseif slot1.state == 2 then
		slot0.btn_challenge:loadTexture(PathTool.getResFrame("common", "common_1098"), LOADTEXT_TYPE_PLIST)
		slot0.btn_challenge:setContentSize(cc.size(141, 54))
		slot0.btn_challenge_label:setString(uv1(TI18N("<img src='%s' scale=0.3 /><div fontcolor=#255505> 1 挑战</div>"), slot0.gold_item_res))
	elseif slot1.state == 3 then
		-- Nothing
	elseif slot1.state == 4 then
		slot0.progress_2:setPercentage(100)
		slot0.btn_challenge:loadTexture(PathTool.getResFrame("common", "common_1027"), LOADTEXT_TYPE_PLIST)
		slot0.btn_challenge_label:setString(uv1(TI18N("<img src='%s' scale=0.3 /><div fontcolor=#712804> 1 挑战</div>"), slot0.gold_item_res))
		slot0.btn_challenge:setContentSize(cc.size(141, 54))
	end
end

function HolynightBossItem.DeleteMe(slot0)
	if slot0.goods_scrollview then
		slot0.goods_scrollview:DeleteMe()

		slot0.goods_scrollview = nil
	end

	if slot0.hero_icon then
		slot0.hero_icon:DeleteMe()

		slot0.hero_icon = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
