RoleLoginCell = class("RoleLoginCell", function ()
	return ccui.Widget:create()
end)

function RoleLoginCell.ctor(slot0, slot1, slot2)
	slot0.data = slot1
	slot0.isEmpty = slot1.isEmpty
	slot3 = cc.size(397, 84)

	slot2:addChild(slot0)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(slot3)

	slot0.Bg = createImage(slot0, PathTool.getResFrame("login", "login2_1013", false, "login2"), 0, slot0:getContentSize().height / 2, cc.p(0, 0.5), true)

	slot0:setAnchorPoint(0, 1)
	slot0.Bg:setContentSize(slot3)
	slot0.Bg:setScale9Enabled(true)

	slot0.select_bg = createImage(slot0, PathTool.getResFrame("login", "login2_1014", false, "login2"), -3, slot0:getContentSize().height / 2, cc.p(0, 0.5), true)

	slot0.select_bg:setVisible(false)
	slot0.select_bg:setCapInsets(cc.rect(21, 20, 1, 1))
	slot0.select_bg:setContentSize(cc.size(slot3.width + 6, slot3.height + 10))
	slot0.select_bg:setScale9Enabled(true)

	slot0.roleBg = PlayerHead.new(PlayerHead.type.circle)

	slot0.roleBg:setPosition(42, 39)
	slot0.roleBg:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.roleBg)
	slot0.roleBg:setScale(0.7)

	slot0.isAddDelBtn = false

	if slot0.isEmpty then
		createImage(slot0.roleBg, PathTool.getResFrame("common", "common_90026"), 53.5, 50.5, cc.p(0.5, 0.5), true):setVisible(true)

		slot0.isCanDel = false
	else
		slot5:setVisible(false)

		slot4 = PathTool.getHeadIcon(({
			name = slot1.name,
			lev = slot1.lev,
			face_id = slot1.face_id or 1
		}).face_id)

		if slot0.roleBg then
			slot0.roleBg:setHeadRes(slot6.face_id)
		end

		slot8 = {}
		slot9 = slot6.name

		if string.find(slot6.name, "【") then
			slot9 = Split(Split(slot6.name, slot7)[2], "】")[2]
		end

		slot0.txt_name = createLabel(22, cc.c4b(255, 248, 202, 255), nil, 90, 42, slot9, slot0, 0, cc.p(0, 0))
		slot0.txt_lev = createLabel(22, cc.c4b(255, 248, 202, 255), nil, 90, 12, StringFormat("Lv.{0}", slot6.lev), slot0, 0, cc.p(0, 0))
	end
end

function RoleLoginCell.addCallBack(slot0, slot1)
	slot0.callBack = slot1

	slot0:setTouchEnabled(true)

	slot2 = 0
	slot3 = 0
	slot4 = 0
	slot5 = false

	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			slot2 = slot0:getTouchBeganPosition()
			uv0 = slot0:convertToNodeSpace(cc.p(slot2.x, slot2.y))
			uv1 = false
		elseif slot1 == ccui.TouchEventType.moved then
			slot2 = slot0:getTouchMovePosition()
			uv2 = slot0:convertToNodeSpace(cc.p(slot2.x, slot2.y))

			if uv0.x > 5 and uv2.x < 200 and uv2.x - uv0.x > 30 and not uv1 and uv3.isCanDel and not uv3.isAddDelBtn then
				uv1 = true
				uv3.isAddDelBtn = true
			end
		elseif slot1 == ccui.TouchEventType.ended then
			uv0 = slot0:getTouchBeganPosition()
			uv4 = slot0:getTouchEndPosition()

			uv3:clickHandler()
		end
	end)
end

function RoleLoginCell.clickHandler(slot0)
	if slot0.callBack then
		slot0:callBack()
	end

	slot0:showSelectBg(true)
end

function RoleLoginCell.showSelectBg(slot0, slot1)
	if slot0.select_bg then
		slot0.select_bg:setVisible(slot1)
	end
end

function RoleLoginCell.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
