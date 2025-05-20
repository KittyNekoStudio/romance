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
      game.branch[name].name = name

      if table_length(game.sequence.tree) == 0 then
         game.current_branch = game.branch[name]
         game.starting_branch = game.branch[name]
      end

      game.sequence.tree[name] = ""
   end

   function game.branch.set(name)
      if not game.branch[name] then
         error("branch " .. name .. " does not exist")
      end

      game.current_branch = game.branch[name]
   end

   function game.branch.set_new(name)
      game.branch.new(name)
      game.branch.set(name)
   end

   function game.branch.next(name)
      game.sequence.tree[game.current_branch.name] = name
   end
end

return branch
