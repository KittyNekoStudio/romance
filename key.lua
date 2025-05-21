local key = {}

function key.init(game)

   function game.key.update_continue_pressed()
      if love.keyboard.isDown(game.conf.continue) then
         if game.state.continue_constantly_pressed then
            game.state.continue_pressed = false
         else
            game.state.continue_constantly_pressed = true
            game.state.continue_pressed = true
         end
      else
         game.state.continue_constantly_pressed = false
         game.state.continue_pressed = false
      end
   end
end

return key
