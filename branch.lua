local branch = {}

local function table_length(_table)
   local count = 0
   for _ in pairs(_table) do count = count + 1 end
   return count
end

function branch.init(game)
   game.branch = {
      index = 1
   }

   function game.branch.new(name)
      if table_length(game.sequence.tree) == 0 then
         game.sequence.current_branch = name
         game.sequence.starting_branch = name
      end

      game.branch[name] = {}
      game.branch[name].text = {}
      game.sequence.tree[name] = ""
   end

   function game.branch.set(name)
      if not game.branch[name] then
         error("branch " .. name .. " does not exist")
      end

      game.sequence.current_branch = name
   end

   function game.branch.set_new(name)
      game.branch.new(name)
      game.branch.set(name)
   end

   function game.branch.next(name)
      game.sequence.tree[game.sequence.current_branch] = name
   end
end

return branch
