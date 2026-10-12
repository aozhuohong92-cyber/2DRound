slot1 = CrossarenaController:getInstance():getModel()
slot2 = string.format
CrossareanRoleItem = CrossareanRoleItem or BaseClass()

function CrossareanRoleItem.__init(slot0, slot1)
	slot0.is_init = false
	slot0.parent = slot1

	slot0:createRoorWnd()
	slot0:registerEvent()
end

function CrossareanRoleItem.createRoorWnd(slot0)
	slot0.size = cc.size(220, 400)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("crossarena/crossarena_role_item"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
		slot0.root_wnd:setVisible(false)
	end

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.challenge_btn = slot0.container:getChildByName("challenge_btn")
	slot1 = slot0.challenge_btn:getContentSize()
	slot0.challenge_btn_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(slot1.width / 2, slot1.height / 2))

	slot0.challenge_btn_label:setString(TI18N("挑战"))
	slot0.challenge_btn:addChild(slot0.challenge_btn_label)

	slot0.ticket_bid = Config.ArenaClusterData.data_const.arena_ticket.val

	if Config.ItemData.data_get_data(slot0.ticket_bid) then
		slot0.challenge_btn_label:setString(uv0(TI18N("<img src='%s' scale=0.3 /><div outline=2,#6c2b00>3 挑战</div>"), PathTool.getItemRes(slot2.icon)))
	end

	slot0.txt_role_name = slot0.container:getChildByName("txt_role_name")
	slot0.txt_score = slot0.container:getChildByName("txt_score")
	slot0.txt_atk = slot0.container:getChildByName("txt_atk")
end

function CrossareanRoleItem.registerEvent(slot0)
	registerButtonEventListener(slot0.container, handler(slot0, slot0.onClickRoleItem), false)
	registerButtonEventListener(slot0.challenge_btn, handler(slot0, slot0.onClickRoleItem), true)

	if not slot0.update_single_role_event then
		slot0.update_single_role_event = GlobalEvent:getInstance():Bind(CrossarenaEvent.Update_Single_Challenge_Role_Event, function (slot0)
			if slot0 and slot0.idx and uv0.data and uv0.data.idx == slot0.idx then
				uv0:setData(slot0)
			end
		end)
	end
end

function CrossareanRoleItem.onClickRoleItem(slot0)
	if slot0.data and uv0:checkCrossarenaIsOpen() then
		if slot0.data.rid == 0 then
			message(TI18N("新赛季已开启，请刷新对手"))

			return
		end

		uv1:sender25602(slot0.data.rid, slot0.data.srv_id)
	end
end

function CrossareanRoleItem.onClickChallengeBtn(slot0)
	if slot0.data and uv0:checkCrossarenaIsOpen() then
		if slot0.data.rid == 0 then
			message(TI18N("新赛季已开启，请刷新对手"))

			return
		end

		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.CrossArena, {
			rid = slot0.data.rid,
			srv_id = slot0.data.srv_id
		}, HeroConst.FormShowType.eFormFight)
	end
end

function CrossareanRoleItem.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.txt_role_name:setString(transformNameByServ(slot1.name or "", slot1.srv_id))
	slot0.txt_score:setString(uv0(TI18N("积分:%d"), slot1.score or 0))
	slot0.txt_atk:setString(slot1.power or 0)

	if slot0.role_spine then
		slot0.role_spine:DeleteMe()

		slot0.role_spine = nil
	end

	if slot1.look then
		slot0.role_spine = BaseRole.new(BaseRole.type.role, slot1.look, nil, {
			scale = 0.5
		})

		slot0.role_spine:setCascade(true)
		slot0.role_spine:setAnchorPoint(cc.p(0.5, 0))
		slot0.role_spine:setAnimation(0, PlayerAction.show, true)
		slot0.role_spine.container:setScale(0.5)
		slot0.parent:addChild(slot0.role_spine, 1)
		slot0.role_spine:setPosition(cc.p(15 + (slot2 - 1) * (15 + slot0.size.width) + slot0.size.width * 0.5, 655))

		if slot2 and slot2 == 2 then
			slot0.role_spine:setLocalZOrder(2)
		end
	end

	slot0:setItemPos(slot2)
end

function CrossareanRoleItem.setItemPos(slot0, slot1)
	if slot1 and not slot0.cur_index or slot0.cur_index ~= slot1 then
		slot0.root_wnd:setPosition(cc.p(15 + (slot1 - 1) * (15 + slot0.size.width), 480))
		slot0.root_wnd:setVisible(true)

		slot0.cur_index = slot1
	end
end

function CrossareanRoleItem.__delete(slot0)
	if slot0.role_spine then
		slot0.role_spine:DeleteMe()

		slot0.role_spine = nil
	end

	if slot0.update_single_role_event then
		GlobalEvent:getInstance():UnBind(slot0.update_single_role_event)

		slot0.update_single_role_event = nil
	end
end
