WorldmapController = WorldmapController or BaseClass(BaseController)

function WorldmapController.config(slot0)
	slot0.model = WorldmapModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function WorldmapController.getModel(slot0)
	return slot0.model
end

function WorldmapController.registerEvents(slot0)
end

function WorldmapController.registerProtocals(slot0)
end

function WorldmapController.openWorldMapMainWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.worldmap_window ~= nil then
			slot0.worldmap_window:close()

			slot0.worldmap_window = nil
		end
	else
		if require("ePoCrKQkWA3vpiOwu2oNfOh02MOeNheW.dungeon_scene_data") == nil then
			return
		end

		if slot0.worldmap_window == nil then
			slot0.worldmap_window = WorldMapMainWindow.New(slot3)
		end

		slot0.worldmap_window:open(slot2)
	end
end

function WorldmapController.openWorldMapTipsWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if slot0.WorldMapTipsWindow == nil then
			slot0.WorldMapTipsWindow = WorldMapTipsWindow.New()
		end

		if slot0.WorldMapTipsWindow:isOpen() == false then
			slot0.WorldMapTipsWindow:open(slot2, slot3)
		end
	elseif slot0.WorldMapTipsWindow then
		slot0.WorldMapTipsWindow:close()

		slot0.WorldMapTipsWindow = nil
	end
end

function WorldmapController.addLockContainer(slot0, slot1)
	if slot1 == true then
		if not slot0.lock_layout then
			slot0.lock_layout = ViewManager:getInstance():getLayerByTag(ViewMgrTag.DEBUG_TAG)

			if slot0.lock_layout ~= nil then
				slot0.lock_layout:setSwallowTouches(true)
			end
		end
	elseif slot0.lock_layout ~= nil then
		slot0.lock_layout:setSwallowTouches(false)
	end
end

function WorldmapController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
