local romance = {}

function romance.init(game)
   game.image = {}
   local image = require("src.image")
   image.init(game)

   game.text = {}
   local text = require ("src.text")
   text.init(game)

   game.branch = {}
   local branch = require ("src.branch")
   branch.init(game)

   game.textbox = {}
   local textbox = require ("src.textbox")
   textbox.init(game)
end

return romance
