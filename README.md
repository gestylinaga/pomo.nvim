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
    require("pomo").setup({
      -- config options go here --
    })
  end
}
```

## 🛠️ Configuration
```lua
-- Default config
require("pomo").setup({
  pomo_opts = {
    taskTime = 25,
    shortBreak = 5, -- or 10
    longBreak = 25,
  },
  notify_opts = {
    title = "Pomodoro Timer",
    icon = "🍅",
    render = "default", -- display style
    stages = "fade_in_slide_out", -- animation style
    timeout = 2500, -- time (in ms) popup stays on screen
  }
})
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

#### 📓 TODO
- wait for user input on break time start?
  - or add command for manually starting break time
- notify on long break
