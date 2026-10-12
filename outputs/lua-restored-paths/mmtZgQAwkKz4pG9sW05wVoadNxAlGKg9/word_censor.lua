TreeNode = TreeNode or BaseClass()

function TreeNode.__init(slot0)
	slot0.data = {}
	slot0._isLeaf = nil
	slot0.isEnd = false
	slot0.parent = nil
	slot0.value = nil
end

function TreeNode.getChild(slot0, slot1)
	return slot0.data[slot1]
end

function TreeNode.addChild(slot0, slot1)
	slot2 = TreeNode.New()
	slot0.data[slot1] = slot2
	slot2.value = slot1
	slot2.parent = slot0

	return slot2
end

function TreeNode.getFullWord(slot0)
	slot1 = slot0.value
	slot2 = slot0.parent

	while slot2 do
		slot1 = string.format("%s%s", slot2.value, slot1)
		slot2 = slot2.parent
	end

	return slot1
end

function TreeNode.isLeaf(slot0)
	for slot5, slot6 in pairs(slot0.data) do
		slot1 = 0 + 1
	end

	slot0._isLeaf = slot1 == 0

	return slot0._isLeaf
end

WordCensor = WordCensor or BaseClass()

function WordCensor.__init(slot0)
	slot0.word_config = {
		"你妹啊",
		"你大爷啊",
		"我擦",
		"你sb啊",
		"傻逼",
		"顶你的肺啊",
		"2b青年",
		"两百五"
	}
	slot0.treeRoot = slot0:createRootNode(slot0.word_config)
	WordCensor.Instance = slot0
end

function WordCensor.getInstance(slot0)
	if not WordCensor.Instance then
		WordCensor.New()
	end

	return WordCensor.Instance
end

function WordCensor.stringToChars(slot0, slot1)
	slot2 = {}
	slot3 = string.len(slot1)
	slot4 = 1

	while slot3 >= slot4 do
		slot6 = 1

		if string.byte(slot1, slot4) > 0 and slot5 <= 127 then
			slot6 = 1
		elseif slot5 >= 192 and slot5 <= 223 then
			slot6 = 2
		elseif slot5 >= 224 and slot5 <= 239 then
			slot6 = 3
		elseif slot5 >= 240 and slot5 <= 247 then
			slot6 = 4
		end

		slot4 = slot4 + slot6

		table.insert(slot2, string.sub(slot1, slot4, slot4 + slot6 - 1))
	end

	return slot2, slot3
end

function WordCensor.createRootNode(slot0, slot1)
	TreeNode.New().value = ""

	for slot7 = 1, table.getn(slot1) do
		for slot15 = 1, table.getn(slot0:stringToChars(slot1[slot7])) do
			slot11 = slot2:getChild(slot9[slot15]) and slot17 or slot17:addChild(slot16)
		end

		slot11.isEnd = true
	end

	return slot2
end

function WordCensor.getRootNode(slot0)
	return slot0.treeRoot
end

function WordCensor.replaceWordCensor(slot0, slot1)
	slot2, slot3, slot4, slot5 = nil
	slot6 = slot0:getRootNode()
	slot7 = slot1
	slot8 = slot0:stringToChars(slot1)
	slot9 = 1
	slot10 = 0
	slot11 = 0

	while slot9 <= table.getn(slot8) do
		if slot6:getChild(slot8[slot9]) then
			if slot3.isEnd then
				slot4 = slot3
				slot10 = slot9
			end

			slot11 = slot9
			slot6 = slot3
			slot9 = slot9 + 1
		else
			if slot4 then
				slot5 = slot4:getFullWord()
				slot7 = string.gsub(slot7, slot5, slot0:getReplaceWord(table.getn(slot0:stringToChars(slot5))))
				slot9 = slot10
			elseif slot6 ~= slot0:getRootNode() then
				slot9 = slot11
			end

			slot6 = slot0:getRootNode()
			slot4 = nil
			slot9 = slot9 + 1
		end
	end

	if slot4 then
		slot5 = slot4.getFullWord()
		slot7 = string.gsub(slot7, slot5, slot0:getReplaceWord(table.getn(slot0:stringToChars(slot5))))
	end

	return slot7
end

function WordCensor.getReplaceWord(slot0, slot1)
	for slot6 = 1, slot1 do
		slot2 = string.format("%s%s", "", "*")
	end

	return slot2
end

function WordCensor.relpaceChatTag(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in function ()
		return string.find(uv0, "[<>]", uv1)
	end, nil, nil do
		slot1 = string.gsub(slot1, string.sub(slot1, slot6, slot7), "")
		slot2 = slot7 + 1
	end

	return slot1
end

function WordCensor.relapceAssetsTag(slot0, slot1)
	slot2 = 0
	slot3 = Array.New()

	for slot7, slot8 in function ()
		return string.find(uv0, "(%<assets=)(.-)(%/)(%>)")
	end, nil, nil do
		slot11 = nil

		if Config.ItemData.data_get_data(tonumber(string.sub(string.sub(slot1, slot7, slot8), 9, -3))) then
			slot11 = PathTool.getItemRes(slot12.icon, true)
		end

		if not cc.FileUtils:getInstance():isFileExist(slot11) then
			return slot1
		end

		slot1 = string.gsub(slot1, slot9, "STR___", 1)

		slot3:PushBack(string.format("<img src='%s' scale=0.3 />", slot11))

		slot2 = slot8 + 1
	end

	while slot3:GetSize() > 0 do
		slot1 = string.gsub(slot1, "STR___", slot3:PopFront(), 1)
	end

	return slot1
end

function WordCensor.relapceChatIconTag(slot0, slot1)
	slot2 = 0
	slot3 = Array.New()

	for slot7, slot8 in function ()
		return string.find(uv0, "(%<icon=)(.-)(%/)(%>)", uv1)
	end, nil, nil do
		if not cc.FileUtils:getInstance():isFileExist(PathTool.getChatRes(string.sub(string.sub(slot1, slot7, slot8), 9, -3))) then
			return slot1
		end

		slot1 = string.gsub(slot1, slot9, "STR___")

		slot3:PushBack(string.format("<img src='%s' scale=0.25 />", slot11))

		slot2 = slot8 + 1
	end

	while slot3:GetSize() > 0 do
		slot1 = string.gsub(slot1, "STR___", slot3:PopFront(), 1)
	end

	return slot1
end

function WordCensor.relapceFaceIconTag(slot0, slot1)
	slot2 = Config.FaceData.data_biaoqing_length
	slot3 = 0
	slot4 = Array.New()

	for slot8, slot9 in function ()
		return string.find(uv0, "(%#)%d+", uv1)
	end, nil, nil do
		if slot8 <= 1 or string.sub(slot1, slot8 - 1, slot8 - 1) ~= "=" then
			slot12 = string.len(string.sub(string.sub(slot1, slot8, slot9), 2))
			slot14 = ""

			while true do
				if slot2 < tonumber(slot11) then
					if slot12 - 1 == string.len(string.sub(slot11, 1, slot12 - 1)) then
						slot13 = nil
					end
				else
					slot1 = string.gsub(slot1, "#" .. slot11, "STR___", 1)

					if Config.FaceData.data_biaoqing[tonumber(slot11)] then
						slot4:PushBack(string.format("<img src='%s' />", Config.FaceData.data_biaoqing[tonumber(slot11)].name))
					end

					slot13 = nil
				end
			end
		end

		slot3 = slot9 + 1
	end

	slot5 = slot4:GetSize()

	while slot4:GetSize() > 0 do
		slot1 = string.gsub(slot1, "STR___", slot4:PopFront(), 1)
	end

	return {
		slot5,
		slot1
	}
end
