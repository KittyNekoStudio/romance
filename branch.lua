--- @class romance.branch
local branch = {}

local function table_length(_table)
   local count = 0
   for _ in pairs(_table) do count = count + 1 end
   return count
end

local function init_branch(romance)
   function branch.new(name)
      branch[name] = {}
      branch[name].text = {}
      branch[name].image = {}
      branch[name].name = name
      branch[name].button_width = 500
      branch[name].button_height = 40
      branch[name].buttons = {}
      branch[name].button_x = love.graphics.getWidth() / 2 - branch[name].button_width / 2
      branch[name].button_y = love.graphics.getHeight() / 2 - branch[name].button_height / 2 - 100
      branch[name].font = romance.conf.font


      if table_length(romance.sequence.tree) == 0 then
         romance.state.current_branch = branch[name]
         romance.state.starting_branch = branch[name]
      end

      romance.sequence.tree[name] = ""
   end

   function branch.set(name)
      if not branch[name] then
         error("branch " .. name .. " does not exist")
      end

      romance.state.current_branch = branch[name]
   end

   function branch.setNew(name)
      branch.new(name)
      branch.set(name)
   end

   function branch.next(name)
      romance.sequence.tree[romance.state.current_branch.name] = name
   end

   function branch.choice(line, ...)
      local args = {...}
      table.insert(romance.state.current_branch.text, line)
      romance.state.current_branch.choice = args
      romance.prompt.addButtons()
   end

   return branch
end

return init_branch
