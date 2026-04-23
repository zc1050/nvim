-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here with `vim.api.nvim_create_autocmd`
-- Or remove existing autocmds by their group name (prefixed with `lazyvim_`)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- =============================================================================
-- Python 文件头自动生成
-- =============================================================================

local header_augroup = vim.api.nvim_create_augroup("FileHeaderGroup", { clear = true })

-- 配置项 - 可在此处修改个人信息
local header_config = {
  author = "zc1050",
  contact = "zc1050@qq.com",
  version = "1.0",
}

-- 生成 Python 文件头部模板
local function get_python_header()
  return string.format(
    [[#!/usr/bin/env python3

"""
Version :   %s
Author  :   %s
Contact :   %s
Date    :   %s

"""


def main():
    pass


if __name__ == "__main__":
    main()
]],
    header_config.version,
    header_config.author,
    header_config.contact,
    os.date("%Y-%m-%d %H:%M:%S")
  )
end

-- 插入文件头部并将光标定位到 main 函数处
local function insert_python_header()
  local lines = vim.split(get_python_header(), "\n")
  vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
  vim.schedule(function()
    vim.cmd("normal! 12G")
  end)
end

-- 新建 Python 文件时自动生成头部
vim.api.nvim_create_autocmd("BufNewFile", {
  group = header_augroup,
  pattern = "*.py",
  callback = insert_python_header,
  desc = "Generate Python file header template",
})
