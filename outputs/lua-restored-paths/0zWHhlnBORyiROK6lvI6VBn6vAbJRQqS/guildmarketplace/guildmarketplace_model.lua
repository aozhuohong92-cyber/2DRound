GuildmarketplaceModel = GuildmarketplaceModel or BaseClass()

function GuildmarketplaceModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

slot0 = string.format

function GuildmarketplaceModel.config(slot0)
end

function GuildmarketplaceModel.getStrByType(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot3 = nil

	return (slot1 ~= GuildmarketplaceConst.RewardRecordType.eSecretArea or uv0(TI18N(" <div fontcolor=#d95014>公会秘境·%s</div>的奖励已放入"), slot2)) and (slot1 ~= GuildmarketplaceConst.RewardRecordType.eGuildWar or TI18N(" <div fontcolor=#d95014>公会战</div>的奖励已放入")) and (slot1 ~= GuildmarketplaceConst.RewardRecordType.eMonopoly or uv0(TI18N(" <div fontcolor=#d95014>圣夜奇境·%s</div>的奖励已放入"), slot2)) and uv0(TI18N(" <div fontcolor=#d95014>%s</div>的奖励已放入"), slot2)
end

function GuildmarketplaceModel.__delete(slot0)
end
