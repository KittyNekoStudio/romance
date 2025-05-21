local sequence = {}

function sequence.init(game)
   game.sequence = {
      tree = {}
   }

   function game.sequence.next_branch()
      local next_branch = game.sequence.tree[game.state.current_branch.name]
      if next_branch == "" and game.state.current_branch.choice then
         local chosen_branch = game.prompt.choose_branch()
         if chosen_branch then
            -- Lets you revisit this branch and choose something else
            game.sequence.tree[game.state.current_branch.name] = ""
            game.state.current_branch = chosen_branch
            game.state.index = 1
            game.state.choosing = false
            game.state.pressed = nil
            return
         end
      end

      if game.state.choosing then return end

      if next_branch ~= "" then
         game.state.current_branch = game.branch[game.sequence.tree[game.state.current_branch.name]]
         game.state.index = 1
      else
         love.event.quit()
      end
   end
end

return sequence
