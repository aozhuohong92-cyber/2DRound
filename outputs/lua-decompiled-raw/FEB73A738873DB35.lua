ResourcesLoadMgr = ResourcesLoadMgr or BaseClass()
slot0 = cc.FileUtils:getInstance()

function ResourcesLoadMgr.getInstance(slot0)
	if not slot0.instance then
		slot0.instance = ResourcesLoadMgr.New()
	end

	return slot0.instance
end

function ResourcesLoadMgr.__init(slot0)
	slot0.res_info = {}
	slot0.resources_dir_list = {}
	slot0.download_list = {}
	slot0.error_list = {}
	slot0.callback_list = {}
	slot0.download_pro_num = 0
	slot0.is_startting = false
	slot0.resources_status_list = {}
	slot0.is_in_download_list = {}
	slot0.in_add_task = true
	slot0.wait_downlist_dir_list = {}
	slot0.all_res_num = 0
	slot0.all_res_size = 0
	slot0.finish_num = 0
	slot0.finish_size = 0
	slot0.tag = ".shiraho"
	slot0.allow_print = false
	slot0.download_delay = 0.3

	if device.isWifiState() == false then
		slot0.download_delay = 0.5
	end

	if IS_REQUIRE_RES_GY then
		function OnFileDownloadRes(slot0, slot1)
			if slot0 ~= 0 then
				-- Nothing
			end

			uv0.last_down_status = slot0

			uv0:printLog("========>download back path is", res, slot1)
			uv0:onResourcesDownLoaded(slot1)

			uv0.download_pro_num = uv0.download_pro_num - 1
		end

		function downloadProcess(slot0, slot1)
		end
	end
end

function ResourcesLoadMgr.downloadResAll(slot0)
	slot0.res_info = ALL_DOWNLOAD_RES_FILE[1]
	slot0.first_info_list = ALL_DOWNLOAD_RES_FILE[2]

	slot0:checkResoucesAll()
end

function ResourcesLoadMgr.checkResoucesAll(slot0)
	slot0.in_calc = true
	slot1 = 1
	slot2 = 100
	slot3 = nil
	slot4 = {}

	for slot8, slot9 in pairs(slot0.res_info) do
		if slot9[3] ~= nil then
			if slot0.resources_dir_list[slot9[3]] == nil then
				slot0.resources_dir_list[slot9[3]] = {}
			end

			table.insert(slot0.resources_dir_list[slot9[3]], {
				path = slot8,
				data = slot9
			})

			slot10 = string.format("%s%s", slot8, slot0.tag)

			if uv0:isFileExist(slot10) == true then
				uv0:removeFile(string.format("%sassets/%s", uv0:getWritablePath(), string.format("res/%s", slot10)))
			elseif uv0:isFileExist(slot8) and uv0:getFileSize(slot8) == 0 then
				uv0:removeFile(string.format("%sassets/%s", uv0:getWritablePath(), string.format("res/%s", slot8)))
			end

			table.insert(slot4, slot8)
		end
	end

	if next(slot4) then
		GlobalTimeTicket:getInstance():add(function ()
			for slot3 = uv0, uv0 + uv1 - 1 do
				if uv3.res_info[uv2[slot3]] then
					uv3:checkResouces(slot4)
				end
			end

			uv0 = uv0 + uv1

			if uv4 <= uv0 then
				uv3.in_calc = false
				uv3.in_add_task = false

				uv3:downloadNext()
				GlobalEvent:getInstance():Fire(EventId.ON_SPINE_DOWNLOADED)
			end
		end, 2 / display.DEFAULT_FPS, math.ceil(#slot4 / slot2), "re_download_mgr_checkResoucesAll")
	end
end

function ResourcesLoadMgr.checkResouces(slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil or type(slot1) ~= "string" then
		return
	end

	if slot0:getDir(slot1) == "" then
		return
	end

	if slot0.download_list[slot5] == nil then
		slot0.download_list[slot5] = {}

		slot0:addDownloadList(slot5)
	end

	if slot2 == true then
		if slot3 ~= nil then
			slot0.callback_list[slot1] = {
				callback = slot3,
				data = slot4
			}
		end

		slot0:startDownloadFile(slot1, true)
	end
end

function ResourcesLoadMgr.onResourcesDownLoaded(slot0, slot1)
	slot3 = 0
	slot4 = slot0.download_delay
	slot5, slot6 = nil

	if string.find(string.sub(slot1, string.len(string.format("%sassets/res/", uv0:getWritablePath())) + 1), slot0.tag) then
		slot0.is_in_download_list[string.gsub(slot1, slot0.tag, "")] = nil

		if #Split(slot1, "/") == 0 then
			return
		end

		if slot0:getDir(slot1) and slot0.download_list[slot5] then
			slot14 = ""

			for slot14, slot15 in pairs(slot0.download_list[slot5]) do
				if slot15[3] == string.gsub(slot8[#slot8], slot0.tag, slot14) then
					slot6, slot3 = slot0:checkResExist(slot15[1], nil, true)
					slot15[2] = slot6

					if slot6 == "downloaded" then
						slot0.resources_status_list[slot15[1]] = true
						slot0.finish_num = slot0.finish_num + 1
						slot0.finish_size = slot0.finish_size + slot3

						if slot0:checkFinish(slot5, slot15[1]) then
							slot4 = slot0.download_delay * 2
						end
					end

					break
				end
			end
		end
	end

	if string.find(slot5, "v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO") then
		slot0:downloadNext(slot5)
	else
		slot0:downloadNext()
	end
end

function ResourcesLoadMgr.downloadNext(slot0, slot1)
	if slot0.in_add_task == true then
		return
	end

	if slot1 and slot0.download_list[slot1] then
		for slot5, slot6 in pairs(slot0.download_list[slot1]) do
			if slot6[2] == "null" then
				slot0:startDownloadFile(slot6[1])

				return
			end
		end
	end

	if slot0.first_info_list and next(slot0.first_info_list) ~= nil and not slot0.resources_status_list[table.remove(slot0.first_info_list, 1)] then
		slot0:startDownloadFile(slot2, true)

		return
	end

	if AUTO_DOWN_RES == true then
		for slot5, slot6 in pairs(slot0.download_list) do
			for slot10, slot11 in pairs(slot6) do
				if slot11[2] == "null" then
					slot0:startDownloadFile(slot11[1])

					return
				end
			end
		end
	end

	slot0.is_startting = false

	cc.CCGameDownload:getInstance():stopThread()
end

function ResourcesLoadMgr.startDownloadFile(slot0, slot1, slot2)
	if slot0.resources_status_list[slot1] == true then
		return
	end

	if slot0.is_startting == false then
		cc.CCGameDownload:getInstance():startThread(RESOURCES_DOWNLOAD_PRO_MAX)

		slot0.is_startting = true
	end

	if slot0.res_info[slot1] == nil then
		slot3 = slot0.callback_list[slot1]

		if error_log_report and slot3 and slot3.data then
			if CDN_ALL_RES_FILE == nil then
				CDN_ALL_RES_FILE = ""
			end

			error_log_report(string.format("资源下载失败,主包内部不存在,cdn上面也不存在===============> 资源路径-%s, 资源类型-%s, 目标资源路径-%s, 下载缓存-%s, 总资源长度-%s, 堆栈-%s", slot3.data.path, slot3.data.type, slot1, CDN_ALL_RES_FILE, tableLen(slot0.res_info), debug.traceback()))
		end

		slot0:checkCallBack(slot1, true)

		return
	end

	if slot2 == true or slot0.download_pro_num <= RESOURCES_DOWNLOAD_PRO then
		if not IS_REQUIRE_RES_GY then
			return
		end

		if MAKELIFEBETTER or not GAME_INITED or slot0.in_add_task then
			return
		end

		if slot0.is_in_download_list[slot1] ~= nil then
			return
		end

		slot0.is_in_download_list[slot1] = slot1
		slot0.download_pro_num = slot0.download_pro_num + 1
		slot0.in_download = true
		slot3 = string.format("%s/%s", CDN_RES_GY_URL, slot0.res_info[slot1][1])
		slot4 = Split(slot1, "/")
		slot7 = string.format("%sassets/res/%s%s", uv0:getWritablePath(), slot1, slot0.tag)
		slot8 = string.format("%sassets/res/%s", uv0:getWritablePath(), string.gsub(slot1, string.format("/%s", slot4[#slot4]), ""))

		slot0:mkdir(slot8)
		slot0:printLog(string.format("==> download url---%s", slot3), slot7, slot8)
		uv0:removeFile(slot7)
		cc.CCGameDownload:getInstance():download(slot3, slot7, "OnFileDownloadRes")
	end
end

function ResourcesLoadMgr.mkdir(slot0, slot1)
	if not uv0:isDirectoryExist(slot1) then
		uv0:createDirectory(slot1)
	end
end

function ResourcesLoadMgr.checkResExist(slot0, slot1, slot2, slot3)
	slot4 = false
	slot5 = "downloaded"
	slot6 = string.format("%s%s", slot1, slot0.tag)
	slot8 = 0

	if uv0:isFileExist(slot6) and (uv0:getFileSize(slot6) ~= (slot2 or slot0.res_info[slot1])[2] or slot8 == 0) then
		uv0:removeFile(string.format("%sassets/%s", uv0:getWritablePath(), string.format("res/%s", slot6)))

		slot0.error_list[slot1] = (slot0.error_list[slot1] or 0) + 1

		if slot0.error_list[slot1] < 3 then
			return "null", 0
		else
			if not resources_load_file_ then
				resources_load_file_ = true

				if error_log_report then
					error_log_report(string.format("边玩边下下载失败,url:%s|status:%s|size:%s;%s:path:%s", string.format("%s/%s", CDN_RES_GY_URL, slot2[1]), slot0.last_down_status or -1, slot8, slot2[2], slot6))
				end
			end

			return "error", 0
		end
	end

	if slot4 == false then
		slot4 = uv0:isFileExist(slot1)
	elseif slot3 == true then
		slot5 = "downloaded"
		slot1 = slot6
	end

	if slot4 and uv0:isFileExist(slot1) then
		if slot3 == false or uv0:getFileSize(slot1) == slot2[2] then
			return slot5, slot2[2]
		else
			if slot1 == slot6 then
				uv0:removeFile(string.format("%sassets/%s", uv0:getWritablePath(), slot7))
			end

			slot0.error_list[slot1] = (slot0.error_list[slot1] or 0) + 1

			if slot0.error_list[slot1] < 3 then
				return "null", 0
			else
				if slot3 == true then
					slot0:checkCallBack(slot1, true)
				end

				if not resources_load_file_ then
					resources_load_file_ = true

					if error_log_report then
						error_log_report(string.format("边玩边下下载失败2,url:%s|status:%s|size:%s;%s|path:%s", string.format("%s/%s", CDN_RES_GY_URL, slot2[1]), slot0.last_down_status or -1, uv0:getFileSize(slot1), slot2[2], slot1))
					end
				end

				return "error", 0
			end
		end
	else
		return "null", 0
	end
end

function ResourcesLoadMgr.checkFinish(slot0, slot1, slot2)
	if string.find(slot1, "v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO") then
		for slot6, slot7 in pairs(slot0.download_list[slot1]) do
			if slot7[2] ~= "downloaded" then
				return false
			end
		end
	end

	slot0:printLog(string.format("资源 [%s] 下载完毕", slot2 or slot1))

	if GlobalEvent then
		GlobalEvent:getInstance():Fire(EventId.ON_SPINE_DOWNLOADED)
	end

	if slot0.all_res_size <= slot0.finish_size then
		MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.download, true)
	end

	if slot2 ~= nil and not string.find(slot1, "v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO") then
		slot0:printLog(string.format("重命名UI资源 [%s]", slot2))
		slot0:renameFile(slot2)

		_file_exist_list[slot2] = uv0:isFileExist(slot2)

		slot0:checkCallBack(slot2)
	else
		for slot7, slot8 in pairs(slot0.download_list[slot1]) do
			if slot8[2] == "downloaded" then
				slot0:printLog(string.format("重命名资源 [%s]", slot8[1]))
				slot0:renameFile(slot8[1])

				_file_exist_list[slot8[1]] = uv0:isFileExist(slot8[1])
			end
		end
	end

	return true
end

function ResourcesLoadMgr.checkCallBack(slot0, slot1, slot2)
	if slot0.callback_list[slot1] ~= nil then
		slot3.callback(slot3.data, slot2)

		slot0.callback_list[slot1] = nil
	end
end

function ResourcesLoadMgr.renameFile(slot0, slot1)
	slot2 = Split(slot1, "/")
	slot5 = slot2[#slot2]
	slot6 = string.format("%s%s", slot5, slot0.tag)

	if uv0:isFileExist(string.format("%s%s", string.format("%sassets/res/%s/", uv0:getWritablePath(), string.gsub(slot1, string.format("/%s", slot2[#slot2]), "")), slot5)) then
		uv0:removeFile(slot8)
	end

	slot9 = false
	slot9 = uv0:renameFile(slot7, slot6, slot5)
end

function ResourcesLoadMgr.checkDirFull(slot0, slot1)
	if not string.find(slot1, "v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO") then
		return uv0:isFileExist(slot1)
	end

	if slot0.resources_dir_list[slot0:getDir(slot1)] == nil or next(slot0.resources_dir_list[slot2]) == nil then
		return uv0:isFileExist(slot1)
	else
		for slot6, slot7 in ipairs(slot0.resources_dir_list[slot2]) do
			if slot7.path ~= nil and uv0:getFileSize(slot7.path) == 0 then
				return false
			end
		end

		return true
	end
end

function ResourcesLoadMgr.addDownloadList(slot0, slot1)
	slot2, slot3, slot4 = nil

	if slot0.resources_dir_list[slot1] ~= nil and next(slot5) ~= nil then
		for slot9, slot10 in ipairs(slot5) do
			if slot0:checkResExist(slot10.path, slot10.data, false) == "downloaded" then
				slot0.resources_status_list[slot10.path] = true
				slot0.finish_num = slot0.finish_num + 1
				slot0.finish_size = slot0.finish_size + (slot10.data[2] or 0)
			else
				slot3 = Split(slot10.path, "/")

				table.insert(slot0.download_list[slot1], {
					slot10.path,
					slot2,
					slot3[#slot3]
				})
			end

			slot0.all_res_num = slot0.all_res_num + 1
			slot0.all_res_size = slot0.all_res_size + (slot10.data[2] or 0)
		end
	end

	if #slot0.download_list[slot1] == 0 then
		slot0:checkFinish(slot1)
	end
end

function ResourcesLoadMgr.getCurNum(slot0)
	return slot0.finish_size
end

function ResourcesLoadMgr.getLeftNum(slot0)
	if slot0.in_calc then
		return 100000
	end

	return math.max(0, slot0.all_res_size - slot0.finish_size)
end

function ResourcesLoadMgr.getPercentage(slot0)
	if slot0.all_res_size == 0 then
		return 100
	else
		return 100 * slot0.finish_size / slot0.all_res_size
	end
end

function ResourcesLoadMgr.getSumNum(slot0)
	if slot0.in_calc then
		return 1000000
	end

	return slot0.all_res_size
end

function ResourcesLoadMgr.printLog(slot0, ...)
	if slot0.allow_print then
		print(unpack({
			...
		}))
	end
end

function ResourcesLoadMgr.getDir(slot0, slot1)
	if slot1 == nil then
		return ""
	end

	if Split(slot1, "/") == nil or next(slot3) == nil then
		return slot2
	end

	for slot7 = 1, #slot3 - 1 do
		if slot2 ~= "" then
			slot2 = slot2 .. "/"
		end

		slot2 = slot2 .. slot3[slot7]
	end

	return slot2
end
