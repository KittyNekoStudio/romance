local romance = {}

function romance.init(game)
   game.image = {}
   local image = require("image")
   image.init(game)

   game.text = {}
   local text = require ("text")
   text.init(game)

   game.branch = {}
   local branch = require ("branch")
   branch.init(game)

   game.textbox = {}
   local textbox = require ("textbox")
   textbox.init(game)
end

return romance
