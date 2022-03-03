-- gameover
-- LOVE Jam 2022
-- Theme: Earthquake

function DrawGameOver()
	local width, height, flags = love.window.getMode()
	w = love.graphics.getWidth()
	love.graphics.setFont(bigFont)
	love.graphics.printf("Game Over!",0,200,w,"center")
	love.graphics.setFont(font)
end