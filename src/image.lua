local function init_image(game)
   game.image.load = function(image_table)
      for k, v in pairs(image_table) do
         if game.image[k] then
            error("image name already exists")
         end
         game.image[k] = love.graphics.newImage(v)
      end
   end
end

return init_image
