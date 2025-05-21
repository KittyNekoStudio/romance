local image = {}

function image.init(romance)
   function romance.image.load(image_table)
      for k, v in pairs(image_table) do
         if romance.image[k] then
            error("image name already exists")
         end
         romance.image[k] = love.graphics.newImage(v)
      end
   end

   function romance.image.set(index, image_name)
      table.insert(romance.state.current_branch.image, index, image_name)
   end

   function romance.image.render()
      if romance.state.current_branch.image[romance.state.index] then
         romance.state.current_image = (romance.image[romance.state.current_branch.image[romance.state.index]])
      end

      if romance.state.current_image then
         love.graphics.draw(romance.state.current_image)
      end
   end
end

return image
