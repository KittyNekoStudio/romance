local branch = {}

local function table_length(_table)
   local count = 0
   for _ in pairs(_table) do count = count + 1 end
   return count
end

function branch.init(romance)
   function romance.branch.new(name)
      romance.branch[name] = {}
      romance.branch[name].text = {}
      romance.branch[name].image = {}
      romance.branch[name].name = name
      romance.branch[name].button_width = 500
      romance.branch[name].button_height = 40
      romance.branch[name].buttons = {}
      romance.branch[name].button_x = love.graphics.getWidth() / 2 - romance.branch[name].button_width / 2
      romance.branch[name].button_y = love.graphics.getHeight() / 2 - romance.branch[name].button_height / 2 - 100
      romance.branch[name].font = romance.conf.font


      if table_length(romance.sequence.tree) == 0 then
         romance.state.current_branch = romance.branch[name]
         romance.state.starting_branch = romance.branch[name]
      end

      romance.sequence.tree[name] = ""
   end

   function romance.branch.set(name)
      if not romance.branch[name] then
         error("branch " .. name .. " does not exist")
      end

      romance.state.current_branch = romance.branch[name]
   end

   function romance.branch.setNew(name)
      romance.branch.new(name)
      romance.branch.set(name)
   end

   function romance.branch.next(name)
      romance.sequence.tree[romance.state.current_branch.name] = name
   end

   function romance.branch.choice(line, ...)
      local args = {...}
      table.insert(romance.state.current_branch.text, line)
      romance.state.current_branch.choice = args
      romance.prompt.addButtons()
   end
end

return branch
