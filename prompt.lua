local prompt = {}

function prompt.init(game)
   function game.prompt.render()
      for _, v in pairs(game.state.current_branch.buttons) do
         game.prompt.draw_button(v)
      end
   end

   function game.prompt.choose_branch()
      game.state.choosing = true
      game.prompt.render()
      game.text.render(game.state.current_branch.text[game.state.index - 1])

      if game.state.pressed then
         local id = game.state.pressed
         local choice = game.state.current_branch.choice[id][2]
         game.sequence.tree[game.state.current_branch.name] = choice
         return game.branch[choice]
      end
   end

   function game.prompt.button_new(text, width, height, x, y)
      local count = 0
      for _ in pairs(game.state.current_branch.buttons) do
         count = count + 1
      end

      local button = {
         text = text,
         width = width or game.state.current_branch.button_width,
         height = height or game.state.current_branch.button_height,
         x = x or game.state.current_branch.button_x,
      }

      if count >= 1 then
         button.y = y or game.state.current_branch.button_y
            + (game.state.current_branch.button_height * count) + (10 * count)
      else
         button.y = y or game.state.current_branch.button_y
      end

      table.insert(game.state.current_branch.buttons, button)
   end

   function game.prompt.add_buttons()
      local args = game.state.current_branch.choice
      for _, v in pairs(args) do
         game.prompt.button_new(v[1])
      end
   end

   function game.prompt.button_pressed(i)
      local x, y = love.mouse.getX(), love.mouse.getY()
      local buttons = game.state.current_branch.buttons
      if x > buttons[i].x and x < buttons[i].x + buttons[i].width
         and y > buttons[i].y and y < buttons[i].y + buttons[i].height then
         if love.mouse.isDown(1) then
            game.state.pressed = i
         end
      end
   end

   function game.prompt.draw_button(button)
      love.graphics.rectangle("line", button.x, button.y,
                              button.width, button.height)
      love.graphics.print(button.text, button.x, button.y)
   end
end

return prompt
