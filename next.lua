local _next = {}

function _next.init(game)
   function game.next()
      game.text.next()
   end
end

return _next
