DEBUG = 0
CC_USE_FRAMEWORK = true
CC_SHOW_FPS = false
CC_DISABLE_GLOBAL = false
CC_DESIGN_RESOLUTION = {
	autoscale = "FIXED_WIDTH",
	height = 1280,
	width = 720,
	callback = function (slot0)
		if slot0.height / slot0.width <= 1.78 then
			return {
				autoscale = "FIXED_HEIGHT"
			}
		end
	end
}
