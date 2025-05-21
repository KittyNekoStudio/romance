local textbox = {}

function textbox.init(romance)
   romance.textbox = {
      width = love.graphics.getWidth() / 2 - 400,
      height = love.graphics.getHeight() - 100
   }

   function romance.textbox.render()
      -- TODO! got dimensions and coordinates mixed up
      love.graphics.rectangle("line", romance.textbox.width,
                              romance.textbox.height, 800, 90)
   end
end

return textbox
