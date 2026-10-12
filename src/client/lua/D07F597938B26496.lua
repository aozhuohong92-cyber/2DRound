BaseRole = class("BaseRole", function ()
	return ccui.Widget:create()
end);
BaseRole.type = {
	role = 0,
	partner = 1,
	unit = 2,
	skin = 3
};

function BaseRole.ctor(slot0, slot1, slot2, slot3, slot4)
	slot0.type = slot1 or BaseRole.type.partner;
	slot0.is_load_finish = false;
	slot0.action_path = slot3 or PlayerAction.show;
	slot0.reversal = reversal;
	slot0.act_list = {};

	if slot2 == nil then
		print("===========> 创建UI模型失败,给了一个空的值");

		return
	end

	slot0.container = ccui.Widget:create();

	slot0.container:setScale((slot4 or {}).scale or 0.72);
	slot0:addChild(slot0.container);
	slot0.container:setCascadeOpacityEnabled(true);
	slot0:setCascadeOpacityEnabled(true);

	slot0.spine_list = {};

	if slot0.type == BaseRole.type.partner then
		slot7 = 0;
		slot8 = 0;
		slot9 = slot5.skin_id;

		if type(slot2) == "number" then
			if Config.PartnerData.data_partner_base[slot2] ~= nil then
				slot7 = slot10.bid;
				slot8 = slot10.init_star;
			end
		elseif type(slot2) == "table" then
			slot7 = slot2.bid or 0;
			slot8 = slot2.star or 0;
		end

		slot10 = getNorKey(slot7, slot8);

		slot0:setSpineScale(slot10);

		if Config.PartnerData.data_partner_star(slot10) ~= nil then
			slot12 = slot11.res_id;

			if slot9 ~= nil and slot9 ~= 0 and Config.PartnerSkinData.data_skin_info_fun(slot9) and slot14.res_id ~= nil and slot14.res_id ~= "" then
				slot12 = slot14.res_id;

				if slot11.show_effect ~= "" then
					slot13 = slot14.show_effect;
				end
			end

			table.insert(slot0.spine_list, {
				name = "body",
				zorder = 0,
				enable = true,
				res = slot12,
				suffix = slot0.action_path
			});

			if slot13 and slot13 ~= "" then
				table.insert(slot0.spine_list, {
					name = "effect",
					zorder = 1,
					enable = true,
					res = slot13,
					suffix = PlayerAction.action
				});
			end
		end
	elseif slot0.type == BaseRole.type.unit then
		if type(slot2) == "number" then
			if PathTool.specialBSModel(slot2) then
				slot0.action_path = PlayerAction.battle_stand;
			end

			if Config.UnitData.data_unit(slot2) ~= nil then
				slot9 = 1;

				if Config.BattleActData.data_get_model_show_scale[slot7.body_id] then
					slot9 = slot8 / 1000;
				end

				slot0.container:setScale(slot9 * slot6);
				table.insert(slot0.spine_list, {
					name = "body",
					zorder = 0,
					enable = true,
					res = slot7.body_id,
					suffix = slot0.action_path
				});
			end
		end
	elseif slot0.type == BaseRole.type.role then
		if type(slot2) == "number" and Config.LooksData.data_data[slot2] then
			table.insert(slot0.spine_list, {
				name = "body",
				zorder = 0,
				enable = true,
				res = slot7.ico_id,
				suffix = slot0.action_path
			});

			slot9 = getNorKey(slot7.partner_id, slot7.star);

			slot0:setSpineScale(slot9);

			if Config.PartnerData.data_partner_star(slot9) and slot10.show_effect ~= "" then
				if slot7.skin_id ~= 0 then
					if Config.PartnerSkinData.data_skin_info_fun(slot7.skin_id) and slot11.show_effect ~= "" then
						table.insert(slot0.spine_list, {
							name = "effect",
							zorder = 1,
							enable = true,
							res = slot11.show_effect,
							suffix = PlayerAction.action
						});
					end
				else
					table.insert(slot0.spine_list, {
						name = "effect",
						zorder = 1,
						enable = true,
						res = slot10.show_effect,
						suffix = PlayerAction.action
					});
				end
			end
		end
	elseif slot0.type == BaseRole.type.skin and type(slot2) == "number" then
		if Config.PartnerSkinData.data_skin_info_fun(slot2) and slot8.res_id ~= nil and slot8.res_id ~= "" then
			table.insert(slot0.spine_list, {
				name = "body",
				zorder = 0,
				enable = true,
				res = slot8.res_id,
				suffix = slot0.action_path
			});
		end

		if slot8 and slot8.show_effect ~= "" then
			table.insert(slot0.spine_list, {
				name = "effect",
				zorder = 1,
				enable = true,
				res = slot8.show_effect,
				suffix = PlayerAction.action
			});
		end
	end

	if slot0.spine_list == nil or next(slot0.spine_list) == nil then
		print("==============>  创建模型出错,没有指定资源");

		return
	end

	for slot10, slot11 in ipairs(slot0.spine_list) do
		if slot11.name == "body" then
			slot0.spine_name = slot11.res;

			break
		end
	end

	slot0.load_res_num = #slot0.spine_list;

	slot0:loadSpineTexture();
	slot0:showShadowUI(true);
end

function BaseRole.setSpineScale(slot0, slot1)
	slot0.container:setScale(scaleSpine(slot1));
end

function BaseRole.showShadowUI(slot0, slot1)
	if slot1 then
		if slot0.shadow == nil then
			slot0.shadow = createSprite(PathTool.getResFrame("common", "common_90095"), -50, -50, slot0.container, cc.p(0, 0), LOADTEXT_TYPE_PLIST, -2);
		else
			slot0.shadow:setVisible(true);
		end
	elseif slot0.shadow then
		slot0.shadow:setVisible(false);
	end
end

function BaseRole.loadSpineTexture(slot0)
	if tolua.isnull(slot0) then
		return
	end

	for slot5, slot6 in pairs(slot0.spine_list) do
		slot7, slot8, slot9, slot10 = PathTool.getSpineByName(slot6.res, slot6.suffix);

		if display.isPrefixExist(slot10) then
			(function ()
				if not uv0.load_res_num then
					return
				end

				uv0.load_res_num = uv0.load_res_num - 1;

				if uv0.load_res_num == 0 then
					table.insert(uv0.act_list, 1, {
						"addSpineByActionAct",
						{}
					});
					uv0:loadFinish();
				end
			end)();
		else
			cc.Director:getInstance():getTextureCache():addImageAsync(slot9, function ()
				uv0();
			end, getPixelFormat(slot6.res));
		end
	end
end

function BaseRole.setCascade(slot0, slot1)
	if slot0.container then
		slot0:setCascadeOpacityEnabled(slot1);
		slot0.container:setCascadeOpacityEnabled(slot1);
	end
end

function BaseRole.getContainer(slot0)
	return slot0.container
end

function BaseRole.getSpineBoxSize(slot0)
	for slot4, slot5 in ipairs(slot0.spine_list) do
		if slot5.name == "body" and slot5.spine then
			slot5.spine:update(0);

			return slot5.spine:getBoundingBox()
		end
	end

	return nil
end

function BaseRole.loadFinish(slot0)
	if tolua.isnull(slot0) then
		return
	end

	slot0.is_load_finish = true;

	for slot4, slot5 in pairs(slot0.act_list) do
		slot0[slot5[1]](slot0, unpack(slot5[2]));
	end

	slot0.act_list = {};

	if slot0.reversal ~= nil and slot0.reversal == true then
		slot0.container:setScaleX(-1);
	end
end

function BaseRole.addSpineByActionAct(slot0)
	if tolua.isnull(slot0) then
		return
	end

	slot1 = nil;

	for slot5, slot6 in pairs(slot0.spine_list) do
		if not tolua.isnull(slot6.spine) and slot6.name == "body" then
			slot1 = cc.p(slot6.spine:getPosition());

			slot6.spine:runAction(cc.RemoveSelf:create());

			slot6.spine = nil;
		end

		if slot6.spine == nil and slot6.name == "body" then
			slot6.spine = slot0:createSpine(slot6.res, slot6.suffix, slot6.name, slot6.zorder);
		end

		if slot6.name == "effect" and slot6.effect == nil then
			slot6.effect = slot0:createEffect(slot6.res, slot6.suffix, slot6.zorder);
		end

		if slot1 then
			if slot6.spine then
				slot6.spine:setPosition(slot1);
			end

			if slot6.effect then
				slot6.effect:setPosition(slot1);
			end
		end
	end
end

function BaseRole.createSpine(slot0, slot1, slot2, slot3, slot4)
	if tolua.isnull(slot0.container) then
		return
	end

	if slot1 == nil or slot1 == "" then
		slot1 = "H99999";
	end

	slot5 = createSpineByName(slot1, slot2);

	slot0.container:addChild(slot5, slot4 or 2);

	return slot5
end

function BaseRole.createEffect(slot0, slot1, slot2, slot3)
	if tolua.isnull(slot0.container) then
		return
	end

	if slot1 == nil or slot1 == "" then
		slot1 = "E99999";
	end

	createEffectSpine(slot1, cc.p(0, 300), cc.p(0.5, 0.5), true, slot2):setScale(1.5);
	slot0.container:addChild(slot4, slot3 or 2);

	slot6 = slot0.container:getScale();

	return slot4
end

function BaseRole.setAnimation(slot0, slot1, slot2, slot3)
	slot1 = slot1 or 0;
	slot2 = slot2 or slot0.action_path;

	if slot3 == nil then
		slot3 = true;
	end

	if slot0.is_load_finish then
		slot0:setAnimationAct(slot1, slot2, slot3);
	else
		table.insert(slot0.act_list, {
			"setAnimationAct",
			{
				slot1,
				slot2,
				slot3
			}
		});
	end
end

function BaseRole.loadFinishCallBack(slot0, slot1)
	slot0.finish_callback = slot1;

	if slot0.is_load_finish then
		slot0:finish_callback();
	else
		table.insert(slot0.act_list, {
			"finish_callback",
			{}
		});
	end
end

function BaseRole.setUnEnabled(slot0, slot1)
	if slot0.is_load_finish then
		slot0:setUnEnabledAct(slot1);
	else
		table.insert(slot0.act_list, {
			"setUnEnabledAct",
			{
				slot1
			}
		});
	end
end

function BaseRole.setUnEnabledAct(slot0, slot1)
	setChildUnEnabled(slot1, slot0);
end

function BaseRole.setAnimationAct(slot0, slot1, slot2, slot3)
	for slot7, slot8 in pairs(slot0.spine_list) do
		if slot8.enable and slot8.spine then
			slot8.spine:setToSetupPose();
			slot8.spine:setAnimation(slot1, slot2, slot3);
		end
	end
end

function BaseRole.registerSpineEventHandler(slot0, ...)
	if slot0.is_load_finish then
		slot0:registerSpineEventHandlerAct(...);
	else
		table.insert(slot0.act_list, {
			"registerSpineEventHandlerAct",
			{
				...
			}
		});
	end
end

function BaseRole.registerSpineEventHandlerAct(slot0, ...)
	if keyfind("name", "body", slot0.spine_list) then
		slot1.spine:registerSpineEventHandler(...);
	end
end

function BaseRole.DeleteMe(slot0)
	slot0:removeAllChildren();
	slot0:removeFromParent();
end
