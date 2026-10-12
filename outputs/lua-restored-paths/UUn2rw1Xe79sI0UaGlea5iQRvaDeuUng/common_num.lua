CommonNum = class("CommonNum", function ()
	return ccui.Widget:create()
end)

function CommonNum.ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.num_list = {}
	slot0.num_pool_list = {}
	slot0.is_init = false
	slot0.type = slot1 or 1
	slot0.space = slot4 or 1
	slot0.is_completed = false

	slot0:setAnchorPoint(slot5 or cc.p(0.5, 0.5))
	slot0:setCascadeOpacityEnabled(true)

	if slot2 ~= nil then
		slot2:addChild(slot0)
	end

	slot0:setNum(slot3)
end

common_num_resources_load = nil
common_num_is_completed = false
commom_battle_num = {
	[2] = true,
	[4] = true,
	[7] = true,
	[24] = true,
	[25] = true,
	[27] = true,
	[19] = true,
	[20] = true
}

function CommonNumClearRes()
	if common_num_resources_load ~= nil then
		common_num_resources_load:DeleteMe()

		common_num_resources_load = nil
		common_num_is_completed = false
	end
end

function CommonNum.setNum(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	slot0.num = slot1
	slot0.addtype = slot2
	slot0.plist_file = nil

	if commom_battle_num[slot0.type] then
		slot0.plist_file = "battle_num"

		if common_num_is_completed == true then
			slot0:setOfficialNum(slot0.num, slot0.addtype)
		elseif common_num_resources_load == nil then
			common_num_resources_load = ResourcesLoad.New()

			common_num_resources_load:addDownloadList(PathTool.getPlistImgForDownLoad("num", "battle_num"), ResourcesType.plist, function ()
				common_num_is_completed = true

				if not tolua.isnull(uv0) then
					uv0:setOfficialNum(uv0.num, uv0.addtype)
				end
			end)
		end
	else
		slot0.plist_file = string.format("type%s", slot0.type)

		if slot0.is_completed == true then
			slot0:setOfficialNum(slot0.num, slot0.addtype)
		elseif slot0.resources_load == nil then
			slot0.resources_load = ResourcesLoad.New()

			slot0.resources_load:addDownloadList(PathTool.getPlistImgForDownLoad("num", string.format("type%s", slot0.type)), ResourcesType.plist, function (...)
				uv0.is_completed = true

				if not tolua.isnull(uv0) then
					uv0:setOfficialNum(uv0.num, uv0.addtype)
				end
			end)
		end
	end
end

function CommonNum.setOfficialNum(slot0, slot1, slot2)
	slot3 = PathTool.getResFrame
	slot4 = string.format
	slot5 = table.remove

	for slot10, slot11 in ipairs(slot0.num_list) do
		slot11.sp:setVisible(false)
		table.insert(slot0.num_pool_list, slot11)
	end

	slot0.num_list = {}
	slot7 = type(slot1) == "number" and tostring(slot1) or slot1

	if slot2 ~= nil then
		slot7 = slot2 == true and "+" .. slot7 or "-" .. slot7
	end

	slot9 = 0
	slot10 = 0

	for slot14 = 1, string.len(slot7) do
		if string.sub(slot7, slot14, slot14) == "+" then
			slot15 = "add"
		elseif slot15 == "-" then
			slot15 = "sub"
		elseif slot15 == "/" then
			slot15 = "bias"
		elseif slot15 == "." then
			slot15 = "point"
		elseif slot15 == ":" then
			slot15 = "mao"
		elseif slot15 == "s" then
			slot15 = "txt_cn_step"
		elseif slot15 == "g" then
			slot15 = "txt_cn_go"
		end

		slot16 = slot3("num", slot4("type%s_%s", slot0.type, slot15), false, slot0.plist_file)
		slot17, slot18 = nil

		if next(slot0.num_pool_list) then
			slot17 = slot5(slot0.num_pool_list, 1)
		else
			slot18 = createSprite(nil, 0, 0, nil, cc.p(0, 0.5))
			slot17 = {
				sp = slot18
			}

			slot0:addChild(slot18)
		end

		slot6(slot0.num_list, slot17)
		slot17.sp:setVisible(true)

		if slot17.res ~= slot16 then
			slot17.res = slot16

			loadSpriteTexture(slot17.sp, slot16, LOADTEXT_TYPE_PLIST)

			slot17.size = slot17.sp:getContentSize()
		end

		if slot15 == "point" then
			slot17.sp:setAnchorPoint(cc.p(0, 0))
			slot17.sp:setPositionY(-slot9 / 2)
		end

		slot17.sp:setPositionX(slot10)

		slot10 = slot10 + slot17.size.width + slot0.space

		if slot9 <= slot17.size.height then
			slot9 = slot17.size.height
		end
	end

	slot0:setContentSize(cc.size(slot10, slot9))

	if slot0.call_back then
		slot0.call_back()
	end
end

function CommonNum.setCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function CommonNum.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.num_pool_list) do
		slot5.sp:removeFromParent()
	end

	slot0.num_pool_list = nil

	for slot4, slot5 in ipairs(slot0.num_list) do
		slot5.sp:removeFromParent()
	end

	slot0.num_list = nil

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()
	end

	slot0.resources_load = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
