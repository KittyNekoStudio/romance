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
      table.insert(game.state.current_branch.image, index, image_name)
   end

   function game.image.render()
      if game.state.current_branch.image[game.state.index] then
         game.state.current_image = (game.image[game.state.current_branch.image[game.state.index]])
      end

      if game.state.current_image then
         love.graphics.draw(game.state.current_image)
      end
   end
end

return image
