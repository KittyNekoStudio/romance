local romance = {}

romance.new_game = function()
   local game = {}
   game.image = {}
   game.text = {}
   game.branch = {}

   game.image.load = function(image_table)
      for k, v in pairs(image_table) do
         game.image[k] = love.graphics.newImage(v)
      end
   end

   game.branch.new = function(name)
      game.branch[name] = {}
      game.branch[name].text = game.text[name]
   end

   game.branch.set = function(name)
      if not game.branch[name] then
         error("branch " .. name .. " does not exist")
      end
      game._current_branch = name
   end

    game.branch.set_new = function(name)
        game.branch.new(name)
        game.branch.set(name)
    end

   return game
end

return romance
