local text = {}

function text.init(game)
   function game.text.add(text_table)
      for _, v in pairs(text_table) do
         table.insert(game.state.current_branch.text, v)
      end
   end

   function game.text.render(line)
      local text_start_width = game.textbox.width + 5
      local text_start_height = game.textbox.height + 5
      love.graphics.setFont(game.state.current_branch.font)
      love.graphics.print(line, text_start_width, text_start_height)
   end

   function game.text.next()
      if game.state.start then
         game.textbox.render()

         if not game.state.choosing then
            game.key.update_continue_pressed()
            if game.state.continue_pressed then
               game.state.index = game.state.index + 1
            end
         end

         game.text.draw()
      else
         game.state.current_branch = game.state.starting_branch
         game.state.start = true
      end
   end

   function game.text.draw()
      if game.state.current_branch.text[game.state.index] then
         game.text.render(game.state.current_branch.text[game.state.index])
      else
         game.sequence.next_branch()
      end
   end
end

return text
