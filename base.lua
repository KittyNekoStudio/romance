local base = {}

function base.init(romance)
   function romance.next()
      romance.image.render()
      romance.text.next()
      if romance.state.choosing then
         for k, _ in pairs(romance.state.current_branch.buttons) do
            romance.prompt.button_pressed(k)
         end
      end
   end
end

return base
