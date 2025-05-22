--- @class romance.prompt
local prompt = {}

local function init_prompt(romance)
   function prompt.render()
      for _, v in pairs(romance.state.current_branch.buttons) do
         prompt.drawButton(v)
      end
   end

   function prompt.chooseBranch()
      romance.state.choosing = true
      prompt.render()
      romance.text.render(romance.state.current_branch.text[romance.state.index - 1])

      if romance.state.pressed then
         local id = romance.state.pressed
         local choice = romance.state.current_branch.choice[id][2]
         romance.sequence.tree[romance.state.current_branch.name] = choice
         return romance.branch[choice]
      end
   end

   function prompt.buttonNew(text, width, height, x, y)
      local count = 0
      for _ in pairs(romance.state.current_branch.buttons) do
         count = count + 1
      end

      local button = {
         text = text,
         width = width or romance.state.current_branch.button_width,
         height = height or romance.state.current_branch.button_height,
         x = x or romance.state.current_branch.button_x,
      }

      if count >= 1 then
         button.y = y or romance.state.current_branch.button_y
            + (romance.state.current_branch.button_height * count) + (10 * count)
      else
         button.y = y or romance.state.current_branch.button_y
      end

      table.insert(romance.state.current_branch.buttons, button)
   end

   function prompt.addButtons()
      local args = romance.state.current_branch.choice
      for _, v in pairs(args) do
         prompt.buttonNew(v[1])
      end
   end

   function prompt.buttonPressed(i)
      local x, y = love.mouse.getX(), love.mouse.getY()
      local buttons = romance.state.current_branch.buttons
      if x > buttons[i].x and x < buttons[i].x + buttons[i].width
         and y > buttons[i].y and y < buttons[i].y + buttons[i].height then
         if love.mouse.isDown(1) then
            romance.state.pressed = i
         end
      end
   end

   function prompt.drawButton(button)
      love.graphics.rectangle("line", button.x, button.y,
                              button.width, button.height)
      love.graphics.print(button.text, button.x, button.y)
   end

   return prompt
end

return init_prompt
