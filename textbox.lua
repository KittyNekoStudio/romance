--- @class romance.textbox
local textbox = {}

local function init_textbox(romance)
   textbox = {
      width = love.graphics.getWidth() / 2 - 400,
      height = love.graphics.getHeight() - 100
   }

   function textbox.render()
      -- TODO! got dimensions and coordinates mixed up
      love.graphics.rectangle("line", romance.textbox.width,
                              romance.textbox.height, 800, 90)
   end

   return textbox
end

return init_textbox
