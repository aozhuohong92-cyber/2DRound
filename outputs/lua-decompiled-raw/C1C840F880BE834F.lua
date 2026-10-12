BattleDramaFuncItem = class("BattleDramaFuncItem", function ()
	return ccui.Layout:create()
end)
BattleDramaFuncItem.WIDTH = 600
BattleDramaFuncItem.HEIGHT = 136

function BattleDramaFuncItem.ctor(slot0, slot1, slot2, slot3)
	slot0:retain()

	slot0.size = slot3 or cc.size(BattleDramaFuncItem.WIDTH, BattleDramaFuncItem.HEIGHT)

	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("battledrama/battle_drama_open_func_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("root")
	slot0.name_label = slot0.container:getChildByName("name_label")
	slot0.icon = slot0.container:getChildByName("icon")

	slot0.icon:setScale(0.5)

	slot0.desc_label = slot0.container:getChildByName("desc_label")
	slot0.desc_label_2 = slot0.container:getChildByName("desc_label_2")
	slot0.show_icon = slot0.container:getChildByName("show_icon")

	slot0.show_icon:setVisible(false)

	slot0.desc_label_3 = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(495, 95), nil, , 1000)

	slot0.desc_label_3:setVisible(false)
	slot0.container:addChild(slot0.desc_label_3)

	slot0.item_list = {}

	slot0:registerEvent()
end

function BattleDramaFuncItem.registerEvent(slot0)
end

function BattleDramaFuncItem.setData(slot0, slot1)
	if slot1 then
		if Config.DungeonData.data_drama_dungeon_info(slot1.limit_id) then
			slot0.desc_label_2:setString(TI18N("通关") .. slot2.name)
		end

		slot0.name_label:setString(slot1.unlock_name)

		slot4 = ""
		slot4 = (BattleDramaController:getInstance():getModel():getOffsetNum(slot1.limit_id) - BattleDramaController:getInstance():getModel():getCurDungeonMaxNum() <= 0 or string.format(TI18N("<div fontcolor=#289b14>%s</div><div fontcolor=#a95a1d>关后开启</div>"), slot3)) and ""

		if slot1.has_open == TRUE then
			slot0.show_icon:setVisible(true)
			slot0.desc_label_3:setVisible(false)
		else
			slot0.desc_label_3:setString(slot4)
			slot0.show_icon:setVisible(false)
			slot0.desc_label_3:setVisible(true)
		end

		if slot0.res_id_2 ~= PathTool.getPlistImgForDownLoad("bigbg/battledrama", slot1.unlock_icon) then
			slot0.res_id_2 = slot5
			slot0.item_load_1 = createResourcesLoad(slot0.res_id_2, ResourcesType.single, function ()
				if not tolua.isnull(uv0.icon) then
					loadSpriteTexture(uv0.icon, uv0.res_id_2, LOADTEXT_TYPE)
				end
			end, slot0.item_load_1)
		end

		slot0.desc_label:setString(slot1.desc)
	end
end

function BattleDramaFuncItem.updateItem(slot0, slot1)
	if not slot1 then
		return
	end
end

function BattleDramaFuncItem.DeleteMe(slot0)
	if slot0.item_load_1 then
		slot0.item_load_1:DeleteMe()

		slot0.item_load_1 = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
	slot0:release()
end
