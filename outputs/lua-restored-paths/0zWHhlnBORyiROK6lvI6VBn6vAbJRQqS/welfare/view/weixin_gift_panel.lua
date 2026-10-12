WeiXinGiftPanel = class("WeiXinGiftPanel", function ()
	return ccui.Widget:create()
end)

function WeiXinGiftPanel.ctor(slot0)
	slot0.ctrl = WelfareController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.update_list = {}

	slot0:configUI()
end

function WeiXinGiftPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/weixin_gift_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -45)
	slot0:setAnchorPoint(0, 0)

	slot0.bg = slot0.root_wnd:getChildByName("bg")
	slot0.title = slot0.root_wnd:getChildByName("title")

	slot0:loadResources()
end

function WeiXinGiftPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_weixin"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/welfare", "txt_cn_welfare_weixin_title"),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.loadResListCompleted then
			uv0:loadResListCompleted()
		end
	end)
end

function WeiXinGiftPanel.loadResListCompleted(slot0)
	loadSpriteTexture(slot0.bg, PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_weixin"), LOADTEXT_TYPE)
	loadSpriteTexture(slot0.title, PathTool.getPlistImgForDownLoad("bigbg/welfare", "txt_cn_welfare_weixin_title"), LOADTEXT_TYPE)
	slot0:createList()
end

function WeiXinGiftPanel.createList(slot0)
	if Config.HolidayClientData.data_info[WelfareIcon.weixin_gift] and slot1.items then
		slot2 = {
			{
				140,
				564
			},
			{
				227,
				372
			},
			{
				140,
				186
			}
		}

		for slot6, slot7 in ipairs(slot1.items) do
			if slot7[1] and slot7[2] and Config.ItemData.data_get_data(slot8) and slot2[slot6] then
				createSprite(PathTool.getItemRes(slot10.icon), 0, 0, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE):setPosition(slot2[slot6][1], slot2[slot6][2])

				slot12 = createLabel(24, 1, cc.c4b(22, 50, 132, 255), slot2[slot6][1], slot2[slot6][2] - 70, slot10.name, slot0.root_wnd, nil, cc.p(0.5, 0.5))
			end
		end
	end
end

function WeiXinGiftPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function WeiXinGiftPanel.DeleteMe(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end
end
