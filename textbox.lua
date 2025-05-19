local textbox = {}

function textbox.init(game)
   game.textbox = {
      width = love.graphics.getWidth() / 2 - 400,
      height = love.graphics.getHeight() - 100
   }

   function game.textbox.render()
      love.graphics.rectangle("line", game.textbox.width,
                              game.textbox.height, 800, 90)
   end
end

return textbox
