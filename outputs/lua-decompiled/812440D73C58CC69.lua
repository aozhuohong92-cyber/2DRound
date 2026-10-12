ResourcesLoad = ResourcesLoad or BaseClass()

function ResourcesLoad.__init(slot0, slot1)
	slot0.res_list = {}
	slot0.is_loading = false
	slot0.del_list = {}
	slot0.need_lock = slot1
end

function ResourcesLoad.__delete(slot0)
	slot0.load_completed_back = nil

	if slot0.del_list and next(slot0.del_list) then
		for slot4, slot5 in ipairs(slot0.del_list) do
			ResourcesCacheMgr:getInstance():decreaseReferenceCount(slot5.path, slot5.delete_time)
		end
	end

	slot0.del_list = nil
end

function ResourcesLoad.addAllList(slot0, slot1, slot2)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot0.res_list = DeepCopy(slot1)
	slot0.load_completed_back = slot2
	slot0.del_list = {}

	slot0:loadResouces()
end

function ResourcesLoad.addDownloadList(slot0, slot1, slot2, slot3, slot4)
	slot0.path = slot1

	if slot1 ~= nil and slot2 ~= nil then
		table.insert(slot0.res_list, {
			path = slot1,
			type = slot2,
			delete_time = slot4
		})

		slot0.load_completed_back = slot3

		slot0:loadResouces()
	end
end

function ResourcesLoad.loadResouces(slot0, slot1)
	if slot1 and slot1.path and slot1.type then
		ResourcesCacheMgr:getInstance():increaseReferenceCount(slot1.path, slot1.type)

		if slot0.del_list ~= nil then
			table.insert(slot0.del_list, slot1)
		else
			ResourcesCacheMgr:getInstance():decreaseReferenceCount(slot1.path, slot1.delete_time)

			return
		end
	end

	if slot0.res_list and next(slot0.res_list) ~= nil then
		slot0.is_loading = true

		if ResourcesCacheMgr:getInstance():checkCacheResources(table.remove(slot0.res_list, 1).path) then
			slot0:loadResouces(slot2)
		elseif PathTool.checkResourcesExist(slot2.path) then
			if slot2.type == ResourcesType.plist then
				slot0:handleLoadPlist(slot2)
			elseif slot2.type == ResourcesType.single then
				display.loadImage(slot2.path, function (slot0)
					uv0:loadResouces(uv1)
				end)
			end
		else
			print(string.format("当前资源 %s 不存在，因此需要去cdn上面下载回来！", slot2.path))

			if slot0.need_lock == true then
				LoginController:getInstance():openDownLoadView(true)
			end

			PathTool.downloadResources(slot2, function (slot0)
				if slot0.type == ResourcesType.single then
					uv0:loadResouces(slot0)
				else
					uv0:handleLoadPlist(slot0)
				end
			end)
		end

		return
	end

	if slot0.load_completed_back ~= nil then
		if slot0.need_lock == true then
			LoginController:getInstance():openDownLoadView(false)
		end

		slot0.load_completed_back()
	end
end

function ResourcesLoad.handleLoadPlist(slot0, slot1)
	if slot1 ~= nil and slot1.path ~= nil and slot1.type == ResourcesType.plist then
		if string.split(slot1.path, ".") == nil or #slot2 ~= 2 then
			print("加载资源路径出错，路径为：", slot1.path)
			slot0:loadResouces()
		elseif display.isSpriteFramesWithFileLoaded(string.format("%s.plist", slot2[1])) then
			slot0:loadResouces(slot1)
		else
			display.loadSpriteFrames(slot3, slot1.path, function (slot0, slot1)
				uv0:loadResouces(uv1)
			end)
		end
	end
end
