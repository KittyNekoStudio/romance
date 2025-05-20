local sequence = {}

function sequence.init(game)
   game.sequence = {
      start = false,
      current_branch = nil,
      starting_branch = nil,
      tree = {}
   }

   function game.sequence.next_branch()
      local current_branch = game.sequence.current_branch
      if game.sequence.tree[current_branch] ~= "" then
         game.sequence.current_branch = game.sequence.tree[current_branch]
         game.text.index = 1
      else
         love.event.quit()
      end
   end
end

return sequence
