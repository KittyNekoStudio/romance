local base = {}

function base.init(game)
   game.start = false
   game.index = 1
   game.current_branch = ""
   game.starting_branch = ""
   game.choosing = false

   function game.next()
      game.text.next()
      if game.choosing then
         for k, _ in pairs(game.current_branch.buttons) do
            game.prompt.button_pressed(k)
         end
      end
   end
end

return base
