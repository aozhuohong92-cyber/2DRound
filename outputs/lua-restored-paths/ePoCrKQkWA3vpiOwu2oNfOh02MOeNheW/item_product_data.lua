Config = Config or {}
Config.ItemProductData = Config.ItemProductData or {}
Config.ItemProductData.data_product_const_length = 0
Config.ItemProductData.data_product_const = {}

function Config.ItemProductData.data_product_const_fun(slot0)
	slot1 = Config.ItemProductData.data_product_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ItemProductData.data_product_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ItemProductData.data_product_data_length = 2
Config.ItemProductData.data_product_data = {
	[10421] = {
		bid = 10421,
		name = "符文·神之耀",
		lev = 0,
		order = 1,
		need_items = {
			{
				10428,
				50
			}
		},
		loss = {}
	},
	[10441] = {
		bid = 10441,
		name = "符文·神之辉",
		lev = 0,
		order = 1,
		need_items = {
			{
				10429,
				30
			}
		},
		loss = {}
	}
}

function Config.ItemProductData.data_product_data_fun(slot0)
	slot1 = Config.ItemProductData.data_product_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ItemProductData.data_product_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
