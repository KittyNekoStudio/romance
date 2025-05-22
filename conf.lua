--- @class romance.conf
local conf = {}

local function init_conf(romance)
   conf.continue = "space"
   conf.font = love.graphics.newFont(20)

   function conf.setFont(font)
      if romance.state.starting_branch == "" then
         conf.font = font
      else
         romance.state.current_branch.font = font
      end
   end

   return conf
end

return init_conf
