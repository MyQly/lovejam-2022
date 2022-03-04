-- gametitle
-- LOVE Jam 2022
-- Theme: Earthquake

function DrawGameTitle()
	local width, height, flags = love.window.getMode()
	w = love.graphics.getWidth()
	love.graphics.setFont(bigFont)
	love.graphics.printf("Earthquake... Run!",0,200,w,"center")
	love.graphics.setFont(font)
	love.graphics.printf("Press Enter To Start or Escape to Quit",0,350, w,"center")
	love.graphics.printf("Press Z to Dash, Space to Jump/DoubleJump, Ctrl to Ground Slam, Shift to Duck",0,400, w,"center")
end