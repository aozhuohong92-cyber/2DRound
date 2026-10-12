Area_sceneController = Area_sceneController or BaseClass(BaseController)

function Area_sceneController.config(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function Area_sceneController.registerEvents(slot0)
end

function Area_sceneController.registerProtocals(slot0)
end

function Area_sceneController.openAreaScene(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.area_scene_wnd then
			slot0.area_scene_wnd = AreaSceneWindow.New(slot2)
		end

		if slot0.area_scene_wnd:isOpen() == false then
			slot0.area_scene_wnd:open()
		end
	elseif slot0.area_scene_wnd then
		slot0.area_scene_wnd:close()

		slot0.area_scene_wnd = nil
	end
end

function Area_sceneController.getAreaSceneRoot(slot0)
	if slot0.area_scene_wnd then
		return slot0.area_scene_wnd.root_wnd
	end
end

function Area_sceneController.onClickAreaBuildById(slot0, slot1, slot2)
	if slot1 == Area_sceneConst.Area_Type.Shop then
		if slot2 == 1 then
			MallController:getInstance():openScoreShopWindow(true)
		elseif slot2 == 2 then
			MallController:getInstance():openVarietyStoreWindows(true)
		elseif slot2 == 3 then
			MallController:getInstance():openChargeShopWindow(true)
		elseif slot2 == 4 then
			MallController:getInstance():openSkinShopWindow(true)
		elseif slot2 == 5 then
			MallController:getInstance():openPlumeShopWindow(true)
		elseif slot2 == 6 then
			MallController:getInstance():openMallPanel(true)
		end
	end
end

function Area_sceneController.setBuildRedStatus(slot0, slot1, slot2)
	if slot0.area_scene_wnd then
		slot0.area_scene_wnd:setBuildRedStatus(slot1, slot2)
	end
end

function Area_sceneController.__delete(slot0)
end
