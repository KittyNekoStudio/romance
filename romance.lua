--- @class romance
local romance = {}

local function init_romance()
   local init_state = require("romance.state")
   romance.state = init_state(romance)

   local init_conf = require("romance.conf")
   romance.conf = init_conf(romance)

   local init_image = require("romance.image")
   romance.image = init_image(romance)

   local init_text = require ("romance.text")
   romance.text = init_text(romance)

   local init_branch = require ("romance.branch")
   romance.branch = init_branch(romance)

   local init_textbox = require ("romance.textbox")
   romance.textbox = init_textbox(romance)

   local init_key = require("romance.key")
   romance.key = init_key(romance)

   local init_sequence = require("romance.sequence")
   romance.sequence = init_sequence(romance)

   local init_prompt = require("romance.prompt")
   romance.prompt = init_prompt(romance)
end

--- Render loop for romance
function romance.next()
   romance.image.render()
   romance.text.next()
   if romance.state.choosing then
      for k, _ in pairs(romance.state.current_branch.buttons) do
         romance.prompt.buttonPressed(k)
      end
   end
end

init_romance()
return romance
