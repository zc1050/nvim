-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
-- 在终端模式 (t) 下，将 <Esc> 映射到退出终端模式的命令
-- 注释掉这个映射，让snacks.nvim插件处理ESC键
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Terminal: Exit to Normal Mode" })
--

local map = vim.keymap.set
-- 假设你的 Leader 键是空格 (Space)
map("n", "<leader>pb", ":PioBuild<CR>", { desc = "PIO Build" })
map("n", "<leader>pu", ":PioUpload<CR>", { desc = "PIO Upload" })
map("n", "<leader>pm", ":PioMonitor<CR>", { desc = "PIO Serial Monitor" })

-- map("n", "<leader>py", ":terminal python<CR>", { desc = "Run python" })

vim.keymap.set("n", "<leader>py", "<cmd>split | terminal python %<CR>", {
  desc = "Run Current File (Terminal)",
  buffer = true,
  -- 只对当前缓冲区生效（可选）
})
