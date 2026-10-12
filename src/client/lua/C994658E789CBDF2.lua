PastePanel = class("PastePanel", function ()
	return ccui.Widget:create()
end)

function PastePanel.ctor(slot0)
	slot0.item_list = {}

	slot0:createRootWnd()
end

function PastePanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/paste_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -80)
	slot0:setAnchorPoint(0, 0)
	WelfareController:getInstance():setPosteWelfareStatus(false)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:getChildByName("txt1"):setString(TI18N("贴吧搜索:"))
	slot0.main_container:getChildByName("txt2"):setString(TI18N("点击关注"))
	slot0.main_container:getChildByName("txt3"):setString(TI18N("进入「关注礼包码贴」领取礼包码"))

	slot0.item_cons = slot0.main_container:getChildByName("item_cons")
	slot0.bg = slot0.main_container:getChildByName("bg")

	slot0:loadBackground()
	slot0:showItemList()
end

function PastePanel.loadBackground(slot0)
	slot0.load_bg = loadSpriteTextureFromCDN(slot0.bg, PathTool.getPlistImgForDownLoad("bigbg/welfare", "txt_cn_paste"), ResourcesType.single)
end

function PastePanel.showItemList(slot0)
	if Config.HolidayClientData.data_info[WelfareIcon.poste] then
		for slot6, slot7 in ipairs(slot2.items) do
			if slot0.item_list[slot6] == nil then
				slot0.item_list[slot6] = BackPackItem.new(false, true, false, 1, false, true)

				slot0.item_cons:addChild(slot0.item_list[slot6])
				slot0.item_list[slot6]:setPosition(77 + (slot6 - 1) * 138, 77)
			end

			slot0.item_list[slot6]:setBaseData(slot7[1], slot7[2])
		end
	end
end

function PastePanel.setVisibleStatus(slot0, slot1)
	bool = bool or false

	slot0:setVisible(slot1)
end

function PastePanel.DeleteMe(slot0)
	if slot0.load_bg then
		slot0.load_bg:DeleteMe()
	end

	slot0.load_bg = nil

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end
end
