local notify = require("notify")
local M = {}

local default = {
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
}

M.config = default

local pomosDone = 0
local timer = vim.loop.new_timer()

function M.breakStart()
  local breakTime = M.config.pomo_opts.shortBreak
  if pomosDone >= 4 then
    breakTime = M.config.pomo_opts.longBreak
  end

  notify("Break time! Relax for " .. breakTime .. " minutes", "default", M.config.notify_opts)

  timer:start(1000 * 60 * breakTime, 0, vim.schedule_wrap(function()
    notify("Break time over, back to work!", "default", M.config.notify_opts)
  end))
end

function M.pomoStart()
  local taskTime = M.config.pomo_opts.taskTime
  notify("Timer Started. Focus for " .. taskTime .. " minutes.", "default", M.config.notify_opts)
  if pomosDone >= 1 then
    notify("Pomodoro intervals done: " .. pomosDone, "default", M.config.notify_opts)
  end

  timer:start(1000 * 60 * taskTime, 0, vim.schedule_wrap(function()
    notify(taskTime .. " minutes done. Time for a break!", "default", M.config.notify_opts)
    pomosDone = pomosDone + 1
    M.breakStart()
  end))

end

function M.pomoCheck()
  local timeLeft = math.floor(math.floor(timer:get_due_in() / 1000) / 60)
  notify(timeLeft .. " minutes left", "default", M.config.notify_opts)
end

function M.pomoStop()
  timer:stop()
  timer:close()
  notify("Timer Stopped", "default", M.config.notify_opts)
end

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", default, opts or {})

  vim.api.nvim_create_user_command("PomoStart", "lua require('pomo').pomoStart()", {})
  vim.api.nvim_create_user_command("PomoCheck", "lua require('pomo').pomoCheck()", {})
  vim.api.nvim_create_user_command("PomoStop", "lua require('pomo').pomoStop()", {})
end

return M
