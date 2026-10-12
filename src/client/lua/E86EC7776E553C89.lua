AdventureUseHPWindow = AdventureUseHPWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()
slot1 = AdventureController:getInstance():getUiModel()
slot2 = string.format
slot3 = table.insert
slot4 = GameNet:getInstance()

function AdventureUseHPWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.index = 2
	slot0.layout_name = "adventure/adventure_use_hp_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventurewindow"),
			type = ResourcesType.plist
		}
	}
	slot0.hero_list = {}
end

function AdventureUseHPWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.skill_name = slot1:getChildByName("skill_name")
	slot0.skill_desc = slot1:getChildByName("skill_desc")
	slot0.skill_num = slot1:getChildByName("skill_num")
	slot0.skill_num2 = slot1:getChildByName("skill_num2")
	slot0.choose_container = slot1:getChildByName("choose_container")

	slot0.choose_container:getChildByName("choose_title"):setString(TI18N("请选择使用目标"))

	slot0.total_width = slot0.choose_container:getContentSize().width
	slot0.cancen_btn = slot0.choose_container:getChildByName("cancen_btn")

	slot0.cancen_btn:setTitleColor(Config.ColorData.data_color4[1])
	slot0.cancen_btn:setTitleText(TI18N("取消"))

	slot0.cancen_btn_label = slot0.cancen_btn:getTitleRenderer()

	if slot0.cancen_btn_label ~= nil then
		slot0.cancen_btn_label:enableOutline(Config.ColorData.data_color4[278], 2)
	end

	slot0.confirm_btn = slot0.choose_container:getChildByName("confirm_btn")

	slot0.confirm_btn:setTitleColor(Config.ColorData.data_color4[1])
	slot0.confirm_btn:setTitleText(TI18N("确定"))

	slot0.confirm_btn_label = slot0.confirm_btn:getTitleRenderer()

	if slot0.confirm_btn_label ~= nil then
		slot0.confirm_btn_label:enableOutline(Config.ColorData.data_color4[277], 2)
	end
end

function AdventureUseHPWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openAdventureUseHPWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.cancen_btn, function ()
		uv0:openAdventureUseHPWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.confirm_btn, function ()
		if uv0.select_cell == nil then
			message(TI18N("请选择使用英雄"))

			return
		end

		if uv0.select_cell:getData() == nil or slot0.partner_id == nil or slot0.partner_id == 0 then
			message(TI18N("数据异常,请关闭重新打开"))

			return
		end

		if uv0.config then
			uv1:send20607(uv0.config.id, slot0.partner_id)
		end
	end, false, 1)
end

function AdventureUseHPWindow.openRootWnd(slot0, slot1)
	if slot1 and slot1.config then
		slot0.config = slot1.config

		slot0.skill_name:setString(slot0.config.name)
		slot0.skill_desc:setString(TI18N("效果：") .. slot0.config.desc)

		if slot0.config.max_num and slot3 > 0 then
			slot0.skill_num:setString(uv0(TI18N("本轮剩余使用次数：%s"), slot3 - (slot1.use_count or 0)))
			slot0.skill_num2:setString(uv0(TI18N("生命药剂剩余：%s"), slot1.num or 0))
		else
			slot0.skill_num:setString(TI18N("剩余数量：") .. slot2)
			slot0.skill_num2:setString("")
		end

		slot0:updateHeroList()
	end
end

function AdventureUseHPWindow.updateHeroList(slot0)
	slot1 = uv0:getFormList()
	slot2 = uv0:getSelectPartnerID()

	for slot11, slot12 in ipairs(slot1) do
		if slot0.hero_list[slot11] == nil then
			slot0.hero_list[slot11] = HeroExhibitionItem.new(slot3, true, 0, true)

			slot0.hero_list[slot11]:setPosition((slot0.total_width - #slot1 * 130 * 0.8) * 0.5 + (slot4 * 0.5 + (slot11 - 1) * slot4) * slot3, 152)
			slot0.hero_list[slot11]:addCallBack(function (slot0, slot1)
				uv0:selectHeroItem(slot0, slot1)
			end)
			slot0.choose_container:addChild(slot0.hero_list[slot11])
		end

		slot0:updateHeroInfo(slot0.hero_list[slot11], slot12)

		if slot2 ~= 0 and slot12.partner_id == slot2 then
			slot0:selectHeroItem(slot14, slot12)
		end
	end
end

function AdventureUseHPWindow.updateHeroInfo(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	slot1:setData(slot2)

	slot3 = slot2.now_hp / slot2.hp

	slot1:showProgressbar(slot3 * 100)

	if slot3 == 0 then
		slot1:showStrTips(true, TI18N("已阵亡"))
	else
		slot1:showStrTips(false)
	end
end

function AdventureUseHPWindow.selectHeroItem(slot0, slot1, slot2)
	if slot2.now_hp == 0 then
		message(TI18N("死亡英雄无法选择"))

		return
	end

	if slot0.select_cell == slot1 then
		return
	end

	if slot0.select_cell then
		slot0.select_cell:setSelected(false)

		slot0.select_cell = nil
	end

	slot0.select_cell = slot1

	slot0.select_cell:setSelected(true)
end

function AdventureUseHPWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.hero_list) do
		slot5:DeleteMe()
	end

	slot0.hero_list = nil

	uv0:openAdventureUseHPWindow(false)
end
