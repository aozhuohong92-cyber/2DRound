RecruitHeroController = RecruitHeroController or BaseClass(BaseController)

function RecruitHeroController.config(slot0)
	slot0.model = RecruitHeroModel.New(slot0)
end

function RecruitHeroController.getModel(slot0)
	return slot0.model
end

function RecruitHeroController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
			slot0 = RoleController:getInstance():getRoleVo()

			if slot0 and math.floor((GameNet:getInstance():getTime() - slot0.reg_time) / TimeTool.day2s()) <= 3 then
				if slot0.lev >= 10 then
					uv0:sender25100()
				end

				if uv0.role_recruit_event == nil then
					uv0.role_recruit_event = slot0:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
						if slot0 == "lev" and uv0.lev >= 10 then
							uv1:sender25100()

							if uv1.role_recruit_event and uv0 then
								uv0:UnBind(uv1.role_recruit_event)

								uv1.role_recruit_event = nil
							end
						end
					end)
				end
			end
		end)
	end
end

function RecruitHeroController.registerProtocals(slot0)
	slot0:RegisterProtocal(25100, "handle25100")
end

function RecruitHeroController.sender25100(slot0)
	slot0:SendProtocal(25100, {})
end

function RecruitHeroController.handle25100(slot0, slot1)
	slot0.model:setRecruitEndTime(slot1.end_time)
	slot0.model:setRecruitBaseData(slot1)
	slot0.model:setStatusRedPoint(slot1)
	GlobalEvent:getInstance():Fire(RecruitHeroEvent.RecruitHeroBaseInfo, slot1)
end

function RecruitHeroController.sender25101(slot0, slot1)
	slot0:SendProtocal(25101, {
		id = slot1
	})
end

function RecruitHeroController.handle25101(slot0, slot1)
	message(slot1.msg)
end

function RecruitHeroController.openRecruitHeroWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.recruit_hero_window then
			slot0.recruit_hero_window = RecruitHeroWindow.New()
		end

		slot0.recruit_hero_window:open()
	elseif slot0.recruit_hero_window then
		slot0.recruit_hero_window:close()

		slot0.recruit_hero_window = nil
	end
end

function RecruitHeroController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
