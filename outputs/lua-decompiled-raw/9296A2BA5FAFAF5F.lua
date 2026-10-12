slot1 = CrossarenaController:getInstance():getModel()
CrossareanHonourItem = CrossareanHonourItem or BaseClass()

function CrossareanHonourItem.__init(slot0, slot1)
	slot0.is_init = false
	slot0.parent = slot1

	slot0:createRoorWnd()
	slot0:registerEvent()
end

function CrossareanHonourItem.createRoorWnd(slot0)
	slot0.size = cc.size(220, 400)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("crossarena/crossarena_honour_item"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
		slot0.root_wnd:setVisible(false)
	end

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.image_top = slot0.container:getChildByName("image_top")
	slot0.image_title = slot0.container:getChildByName("image_title")
	slot0.image_stage = slot0.container:getChildByName("image_stage")
	slot0.like_btn = slot0.container:getChildByName("like_btn")
	slot0.like_btn_label = slot0.like_btn:getChildByName("label")
	slot0.txt_role_name = slot0.container:getChildByName("txt_role_name")
	slot0.txt_no_role = slot0.container:getChildByName("txt_no_role")

	slot0.txt_role_name:setVisible(false)
	slot0.txt_no_role:setVisible(false)
	slot0.like_btn:setVisible(false)
end

function CrossareanHonourItem.registerEvent(slot0)
	registerButtonEventListener(slot0.container, handler(slot0, slot0.onClickRoleItem), false)
	registerButtonEventListener(slot0.like_btn, handler(slot0, slot0.onClickLikeBtn), true)

	if slot0.update_worship_event == nil then
		slot0.update_worship_event = GlobalEvent:getInstance():Bind(RoleEvent.WorshipOtherRole, function (slot0, slot1, slot2)
			if uv0.data and slot2 and uv0.data.rank == slot2 then
				uv0.data.worship = uv0.data.worship + 1

				uv0.like_btn_label:setString(uv0.data.worship)
				uv0.like_btn:setTouchEnabled(false)
				setChildUnEnabled(true, uv0.like_btn)
				uv0.like_btn_label:setColor(cc.c3b(255, 255, 255))
			end
		end)
	end
end

function CrossareanHonourItem.onClickRoleItem(slot0)
	slot1 = RoleController:getInstance():getRoleVo()

	if slot0.data and slot0.data.rid and slot0.data.srv_id and slot1 then
		if slot1.rid == slot0.data.rid and slot1.srv_id == slot0.data.srv_id then
			message(TI18N("你连自己都不认识了么？"))
		else
			FriendController:getInstance():openFriendCheckPanel(true, {
				srv_id = slot0.data.srv_id,
				rid = slot0.data.rid
			})
		end
	end
end

function CrossareanHonourItem.onClickLikeBtn(slot0)
	if slot0.data and slot0.data.rid and slot0.data.srv_id and slot0.data.rank then
		RoleController:getInstance():requestWorshipRole(slot0.data.rid, slot0.data.srv_id, slot0.data.rank, WorshipType.crossarena)
	end
end

function CrossareanHonourItem.setData(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if slot1 then
		slot0.data = slot1

		if slot0.role_spine then
			slot0.role_spine:DeleteMe()

			slot0.role_spine = nil
		end

		if slot1.lookid then
			slot0.role_spine = BaseRole.new(BaseRole.type.role, slot1.lookid, nil, {
				scale = 0.5
			})

			slot0.role_spine:setCascade(true)
			slot0.role_spine:setAnchorPoint(cc.p(0.5, 0))
			slot0.role_spine.container:setScale(0.45)
			slot0.role_spine:setAnimation(0, PlayerAction.show, true)
			slot0.parent:addChild(slot0.role_spine, 1)
		end

		slot0.txt_role_name:setString(transformNameByServ(slot1.name, slot1.srv_id))
		slot0.like_btn_label:setString(slot1.worship or 0)

		if slot1.worship_status == 0 then
			slot0.like_btn:setTouchEnabled(true)
			setChildUnEnabled(false, slot0.like_btn)
		else
			slot0.like_btn:setTouchEnabled(false)
			setChildUnEnabled(true, slot0.like_btn)
		end

		slot0.like_btn_label:setColor(cc.c3b(255, 255, 255))
		slot0.txt_role_name:setVisible(true)
		slot0.like_btn:setVisible(true)
		slot0.txt_no_role:setVisible(false)
	else
		slot0.txt_role_name:setVisible(false)
		slot0.like_btn:setVisible(false)
		slot0.txt_no_role:setVisible(true)
	end

	if CrossarenaConst.Title_Res[slot2] then
		slot0.title_load = loadSpriteTextureFromCDN(slot0.image_title, PathTool.getTargetRes("honor", slot3, false, false), ResourcesType.single, slot0.title_load)
	end

	if slot2 then
		slot0.root_wnd:setPosition(cc.p(15 + (slot2 - 1) * (15 + slot0.size.width), 480))

		if slot0.role_spine then
			slot0.role_spine:setPosition(cc.p(slot6 + slot0.size.width * 0.5, 645))
		end

		slot0.root_wnd:setVisible(true)

		if slot2 == 1 then
			loadSpriteTexture(slot0.image_top, PathTool.getResFrame("crossarena", "crossarena_13"), LOADTEXT_TYPE_PLIST)
		elseif slot2 == 2 then
			loadSpriteTexture(slot0.image_top, PathTool.getResFrame("crossarena", "crossarena_12"), LOADTEXT_TYPE_PLIST)
			slot0.image_top:setPositionY(slot0.image_top:getPositionY() + 12)
			slot0.image_title:setPositionY(slot0.image_title:getPositionY() + 18)
			slot0.image_stage:setPositionY(slot0.image_stage:getPositionY() + 12)
			slot0.txt_role_name:setPositionY(slot0.txt_role_name:getPositionY() + 12)
			slot0.txt_no_role:setPositionY(slot0.txt_no_role:getPositionY() + 12)

			if slot0.role_spine then
				slot0.role_spine:setPositionY(slot0.role_spine:getPositionY() + 12)
				slot0.role_spine:setLocalZOrder(2)
			end
		elseif slot2 == 3 then
			loadSpriteTexture(slot0.image_top, PathTool.getResFrame("crossarena", "crossarena_14"), LOADTEXT_TYPE_PLIST)
		end
	end
end

function CrossareanHonourItem.__delete(slot0)
	if slot0.role_spine then
		slot0.role_spine:DeleteMe()

		slot0.role_spine = nil
	end

	if slot0.title_load then
		slot0.title_load:DeleteMe()

		slot0.title_load = nil
	end

	if slot0.update_worship_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_worship_event)

		slot0.update_worship_event = nil
	end
end
