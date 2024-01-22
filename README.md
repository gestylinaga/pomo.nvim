# 🍅 pomo.nvim
Simple [Pomodoro](https://en.wikipedia.org/wiki/Pomodoro_Technique) Timer for NeoVim

## ✨ Installation
via [lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
{
  "gestylinaga/pomo.nvim",
  dependencies = {
    "rcarriga/nvim-notify",
  },
  cmd = {
    "PomoStart",
    "PomoCheck",
    "PomoStop"
  },
  config = function()
    require("pomo").setup()
  end
}
```

## ⚡ Usage
```
# To start Pomo timer
:PomoStart

# To check remaining time
:PomoCheck

# To stop Pomo timer
:PomoStop
```

## 📓 TODO
- fix option for taking in user config/opts
- wait for user input on break time start?
  - or add command for manually starting break time
- notify on long break
