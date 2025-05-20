local sequence = {}

function sequence.init(game)
   game.sequence = {
      tree = {}
   }

   function game.sequence.next_branch()
      local next_branch = game.sequence.tree[game.current_branch.name]
      if next_branch == "" and game.current_branch.choice then
         local chosen_branch = game.prompt.choose_branch()
         if chosen_branch then
            -- Lets you revisit this branch and choose something else
            game.sequence.tree[game.current_branch.name] = ""
            game.current_branch = chosen_branch
            game.index = 1
            game.choosing = false
            game.prompt.pressed = nil
            return
         end
      end

      if game.choosing then return end

      if next_branch ~= "" then
         game.current_branch = game.branch[game.sequence.tree[game.current_branch.name]]
         game.index = 1
      else
         love.event.quit()
      end
   end
end

return sequence
