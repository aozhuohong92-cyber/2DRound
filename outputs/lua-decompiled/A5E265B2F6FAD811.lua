slot0 = table.remove
SysController = SysController or BaseClass(BaseController)

function SysController.config(slot0)
	slot0.dispather = GlobalEvent:getInstance()

	slot0:initAttrProtocalsFunList()
end

function SysController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if uv0.role_vo and uv0.role_assets_event == nil then
				uv0.role_assets_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "lev" or slot0 == "open_day" then
						uv0:requestAttrProtocals()
					elseif slot0 == "guild_lev" then
						-- Nothing
					end
				end)
			end
		end)
	end

	if slot0.world_lev_event == nil then
		slot0.world_lev_event = GlobalEvent:getInstance():Bind(RoleEvent.WORLD_LEV, function ()
			uv0:crossarenaProtocal()
		end)
	end

	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			if not RoleController:getInstance():checkRoleSetNameViewIsOpen() and not GuideController:getInstance():isInGuide() then
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene)
			end

			uv0:resetAttrProtocals()
			uv0:requestReLinkProtocals()
		end)
	end
end

function SysController.registerProtocals(slot0)
	slot0:RegisterProtocal(10394, "rgp_hander10394")
end

function SysController.requestLoginProtocals(slot0)
	slot0:registerEvents()

	for slot5, slot6 in ipairs({
		function ()
			uv0:SendProtocal(10500, {})
		end,
		function ()
			uv0:SendProtocal(10501, {})
		end,
		function ()
			uv0:SendProtocal(10502, {})
		end,
		function ()
			uv0:SendProtocal(10503, {})
		end,
		function ()
			uv0:SendProtocal(11025, {})
		end,
		function ()
			uv0:adventrueProtocal()
		end,
		function ()
			uv0:SendProtocal(10906, {})
		end,
		function ()
			uv0:SendProtocal(10380, {})
		end,
		function ()
			uv0:SendProtocal(10926, {})
		end,
		function ()
			uv0:SendProtocal(24600, {})
		end,
		function ()
			uv0:SendProtocal(16710, {})
		end,
		function ()
			uv0:SendProtocal(23200, {})
		end,
		function ()
			uv0:SendProtocal(25300, {})
		end,
		function ()
			uv0:SendProtocal(10325, {})
		end,
		function ()
			uv0:SendProtocal(13006, {})
		end,
		function ()
			uv0:SendProtocal(13008, {})
		end,
		function ()
			uv0:SendProtocal(13011, {})
		end,
		function ()
			uv0:SendProtocal(13017, {})
		end,
		function ()
			uv0:SendProtocal(10905, {})
		end,
		function ()
			uv0:SendProtocal(20700, {})
		end,
		function ()
			uv0:SendProtocal(10317, {})
		end,
		function ()
			uv0:SendProtocal(21100, {})
		end,
		function ()
			uv0:SendProtocal(13601, {})
		end,
		function ()
			uv0:SendProtocal(21021, {})
		end,
		function ()
			uv0:SendProtocal(16637, {})
		end,
		function ()
			uv0:SendProtocal(24700, {})
		end,
		function ()
			uv0:SendProtocal(21000, {})
		end,
		function ()
			uv0:SendProtocal(21030, {})
		end,
		function ()
			uv0:SendProtocal(21010, {})
		end,
		function ()
			uv0:SendProtocal(25000, {})
		end,
		function ()
			uv0:SendProtocal(23606, {})
		end,
		function ()
			uv0:SendProtocal(24204, {})
		end,
		function ()
			uv0:SendProtocal(24220, {})
		end,
		function ()
			uv0:SendProtocal(22200, {})
		end,
		function ()
			uv0:SendProtocal(24125, {})
		end,
		function ()
			uv0:SendProtocal(24128, {})
		end,
		function ()
			uv0:SendProtocal(11040, {})
		end,
		function ()
			uv0:SendProtocal(11037, {})
		end,
		function ()
			uv0:SendProtocal(11213, {
				type_list = {
					{
						type = PartnerConst.Fun_Form.Drama
					},
					{
						type = PartnerConst.Fun_Form.Arena
					}
				}
			})
		end,
		function ()
			uv0:SendProtocal(19807, {})
		end,
		function ()
			uv0:SendProtocal(19804, {})
		end,
		function ()
			uv0:SendProtocal(24312, {})
		end,
		function ()
			uv0:SendProtocal(10800, {})
		end,
		function ()
			uv0:SendProtocal(10950, {})
		end,
		function ()
			uv0:SendProtocal(23214, {})
		end,
		function ()
			uv0:SendProtocal(13604, {})
		end,
		function ()
			uv0:SendProtocal(13607, {})
		end,
		function ()
			uv0:SendProtocal(13030, {})
		end,
		function ()
			uv0:SendProtocal(10400, {})
		end,
		function ()
			uv0:SendProtocal(16400, {})
		end,
		function ()
			uv0:SendProtocal(20300, {})
		end,
		function ()
			uv0:SendProtocal(25810, {})
		end,
		function ()
			uv0:SendProtocal(19906, {})
		end,
		function ()
			uv0:SendProtocal(16707, {})
		end,
		function ()
			uv0:SendProtocal(16712, {})
		end,
		function ()
			uv0:SendProtocal(21006, {})
		end,
		function ()
			uv0:SendProtocal(24502, {})
		end,
		function ()
			uv0:SendProtocal(14100, {})
		end,
		function ()
			uv0:SendProtocal(16705, {})
		end,
		function ()
			uv0:SendProtocal(21008, {})
		end,
		function ()
			uv0:SendProtocal(16635, {})
		end,
		function ()
			uv0:SendProtocal(16633, {})
		end,
		function ()
			uv0:SendProtocal(11320, {})
		end,
		function ()
			uv0:SendProtocal(20706, {})
		end,
		function ()
			uv0:SendProtocal(16687, {
				bid = ActionRankCommonType.open_server
			})
		end,
		function ()
			uv0:SendProtocal(16687, {
				bid = ActionRankCommonType.high_value_gift
			})
		end,
		function ()
			uv0:SendProtocal(16687, {
				bid = ActionRankCommonType.mysterious_store
			})
		end,
		function ()
			uv0:SendProtocal(25200, {})
		end,
		function ()
			uv0:SendProtocal(25219, {})
		end,
		function ()
			uv0:SendProtocal(25303, {})
		end,
		function ()
			uv0:SendProtocal(24313, {})
		end,
		function ()
			uv0:SendProtocal(24314, {})
		end,
		function ()
			uv0:SendProtocal(25830, {
				num = 1,
				start = 0
			})
		end,
		function ()
			uv0:SendProtocal(25833, {})
		end,
		function ()
			uv0:homepetProtocal()
		end,
		function ()
			uv0:SendProtocal(25814, {})
		end,
		function ()
			uv0:SendProtocal(11056, {})
		end,
		function ()
			uv0:crossarenaProtocal()
		end,
		function ()
			uv0:guildRedBagProtocal()
		end,
		function ()
			uv0:arenateamProtocal()
		end,
		function ()
			uv0:arenaPeakProtocal()
		end,
		function ()
			uv0:endlessProtocal()
		end,
		function ()
			uv0:voyageProtocal()
		end,
		function ()
			uv0:homeworldProtocal()
		end,
		function ()
			uv0:crosschampionProtocal()
		end,
		function ()
			uv0:elfinProtocal()
		end,
		function ()
			uv0:SendProtocal(27100, {})
		end,
		function ()
			uv0:monopolyProtocal()
		end,
		function ()
			uv0:SendProtocal(27600, {})
		end,
		function ()
			uv0:SendProtocal(24952, {})
		end,
		function ()
			uv0:SendProtocal(27102, {})
		end,
		function ()
			uv0:planesProtocal()
		end,
		function ()
			uv0:SendProtocal(10930, {})
		end,
		function ()
			uv0:SendProtocal(28700, {})
		end,
		function ()
			uv0:SendProtocal(28703, {})
		end,
		function ()
			uv0:SendProtocal(25232, {})
		end,
		function ()
			uv0:SendProtocal(16651, {})
		end,
		function ()
			uv0:SendProtocal(10987, {})
		end,
		function ()
			uv0:SendProtocal(23235, {})
		end,
		function ()
			uv0:SendProtocal(10985, {})
		end
	}) do
		RenderMgr:getInstance():doNextFrame(slot6)
	end
end

function SysController.requestReLinkProtocals(slot0)
	for slot5, slot6 in ipairs({
		function ()
			uv0:SendProtocal(10500, {})
		end,
		function ()
			uv0:SendProtocal(10501, {})
		end,
		function ()
			uv0:SendProtocal(10503, {})
		end,
		function ()
			uv0:SendProtocal(13006, {})
		end,
		function ()
			uv0:SendProtocal(13008, {})
		end,
		function ()
			uv0:SendProtocal(13011, {})
		end,
		function ()
			uv0:SendProtocal(13017, {})
		end,
		function ()
			uv0:SendProtocal(10906, {})
		end,
		function ()
			uv0:SendProtocal(25000, {})
		end,
		function ()
			uv0:SendProtocal(24204, {})
		end,
		function ()
			uv0:SendProtocal(11025, {})
		end,
		function ()
			uv0:SendProtocal(21021, {})
		end,
		function ()
			uv0:SendProtocal(10926, {})
		end,
		function ()
			uv0:adventrueProtocal()
		end,
		function ()
			uv0:SendProtocal(11040, {})
		end,
		function ()
			uv0:SendProtocal(11037, {})
		end,
		function ()
			uv0:SendProtocal(11213, {
				type_list = {
					{
						type = PartnerConst.Fun_Form.Drama
					},
					{
						type = PartnerConst.Fun_Form.Arena
					}
				}
			})
		end,
		function ()
			uv0:SendProtocal(25300, {})
		end,
		function ()
			uv0:SendProtocal(24312, {})
		end,
		function ()
			uv0:SendProtocal(23200, {})
		end,
		function ()
			uv0:SendProtocal(10400, {})
		end,
		function ()
			uv0:SendProtocal(16400, {})
		end,
		function ()
			uv0:SendProtocal(20300, {})
		end,
		function ()
			uv0:SendProtocal(25810, {})
		end,
		function ()
			uv0:SendProtocal(19906, {})
		end,
		function ()
			uv0:SendProtocal(21006, {})
		end,
		function ()
			uv0:SendProtocal(16705, {})
		end,
		function ()
			uv0:SendProtocal(24700, {})
		end,
		function ()
			uv0:SendProtocal(10800, {})
		end,
		function ()
			uv0:SendProtocal(10950, {})
		end,
		function ()
			uv0:SendProtocal(26017, {})
		end,
		function ()
			uv0:homepetProtocal()
		end,
		function ()
			uv0:SendProtocal(25814, {})
		end,
		function ()
			uv0:SendProtocal(11056, {})
		end,
		function ()
			uv0:SendProtocal(11320, {})
		end,
		function ()
			uv0:SendProtocal(25833, {})
		end,
		function ()
			uv0:crossarenaProtocal()
		end,
		function ()
			uv0:guildRedBagProtocal()
		end,
		function ()
			uv0:arenateamProtocal()
		end,
		function ()
			uv0:arenaPeakProtocal()
		end,
		function ()
			uv0:arenaProtocal()
		end,
		function ()
			uv0:endlessProtocal()
		end,
		function ()
			uv0:voyageProtocal()
		end,
		function ()
			uv0:homeworldProtocal()
		end,
		function ()
			uv0:crosschampionProtocal()
		end,
		function ()
			uv0:elfinProtocal()
		end,
		function ()
			uv0:monopolyProtocal()
		end,
		function ()
			uv0:requestVisitior()
		end,
		function ()
			uv0:SendProtocal(27102, {})
		end,
		function ()
			uv0:SendProtocal(28700, {})
		end,
		function ()
			uv0:SendProtocal(13300, {})
		end,
		function ()
			uv0:SendProtocal(25232, {})
		end,
		function ()
			uv0:SendProtocal(10985, {})
		end
	}) do
		RenderMgr:getInstance():doNextFrame(slot6)
	end
end

function SysController.requestAttrProtocals(slot0)
	if not slot0.attr_fun_list then
		return
	end

	for slot4, slot5 in pairs(slot0.attr_fun_list) do
		slot6 = slot5.fun

		if not slot5.req_flag and slot6 then
			RenderMgr:getInstance():doNextFrame(slot6)
		end
	end
end

function SysController.initAttrProtocalsFunList(slot0, slot1)
	if slot1 or not slot0.attr_fun_list then
		slot0.attr_fun_list = {
			{
				req_flag = false,
				fun = function ()
					uv0:adventrueProtocal()
				end
			},
			{
				req_flag = false,
				fun = function ()
					uv0:arenaProtocal()
				end
			},
			{
				req_flag = false,
				fun = function ()
					uv0:endlessProtocal()
				end
			},
			{
				req_flag = false,
				fun = function ()
					uv0:voyageProtocal()
				end
			},
			{
				req_flag = false,
				fun = function ()
					uv0:crossarenaProtocal()
				end
			},
			{
				req_flag = false,
				fun = function ()
					uv0:homeworldProtocal()
				end
			},
			{
				req_flag = false,
				fun = function ()
					uv0:crosschampionProtocal()
				end
			},
			{
				req_flag = false,
				fun = function ()
					uv0:elfinProtocal()
				end
			},
			[10] = {
				req_flag = false,
				fun = function ()
					uv0:arenateamProtocal()
				end
			},
			[11] = {
				req_flag = false,
				fun = function ()
					uv0:arenaPeakProtocal()
				end
			},
			[12] = {
				req_flag = false,
				fun = function ()
					uv0:monopolyProtocal()
				end
			},
			[13] = {
				req_flag = false,
				fun = function ()
					uv0:planesProtocal()
				end
			}
		}
	end
end

function SysController.checkProtocalIsCanRequest(slot0, slot1)
	if slot0.attr_fun_list and slot0.attr_fun_list[slot1] and not slot0.attr_fun_list[slot1].req_flag then
		return true
	end

	return false
end

function SysController.resetAttrProtocals(slot0)
	slot0:initAttrProtocalsFunList(true)
end

function SysController.adventrueProtocal(slot0)
	if forces == nil then
		slot1 = AdventureActivityController:getInstance():isOpenActivity(AdventureActivityConst.Ground_Type.adventure)
	end

	if slot1 == false then
		return
	end

	if not slot0:checkProtocalIsCanRequest(1) then
		return
	end

	slot0:SendProtocal(20600, {})
	slot0:SendProtocal(20601, {})
	slot0:SendProtocal(20604, {})
	slot0:SendProtocal(20634, {})

	if slot0.attr_fun_list[1] then
		slot0.attr_fun_list[1].req_flag = true
	end
end

function SysController.arenaProtocal(slot0)
	if not Config.ArenaData.data_const.limit_lev or not slot0.role_vo or slot0.role_vo.lev < slot1.val then
		return
	end

	if not slot0:checkProtocalIsCanRequest(2) then
		return
	end

	slot0:SendProtocal(20208, {})
	slot0:SendProtocal(20200, {})
	slot0:SendProtocal(20250, {})
	slot0:SendProtocal(20223, {})

	if slot0.attr_fun_list[2] then
		slot0.attr_fun_list[2].req_flag = true
	end
end

function SysController.endlessProtocal(slot0)
	if Config.EndlessData.data_const.open_lev == nil then
		return false
	end

	if not MainuiController:getInstance():checkIsOpenByActivate(slot1.val) then
		return
	end

	if not slot0:checkProtocalIsCanRequest(3) then
		return
	end

	slot0:SendProtocal(23900, {})
	slot0:SendProtocal(23912, {})
	slot0:SendProtocal(23906, {})

	if slot0.attr_fun_list[3] then
		slot0.attr_fun_list[3].req_flag = true
	end
end

function SysController.voyageProtocal(slot0)
	if not Config.ShippingData.data_const.guild_lev or not slot0.role_vo or slot0.role_vo.lev < slot1.val then
		return
	end

	if not slot0:checkProtocalIsCanRequest(4) then
		return
	end

	slot0:SendProtocal(23800, {})
	slot0:SendProtocal(23805, {})

	if slot0.attr_fun_list[4] then
		slot0.attr_fun_list[4].req_flag = true
	end
end

function SysController.guildRedBagProtocal(slot0)
	if slot0.role_vo and slot0.role_vo.gid ~= 0 and slot0.role_vo.gsrv_id ~= "" then
		slot0:SendProtocal(13534, {})
	end
end

function SysController.homepetProtocal(slot0)
	slot0:SendProtocal(26100, {})
	slot0:SendProtocal(26105, {})
	slot0:SendProtocal(26110, {})
	slot0:SendProtocal(26111, {
		type = 34
	})
	slot0:SendProtocal(26111, {
		type = 35
	})
end

function SysController.crossarenaProtocal(slot0)
	if not slot0:checkProtocalIsCanRequest(5) then
		return
	end

	if CrossarenaController:getInstance():getModel():getCrossarenaIsOpen(true) then
		slot0:SendProtocal(25610, {})
		slot0:SendProtocal(25607, {})
		slot0:SendProtocal(25618, {})
		slot0:SendProtocal(25605, {
			type = 2
		})

		if slot0.attr_fun_list[5] then
			slot0.attr_fun_list[5].req_flag = true
		end
	end
end

function SysController.homeworldProtocal(slot0)
	if not HomeworldController:getInstance():getModel():checkHomeworldIsOpen(true) then
		return
	end

	if not slot0:checkProtocalIsCanRequest(6) then
		return
	end

	slot0:SendProtocal(26017, {})
	slot0:SendProtocal(26018, {})
	slot0:SendProtocal(26013, {})

	if slot0.attr_fun_list[6] then
		slot0.attr_fun_list[6].req_flag = true
	end
end

function SysController.crosschampionProtocal(slot0)
	if not slot0:checkProtocalIsCanRequest(7) then
		return
	end

	if not CrosschampionController:getInstance():getModel():checkCrossChampionIsOpen(true) then
		return
	end

	slot0:SendProtocal(26200, {})
	slot0:SendProtocal(26213, {})

	if slot0.attr_fun_list[7] then
		slot0.attr_fun_list[7].req_flag = true
	end
end

function SysController.elfinProtocal(slot0)
	if not slot0:checkProtocalIsCanRequest(8) then
		return
	end

	if not ElfinController:getInstance():getModel():checkElfinIsOpen(true) then
		return
	end

	slot0:SendProtocal(26500, {})
	slot0:SendProtocal(26510, {})
	slot0:SendProtocal(26550, {})

	if slot0.attr_fun_list[8] then
		slot0.attr_fun_list[8].req_flag = true
	end
end

function SysController.expeditProtocal(slot0)
end

function SysController.arenateamProtocal(slot0)
	if not slot0:checkProtocalIsCanRequest(10) then
		return
	end

	if ArenateamController:getInstance() and slot1.checkArenaTeamIsOpen then
		if slot1:checkArenaTeamIsOpen(true) == false then
			return
		end

		slot0:SendProtocal(27220, {})
		slot0:SendProtocal(27215, {})
		slot0:SendProtocal(11211, {
			type = PartnerConst.Fun_Form.ArenaTeam
		})

		if slot0.attr_fun_list[10] then
			slot0.attr_fun_list[10].req_flag = true
		end
	end
end

function SysController.arenaPeakProtocal(slot0)
	if not slot0:checkProtocalIsCanRequest(11) then
		return
	end

	if ArenapeakchampionController:getInstance():getModel() and slot2.checkPeakChampionIsOpen then
		if slot2:checkPeakChampionIsOpen(true) == false then
			return
		end

		slot0:SendProtocal(27700, {})
		slot0:SendProtocal(27703, {})
		slot0:SendProtocal(27730, {})
		slot0:SendProtocal(27726, {})
		slot0:SendProtocal(27714, {
			end_num = 1,
			start_num = 1,
			zone_id = 0
		})

		if slot0.attr_fun_list[11] then
			slot0.attr_fun_list[11].req_flag = true
		end
	end
end

function SysController.monopolyProtocal(slot0)
	if not slot0:checkProtocalIsCanRequest(12) then
		return
	end

	if not MonopolyController:getInstance():getModel():checkMonopolyIsOpen(true) then
		return
	end

	if slot0.attr_fun_list[12] then
		slot0.attr_fun_list[12].req_flag = true
	end
end

function SysController.planesProtocal(slot0)
	if not slot0:checkProtocalIsCanRequest(13) then
		return
	end

	if not PlanesafkController:getInstance():checkPlanesIsOpen(true) then
		return
	end

	slot0:SendProtocal(28603, {})
	slot0:SendProtocal(28616, {})

	if slot0.attr_fun_list[13] then
		slot0.attr_fun_list[13].req_flag = true
	end
end

function SysController.requestVisitior(slot0)
	if NEED_CHECK_VISITIOR_STATUS then
		slot0:SendProtocal(10394, {})
	end
end

function SysController.rgp_hander10394(slot0, slot1)
	if NEED_CHECK_VISITIOR_STATUS then
		if OPEN_SDK_VISITIOR_WINDOW == true then
			NEED_OPEN_OPEN_SDK_VISITIOR_WINDOW = true
		else
			callFunc("touristMode", "60")
		end
	end
end

function SysController.__delete(slot0)
end
