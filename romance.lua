local romance = {}

romance.new_game = function()
   local game = {}
   game.image = {}
   game.text = {}
   game.branch = {}
   game.textbox = {}

   game.image.load = function(image_table)
      for k, v in pairs(image_table) do
         if game.image[k] then
            error("image name already exists")
         end
         game.image[k] = love.graphics.newImage(v)
      end
   end

   game.text.add_text = function(text_table)
      for k, v in pairs(text_table) do
         if game.text[k] then
            error("branch already has text")
         end
         game.text[k] = v
      end
   end

   game.text.font_size = 30
   game.text.render = function(text)

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

    game.textbox.width = love.graphics.getWidth() / 2 - 400
    game.textbox.height = love.graphics.getHeight() - 100

    game.textbox.render = function()
       love.graphics.rectangle("line", game.textbox.width,
                               game.textbox.height, 800, 90)
       love.graphics.setFont(love.graphics.newFont(game.text.font_size))
       love.graphics.print("Hello, World", 300, 400)
    end

   return game
end

return romance
