local state = {}

function state.init(romance)
   romance.state.start = false
   romance.state.index = 1
   romance.state.current_branch = ""
   romance.state.starting_branch = ""
   romance.state.choosing = false
   romance.state.continue_pressed = false
   romance.state.continue_constantly_pressed = false
end

return state
