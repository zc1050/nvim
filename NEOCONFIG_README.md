# Neovim 配置 PlatformIO 头文件支持

## 已完成的配置

我已经为你创建了以下配置：

### 1. `.clangd` 配置文件
- 位于项目根目录
- 告诉 clangd 使用 `compile_commands.json`
- 移除了 clangd 不理解的编译标志
- 抑制了 Arduino 特定的错误提示

### 2. Neovim 插件配置
- 位于 `~/.config/nvim/lua/plugins/clangd.lua`
- 配置了 clangd LSP 服务器
- 自动添加 PlatformIO 头文件路径
- 添加了有用的快捷键

## 使用步骤

### 步骤 1: 安装 clangd
```bash
# Ubuntu/Debian
sudo apt-get install clangd

# macOS
brew install llvm

# 或者通过 Mason 安装（推荐）
:MasonInstall clangd
```

### 步骤 2: 启用配置
1. 确保 `clangd.lua` 文件在正确的目录：`~/.config/nvim/lua/plugins/`
2. 在 `~/.config/nvim/lua/plugins/init.lua` 或类似文件中导入：
   ```lua
   -- 在 plugins 目录中的某个文件添加
   return {
     -- 其他插件...
     { import = "plugins.clangd" },
   }
   ```

### 步骤 3: 生成编译数据库
在 PlatformIO 项目根目录运行：
```bash
pio run --target compiledb
```
这会生成 `compile_commands.json` 文件。

### 步骤 4: 重启 Neovim
```bash
nvim src/main.cpp
```

## 快捷键

- `<leader>cg` - 生成 compile_commands.json
- `<leader>cb` - 构建项目
- `<leader>cu` - 上传到设备

## 验证配置

1. 打开 Neovim：
   ```bash
   nvim src/main.cpp
   ```

2. 检查 LSP 状态：
   ```
   :LspInfo
   ```

3. 测试代码补全：
   - 输入 `digitalWr` 然后按 `<C-x><C-o>`
   - 应该能看到 `digitalWrite` 的补全

4. 测试跳转到定义：
   - 光标放在 `digitalWrite` 上
   - 按 `gd` 或 `gD`

## 故障排除

### 问题 1: clangd 未启动
```
:LspInfo
```
检查 clangd 是否在运行。如果没有：
1. 确保 clangd 已安装
2. 检查 `compile_commands.json` 是否存在

### 问题 2: 头文件未找到
确保 `.clangd` 文件在项目根目录，并且包含正确的路径。

### 问题 3: Mason 未安装 clangd
```
:Mason
```
在 Mason UI 中安装 clangd。

## 手动配置 include 路径

如果不想使用 clangd，可以在 Neovim 中手动设置：

```lua
-- 在 init.lua 或配置文件中添加
vim.opt.path:append({
  "/home/tang/.platformio/packages/framework-arduino-avr/cores/arduino",
  "/home/tang/.platformio/packages/framework-arduino-avr/variants/standard",
  "include",
  "src",
})
```

## 推荐插件

1. **clangd_extensions.nvim** - clangd 扩展功能
2. **nvim-cmp** - 自动补全
3. **telescope.nvim** - 文件搜索和跳转

现在你的 Neovim 应该能够找到 PlatformIO 的头文件了！

