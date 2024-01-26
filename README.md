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
See [nvim-notify](https://github.com/rcarriga/nvim-notify) for full list of 
notify options

## ⚡ Usage
- Run `:PomoStart` to start the Pomodoro timer
- The *break* timer will start automatically when the Pomodoro timer is done
- Run `:PomoStart` again to start another interval
- A *long break* will start automatically when 4 Pomodoro intervals have been
completed
- Run `:PomoCheck` anytime to see the remaining time on any timer
- Run `:PomoStop` to stop the timer

**Full Command List:**
```
:PomoStart # starts timer
:PomoCheck # checks remaining time
:PomoStop  # stops timer
```
