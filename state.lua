--- @class romance.state
local state = {}

local function init_state(romance)
   state.start = false
   state.index = 1
   state.current_branch = ""
   state.starting_branch = ""
   state.choosing = false
   state.continue_pressed = false
   state.continue_constantly_pressed = false

   return state
end

return init_state
