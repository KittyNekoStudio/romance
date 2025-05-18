local romance = {}

romance.new_game = function()
   local game = {}
   game.image = {}

   game.image.load = function(image_table)
      for k, v in pairs(image_table) do
         game.image[k] = love.graphics.newImage(v)
      end
   end

   return game
end

return romance
