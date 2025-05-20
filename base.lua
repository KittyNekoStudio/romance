local base = {}

function base.init(game)
   game.start = false
   game.index = 1
   game.current_branch = ""
   game.starting_branch = ""

   function game.next()
      game.text.next()
   end
end

return base
