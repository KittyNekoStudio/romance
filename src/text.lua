local function init_text(game)
   game.text.font_size = 20

   game.text.add_text = function(text_table)
      for k, v in pairs(text_table) do
         if game.text[k] then
            error("branch already has text")
         end
         game.text[k] = v
      end
   end

   game.text.render = function(text)
      local text_start_width = game.textbox.width + 5
      local text_start_height = game.textbox.height + 5
      love.graphics.print(text, text_start_width, text_start_height)
   end
end

return init_text
