# What I've learned so far

## 2026-08-12

### UI

- **About Flutter buttons:** There are 3 main buttons and it's "order" is: `FilledButton`: main CTA → `OutlinedButton`: secondary action → `TextButton`: low-priority action

### Codespaces & "Infrastructure"

- It turns out that is way easier just download the `lib` folder into the local machine (with Flutter SDK already installed) and run the project locally than try to make it run on a codespaces container. Best to let de container just to write the code
- Had trouble installing Flutter SDK by vs code, in my codespaces. Following [flutter tutorial](https://docs.flutter.dev/install/manual)
    - It seems that I will need to manually be adding the flutter sdk on the project... that's crap, since the tar.xz has 1,44GB
    - Let's wait to see if I will really need this.
- There is this thing `devcontainer.json` that it seems to control what extensions are installed in my codespaces container

## 2026-03-22

### Rendering lifecycle
While rendering, there are three 'trees' in Flutter UI.

#### 1. Widget Tree
Here we have the descriptions of the widgets, like manual, saying what every piece is and where you should fit it.

#### 2. Element Tree
This tree is the one who connects the widgets to the rendered objects. 

It's used (as far as I can tell) to manage the state lifecycle of rendered objects. Also, it is what 'links' the widget (the name of the piece in the manual) to the rendered object (the piece you want to pick up).

#### 3. Render Tree
Here, through the [Element Tree](#2-element-tree), are ... 