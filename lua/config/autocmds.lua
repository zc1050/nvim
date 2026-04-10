-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

local augroup_fileheader = vim.api.nvim_create_augroup("FileHeaderGroup", { clear = true })
-- 定义一个函数来生成文件头部信息
local function create_python_header()
  -- 获取当前用户名
  -- local author = os.getenv("USER") or "YourName"
  local author = "zc1050"
  -- 获取当前日期
  local date_str = os.date("%Y-%m-%d %H:%M:%S")
  -- 获取文件名
  local filename = vim.fn.expand("%:t")
  -- 构造文件头信息 (使用三重引号的格式)
  local header = string.format(
    [[
#!/usr/bin/env python3

"""

Version :   1.0
Author  :   %s
Contact :   zc1050@gmail.com
Date    :   %s

"""


def main():
    pass


if __name__ == "__main__":
    main()
]],
    author,
    date_str
  )
  -- 插入到当前缓冲区的顶部
  -- vim.api.nvim_buf_set_lines(缓冲区ID, 起始行, 结束行, 是否保留原有行, 要插入的行数组)
  vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(header, "\n", {}))
  -- 自动设置光标到文件末尾或特定位置
  vim.cmd("normal! G")
end
-- 绑定自动命令：在新建 .py 文件时执行函数
vim.api.nvim_create_autocmd("BufNewFile", {
  group = augroup_fileheader,
  pattern = "*.py",
  -- 仅对 .py 文件生效
  callback = create_python_header,
  -- 触发时调用上面的函数
})
