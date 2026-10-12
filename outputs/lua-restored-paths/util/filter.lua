function createGreyFilter()
	return {
		0.299,
		0.587,
		0.114,
		0,
		0,
		0.299,
		0.587,
		0.114,
		0,
		0,
		0.299,
		0.587,
		0.114,
		0,
		0,
		0,
		0,
		0,
		1,
		0
	}
end

function createRed()
	return {
		1,
		0,
		0,
		0.42,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		1,
		0
	}
end

function createSaturationFilter(slot0)
	return {
		0.199 * (1 - slot0) + slot0,
		0.017 * (1 - slot0),
		0.114 * (1 - slot0),
		0,
		0,
		0.199 * (1 - slot0),
		0.017 * (1 - slot0) + slot0,
		0.114 * (1 - slot0),
		0,
		0,
		0.199 * (1 - slot0),
		0.017 * (1 - slot0),
		0.114 * (1 - slot0) + slot0,
		0,
		0,
		0,
		0,
		0,
		1,
		0
	}
end

function createContrastFilter(slot0)
	return {
		slot0,
		0,
		0,
		0,
		128 * (1 - slot0),
		0,
		slot0,
		0,
		0,
		128 * (1 - slot0),
		0,
		0,
		slot0,
		0,
		128 * (1 - slot0),
		0,
		0,
		0,
		1,
		0
	}
end

function createBrightnessFilter(slot0)
	return {
		1,
		0,
		0,
		0,
		slot0,
		0,
		1,
		0,
		0,
		slot0,
		0,
		0,
		1,
		0,
		slot0,
		0,
		0,
		0,
		1,
		0
	}
end

function createInversionFilter()
	return {
		-1,
		0,
		0,
		0,
		255,
		0,
		-1,
		0,
		0,
		255,
		0,
		0,
		-1,
		0,
		255,
		0,
		0,
		0,
		1,
		0
	}
end

function createWhite()
	return {
		1,
		0.1,
		0,
		0,
		0,
		0,
		1,
		0.1,
		0,
		0,
		0,
		0,
		1,
		0.1,
		0,
		0,
		0,
		0,
		0.7,
		0
	}
end

function createGhost()
	return {
		1,
		0,
		0,
		0,
		0,
		0,
		1,
		0,
		0,
		0,
		0,
		0,
		1,
		0,
		0,
		0.3,
		0.31,
		0.71,
		0.3,
		0
	}
end

function createGhost2()
	return {
		0.66,
		0,
		0,
		0,
		0,
		0,
		0.6,
		0,
		0,
		0,
		0,
		0,
		1,
		0,
		0,
		0,
		0,
		0,
		0.44,
		0
	}
end

function createMagic()
end

function createHueFilter(slot0)
	p1 = math.cos(slot0 * 3.1415926 / 180)
	p2 = math.sin(slot0 * 3.1415926 / 180)
	p4 = 0.213
	p5 = 0.715
	p6 = 0.072

	return {
		p4 + p1 * (1 - p4) + p2 * (0 - p4),
		p5 + p1 * (0 - p5) + p2 * (0 - p5),
		p6 + p1 * (0 - p6) + p2 * (1 - p6),
		0,
		0,
		p4 + p1 * (0 - p4) + p2 * 0.143,
		p5 + p1 * (1 - p5) + p2 * 0.14,
		p6 + p1 * (0 - p6) + p2 * -0.283,
		0,
		0,
		p4 + p1 * (0 - p4) + p2 * (0 - (1 - p4)),
		p5 + p1 * (0 - p5) + p2 * p5,
		p6 + p1 * (1 - p6) + p2 * p6,
		0,
		0,
		0,
		0,
		0,
		1,
		0
	}
end

function createIceFilter(...)
	return {
		1,
		0,
		0,
		0,
		18,
		0,
		1,
		0,
		0,
		166,
		0,
		0,
		1,
		0,
		245,
		0,
		0,
		0,
		1,
		0
	}
end
