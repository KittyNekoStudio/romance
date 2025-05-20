local sequence = {}

function sequence.init(game)
   game.sequence = {
      tree = {}
   }

   function game.sequence.next_branch()
      if game.sequence.tree[game.current_branch.name] ~= "" then
         game.current_branch = game.branch[game.sequence.tree[game.current_branch.name]]
         game.index = 1
      else
         love.event.quit()
      end
   end
end

return sequence
