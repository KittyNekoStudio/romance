local text = {}

function text.init(romance)
   function romance.text.add(text_table)
      for _, v in pairs(text_table) do
         table.insert(romance.state.current_branch.text, v)
      end
   end

   function romance.text.render(line)
      local text_start_width = romance.textbox.width + 5
      local text_start_height = romance.textbox.height + 5
      love.graphics.setFont(romance.state.current_branch.font)
      love.graphics.print(line, text_start_width, text_start_height)
   end

   function romance.text.next()
      if romance.state.start then
         romance.textbox.render()

         if not romance.state.choosing then
            romance.key.updateContinuePressed()
            if romance.state.continue_pressed then
               romance.state.index = romance.state.index + 1
            end
         end

         romance.text.draw()
      else
         romance.state.current_branch = romance.state.starting_branch
         romance.state.start = true
      end
   end

   function romance.text.draw()
      if romance.state.current_branch.text[romance.state.index] then
         romance.text.render(romance.state.current_branch.text[romance.state.index])
      else
         romance.sequence.nextBranch()
      end
   end
end

return text
