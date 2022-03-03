-- gametitle
-- LOVE Jam 2022
-- Theme: Earthquake

function DrawGameTitle()
	local width, height, flags = love.window.getMode()
	w = love.graphics.getWidth()
	love.graphics.setFont(bigFont)
	love.graphics.printf("Earthquake... Run!",0,200,w,"center")
	love.graphics.setFont(font)
end