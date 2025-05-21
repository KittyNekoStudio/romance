local branch = {}

local function table_length(_table)
   local count = 0
   for _ in pairs(_table) do count = count + 1 end
   return count
end

function branch.init(game)
   function game.branch.new(name)
      game.branch[name] = {}
      game.branch[name].text = {}
      game.branch[name].image = {}
      game.branch[name].name = name
      game.branch[name].button_width = 500
      game.branch[name].button_height = 40
      game.branch[name].buttons = {}
      game.branch[name].button_x = love.graphics.getWidth() / 2 - game.branch[name].button_width / 2
      game.branch[name].button_y = love.graphics.getHeight() / 2 - game.branch[name].button_height / 2 - 100
      game.branch[name].font = game.conf._font


      if table_length(game.sequence.tree) == 0 then
         game.state.current_branch = game.branch[name]
         game.state.starting_branch = game.branch[name]
      end

      game.sequence.tree[name] = ""
   end

   function game.branch.set(name)
      if not game.branch[name] then
         error("branch " .. name .. " does not exist")
      end

      game.state.current_branch = game.branch[name]
   end

   function game.branch.set_new(name)
      game.branch.new(name)
      game.branch.set(name)
   end

   function game.branch.next(name)
      game.sequence.tree[game.state.current_branch.name] = name
   end

   function game.branch.choice(line, ...)
      local args = {...}
      table.insert(game.state.current_branch.text, line)
      game.state.current_branch.choice = args
      game.prompt.add_buttons()
   end
end

return branch
