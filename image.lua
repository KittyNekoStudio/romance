--- @class romance.image
local image = {}
--- @param romance table Takes the romance table an intializes the image
--- module
local function init_image(romance)

   --- @param image_table table Table containing key to reference by and
   --- path to image as value
   function image.load(image_table)
      for k, v in pairs(image_table) do
         if image[k] then
            error("image name already exists")
         end
         image[k] = love.graphics.newImage(v)
      end
   end

   function image.set(index, image_name)
      table.insert(romance.state.current_branch.image, index, image_name)
   end

   function image.render()
      if romance.state.current_branch.image[romance.state.index] then
         romance.state.current_image = (
            romance.image[romance.state.current_branch.image[romance.state.index]])
      end

      if romance.state.current_image then
         love.graphics.draw(romance.state.current_image)
      end
   end

   return image
end

return init_image
