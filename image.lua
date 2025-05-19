local image = {}

function image.init(game)
   function game.image.load(image_table)
      for k, v in pairs(image_table) do
         if game.image[k] then
            error("image name already exists")
         end
         game.image[k] = love.graphics.newImage(v)
      end
   end
end

return image
