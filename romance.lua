local romance = {}

function romance.init()
   local base = require("romance.base")
   base.init(romance)

   romance.state = {}
   local state = require("romance.state")
   state.init(romance)

   romance.conf = {}
   local conf = require("romance.conf")
   conf.init(romance)

   romance.image = {}
   local image = require("romance.image")
   image.init(romance)

   romance.text = {}
   local text = require ("romance.text")
   text.init(romance)

   romance.branch = {}
   local branch = require ("romance.branch")
   branch.init(romance)

   romance.textbox = {}
   local textbox = require ("romance.textbox")
   textbox.init(romance)

   romance.key = {}
   local key = require("romance.key")
   key.init(romance)

   romance.sequence = {}
   local sequence = require("romance.sequence")
   sequence.init(romance)

   romance.prompt = {}
   local prompt = require("romance.prompt")
   prompt.init(romance)
end

romance.init()

return romance
