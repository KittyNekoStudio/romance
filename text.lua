local text = {}

function text.init(game)
   game.text = {
      index = 1,
      font_size = 20,
   }

   function game.text.add(text_table)
      for k, v in pairs(text_table) do
         game.branch[game.sequence.current_branch].text[k] = v
      end
   end

   function game.text.render(text)
      local text_start_width = game.textbox.width + 5
      local text_start_height = game.textbox.height + 5
      love.graphics.print(text, text_start_width, text_start_height)
   end

   function game.text.next()
      if game.sequence.start then
         game.key.update_continue_pressed()
         if game.key.continue_pressed then
            game.text.increment_index()
         end
         game.textbox.render()
         game.text.draw()
      else
         game.sequence.current_branch = game.sequence.starting_branch
         game.sequence.start = true
      end
   end

   function game.text.draw()
      -- TODO: Fix how to get current branch
      if game.branch[game.sequence.current_branch].text[game.text.index] then
         game.text.render(game.branch[game.sequence.current_branch].text[game.text.index])
      else
         game.sequence.next_branch()
      end
   end

   function game.text.increment_index()
      game.text.index = game.text.index + 1
   end
end

return text
