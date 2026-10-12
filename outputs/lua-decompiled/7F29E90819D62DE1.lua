Stone_dungeonController = Stone_dungeonController or BaseClass(BaseController)

function Stone_dungeonController.config(slot0)
	slot0.model = Stone_dungeonModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function Stone_dungeonController.getModel(slot0)
	return slot0.model
end

function Stone_dungeonController.registerEvents(slot0)
end

function Stone_dungeonController.registerProtocals(slot0)
	slot0:RegisterProtocal(13030, "handle13030")
	slot0:RegisterProtocal(13031, "handle13031")
	slot0:RegisterProtocal(13032, "handle13032")
end

function Stone_dungeonController.openStoneDungeonView(slot0, slot1)
	if slot1 == true then
		if Config.DailyplayData.data_exerciseactivity[1] == nil then
			message(TI18N("日常副本数据异常"))

			return
		end

		if MainuiController:getInstance():checkIsOpenByActivate(slot2.activate) == false then
			message(slot2.lock_desc)

			return
		end

		if not slot0.stoneDungeonView then
			slot0.stoneDungeonView = StoneDungeonWindow.New()
		end

		slot0.stoneDungeonView:open()
	elseif slot0.stoneDungeonView then
		slot0.stoneDungeonView:close()

		slot0.stoneDungeonView = nil
	end
end

function Stone_dungeonController.getStoneDungeonRoot(slot0)
	if slot0.stoneDungeonView then
		return slot0.stoneDungeonView.root_wnd
	end
end

function Stone_dungeonController.send13030(slot0)
	slot0:SendProtocal(13030, {})
end

function Stone_dungeonController.handle13030(slot0, slot1)
	slot0.model:setChangeSweepCount(slot1.list)
	slot0.model:setPassClearanceID(slot1.pass_list)
	GlobalEvent:getInstance():Fire(Stone_dungeonEvent.Updata_StoneDungeon_Data, slot1)
end

function Stone_dungeonController.send13031(slot0, slot1)
	slot0:SendProtocal(13031, {
		id = slot1
	})
end

function Stone_dungeonController.handle13031(slot0, slot1)
	message(slot1.msg)
end

function Stone_dungeonController.send13032(slot0, slot1)
	slot0:SendProtocal(13032, {
		id = slot1
	})
end

function Stone_dungeonController.handle13032(slot0, slot1)
	message(slot1.msg)
end

function Stone_dungeonController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
