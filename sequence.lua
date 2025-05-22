--- @class romance.sequence
local sequence = {}

local function init_sequence(romance)
   sequence = {
      tree = {}
   }

   function sequence.nextBranch()
      local next_branch = sequence.tree[romance.state.current_branch.name]
      if next_branch == "" and romance.state.current_branch.choice then
         local chosen_branch = romance.prompt.chooseBranch()
         if chosen_branch then
            -- Lets you revisit this branch and choose something else
            sequence.tree[romance.state.current_branch.name] = ""
            romance.state.current_branch = chosen_branch
            romance.state.index = 1
            romance.state.choosing = false
            romance.state.pressed = nil
            return
         end
      end

      if romance.state.choosing then return end

      if next_branch ~= "" then
         romance.state.current_branch = romance.branch[sequence.tree[romance.state.current_branch.name]]
         romance.state.index = 1
      else
         love.event.quit()
      end
   end

   return sequence
end

return init_sequence
