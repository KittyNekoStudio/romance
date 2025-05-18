local romance = {}

romance.new_game = function()
   local game = {}

   game.image = {}
   local init_image = require "src.image"
   init_image(game)

   game.text = {}
   local init_text = require "src.text"
   init_text(game)

   game.branch = {}
   local init_branch = require "src.branch"
   init_branch(game)

   game.textbox = {}
   local init_textbox = require "src.textbox"
   init_textbox(game)

   return game
end

return romance
