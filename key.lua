--- @class romance.key
local key = {}

local function init_key(romance)
   function key.updateContinuePressed()
      if love.keyboard.isDown(romance.conf.continue) then
         if romance.state.continue_constantly_pressed then
            romance.state.continue_pressed = false
         else
            romance.state.continue_constantly_pressed = true
            romance.state.continue_pressed = true
         end
      else
         romance.state.continue_constantly_pressed = false
         romance.state.continue_pressed = false
      end
   end

   return key
end

return init_key
