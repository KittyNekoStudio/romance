local conf = {}

function conf.init(romance)
   romance.conf.continue = "space"
   romance.conf.font = love.graphics.newFont(20)

   function romance.conf.setFont(font)
      if romance.state.starting_branch == "" then
         romance.conf.font = font
      else
         romance.state.current_branch.font = font
      end
   end
end

return conf
