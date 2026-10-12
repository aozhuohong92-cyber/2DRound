slot1 = PlanesController:getInstance():getModel()
slot2 = string.format
PlanesBoardWindow = PlanesBoardWindow or BaseClass(BaseView)

function PlanesBoardWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "planes/planes_board_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_map"),
			type = ResourcesType.plist
		}
	}
end

function PlanesBoardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1
	slot0.win_title = slot1:getChildByName("win_title")
	slot0.btn_comfirm = slot1:getChildByName("btn_comfirm")
	slot0.btn_comfirm_label = slot0.btn_comfirm:getChildByName("label")
	slot0.board_sp = slot1:getChildByName("board_sp")
	slot0.title_txt = slot1:getChildByName("title_txt")
	slot0.main_con_size = slot1:getContentSize()
end

function PlanesBoardWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.btn_comfirm, handler(slot0, slot0.onClickComfirmBtn), true)
end

function PlanesBoardWindow.onClickCloseBtn(slot0)
	uv0:openPlanesBoardWindow(false)
end

function PlanesBoardWindow.onClickComfirmBtn(slot0)
	if not slot0.board_id or not slot0.grid_index then
		return
	end

	if slot0.board_show_type == 2 then
		return
	end

	if slot0.board_id == PlanesConst.Recover_Id or slot0.board_id == PlanesConst.Revive_Id or slot0.board_id == PlanesConst.Switch_Id or slot0.board_id == PlanesConst.DesBarrier_Id then
		if slot0.board_id == PlanesConst.Recover_Id and not uv0:checkIsHaveHpNotFullHero() then
			CommonAlert.show(TI18N("当前所有非阵亡英雄均满血，使用回复泉水将不会有效，是否继续？"), TI18N("确认"), function ()
				uv0:sender23104(uv1.grid_index, 1, {})
			end, TI18N("取消"))
		elseif slot0.board_id == PlanesConst.Revive_Id and not uv0:checkIsHaveDieHero() then
			CommonAlert.show(TI18N("当前无阵亡英雄且存活的英雄均满血，使用复活十字架将不会有效，是否继续？"), TI18N("确认"), function ()
				uv0:sender23104(uv1.grid_index, 1, {})
			end, TI18N("取消"))
		else
			uv1:sender23104(slot0.grid_index, 1, {})
		end
	end

	uv1:openPlanesBoardWindow(false)
end

function PlanesBoardWindow.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.board_id = slot1
	slot0.grid_index = slot2
	slot3 = slot3 or {}
	slot0.board_show_type = slot3.show_type or 1
	slot0.board_cfg = slot3.board_cfg

	slot0:setData(slot1, board_cfg)
end

function PlanesBoardWindow.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot3 = nil

	if not ((slot0.board_show_type ~= 2 or slot0.board_cfg) and Config.SecretDunData.data_board[slot1]) then
		return
	end

	if slot3.btn_str ~= "" then
		slot0.btn_comfirm:setVisible(true)
		slot0.btn_comfirm_label:setString(slot3.btn_str)
	else
		slot0.btn_comfirm:setVisible(false)
	end

	slot0.win_title:setString(slot3.title)

	if slot0.board_show_type == 2 then
		slot0.board_img_load = loadSpriteTextureFromCDN(slot0.board_sp, uv0("resource/planes/board_img/%s.png", slot3.res_id), ResourcesType.single, slot0.board_img_load)
	else
		slot0.board_img_load = loadSpriteTextureFromCDN(slot0.board_sp, uv0("resource/planes/board_img/%s.png", slot3.res_id), ResourcesType.single, slot0.board_img_load)
	end

	slot0.title_txt:setString(slot3.title)

	if not slot0.desc_txt_1 then
		slot0.desc_txt_1 = createRichLabel(24, cc.c4b(215, 226, 227, 255), cc.p(0.5, 1), cc.p(slot0.main_con_size.width * 0.5, 420), 0, 0, slot0.main_con_size.width - 100)

		slot0.main_container:addChild(slot0.desc_txt_1)
	end

	slot0.desc_txt_1:setString(slot3.desc_1)

	if not slot0.desc_txt_2 then
		slot0.desc_txt_2 = createRichLabel(24, cc.c4b(215, 226, 227, 255), cc.p(0.5, 1), cc.p(slot0.main_con_size.width * 0.5, 0), 0, 0, slot0.main_con_size.width - 100)

		slot0.main_container:addChild(slot0.desc_txt_2)
	end

	slot0.desc_txt_2:setString(slot3.desc_2)
	slot0.desc_txt_2:setPositionY(420 - slot0.desc_txt_1:getContentSize().height - 50)
end

function PlanesBoardWindow.close_callback(slot0)
	if slot0.board_img_load then
		slot0.board_img_load:DeleteMe()

		slot0.board_img_load = nil
	end

	uv0:openPlanesBoardWindow(false)
end
