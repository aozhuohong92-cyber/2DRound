HalidomUpLvWindow = HalidomUpLvWindow or BaseClass(BaseView)
slot1 = HalidomController:getInstance():getModel()

function HalidomUpLvWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
	slot0.is_csb_action = true
	slot0.layout_name = "hallows/hallows_step_up_window"
	slot0.item_list = {}
end

function HalidomUpLvWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.title_container = slot0.root_wnd:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.Sprite_1 = slot0.main_container:getChildByName("Sprite_1")

	if slot0.sprite_1_load == nil then
		slot0.sprite_1_load = loadSpriteTextureFromCDN(slot0.Sprite_1, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_97"), ResourcesType.single, slot0.sprite_1_load)
	end

	slot0.Sprite_2 = slot0.main_container:getChildByName("Sprite_2")

	if slot0.sprite_2_load == nil then
		slot0.sprite_2_load = loadSpriteTextureFromCDN(slot0.Sprite_2, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.sprite_2_load)
	end

	slot0.hallows_name = slot0.main_container:getChildByName("hallows_name")
	slot0.old_step = slot0.main_container:getChildByName("old_step")
	slot4 = "cur_step"
	slot0.cur_step = slot0.main_container:getChildByName(slot4)

	for slot4 = 1, 2 do
		if slot0.main_container:getChildByName("item_" .. slot4) then
			slot6 = {
				item = slot5,
				title = slot5:getChildByName("title"),
				last_lev = slot5:getChildByName("last_lev"),
				now_lev = slot5:getChildByName("now_lev"),
				arrow = slot5:getChildByName("arrow")
			}

			slot6.title:setString("")
			slot6.last_lev:setString("")
			slot6.now_lev:setString("")
			slot6.arrow:setVisible(false)

			slot0.item_list[slot4] = slot6
		end
	end
end

function HalidomUpLvWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openHalidomUpLvWindow(false)
		end
	end)
end

function HalidomUpLvWindow.openRootWnd(slot0, slot1)
	playOtherSound("c_get")
	slot0:handleEffect(true)

	if slot1 then
		slot0.halidom_vo = uv0:getHalidomDataById(slot1)

		if not slot0.halidom_vo then
			return
		end

		slot0.base_cfg = Config.HalidomData.data_base[slot1]
		slot0.all_skill_cfg = Config.HalidomData.data_lvup[slot1]

		if slot0.halidom_vo and slot0.base_cfg and slot0.all_skill_cfg then
			slot0:setBaseInfo()
			slot0:setAttrInfo()
		end
	end
end

function HalidomUpLvWindow.setBaseInfo(slot0)
	slot0.hallows_name:setString(slot0.base_cfg.name)
	slot0.old_step:setString(slot0.halidom_vo.lev - 1 .. TI18N("级"))
	slot0.cur_step:setString(slot0.halidom_vo.lev .. TI18N("级"))
end

function HalidomUpLvWindow.setAttrInfo(slot0)
	if slot0.all_skill_cfg[slot0.halidom_vo.lev - 1] == nil or slot0.all_skill_cfg[slot0.halidom_vo.lev] == nil then
		return
	end

	slot3 = slot1.total_exp / slot1.exp - 1

	for slot7, slot8 in ipairs(slot1.attr) do
		if slot7 > 2 then
			break
		end

		slot10 = slot8[2]

		if Config.AttrData.data_key_to_name[slot8[1]] then
			slot12 = 0

			for slot16, slot17 in pairs(slot1.exp_attr) do
				if slot17[1] == slot9 then
					slot12 = slot3 * slot17[2]

					break
				end
			end

			if PartnerCalculate.isShowPerByStr(slot9) == true then
				slot10 = (slot10 + slot12) / 10 .. "%"
			end

			if slot0.item_list[slot7] then
				slot14.title:setString(slot11)
				slot14.last_lev:setString(slot10)
			end
		end
	end

	for slot7, slot8 in ipairs(slot2.attr) do
		if slot7 > 2 then
			break
		end

		if Config.AttrData.data_key_to_name[slot8[1]] then
			slot12 = slot0.item_list[slot7]

			if PartnerCalculate.isShowPerByStr(slot9) == true then
				slot10 = slot8[2] / 10 .. "%"
			end

			if slot12 then
				slot12.arrow:setVisible(true)
				slot12.now_lev:setString(slot10)

				if slot1.attr[slot7] == nil then
					slot12.title:setString(slot11)
					slot12.last_lev:setString(0)
				end
			end
		end
	end
end

function HalidomUpLvWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(189), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function HalidomUpLvWindow.close_callback(slot0)
	slot0:handleEffect(false)

	if slot0.sprite_1_load then
		slot0.sprite_1_load:DeleteMe()

		slot0.sprite_1_load = nil
	end

	if slot0.sprite_2_load then
		slot0.sprite_2_load:DeleteMe()

		slot0.sprite_2_load = nil
	end

	uv0:openHalidomUpLvWindow(false)
end
