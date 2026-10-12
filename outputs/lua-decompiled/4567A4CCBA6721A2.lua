PokedexController = PokedexController or BaseClass(BaseController)

function PokedexController.config(slot0)
	slot0.model = PokedexModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function PokedexController.getModel(slot0)
	return slot0.model
end

function PokedexController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.role_vo = RoleController:getInstance():getRoleVo()
		end)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 == BackPackConst.Bag_Code.BACKPACK then
				uv0:checkRedPoint(slot1)
			end
		end)
	end

	if not slot0.del_goods_event then
		slot0.del_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 == BackPackConst.Bag_Code.BACKPACK then
				uv0:checkRedPoint(slot1)
			end
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 == BackPackConst.Bag_Code.BACKPACK then
				uv0:checkRedPoint(slot1)
			end
		end)
	end

	if not slot0.add_partner_event then
		slot0.add_partner_event = GlobalEvent:getInstance():Bind(PartnerEvent.Partner_Data_Update, function (slot0, slot1)
			if slot1 then
				-- Nothing
			end
		end)
	end

	if not slot0.get_all_data then
		slot0.get_all_data = GlobalEvent:getInstance():Bind(BackpackEvent.GET_ALL_DATA, function (slot0)
			if slot0 == BackPackConst.Bag_Code.BACKPACK then
				-- Nothing
			end
		end)
	end
end

function PokedexController.registerProtocals(slot0)
	slot0:RegisterProtocal(11041, "handle11041")
	slot0:RegisterProtocal(11042, "handle11042")
	slot0:RegisterProtocal(11043, "handle11043")
	slot0:RegisterProtocal(11044, "handle11044")
	slot0:RegisterProtocal(11046, "handle11046")
	slot0:RegisterProtocal(11047, "handle11047")
end

function PokedexController.openPokedexWindow(slot0, slot1, slot2, slot3, slot4)
	if slot1 == false then
		if slot0.pokedex_window ~= nil then
			slot0.pokedex_window:close()

			slot0.pokedex_window = nil
		end
	else
		if MainSceneController:getInstance():getBuildVo(CenterSceneBuild.library) and slot5.is_lock then
			message(slot5.desc)

			return
		end

		if slot0.pokedex_window == nil then
			slot0.pokedex_window = PokedexWindow.New()
		end

		if slot0.pokedex_window:isOpen() == false then
			slot0.pokedex_window:open(slot2, slot3, slot4)
		end
	end
end

function PokedexController.openCheckHeroWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.check_hero ~= nil then
			slot0.check_hero:close()

			slot0.check_hero = nil
		end
	else
		if slot0.check_hero == nil then
			slot0.check_hero = PokedexCheckWindow.New()
		end

		if slot0.check_hero:isOpen() == false then
			slot0.check_hero:open(slot2)
		end
	end
end

function PokedexController.openCommentWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.comment_window ~= nil then
			slot0.comment_window:close()

			slot0.comment_window = nil
		end
	else
		if slot0.comment_window == nil then
			slot0.comment_window = PartnerCommentWindow.New(slot2)
		end

		if slot0.comment_window:isOpen() == false then
			slot0.comment_window:open()
		end
	end
end

function PokedexController.openStarUpWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.star_window ~= nil then
			slot0.star_window:close()

			slot0.star_window = nil

			slot0:checkIsCanCall()
		end
	else
		if slot0.star_window == nil then
			slot0.star_window = PokedexStarWindow.New(slot2)
		end

		if slot0.star_window:isOpen() == false then
			slot0.star_window:open()
		end
	end
end

function PokedexController.checkRedPoint(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot1 or {}) do
		if slot7 and slot7.config and slot7.config.type == BackPackConst.item_type.PARTNER_DEBRIS then
			slot2 = true

			break
		end
	end

	if slot2 == true then
		-- Nothing
	end
end

function PokedexController.checkIsCanCall(slot0)
end

function PokedexController.sender11040(slot0)
	slot0:SendProtocal(11040, {})
end

function PokedexController.handle11040(slot0, slot1)
	slot5 = slot1

	slot0.model:setHavePartner(slot5)

	for slot5, slot6 in ipairs(slot1.decompose_partners) do
		slot0.model:setDisbandPartner(slot6.partner_id)
	end

	GlobalEvent:getInstance():Fire(PokedexEvent.Get_All_Event, slot1)
	slot0:checkIsCanCall()
end

function PokedexController.setDisbandPartner(slot0, slot1)
	slot0.model:setDisbandPartner(slot1)
end

function PokedexController.sender11041(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(11041, {
		partner_id = slot1,
		start = slot2,
		num = slot3
	})
end

function PokedexController.handle11041(slot0, slot1)
	GlobalEvent:getInstance():Fire(PokedexEvent.Comment_List_Event, slot1)
end

function PokedexController.sender11042(slot0, slot1)
	slot0:SendProtocal(11042, {
		partner_id = slot1
	})
end

function PokedexController.handle11042(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		GlobalEvent:getInstance():Fire(PokedexEvent.Comment_Like_Event, slot1)
	end
end

function PokedexController.sender11043(slot0, slot1, slot2)
	slot0:SendProtocal(11043, {
		partner_id = slot1,
		msg = slot2
	})
end

function PokedexController.handle11043(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		GlobalEvent:getInstance():Fire(PokedexEvent.Comment_Say_Event, slot1)
	end
end

function PokedexController.sender11044(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(11044, {
		partner_id = slot1,
		comment_id = slot2,
		type = slot3
	})
end

function PokedexController.handle11044(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		GlobalEvent:getInstance():Fire(PokedexEvent.Comment_Zan_Event, slot1)
	end
end

function PokedexController.handle11046(slot0, slot1)
	message(slot1.msg)

	if slot1 then
		slot0.model:getAllData().all_star = slot1.new_star

		slot0:checkIsCanCall()
	end
end

function PokedexController.send11047(slot0)
	slot0:SendProtocal(11047, {})
end

function PokedexController.handle11047(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		slot2 = Config.PartnerData.data_pokedex_attr

		if slot0.model:getAllData().lev == nil then
			return
		end

		slot3.lev = slot1.lev
		slot0.star_data = {
			old_star = slot3.all_star,
			new_star = Config.PartnerData.data_pokedex_attr[math.min(slot1.lev + 1, tableLen(slot2))].star,
			old_lev = slot4,
			cur_lev = slot1.lev
		}

		if slot0.star_data then
			slot0:openStarUpWindow(true, slot0.star_data)
		end

		GlobalEvent:getInstance():Fire(PokedexEvent.Up_End_Event, slot0.star_data)
	end
end

function PokedexController.send11048(slot0)
	slot0:SendProtocal(11048, {})
end

function PokedexController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
