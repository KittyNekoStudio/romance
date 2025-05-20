local text = {}

function text.init(game)
   game.text = {
      font_size = 20,
      index = 1
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

   function game.text.next()
      game.key.update_continue_pressed()
      if game.key.continue_pressed then
         game.text.index = game.text.index + 1
      end
      game.textbox.render()
      game.text.render(game.branch[game._current_branch].text[game.text.index])
   end
end

return text
