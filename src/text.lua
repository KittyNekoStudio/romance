local function init_text(game)
   game.text.font_size = 50

   game.text.add_text = function(text_table)
      for k, v in pairs(text_table) do
         if game.text[k] then
            error("branch already has text")
         end
         game.text[k] = v
      end
   end

   game.text.render = function(text)

   end
end

return init_text
