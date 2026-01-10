-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

local map = vim.keymap.set
map("n", "<leader>pb", ":PioBuild<CR>", { desc = "PIO Build" })
map("n", "<leader>pu", ":PioUpload<CR>", { desc = "PIO Upload" })
map("n", "<leader>pm", ":PioMonitor<CR>", { desc = "PIO Serial Monitor" })

-- map("n", "<leader>py", ":terminal python<CR>", { desc = "Run python" })

map("n", "<leader>py", "<cmd>split | terminal python %<CR>", {
  desc = "Run Current File (Terminal)",
  -- 只对当前缓冲区生效
  -- buffer = true,
})
