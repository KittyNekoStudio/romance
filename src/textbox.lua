local function init_textbox(game)
   game.textbox.width = love.graphics.getWidth() / 2 - 400
   game.textbox.height = love.graphics.getHeight() - 100

   game.textbox.render = function()
      love.graphics.rectangle("line", game.textbox.width,
                              game.textbox.height, 800, 90)
      love.graphics.setFont(love.graphics.newFont(game.text.font_size))
      love.graphics.print("Hello, World", 300, 400)
   end
end

return init_textbox
