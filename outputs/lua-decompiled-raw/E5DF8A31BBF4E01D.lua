BattleRoleVo = BattleRoleVo or BaseClass()

function BattleRoleVo.__init(slot0)
	slot0.pos = 0
	slot0.group = 0
	slot0.owner_id = 0
	slot0.owner_srv_id = ""
	slot0.object_type = 2
	slot0.object_id = 0
	slot0.object_bid = 0
	slot0.object_name = ""
	slot0.star = 0
	slot0.sex = 0
	slot0.career = 0
	slot0.lev = 0
	slot0.hp = 0
	slot0.hp_max = 0
	slot0.face_id = 0
	slot0.is_awake = 0
	slot0.round = 0
	slot0.skills = {}
	slot0.extra_data = {}
	slot0.fight_type = 0
end

function BattleRoleVo.__delete(slot0)
end
