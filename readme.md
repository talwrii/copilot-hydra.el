# copilot-hydra.el

This library provides an emacs [hydra](https://github.com/abo-abo/hydra) for the github [copilot.el](https://github.com/zerolfx/copilot.el) library.

# Motivation

When using github copilot one often wants to perform a number of copilot
related actions in a row. For example you might:

1. Start a completion
1. Accept the first line
1. Complete the next line
1. Use another completion
1. Start another completion
1. Give up on that completion

This either uses a lot of valuable simple emacs keybindings or requires you to repeatedly use long bindings.
By using a hydra you can temporarily enable a set of keybindings (and be reminded of them) to perform
some operations and then disable them when you are done with your completion.

# Installation

```
(require 'copilot-hydra)
;; bind copilot-hydra/body
```
