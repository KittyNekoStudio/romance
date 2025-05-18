# What is romance?

romance is a visual novel library written on top of [love2d](https://love2d.org/).

## What does romance provide?

romance provides an API built on top of [love2d](https://love2d.org/) for creating visual novels. 
It provides means to:

- Show images
- Show text in a text box
  - The text and text box are customizable!!
- Save and load the game
- Have branching paths

## How to use romance?

To use romance you will need to install [love2d](https://love2d.org/). You can
do this with your package manager or at the [love2d website](https://love2d.org/).

Once you get [love2d](https://love2d.org/) working clone this repository.

```bash
git clone https://github.com/KittyNekoStudio/romance.git
```

Then simply ```require``` romance.lua in your main.lua file. That's it!

## Example

Here is a simple program written with romance. It does not work yet.

```lua
-- Require romance.lua
local romance = require "romance"


-- Create new game
local game = romance.new_game()

function love.load()
    -- Set key that promts the next line of text
    game.key.continue = "space"
    
    -- Load image into the game.image table
    -- Provide key to refer to image later
    game.image.load({
        cat = "cat.png",
        dog = "dog.png"
    })
    
    -- Creates a new branch
    game.branch.new("intro")
    game.branch.set("intro")
    
    -- Set current text
    game.text = {
        "I have been wondering about myself lately.",
        "I don't even know who I am. Am I even human?"
    }
    
    -- Create a branching path after all text has been drawn
    -- Provide text to draw in text box, 
    -- and object(s) containing text to draw in choice box, and the branch
    game.branch.choice("What am I?", {"Cat", "cat"}, {"Dog", "dog"})
    
    -- Set new branching path
    game.branch.new("cat")
    game.branch.set("cat")
    
    game.text = {
        -- You can name lines to be referenced later
        cat_image = "Yes, yes, I am a cat!"
    }
    
    game.image.set("cat", "cat_image")
    
    -- If you do not provide a choice but want to move onto a new branch
    game.branch.next("end")
    
    -- Convenience function to create and set a branch
    game.branch.set_new("dog")
    
    game.branch.text = {
        dog_image = "How can it be!!",
        "I am a dog!"
    }
    
    game.image.set("dog", "dog_image")

    game.branch.next("end")
    
    game.branch.set_new("end")
    
    game.text = {
        "So I really was never a human, huh.",
        "Life is crazy sometimes."
    }
end

function love.draw()
    if game.continue_key_pressed() then
        game.next()
    end
end
```
