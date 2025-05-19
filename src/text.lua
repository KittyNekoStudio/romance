local text = {}

function text.init(game)
   game.text = {
      font_size = 20
   }

   function game.text.add(text_table)
      for k, v in pairs(text_table) do
         game.branch[game._current_branch].text[k] = v
      end
   end

   function game.text.render(text)
      local text_start_width = game.textbox.width + 5
      local text_start_height = game.textbox.height + 5
      love.graphics.print(text, text_start_width, text_start_height)
   end
end

return text
