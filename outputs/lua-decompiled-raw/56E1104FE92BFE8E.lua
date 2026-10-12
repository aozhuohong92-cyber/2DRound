ResourcesCacheMgr = ResourcesCacheMgr or BaseClass()

function ResourcesCacheMgr.getInstance(slot0)
	if slot0.instance == nil then
		slot0.instance = ResourcesCacheMgr.New()
	end

	return slot0.instance
end

function ResourcesCacheMgr.__init(slot0)
	slot0.resources_list = {}
	slot0.wait_del_list = {}
	slot0.resources_count_list = {}
	slot0.step_interval = 10
	slot0.battle_step_interval = 60
	slot0.is_battle_path = {}
	slot0.plat_form = PLATFORM_NAME
end

function ResourcesCacheMgr.__delete(slot0)
	if slot0.queue_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.queue_timer)

		slot0.queue_timer = nil
	end
end

function ResourcesCacheMgr.checkCacheResources(slot0, slot1)
	if slot1 == nil or type(slot1) ~= "string" then
		return false
	end

	if slot0.resources_list[slot1] then
		return true
	elseif display.getImage(slot1) then
		return true
	else
		return false
	end
end

function ResourcesCacheMgr.checkResource(slot0, slot1)
	if slot0.resources_list[slot1] and slot2.count > 0 then
		return true
	end

	return false
end

function ResourcesCacheMgr.increaseReferenceCount(slot0, slot1, slot2)
	if slot0.resources_list[slot1] ~= nil then
		if slot3.count == nil then
			slot3.count = 0
		end

		slot3.count = slot3.count + 1
	else
		if slot0.is_battle_path[slot1] == nil then
			slot5, slot6 = string.find(slot1, "battle")
			slot0.is_battle_path[slot1] = slot5 ~= nil
		end

		slot0.resources_list[slot1] = {
			timetick = 0,
			count = 1,
			path = slot1,
			type = slot2,
			is_battle = slot4
		}
	end

	if slot0.plat_form == "demo" or slot0.plat_form == "release" or slot0.plat_form == "release2" then
		slot4 = ""

		if slot0.resources_count_list[slot1] == nil then
			slot0.resources_count_list[slot4] = slot4
		end
	end

	if slot0.wait_del_list[slot1] ~= nil then
		slot0.wait_del_list[slot1] = nil
	end
end

function ResourcesCacheMgr.getLoadRes(slot0)
	return slot0.resources_count_list
end

function ResourcesCacheMgr.decreaseReferenceCount(slot0, slot1, slot2)
	if slot0.resources_list[slot1] ~= nil then
		if slot3.count <= 0 then
			-- Nothing
		else
			slot3.count = slot3.count - 1

			if slot3.count == 0 then
				slot3.timetick = os.time()

				if slot2 then
					slot3.delete_time = slot2
				end

				slot0.wait_del_list[slot3.path] = slot3

				if slot0.queue_timer == nil then
					slot0.queue_timer = GlobalTimeTicket:getInstance():add(function ()
						uv0:checkRemoveRes()
					end, 1)
				end
			end
		end
	end
end

function ResourcesCacheMgr.checkRemoveRes(slot0)
	if slot0.wait_del_list ~= nil and next(slot0.wait_del_list) ~= nil then
		slot1 = os.time()

		for slot5, slot6 in pairs(slot0.wait_del_list) do
			if slot6.path ~= nil then
				if slot6.timetick == nil then
					slot6.timetick = 0
				end

				if slot6.count == 0 then
					slot7 = false

					if (slot6.is_battle == true and slot0.battle_step_interval <= slot1 - slot6.timetick or slot6.delete_time and slot6.delete_time <= slot1 - slot6.timetick or slot0.step_interval <= slot1 - slot6.timetick) == true then
						if slot6.type == ResourcesType.plist then
							if string.split(slot6.path, ".") ~= nil then
								if #slot8 == 2 then
									display.removeSpriteFrames(string.format("%s.plist", slot8[1]), slot6.path)
								end
							end
						elseif slot6.type == ResourcesType.single then
							display.removeImage(slot6.path)
						end

						slot0.resources_list[slot6.path] = nil
						slot0.wait_del_list[slot5] = nil
					end
				else
					slot0.wait_del_list[slot5] = nil
				end
			end
		end
	end
end

function ResourcesCacheMgr.cleanAllTexture(slot0)
	if slot0.resources_list and next(slot0.resources_list) then
		for slot4, slot5 in pairs(slot0.resources_list) do
			if slot5.type == ResourcesType.plist then
				if string.split(slot5.path, ".") ~= nil then
					if #slot6 == 2 then
						display.removeSpriteFrames(string.format("%s.plist", slot6[1]), slot5.path)
					end
				end
			else
				display.removeImage(slot5.path)
			end
		end
	end
end
