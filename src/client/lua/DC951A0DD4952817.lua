Config = Config or {}
Config.AttackCityData = Config.AttackCityData or {}
Config.AttackCityData.data_position_length = 12
Config.AttackCityData.data_position = {
	{
		id = 1,
		name = "大陆霸主",
		addition_desc = "1、行军速度提升<div fontcolor=289b14>15%</div>\n2、每日获得<div fontcolor=289b14>500</div>世界币",
		r_id = 1,
		num = 1
	},
	{
		id = 2,
		name = "王后",
		addition_desc = "1、行军速度提升<div fontcolor=289b14>10%</div>\n2、每日获得<div fontcolor=289b14>400</div>世界币",
		r_id = 2,
		num = 1
	},
	{
		id = 3,
		name = "公爵",
		addition_desc = "1、行军速度提升<div fontcolor=289b14>8%</div>\n2、每日获得<div fontcolor=289b14>350</div>世界币",
		r_id = 3,
		num = 2
	},
	{
		id = 4,
		name = "侯爵",
		addition_desc = "1、行军速度提升<div fontcolor=289b14>7%</div>\n2、每日获得<div fontcolor=289b14>300</div>世界币",
		r_id = 4,
		num = 3
	},
	{
		id = 5,
		name = "伯爵",
		addition_desc = "1、行军速度提升<div fontcolor=289b14>6%</div>\n2、每日获得<div fontcolor=289b14>250</div>世界币",
		r_id = 5,
		num = 5
	},
	{
		id = 6,
		name = "子爵",
		addition_desc = "1、行军速度提升<div fontcolor=289b14>5%</div>\n2、每日获得<div fontcolor=289b14>200</div>世界币",
		r_id = 6,
		num = 10
	},
	[11] = {
		id = 11,
		name = "国王",
		addition_desc = "1、行军速度提升<div fontcolor=289b14>15%</div>\n2、每日获得<div fontcolor=289b14>400</div>世界币",
		r_id = 1,
		num = 1
	},
	[12] = {
		id = 12,
		name = "王后",
		addition_desc = "1、行军速度提升<div fontcolor=289b14>10%</div>\n2、每日获得<div fontcolor=289b14>300</div>世界币",
		r_id = 2,
		num = 1
	},
	[13] = {
		id = 13,
		name = "公爵",
		addition_desc = "1、行军速度提升<div fontcolor=289b14>8%</div>\n2、每日获得<div fontcolor=289b14>250</div>世界币",
		r_id = 3,
		num = 2
	},
	[14] = {
		id = 14,
		name = "侯爵",
		addition_desc = "1、行军速度提升<div fontcolor=289b14>7%</div>\n2、每日获得<div fontcolor=289b14>200</div>世界币",
		r_id = 4,
		num = 3
	},
	[15] = {
		id = 15,
		name = "伯爵",
		addition_desc = "1、行军速度提升<div fontcolor=289b14>6%</div>\n2、每日获得<div fontcolor=289b14>150</div>世界币",
		r_id = 5,
		num = 5
	},
	[16] = {
		id = 16,
		name = "子爵",
		addition_desc = "1、行军速度提升<div fontcolor=289b14>5%</div>\n2、每日获得<div fontcolor=289b14>100</div>世界币",
		r_id = 6,
		num = 10
	}
}
Config.AttackCityData.data_const_length = 13
Config.AttackCityData.data_const = {
	guild_max_city = {
		val = 2,
		key = "guild_max_city",
		desc = "每个联盟最多占领城池数量"
	},
	open_week_days = {
		key = "open_week_days",
		desc = "周几开启",
		val = {
			7
		}
	},
	start_time = {
		key = "start_time",
		desc = "开始时间{时,分,秒}",
		val = {
			19,
			0,
			0
		}
	},
	pre_time = {
		val = 300,
		key = "pre_time",
		desc = "准备时间(秒)"
	},
	match_time = {
		val = 2700,
		key = "match_time",
		desc = "正式时间(秒）"
	},
	def_protect_time = {
		val = 120,
		key = "def_protect_time",
		desc = "驻防保护时间（秒）"
	},
	min_score = {
		val = 20,
		key = "min_score",
		desc = "奖励最小需求积分"
	},
	post_reward_time = {
		key = "post_reward_time",
		desc = "职位每日奖励时间",
		val = {
			5,
			0,
			0
		}
	},
	open_time_notice = {
		val = 0,
		key = "open_time_notice",
		desc = "攻城战每周日19:05-19:50开启"
	},
	reward_times = {
		val = 10,
		key = "reward_times",
		desc = "攻打据点最多获得几次奖励"
	},
	min_guild_score = {
		val = 200,
		key = "min_guild_score",
		desc = "占领城池所需最低积分"
	},
	atck_order_1 = {
		key = "atck_order_1",
		desc = "普通大陆攻城顺序",
		val = {
			50,
			51
		}
	},
	atck_order_2 = {
		key = "atck_order_2",
		desc = "神界大陆攻城顺序",
		val = {
			3,
			4
		}
	}
}
Config.AttackCityData.data_explain_length = 4
Config.AttackCityData.data_explain = {
	{
		id = 1,
		title = "攻城规则",
		desc = [[
1、攻城战每周日晚上<div fontcolor=289b14>19:00-19:50</div>开启，<div fontcolor=289b14>35</div>级以上拥有联盟的玩家可参与
2、攻城需先将个人营地迁营至目标城池<div fontcolor=289b14>攻城范围</div>之内，进攻无需行军
3、每个城池有若干个防守驻点，初始由城池守军守卫，玩家可选择任意据点进攻，战胜守卫后即可布置自己的防守队伍占领该据点，每个驻点需要布置<div fontcolor=289b14>5人队</div>
4、同联盟的成员占领的据点不可攻打，不同联盟成员之间可互相攻打
 5、已经用于布置防守的英雄无法用于防守其它据点，也无法用于进攻]]
	},
	{
		id = 2,
		title = "胜利规则",
		desc = [[
1、每攻下一个据点获得<div fontcolor=289b14>10</div>点攻城积分，每占据一个据点1分钟获得<div fontcolor=289b14>5</div>点积分
 2、系统将对每个城池的攻城玩家个人积分和联盟成员总积分进行排名,积分相同的并列名次
3、活动结束后，该城池中联盟总积分第一的联盟将占领该城池(低于200分不会占领），若有多个并列第一，则占据据点数多的联盟占领
 4、每个联盟最多同时占领<div fontcolor=289b14>2</div>座城池，若同时进攻多座城池，则优先占据高级城池且总积分高的城池优先占领
5、占领城池的联盟盟主将成为该城城主，获得城主头像框，同时全体联盟在占城期间在该大陆将获得buff加成，获得打怪收益加成和属性加成]]
	},
	{
		id = 3,
		title = "攻城阶段",
		desc = [[
1、攻城战共分为<div fontcolor=289b14>4</div>个阶段，每个阶段需要达成一定条件才会进入下一阶段
 2、第1阶段只能攻打本大陆的<div fontcolor=289b14>2级城池</div>，每周只开放一座城池的攻打，若攻城战结束后大陆<div fontcolor=289b14>2</div>座普通城池都产生了城主，则下周将进入第二阶段，否则保留在第1阶段
3、第2阶段可额外攻打本大陆的中心主城，当构成大世界的大陆全部诞生国王后，下周将进入第三阶段，否则保留在第二阶段
4、第3阶段开启后，三块大陆的玩家将可以进入神界，同时攻城战可以攻打神界<div fontcolor=289b14>普通城池</div>，每周只开放一座城池的攻打，若<div fontcolor=289b14>2</div>座普通都被占领，则进入第4阶段
5、第4阶段可攻打神界主城，占领神界主城的盟主将成为世界霸主，同时预示着世界一统，大世界将在<div fontcolor=289b14>下周日过24点</div>后重新开启新的轮回,城池和联盟要塞都将初始化]]
	},
	{
		id = 4,
		title = "攻城奖励",
		desc = "1、每个联盟首次占领某座城池时，全联盟成员都会获得一份攻城大礼包，可开出<div fontcolor=289b14>传说符石</div>等稀有道具\n2、每次攻城战结算时将根据个人积分排名，发放对应的排名奖励\n3、占领城池的联盟，其成员在本大陆将获得打怪收益加成和英雄属性加成，占领多座城池buff效果可叠加"
	}
}
Config.AttackCityData.data_step_explain_length = 4
Config.AttackCityData.data_step_explain = {
	{
		step_name = "城主选拔",
		step_condition = "",
		step_target = "可攻打本大陆2座普通城池",
		desc = [[
1、第一阶段可攻打本大陆普通城池，占据城池的联盟盟主将成为该城城主
2、每个联盟最多可占据2座城池，联盟首次占领某座城池时，全体联盟成员都可获得一份占城大礼包
3、每次攻城战结束后都会根据个人积分排名发放排名奖励，奖励大量贝里和友好值。若个人同时进攻多座城池，则以排名最高的为准发放个人排名奖励
4、第一阶段攻城结束后，若2座普通城池都产生了城主，则下周进入第二阶段攻城，可攻打本大陆的主城，争夺国王之位。]],
		step_desc = "首占普通城池的联盟，全体联盟成员可获得",
		step = 1,
		items = {
			{
				31110,
				1
			}
		}
	},
	{
		step_name = "国王之争",
		step_condition = "开启条件：本大陆诞生2位城主",
		step_target = "可攻打本大陆中心主城",
		desc = [[
1、第二阶段可额外攻打本大陆的中心主城，占据主城的联盟盟主将成为本大陆国王
2、国王享有职位任命的特权，可任命本联盟成员爵位官职，每个成员最多只能拥有一个爵位或王后官职
3、官职将会获得一定buff加成和福利，官职福利每天5:00通过邮件发放
4、第二阶段攻城结束后，若三个服务器的大陆都产出了国王，则下周进入第三阶段，开启通往大陆互通的通道，可进军神界。]],
		step_desc = "首占大陆主城的联盟，全体联盟成员可获得",
		step = 2,
		items = {
			{
				31111,
				1
			}
		}
	},
	{
		step_name = "进军神界",
		step_condition = "开启条件：所有普通大陆都诞生国王",
		step_target = "可前往神界大陆，攻打神界2座普通城池",
		desc = "1、第三阶段可额外攻打神界2座普通城池,每座城池各会诞生一个城主\n2、第三阶段攻城结束后，若神界2座普通城池都诞生了城主，则下周将进入第四阶段，争夺神界主城",
		step_desc = "首占神界普通城池的联盟，全体联盟成员可获得",
		step = 3,
		items = {
			{
				31112,
				1
			}
		}
	},
	{
		step_name = "神界争霸",
		step_condition = "开启条件：神界诞生2位城主",
		step_target = "可攻打神界主城,角逐神界霸主,世界一统",
		desc = "1、第四阶段可额外攻打神界主城，占领神界主城的联盟盟主将成为神界霸主，享受国王全部福利，同时拥有独一无二的霸主头像框\n2、神界霸主产生后，大世界将会继续维持一周，至下周日过24点后大世界重置，重新开启轮回\n3、若自多个服务器构成大世界后，连续7周没有产生神界霸主，则大世界也将重置，开启新的大世界。",
		step_desc = "首占神界主城的联盟，全体联盟成员可获得",
		step = 4,
		items = {
			{
				31113,
				1
			}
		}
	}
}
Config.AttackCityData.data_role_awards_length = 11
Config.AttackCityData.data_role_awards = {
	{
		min = 1,
		max = 1,
		items = {
			{
				1,
				500000
			},
			{
				13,
				800
			}
		}
	},
	{
		min = 2,
		max = 2,
		items = {
			{
				1,
				400000
			},
			{
				13,
				600
			}
		}
	},
	{
		min = 3,
		max = 3,
		items = {
			{
				1,
				350000
			},
			{
				13,
				500
			}
		}
	},
	{
		min = 4,
		max = 10,
		items = {
			{
				1,
				300000
			},
			{
				13,
				400
			}
		}
	},
	{
		min = 11,
		max = 20,
		items = {
			{
				1,
				250000
			},
			{
				13,
				350
			}
		}
	},
	{
		min = 21,
		max = 30,
		items = {
			{
				1,
				200000
			},
			{
				13,
				300
			}
		}
	},
	{
		min = 31,
		max = 50,
		items = {
			{
				1,
				150000
			},
			{
				13,
				250
			}
		}
	},
	{
		min = 51,
		max = 100,
		items = {
			{
				1,
				100000
			},
			{
				13,
				200
			}
		}
	},
	{
		min = 101,
		max = 200,
		items = {
			{
				1,
				50000
			},
			{
				13,
				150
			}
		}
	},
	{
		min = 201,
		max = 500,
		items = {
			{
				1,
				30000
			},
			{
				13,
				100
			}
		}
	},
	{
		min = 501,
		max = 999999,
		items = {
			{
				1,
				10000
			},
			{
				13,
				50
			}
		}
	}
}
Config.AttackCityData.data_city_length = 6
Config.AttackCityData.data_city = {
	{
		score_val = 5,
		name = "神殿",
		desc = "攻城玩法第4阶段开启后，占领神殿的联盟盟主将成为世界霸主，同时享有国王全部权利和福利。",
		alias_name = "一级主城",
		score_time = 60,
		id = 1,
		open_step = 4,
		win_score = 10,
		base_items = {
			{
				1,
				5000
			},
			{
				18,
				30
			}
		},
		guild_items = {
			{
				31113,
				1
			}
		}
	},
	{
		score_val = 5,
		name = "王城",
		desc = "攻城玩法第2阶段开启后，占领主城的联盟盟主将成为国王，任职期间享有国王特殊权利和福利。",
		alias_name = "二级主城",
		score_time = 60,
		id = 2,
		open_step = 2,
		win_score = 10,
		base_items = {
			{
				1,
				5000
			},
			{
				18,
				30
			}
		},
		guild_items = {
			{
				31111,
				1
			}
		}
	},
	{
		score_val = 5,
		name = "耶基斯城",
		desc = "攻城玩法第3阶段开启后，占领城池的联盟盟主将成为城主，享有专属城主聊天头像框。",
		alias_name = "普通城池",
		score_time = 60,
		id = 3,
		open_step = 3,
		win_score = 10,
		base_items = {
			{
				1,
				5000
			},
			{
				18,
				30
			}
		},
		guild_items = {
			{
				31112,
				1
			}
		}
	},
	{
		score_val = 5,
		name = "泽卡赖亚城",
		desc = "攻城玩法第3阶段开启后，占领城池的联盟盟主将成为城主，享有专属城主聊天头像框。",
		alias_name = "普通城池",
		score_time = 60,
		id = 4,
		open_step = 3,
		win_score = 10,
		base_items = {
			{
				1,
				5000
			},
			{
				18,
				30
			}
		},
		guild_items = {
			{
				31112,
				2
			}
		}
	},
	[50] = {
		score_val = 5,
		name = "东城",
		desc = "攻城玩法开启后，占领城池的联盟盟主将成为城主，享有专属城主聊天头像框。",
		alias_name = "普通城池",
		score_time = 60,
		id = 50,
		open_step = 1,
		win_score = 10,
		base_items = {
			{
				1,
				5000
			},
			{
				18,
				30
			}
		},
		guild_items = {
			{
				31110,
				1
			}
		}
	},
	[51] = {
		score_val = 5,
		name = "西城",
		desc = "攻城玩法开启后，占领城池的联盟盟主将成为城主，享有专属城主聊天头像框。",
		alias_name = "普通城池",
		score_time = 60,
		id = 51,
		open_step = 1,
		win_score = 10,
		base_items = {
			{
				1,
				5000
			},
			{
				18,
				30
			}
		},
		guild_items = {
			{
				31110,
				1
			}
		}
	}
}
