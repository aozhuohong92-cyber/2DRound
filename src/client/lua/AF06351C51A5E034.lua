Config = Config or {}
Config.LoadingDescData = Config.LoadingDescData or {}
Config.LoadingDescData.data_desc_length = 7
Config.LoadingDescData.data_desc = {
	"副本推图关卡越高，获取角色经验、贝里、英雄经验效率越高",
	"英雄升星、进阶可大幅提高英雄属性成长，升级属性加成提高",
	"加入公会，一起打Boss可以赚取大量公会贡献",
	"战斗不停！即使离线也会不断获得经验、贝里、英雄碎片等挂机奖励",
	"快速作战可以立即获得大量角色经验和资源",
	"挑战竞技场拿竞技奖杯，珍贵英雄、强者招募令超值兑换",
	"游戏怎么玩？推图、爬塔、打Boss、养英雄玩竞技，感受成长和竞技的乐趣"
}

function Config.LoadingDescData.data_desc_fun(slot0)
	slot1 = Config.LoadingDescData.data_desc[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.LoadingDescData.data_desc[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
