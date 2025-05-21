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

   function game.image.set(index, image_name)
      table.insert(game.current_branch.image, index, image_name)
   end

   function game.image.render()
      if game.current_branch.image[game.index] then
         game.current_image = (game.image[game.current_branch.image[game.index]])
      end

      if game.current_image then
         love.graphics.draw(game.current_image)
      end
   end
end

return image
