local key = {}

function key.init(game)
   game.key = {
      continue = "space",
      continue_pressed = false,
      continue_constantly_pressed = false
   }

   function game.key.update_continue_pressed()
      if love.keyboard.isDown(game.key.continue) then
         if game.key.continue_constantly_pressed then
            game.key.continue_pressed = false
         else
            game.key.continue_constantly_pressed = true
            game.key.continue_pressed = true
         end
      else
         game.key.continue_constantly_pressed = false
         game.key.continue_pressed = false
      end
   end
end

return key
