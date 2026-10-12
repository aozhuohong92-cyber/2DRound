CocosTab = CocosTab or class("CocosTab")

function CocosTab.ctor(slot0, slot1, slot2, slot3)
	slot0.tab_list = slot1
	slot0.tab_type_list = slot2 or {}
	slot0.default_index = slot3 or 0

	slot0:config()
	slot0:addEventListener()
end

function CocosTab.config(slot0)
	slot0.select_index = 0
	slot0.tab_btn_list = {}
	slot0.select_cb = nil
end

function CocosTab.addEventListener(slot0)
	for slot4, slot5 in ipairs(slot0.tab_list) do
		table.insert(slot0.tab_btn_list, slot5)
		slot5:addTouchEventListener(handler(slot0, slot0.clickTabHandler))
		slot5:setTag(slot4)
	end
end

function CocosTab.clickTabHandler(slot0, slot1, slot2)
	if slot2 ~= ccui.TouchEventType.ended then
		return
	end

	if slot1:getTag() == slot0.selec_index then
		return
	end

	slot0:selectIndex(slot3)
end

function CocosTab.selectIndex(slot0, slot1)
	slot2 = slot0.select_index
	slot0.select_index = slot1

	for slot6, slot7 in ipairs(slot0.tab_btn_list) do
		if slot6 == slot1 then
			slot0:loadBtnTexture(slot7, true)

			if slot0.stypeSelectedCb then
				slot0.stypeSelectedCb(slot7)
			end
		else
			slot0:loadBtnTexture(slot7, false)

			if slot0.stypeUnSelectedCb then
				slot0.stypeUnSelectedCb(slot7)
			end
		end
	end

	if slot0.select_cb then
		slot0.select_cb(slot0.select_index, slot2)
	end
end

function CocosTab.setSelectCallback(slot0, slot1)
	slot0.select_cb = slot1

	if slot0.default_index ~= 0 then
		slot0:selectIndex(slot0.default_index)
	end
end

function CocosTab.loadBtnTexture(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	if #slot0.tab_type_list < 2 then
		return
	end

	if slot2 then
		slot1:loadTextureNormal(slot0.tab_type_list[2], LOADTEXT_TYPE_PLIST)
	else
		slot1:loadTextureNormal(slot0.tab_type_list[1], LOADTEXT_TYPE_PLIST)
	end
end

function CocosTab.setTabStypeCb(slot0, slot1, slot2)
	slot0.stypeSelectedCb = slot1
	slot0.stypeUnSelectedCb = slot2

	if slot0.select_index ~= 0 then
		for slot6, slot7 in ipairs(slot0.tab_btn_list) do
			if slot6 == slot0.select_index then
				if slot0.stypeSelectedCb then
					slot0.stypeSelectedCb(slot7)
				end
			elseif slot0.stypeUnSelectedCb then
				slot0.stypeUnSelectedCb(slot7)
			end
		end
	end
end

function CocosTab.deleteMe(slot0)
	slot0.tab_list = nil
	slot0.tab_btn_list = nil
	slot0.tab_type_list = nil
	slot0.select_cb = nil
end
