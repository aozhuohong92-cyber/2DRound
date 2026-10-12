Config = Config or {}
Config.ArenaPeakChampionData = Config.ArenaPeakChampionData or {}
Config.ArenaPeakChampionData.data_const_length = 40
Config.ArenaPeakChampionData.data_const = {
	season_start = {
		desc = "赛季开始时间(周几，时，分)",
		val = {
			7,
			6,
			0
		}
	},
	open_time = {
		val = 14,
		desc = "开战持续时间（天）"
	},
	close_time = {
		val = 14,
		desc = "空闲持续时间（天）"
	},
	time_score_guess = {
		desc = "竞猜阶段",
		val = {
			6,
			0,
			0
		}
	},
	time_score_notice = {
		desc = "提示弹窗",
		val = {
			20,
			25,
			0
		}
	},
	time_score_fight = {
		desc = "战斗阶段",
		val = {
			20,
			30,
			0
		}
	},
	time_score_ready = {
		desc = "休整阶段",
		val = {
			20,
			40,
			0
		}
	},
	battle_members = {
		val = 100,
		desc = "预选赛参赛资格（跨服竞技场前n名）"
	},
	open_number_limit = {
		val = 256,
		desc = "晋级赛所需人数"
	},
	guess_number1 = {
		val = 666,
		desc = "预选赛每轮给予的筹码数量"
	},
	guess_number2 = {
		val = 666,
		desc = "淘汰赛（晋级赛+冠军赛）每轮给予的筹码数量"
	},
	guess_limit = {
		val = 2500,
		desc = "竞猜单次押注上限"
	},
	guess_times = {
		val = 2000,
		desc = "竞猜成功获得的竞猜币倍数"
	},
	guess_coin = {
		val = 666,
		desc = "竞猜币每次加减数量"
	},
	like_max = {
		val = 3,
		desc = "每日点赞最大次数"
	},
	like_reward = {
		desc = "点赞奖励",
		val = {
			{
				38,
				50
			}
		}
	},
	open_world_lev_limit = {
		val = 120,
		desc = "世界120级开启"
	},
	open_lev_limit = {
		val = 115,
		desc = "个人等级115级开启"
	},
	base_score = {
		val = 400,
		desc = "机器人初始积分"
	},
	score_arg = {
		val = 1000,
		desc = "机器人初始积分系数"
	},
	robot_win_score = {
		val = 100,
		desc = "机器人胜利积分系数"
	},
	base_power = {
		val = 100000,
		desc = "机器人基本战力（没有真实玩家时使用)"
	},
	base_lev = {
		val = 60,
		desc = "机器人基本等级（没有一个真实玩家时使用）"
	},
	face_list = {
		desc = "机器人头像信息",
		val = {
			10101,
			10201,
			10202,
			10301,
			10302,
			10303,
			10304,
			10305,
			10401,
			10402,
			10403,
			10404,
			10405,
			10501,
			10502,
			10503,
			10504,
			10505,
			10506,
			10507,
			10508,
			10509,
			20101,
			20201,
			20202,
			20301,
			20302,
			20303,
			20304,
			20305,
			20401,
			20402,
			20403,
			20404,
			20405,
			20501,
			20502,
			20503,
			20504,
			20505,
			20506,
			20507,
			20508,
			30101,
			30201,
			30202,
			30301,
			30302,
			30303,
			30304,
			30305,
			30401,
			30402,
			30403,
			30404,
			30405,
			30501,
			30502,
			30503,
			30504,
			30505,
			30506,
			30507,
			30508,
			40301,
			40401,
			40402,
			40403,
			40404,
			40501,
			40502,
			40503,
			40504,
			40505,
			40506,
			40507,
			50301,
			50401,
			50402,
			50403,
			50404,
			50501,
			50502,
			50503,
			50504,
			50505,
			50506,
			50507
		}
	},
	look_list = {
		desc = "机器人外观信息",
		val = {
			110401,
			110402,
			110403,
			110404,
			110405,
			120401,
			120402,
			120403,
			120404,
			120405,
			130401,
			130402,
			130403,
			130404,
			130405,
			140401,
			140402,
			140403,
			140404,
			150401,
			150402,
			150403,
			150404
		}
	},
	time_champion_ready = {
		val = 30,
		desc = "64强冠军赛准备时间"
	},
	time_champion_guess = {
		val = 90,
		desc = "64强冠军赛下注时间"
	},
	time_champion_fight = {
		val = 180,
		desc = "64强冠军赛战斗时间"
	},
	battel_score = {
		val = 80,
		desc = "循环赛积分加成系数"
	},
	battel_guess = {
		desc = "竞猜最小战力差抽取范围值",
		val = {
			0,
			50000
		}
	},
	guess_lev_limit = {
		val = 55,
		desc = "55级可参与竞猜玩法"
	},
	time_score_start = {
		desc = "赛季开始时间(周几，时，分)",
		val = {
			7,
			6,
			0
		}
	},
	time_champion_end = {
		desc = "赛季结束时间",
		val = {
			1,
			23,
			59,
			59
		}
	},
	like_redpoint_limit = {
		val = 55,
		desc = "红点显示等级"
	},
	hallowskin_reward_rank = {
		val = 3,
		desc = "能获得神器皮肤死神镰刀的前x名"
	},
	cd_score_start = {
		val = 2332800,
		desc = "赛季开启冷却时间（秒）"
	},
	guess_reward = {
		desc = "竞猜成功额外获得的奖励",
		val = {
			{
				1,
				100000
			}
		}
	},
	battle_members1 = {
		val = 128,
		desc = "先行服预选赛参赛资格（跨服竞技场前n名）"
	},
	division_members_normal = {
		val = 200,
		desc = "赛区划分人数标准"
	},
	division_members_limit = {
		val = 16,
		desc = "赛区人数下限"
	}
}

function Config.ArenaPeakChampionData.data_const_fun(slot0)
	slot1 = Config.ArenaPeakChampionData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaPeakChampionData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ArenaPeakChampionData.data_rank_reward_length = 12
Config.ArenaPeakChampionData.data_rank_reward = {
	{
		min = 1,
		max = 1,
		awards = {
			{
				72112,
				1
			},
			{
				50024,
				1
			},
			{
				38,
				30000
			},
			{
				1,
				3000000
			},
			{
				43,
				5000000
			},
			{
				99899,
				10000
			}
		}
	},
	{
		min = 2,
		max = 2,
		awards = {
			{
				72112,
				1
			},
			{
				50025,
				1
			},
			{
				38,
				24000
			},
			{
				1,
				2400000
			},
			{
				43,
				3000000
			},
			{
				99899,
				8000
			}
		}
	},
	{
		min = 3,
		max = 3,
		awards = {
			{
				72112,
				1
			},
			{
				50025,
				1
			},
			{
				38,
				20000
			},
			{
				1,
				2000000
			},
			{
				43,
				1000000
			},
			{
				99899,
				5000
			}
		}
	},
	{
		min = 4,
		max = 4,
		awards = {
			{
				50025,
				1
			},
			{
				38,
				17000
			},
			{
				1,
				1700000
			},
			{
				43,
				500000
			},
			{
				99899,
				3000
			}
		}
	},
	{
		min = 5,
		max = 8,
		awards = {
			{
				50025,
				1
			},
			{
				38,
				14000
			},
			{
				1,
				1400000
			},
			{
				43,
				300000
			},
			{
				99899,
				2000
			}
		}
	},
	{
		min = 9,
		max = 16,
		awards = {
			{
				50026,
				1
			},
			{
				38,
				12000
			},
			{
				1,
				1200000
			},
			{
				43,
				100000
			},
			{
				99899,
				1000
			}
		}
	},
	{
		min = 17,
		max = 32,
		awards = {
			{
				50026,
				1
			},
			{
				38,
				10000
			},
			{
				1,
				1000000
			},
			{
				43,
				50000
			},
			{
				99899,
				500
			}
		}
	},
	{
		min = 33,
		max = 64,
		awards = {
			{
				50026,
				1
			},
			{
				38,
				9000
			},
			{
				1,
				900000
			},
			{
				43,
				30000
			},
			{
				99899,
				300
			}
		}
	},
	{
		min = 65,
		max = 128,
		awards = {
			{
				50027,
				1
			},
			{
				38,
				8000
			},
			{
				1,
				800000
			},
			{
				43,
				10000
			},
			{
				99899,
				100
			}
		}
	},
	{
		min = 129,
		max = 256,
		awards = {
			{
				50027,
				1
			},
			{
				38,
				7000
			},
			{
				1,
				700000
			},
			{
				43,
				5000
			},
			{
				99899,
				50
			}
		}
	},
	{
		min = 257,
		max = 500,
		awards = {
			{
				38,
				6000
			},
			{
				1,
				600000
			}
		}
	},
	{
		min = 501,
		max = 1000,
		awards = {
			{
				38,
				5000
			},
			{
				1,
				500000
			}
		}
	}
}
Config.ArenaPeakChampionData.data_explain_length = 5
Config.ArenaPeakChampionData.data_explain = {
	{
		id = 1,
		title = "基础规则",
		desc = [[
1.巅峰冠军赛作为<div fontcolor=#d95014>赛区制</div>全服玩法，整个赛季共分为预选赛（6轮）、晋级赛（2轮）和冠军赛（6轮）三个阶段
2.赛季开启后，<div fontcolor=#d95014>每天仅进行一轮</div>比赛，每轮比赛分竞猜阶段（<div fontcolor=#d95014>06:00~20:30</div>）、对战阶段（<div fontcolor=#d95014>20:30~20:40</div>）和休整阶段（<div fontcolor=#d95014>20:40~06:00</div>）
3.赛季于<div fontcolor=#d95014>周日早上6点</div>开启，整个赛季共<div fontcolor=#d95014>持续两周</div>，每间隔四周开启新赛季
4.届时<div fontcolor=#d95014>跨服竞技场</div>上赛季前<div fontcolor=#d95014>100</div>名玩家<div fontcolor=#d95014>自动</div>进入预选赛
5.全服所有参与预选赛的选手，按一定人数标准划分出不同赛区，每个赛区至少需要<div fontcolor=#d95014>256</div>名玩家
6.若全服参赛人员不足<div fontcolor=#d95014>256</div>人，则本赛季无法开启
7.每轮比赛为<div fontcolor=#d95014>三局两胜</div>制，第一局由双方<div fontcolor=#d95014>第一队伍</div>进行较量，第二局则是<div fontcolor=#d95014>第二队伍</div>之间进行较量，先胜两局者本轮获胜
8.若本局双方队伍为空，则3支队伍总战力较高者取得本局胜利
9.玩家每次调整阵容，会在下次分配对手时生效]]
	},
	{
		id = 2,
		title = "预选赛规则",
		desc = [[
1.在<div fontcolor=#d95014>赛季开启时</div>即进入预选赛阶段，共6轮比赛，赛制为积分循环制
2.每轮比赛选手胜利将获得积分，失败不得分
3.最后的总积分等于预选赛每轮积分和加上由跨服竞技场排名决定的初始积分，排名越高，初始积分越高
4.预选赛总分排名前<div fontcolor=#d95014>256</div>名自动进入晋级赛阶段]]
	},
	{
		id = 3,
		title = "晋级赛规则",
		desc = "1.在<div fontcolor=#d95014>预选赛过后</div>即进入晋级赛阶段，共2轮比赛，赛制为淘汰制\n2.分十六组进行，每组决出4名胜者进入冠军赛64强"
	},
	{
		id = 4,
		title = "冠军赛规则",
		desc = "1.在<div fontcolor=#d95014>晋级赛过后</div>即进入冠军赛阶段，共6轮比赛，赛制为淘汰制\n2.分八组进行，每组的唯一胜者晋级8强（前3轮）\n3.由晋级的8强决出最终巅峰赛的总冠军（后3轮）"
	},
	{
		id = 5,
		title = "奖励发放",
		desc = "1.每轮比赛竞猜获得的竞猜币，将在战斗阶段结束后（每晚 20:40）结算为巅峰币，通过邮件发放\n2.巅峰币可用于商店兑换稀有道具"
	}
}

function Config.ArenaPeakChampionData.data_explain_fun(slot0)
	slot1 = Config.ArenaPeakChampionData.data_explain[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaPeakChampionData.data_explain[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ArenaPeakChampionData.data_explain_guess_length = 1
Config.ArenaPeakChampionData.data_explain_guess = {
	{
		id = 1,
		title = "竞猜规则",
		desc = [[
1.每轮系统将在本赛区抽取一场指定赛事发起竞猜，玩家可在竞猜阶段（<div fontcolor=#d95014>每日6:00~20:30</div>）进行下注
2.每轮竞猜阶段开始，玩家将拥有<div fontcolor=#d95014>666竞猜币</div>来进行下注，每轮只能<div fontcolor=#d95014>下注一次，无法更改</div>
3.竞猜结果将在对战阶段（<div fontcolor=#d95014>每日20:30~20:40</div>）结束时公布，届时猜中的玩家将以<div fontcolor=#d95014>最终赔率</div>赢得竞猜币
4.与此同时，赢得的竞猜币将在<div fontcolor=#d95014>当天即时结算</div>为巅峰币，和<div fontcolor=#d95014>额外金币奖励</div>一起以邮件形式发放
5.竞猜失败，下注的竞猜币将被<div fontcolor=#d95014>扣除且不返还</div>
6.若本轮未参与竞猜，则拥有的竞猜币将保留到下轮比赛，<div fontcolor=#d95014>不会结算为巅峰币</div>
7.每轮比赛为<div fontcolor=#d95014>三局两胜</div>制，按先后顺序双方第一队伍和第一队伍、第二队伍和第二队伍、第三队伍和第三队伍进行对抗
8.可在【对阵详情】中查看双方的队伍信息，系统将自动隐藏双方的第三队伍
9.若本局双方队伍为空，则3支队伍总战力较高者取得本局胜利]]
	}
}

function Config.ArenaPeakChampionData.data_explain_guess_fun(slot0)
	slot1 = Config.ArenaPeakChampionData.data_explain_guess[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaPeakChampionData.data_explain_guess[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
