local function init_branch(game)
   game.branch.new = function(name)
      game.branch[name] = {}
      game.branch[name].text = {}
   end

   game.branch.set = function(name)
      if not game.branch[name] then
         error("branch " .. name .. " does not exist")
      end
      game._current_branch = name
   end

   game.branch.set_new = function(name)
      game.branch.new(name)
      game.branch.set(name)
   end
end

return init_branch
