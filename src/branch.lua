local branch = {}

function branch.init(game)
   function game.branch.new(name)
      game.branch[name] = {}
      game.branch[name].text = {}
   end

   function game.branch.set(name)
      if not game.branch[name] then
         error("branch " .. name .. " does not exist")
      end
      game._current_branch = name
   end

   function game.branch.set_new(name)
      game.branch.new(name)
      game.branch.set(name)
   end
end

return branch
