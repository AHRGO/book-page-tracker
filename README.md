# book-page-tracker
A tool to track the page where you stopped when reading multiple books at once

# What I've learned so far

## Rendering lifecycle
While rendering, there are three 'trees' in Flutter UI.

### 1. Widget Tree
Here we have the descriptions of the widgets, like manual, saying what every piece is and where you should fit it.

### 2. Element Tree
This tree is the one who connects the widgets to the rendered objects. 

It's used (as far as I can tell) to manage the state lifecycle of rendered objects. Also, it is what 'links' the widget (the name of the piece in the manual) to the rendered object (the piece you want to pick up).

### 3. Render Tree
Here, through the [Element Tree](#2-element-tree), are ... 