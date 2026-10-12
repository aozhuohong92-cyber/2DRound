VedioLookPanel = VedioLookPanel or BaseClass(BaseView)
slot0 = VedioController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function VedioLookPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "vedio/vedio_look_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("vedio", "vedio"),
			type = ResourcesType.plist
		}
	}
end

function VedioLookPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("录像详情"))

	slot1 = slot0.main_panel:getContentSize()
	slot0.cell = VedioMainItem.new(true)

	slot0.cell:addCallBack(function (slot0)
		uv0:onShowSharePanel(slot0)
	end)
	slot0.cell:addPlayCallBack(function ()
		uv0:onClickBtnClose()
	end)
	slot0.cell.container:getChildByName("image_panel"):getChildByName("image_bg"):setVisible(false)
	slot0.cell:setPosition(slot1.width * 0.5, slot1.height * 0.5)
	slot0.main_panel:addChild(slot0.cell)
end

function VedioLookPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
end

function VedioLookPanel.onShowSharePanel(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.data then
		return
	end

	slot2 = nil

	if slot0.data.combat_type == BattleConst.Fight_Type.CrossChampion and slot0.data.ext and next(slot0.data.ext) ~= nil then
		for slot6, slot7 in pairs(slot0.data.ext) do
			if slot7.key == 1 then
				slot2 = slot7.str

				break
			end
		end
	else
		slot2 = slot0.data.a_srv_id
	end

	uv0:openVedioSharePanel(true, slot0.data.id, slot1, function (slot0)
		uv0:updateData(slot0)
	end, slot2, slot0.data.combat_type)
end

function VedioLookPanel.onClickBtnClose(slot0)
	uv0:openVedioLookPanel(false)
end

function VedioLookPanel.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
end

function VedioLookPanel.updateData(slot0, slot1)
	if not slot0.data then
		return
	end

	if slot1 == VedioConst.Share_Btn_Type.eGuildBtn then
		slot0.data.share = slot0.data.share + 1
	else
		slot0.data.share = slot0.data.share + 1
	end

	slot0.cell:setData(slot0.data)
end

function VedioLookPanel.setData(slot0, slot1)
	slot0.data = slot1

	slot0.cell:setData(slot1)
end

function VedioLookPanel.close_callback(slot0)
	slot0.data = nil

	uv0:openVedioLookPanel(false)
end
