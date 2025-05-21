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

Here is a simple program written with romance.

```lua
-- Require romance.lua
local romance = require("romance.romance")

-- Create new game
local game = {}

-- Romance returns a function that initializes a table with required fields
romance.init(game)

function love.load()
   -- Load image into the game.image table
   -- Provide key to refer to image later
   game.image.load({
         cat = "assets/cat.jpg",
         dog = "assets/dog.jpg"
   })
   
   -- Creates a new branch
   -- Branches are each path of the visual novel
   game.branch.new("intro")

   -- Creating and setting separate branchs allows you to 
   -- Configure each branch individually
   game.branch.set("intro")
   
   -- Adds text to currently bound branch
   game.text.add({
         "I have been wondering about myself lately.",
         "I don't even know who I am. Am I even human?"
   })

   -- Create a branching path after all text has been drawn
   -- Provide text to draw in choice box, and object(s) containing branches
   -- What choice the user choses sets the next branch
   game.branch.choice("What am I?", {"Cat", "cat"}, {"Dog", "dog"})
   
   -- Set new branching path
   game.branch.new("cat")
   game.branch.set("cat")
   
   game.text.add({
         "Yes, yes, I am a cat!"
   })
   
   -- Draws an image onto the screen at provided index into text table
   -- Images continue to be drawn until a new image gets drawn
   game.image.set(1, "cat")
   
   -- If you do not provide a choice but want to move onto a new branch
   game.branch.next("end")
   
   -- Convenience function to create and set a branch
   game.branch.set_new("dog")
   
   game.text.add({
         "How can it be!!",
         "I am a dog!"
   })
   
   game.image.set(1, "dog")

   game.branch.next("end")
   
   game.branch.set_new("end")
   
   game.text.add({
         "So I really was never a human, huh.",
         "Life is crazy sometimes."
   })
end

function love.draw()
   game.next()
end

```
