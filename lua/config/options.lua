-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.mouse = ""

vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"

-- 智能剪贴板配置
-- local function has_clipboard_tool()
--   local tools = { "xclip", "xsel", "wl-copy" }
--   for _, tool in ipairs(tools) do
--     if vim.fn.executable(tool) == 1 then
--       return true
--     end
--   end
--   return false
-- end
--
-- local function has_display_server()
--   return vim.env.DISPLAY or vim.env.WAYLAND_DISPLAY
-- end
--
-- local function setup_clipboard()
--   if vim.env.SSH_CONNECTION then
--     vim.opt.clipboard = ""
--   elseif has_display_server() and has_clipboard_tool() then
--     vim.opt.clipboard = "unnamedplus"
--   else
--     vim.opt.clipboard = "" -- 禁用以避免警告
--   end
-- end
--
-- setup_clipboard()

-- 使用 Neovim 的异步终端功能，避免卡顿
local function pio_cmd_async(command)
  -- 命令执行后会在一个新的终端窗口中显示输出
  local cmd = "platformio " .. command
  -- 使用 :split 或 :vsplit 创建终端窗口
  -- vim.cmd("vsplit | terminal " .. cmd)
  vim.cmd("terminal " .. cmd)
end

-- 1. 构建 (Build)
vim.api.nvim_create_user_command("PioBuild", function()
  pio_cmd_async("run")
end, { nargs = 0, desc = "PlatformIO: Build Project" })

-- 2. 上传 (Upload)
vim.api.nvim_create_user_command("PioUpload", function()
  pio_cmd_async("run --target upload")
end, { nargs = 0, desc = "PlatformIO: Upload Firmware" })

-- 3. 串口监视器 (Monitor)
-- 注意：串口监视器会阻塞终端，直到按下 Ctrl+C 退出
vim.api.nvim_create_user_command("PioMonitor", function()
  pio_cmd_async("device monitor")
end, { nargs = 0, desc = "PlatformIO: Serial Monitor" })

-- 4. 清理(Clean)
vim.api.nvim_create_user_command("PioClean", function()
  pio_cmd_async("run --target clean")
end, { nargs = 0, desc = "PlatformIO: Clean Build Files" })
