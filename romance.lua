local romance = {}

function romance.init(game)
   local base = require("romance.base")
   base.init(game)

   game.image = {}
   local image = require("romance.image")
   image.init(game)

   game.text = {}
   local text = require ("romance.text")
   text.init(game)

   game.branch = {}
   local branch = require ("romance.branch")
   branch.init(game)

   game.textbox = {}
   local textbox = require ("romance.textbox")
   textbox.init(game)

   game.key = {}
   local key = require("romance.key")
   key.init(game)

   game.sequence = {}
   local sequence = require("romance.sequence")
   sequence.init(game)
end

return romance
