-- gameover
-- LOVE Jam 2022
-- Theme: Earthquake

function DrawGameOver()
	local width, height, flags = love.window.getMode()
	w = love.graphics.getWidth()
	love.graphics.setFont(bigFont)
	love.graphics.printf("Game Over!",0,200,w,"center")
	love.graphics.printf("Score: "..math.floor(gameTime*100), 0, 300, w, "center")
	love.graphics.setFont(font)
	love.graphics.printf("Press Enter To Restart or Escape to Quit",0,450, w,"center")
end