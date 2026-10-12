RoleSceneNpc = RoleSceneNpc or BaseClass(RoleSceneObj)

function RoleSceneNpc.__init(slot0)
	slot0.model_scale = 0.8
end

function RoleSceneNpc.setVo(slot0, slot1)
	if slot1 == nil then
		return
	end

	RoleSceneObj.setVo(slot0, slot1)

	if slot0.vo.sub_type == RoleSceneVo.sub_unittype.npc then
		slot0:setModelScale(slot0.model_scale)
	end

	slot0:initSpine()

	if RolesceneController:getInstance():getIsInChiefWar() and slot0.vo and slot0.vo.unit_type == 201 then
		slot0:showEffectCircle()
	end

	slot0:registEvent()

	if slot0.vo ~= nil and slot0.unit_attr_change == nil then
		slot0.unit_attr_change = slot0.vo:Bind(RolesceneEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "status" then
				uv0:showBattleEffect(slot1 == 1 or false)
			end
		end)
	end
end

function RoleSceneNpc.registEvent(slot0)
	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:clickHandler()
		end
	end)
end

function RoleSceneNpc.update(slot0, slot1)
	RoleSceneObj.update(slot0, slot1)
	slot0:updateNamePos()
end

function RoleSceneNpc.clickHandler(slot0)
	GlobalEvent:getInstance():Fire(SceneEvent.SCENE_UNIT_CLICK, slot0.vo)
end

function RoleSceneNpc.showEffectCircle(slot0)
	if not slot0.effect_circle then
		slot0.effect_circle = createEffectSpine(Config.EffectData.data_effect_info[280] or "", cc.p(89, 0), cc.p(0.5, 0.5), true, "action")

		slot0.effect_container:addChild(slot0.effect_circle, -1)
	end
end

function RoleSceneNpc.showRedPoint(slot0, slot1)
	if slot0.name_container == nil or tolua.isnull(slot0.name_container) then
		return
	end

	if slot1 == false then
		if slot0.red then
			slot0.red:setVisible(false)
		end
	else
		if slot0.red == nil then
			slot0.red = createSprite(PathTool.getResFrame("common2", "common_tishi"), slot0.name_container:getContentSize().width - 3, slot0.name_container:getContentSize().height - 8, slot0.name_container, cc.p(0.5, 0.5))
		end

		slot0.red:setVisible(true)
	end
end

function RoleSceneNpc.__delete(slot0)
	if slot0.vo ~= nil and slot0.unit_attr_change ~= nil then
		slot0.vo:UnBind(slot0.unit_attr_change)

		slot0.unit_attr_change = nil
	end
end
