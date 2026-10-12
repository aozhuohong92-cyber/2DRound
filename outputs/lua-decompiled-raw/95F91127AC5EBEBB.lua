GuildmarketplaceController = GuildmarketplaceController or BaseClass(BaseController)

function GuildmarketplaceController.config(slot0)
	slot0.model = GuildmarketplaceModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function GuildmarketplaceController.getModel(slot0)
	return slot0.model
end

function GuildmarketplaceController.registerEvents(slot0)
end

function GuildmarketplaceController.registerProtocals(slot0)
	slot0:RegisterProtocal(26900, "handle26900")
	slot0:RegisterProtocal(26901, "handle26901")
	slot0:RegisterProtocal(26902, "handle26902")
	slot0:RegisterProtocal(26903, "handle26903")
	slot0:RegisterProtocal(26904, "handle26904")
	slot0:RegisterProtocal(26905, "handle26905")
	slot0:RegisterProtocal(26906, "handle26906")
end

function GuildmarketplaceController.sender26900(slot0)
	slot0:SendProtocal(26900, {})
end

function GuildmarketplaceController.handle26900(slot0, slot1)
	GlobalEvent:getInstance():Fire(GuildmarketplaceEvent.GUILD_MARKET_PLACE_ITEM_EVENT, slot1)
end

function GuildmarketplaceController.handle26904(slot0, slot1)
	GlobalEvent:getInstance():Fire(GuildmarketplaceEvent.GUILD_MARKET_PLACE_ITEM_EVENT, slot1)
end

function GuildmarketplaceController.handle26905(slot0, slot1)
	GlobalEvent:getInstance():Fire(GuildmarketplaceEvent.GUILD_MARKET_PLACE_ITEM_EVENT, slot1)
end

function GuildmarketplaceController.handle26906(slot0, slot1)
	for slot5, slot6 in ipairs(slot1.id_list) do
		slot6.num = 0
	end

	slot1.item_list = slot1.id_list

	GlobalEvent:getInstance():Fire(GuildmarketplaceEvent.GUILD_MARKET_PLACE_ITEM_EVENT, slot1)
end

function GuildmarketplaceController.sender26901(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(26901, {
		id = slot1,
		quantity = slot2,
		storage = slot3
	})
end

function GuildmarketplaceController.handle26901(slot0, slot1)
	message(slot1.msg)
end

function GuildmarketplaceController.sender26902(slot0, slot1, slot2)
	slot0:SendProtocal(26902, {
		id = slot1,
		quantity = slot2
	})
end

function GuildmarketplaceController.handle26902(slot0, slot1)
	message(slot1.msg)
end

function GuildmarketplaceController.sender26903(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(26903, {})
end

function GuildmarketplaceController.handle26903(slot0, slot1)
	GlobalEvent:getInstance():Fire(GuildmarketplaceEvent.GUILD_MARKET_PLACE_MESSAGE_EVENT, slot1)
end

function GuildmarketplaceController.openGuildmarketplaceMainWindow(slot0, slot1, slot2)
	if RoleController:getInstance():getRoleVo():isHasGuild() == false then
		message(TI18N("您当前未加入任何公会，加入公会后才能参与该玩法！"))

		return
	end

	if slot1 == false then
		if slot0.guildmarketplace_main_window ~= nil then
			slot0.guildmarketplace_main_window:close()

			slot0.guildmarketplace_main_window = nil
		end
	else
		if slot0.guildmarketplace_main_window == nil then
			slot0.guildmarketplace_main_window = GuildmarketplaceMainWindow.New()
		end

		slot0.guildmarketplace_main_window:open(slot2)
	end
end

function GuildmarketplaceController.openGuildmarketplacePutItemWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.guildmarketplace_put_item_window ~= nil then
			slot0.guildmarketplace_put_item_window:close()

			slot0.guildmarketplace_put_item_window = nil
		end
	else
		if slot0.guildmarketplace_put_item_window == nil then
			slot0.guildmarketplace_put_item_window = GuildmarketplacePutItemWindow.New()
		end

		slot0.guildmarketplace_put_item_window:open(slot2)
	end
end

function GuildmarketplaceController.openGuildmarketplaceBuyItemPanel(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.guildmarketplace_buy_item_window ~= nil then
			slot0.guildmarketplace_buy_item_window:close()

			slot0.guildmarketplace_buy_item_window = nil
		end
	else
		if slot0.guildmarketplace_buy_item_window == nil then
			slot0.guildmarketplace_buy_item_window = GuildmarketplaceBuyItemPanel.New(slot3)
		end

		slot0.guildmarketplace_buy_item_window:open(slot2)
	end
end

function GuildmarketplaceController.openGuildmarketplaceRecordInfoPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.guildmarketplace_record_info_panel ~= nil then
			slot0.guildmarketplace_record_info_panel:close()

			slot0.guildmarketplace_record_info_panel = nil
		end
	else
		if slot0.guildmarketplace_record_info_panel == nil then
			slot0.guildmarketplace_record_info_panel = GuildmarketplaceRecordInfoPanel.New()
		end

		slot0.guildmarketplace_record_info_panel:open(slot2)
	end
end

function GuildmarketplaceController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
