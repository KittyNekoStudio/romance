local text = {}

function text.init(game)
   game.text = {
      font_size = 20,
   }

   function game.text.add(text_table)
      for _, v in pairs(text_table) do
         table.insert(game.current_branch.text, v)
      end
   end

   function game.text.render(line)
      local text_start_width = game.textbox.width + 5
      local text_start_height = game.textbox.height + 5
      love.graphics.print(line, text_start_width, text_start_height)
   end

   function game.text.next()
      if game.start then
         game.key.update_continue_pressed()
         if game.key.continue_pressed then
            game.index = game.index + 1
         end
         game.textbox.render()
         game.text.draw()
      else
         game.current_branch = game.starting_branch
         game.start = true
      end
   end

   function game.text.draw()
      if game.current_branch.text[game.index] then
         game.text.render(game.current_branch.text[game.index])
      else
         game.sequence.next_branch()
      end
   end
end

return text
