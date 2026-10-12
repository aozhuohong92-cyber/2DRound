StrongerController = StrongerController or BaseClass(BaseController)

function StrongerController.config(slot0)
	slot0.model = StrongerModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.is_first = true

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.stronger, slot0.is_first)
end

function StrongerController.setIsFirst(slot0, slot1)
	slot0.is_first = slot1
end

function StrongerController.getIsFirst(slot0)
	return slot0.is_first
end

function StrongerController.getModel(slot0)
	return slot0.model
end

function StrongerController.registerEvents(slot0)
end

function StrongerController.registerProtocals(slot0)
	slot0:RegisterProtocal(11070, "on11070")
end

function StrongerController.sender11070(slot0, slot1)
	slot0:SendProtocal(11070, {
		partner_bid = slot1
	})
end

function StrongerController.on11070(slot0, slot1)
	slot0.model:setDataByBid(slot1)
	slot0.dispather:Fire(StrongerEvent.UPDATE_SCROE, slot1)
end

function StrongerController.openMainWin(slot0, slot1, slot2, slot3)
	if slot1 then
		if not slot0.main_win then
			slot0.main_win = StrongerMainWindow.New(slot3)
		end

		slot0.main_win:open(slot2)
	elseif slot0.main_win then
		slot0.main_win:close()

		slot0.main_win = nil
	end
end

function StrongerController.getStrongerRoot(slot0)
	if slot0.main_win then
		return slot0.main_win.root_wnd
	end
end

function StrongerController.clickCallBack(slot0, slot1)
	if slot1 then
		if slot1 == 200 then
			JumpController:getInstance():jumpViewByEvtData({
				19
			})
		elseif slot1 == 201 then
			JumpController:getInstance():jumpViewByEvtData({
				20
			})
		elseif slot1 == 202 then
			JumpController:getInstance():jumpViewByEvtData({
				32
			})
		elseif slot1 == 203 then
			if slot0.main_win and slot0.main_win.view_list[1] and slot0.main_win.view_list[1]:getCurHero() then
				HeroController:getInstance():openHeroMainInfoWindow(true, slot2:getData(), HeroController:getInstance():getModel():getAllHeroArray().items, {
					show_model_type = HeroConst.BagTab.eBagHero
				})
			end
		elseif slot1 == 204 then
			JumpController:getInstance():jumpViewByEvtData({
				24
			})
		elseif slot1 == 100 then
			JumpController:getInstance():jumpViewByEvtData({
				30
			})
		elseif slot1 == 120 then
			JumpController:getInstance():jumpViewByEvtData({
				1
			})
		elseif slot1 == 121 then
			JumpController:getInstance():jumpViewByEvtData({
				8,
				BackPackConst.item_tab_type.HERO
			})
		elseif slot1 == 122 then
			JumpController:getInstance():jumpViewByEvtData({
				15,
				MallConst.MallType.Recovery
			})
		elseif slot1 == 123 or slot1 == 162 then
			JumpController:getInstance():jumpViewByEvtData({
				35
			})
		elseif slot1 == 125 then
			-- Nothing
		elseif slot1 == 126 then
			JumpController:getInstance():jumpViewByEvtData({
				18
			})
		elseif slot1 == 128 then
			-- Nothing
		elseif slot1 == 129 then
			JumpController:getInstance():jumpViewByEvtData({
				41
			})
		elseif slot1 == 130 then
			JumpController:getInstance():jumpViewByEvtData({
				41,
				TaskConst.type.feat
			})
		elseif slot1 == 131 then
			JumpController:getInstance():jumpViewByEvtData({
				7
			})
		elseif slot1 == 132 then
			JumpController:getInstance():jumpViewByEvtData({
				11
			})
		elseif slot1 == 134 then
			JumpController:getInstance():jumpViewByEvtData({
				6
			})
		elseif slot1 == 135 then
			-- Nothing
		elseif slot1 == 138 then
			JumpController:getInstance():jumpViewByEvtData({
				15,
				MallConst.MallType.GodShop
			})
		elseif slot1 == 144 then
			JumpController:getInstance():jumpViewByEvtData({
				8,
				BackPackConst.item_tab_type.PROPS
			})
		elseif slot1 == 145 then
			if RoleController:getInstance():getRoleVo():isHasGuild() then
				JumpController:getInstance():jumpViewByEvtData({
					13
				})
			else
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.guild)
			end
		elseif slot1 == 146 then
			if RoleController:getInstance():getRoleVo():isHasGuild() then
				JumpController:getInstance():jumpViewByEvtData({
					31
				})
			else
				MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.guild)
			end
		elseif slot1 == 150 then
			JumpController:getInstance():jumpViewByEvtData({
				27
			})
		elseif slot1 == 151 then
			JumpController:getInstance():jumpViewByEvtData({
				25
			})
		elseif slot1 == 152 then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.dungeonstone)
		elseif slot1 == 153 then
			if Config.DailyplayData.data_exerciseactivity[2] == nil then
				message(TI18N("无尽试炼数据异常"))

				return
			end

			if MainuiController:getInstance():checkIsOpenByActivate(slot2.activate) == false then
				message(slot2.lock_desc)

				return
			end

			if Endless_trailController:getInstance():checkIsOpen() then
				JumpController:getInstance():jumpViewByEvtData({
					43
				})
			end
		elseif slot1 == 154 then
			JumpController:getInstance():jumpViewByEvtData({
				26
			})
		elseif slot1 == 155 then
			JumpController:getInstance():jumpViewByEvtData({
				23
			})
		elseif slot1 == 156 then
			JumpController:getInstance():jumpViewByEvtData({
				22
			})
		elseif slot1 == 157 then
			JumpController:getInstance():jumpViewByEvtData({
				5
			})
		elseif slot1 == 158 then
			JumpController:getInstance():jumpViewByEvtData({
				3
			})
		elseif slot1 == 159 then
			JumpController:getInstance():jumpViewByEvtData({
				36
			})
		elseif slot1 == 160 then
			JumpController:getInstance():jumpViewByEvtData({
				12
			})
		elseif slot1 == 402 then
			JumpController:getInstance():jumpViewByEvtData({
				4
			})
		elseif slot1 == 404 then
			JumpController:getInstance():jumpViewByEvtData({
				19
			})
		elseif slot1 == 405 then
			JumpController:getInstance():jumpViewByEvtData({
				40
			})
		elseif slot1 == 406 then
			JumpController:getInstance():jumpViewByEvtData({
				15,
				MallConst.MallType.GuessShop
			})
		elseif slot1 == 407 then
			JumpController:getInstance():jumpViewByEvtData({
				34
			})
		elseif slot1 == 408 or slot1 == 161 then
			JumpController:getInstance():jumpViewByEvtData({
				26,
				ForgeHouseConst.Tab_Index.Artifact
			})
		elseif slot1 == 409 then
			JumpController:getInstance():jumpViewByEvtData({
				20
			})
		elseif slot1 == 410 then
			JumpController:getInstance():jumpViewByEvtData({
				15,
				MallConst.MallType.EliteShop
			})
		elseif slot1 == 411 then
			JumpController:getInstance():jumpViewByEvtData({
				45,
				{
					MainuiConst.icon.festival,
					ActionRankCommonType.select_elite_summon
				}
			})
		elseif slot1 == 412 then
			VedioController:getInstance():openVedioMainWindow(true)
		elseif slot1 == 413 then
			VedioController:getInstance():openVedioMyselfWindow(true)
		elseif slot1 == 414 then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.elementWar)
		elseif slot1 == 415 then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.limitexercise)
		elseif slot1 == 416 then
			RoleController:getInstance():openRolePersonalSpacePanel(true, {
				index = RoleConst.Tab_type.eHonorWall
			})
		elseif slot1 == 417 then
			RoleController:getInstance():openRolePersonalSpacePanel(true, {
				index = RoleConst.Tab_type.eGrowthWay
			})
		elseif slot1 == 418 then
			HomeworldController:getInstance():requestOpenMyHomeworld()
		elseif slot1 == 419 then
			JumpController:getInstance():jumpViewByEvtData({
				14
			})
		elseif slot1 == 420 then
			JumpController:getInstance():jumpViewByEvtData({
				41,
				TaskConst.type.exp
			})
		elseif slot1 == 421 then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.hallows, nil, {
				0,
				HallowsConst.Tab_Index.refine
			})
		elseif slot1 == 422 then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.crosschampion)
		elseif slot1 == 423 then
			JumpController:getInstance():jumpViewByEvtData({
				60
			})
		elseif slot1 == 424 then
			JumpController:getInstance():jumpViewByEvtData({
				62
			})
		elseif slot1 == 425 then
			JumpController:getInstance():jumpViewByEvtData({
				48
			})
		elseif slot1 == 426 then
			JumpController:getInstance():jumpViewByEvtData({
				8,
				BackPackConst.item_tab_type.HOLYEQUIPMENT
			})
		elseif slot1 == 427 then
			JumpController:getInstance():jumpViewByEvtData({
				24,
				2
			})
		elseif slot1 == 428 then
			JumpController:getInstance():jumpViewByEvtData({
				28
			})
		elseif slot1 == 429 then
			JumpController:getInstance():jumpViewByEvtData({
				47
			})
		elseif slot1 == 430 then
			JumpController:getInstance():jumpViewByEvtData({
				65
			})
		elseif slot1 == 431 then
			JumpController:getInstance():jumpViewByEvtData({
				76
			})
		end
	end
end

function StrongerController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
