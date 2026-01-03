return {
  {
    "catppuccin/nvim",
    priority = 150,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({

        transparent_background = true, -- disables setting the background color.
        float = {
          transparent = true,
          solid = true,
        },

        color_overrides = {
          mocha = {
            -- Solarized Osaka 颜色映射
            -- 背景和文本颜色（基于 Solarized dark）
            base = "#002b36",        -- base03: 主背景
            mantle = "#073642",      -- base02: 次要背景
            crust = "#00212b",       -- 比 base03 稍暗

            -- 文本颜色
            text = "#839496",        -- base0: 主体文本
            subtext1 = "#93a1a1",    -- base1: 强调文本
            subtext0 = "#657b83",    -- base00: 默认文本
            overlay2 = "#586e75",    -- base01: 注释/次要文本
            overlay1 = "#073642",    -- base02: 高亮背景
            overlay0 = "#002b36",    -- base03: 背景

            -- 表面颜色
            surface2 = "#073642",    -- base02
            surface1 = "#002b36",    -- base03
            surface0 = "#00212b",    -- 自定义深色

            -- 强调色（基于 Solarized 调色板）
            rosewater = "#dc322f",   -- red
            flamingo = "#dc322f",    -- red
            red = "#dc322f",         -- red
            maroon = "#cb4b16",      -- orange

            pink = "#d33682",        -- magenta
            mauve = "#6c71c4",       -- violet

            peach = "#cb4b16",       -- orange
            yellow = "#b58900",      -- yellow

            green = "#859900",       -- green
            teal = "#2aa198",        -- cyan
            sky = "#2aa198",         -- cyan
            sapphire = "#2aa198",    -- cyan

            blue = "#268bd2",        -- blue
            lavender = "#6c71c4",    -- violet
          },
        },
        integrations = {
          barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
          cmp = true,
          gitsigns = true,
          hop = true,
          illuminate = { enabled = true },
          native_lsp = { enabled = true, inlay_hints = { background = true } },
          neogit = true,
          neotree = true,
          semantic_tokens = true,
          treesitter = true,
          treesitter_context = true,
          vimwiki = true,
          which_key = true,
          aerial = true,
          fidget = true,
          mason = true,
          neotest = true,
          dap_ui = true,
          telescope = {
            enabled = true,
            style = "nvchad",
          },
        },
      })
      vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "none", fg = "#93a1a1" })
      vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "none", fg = "#93a1a1" })
      vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "none", fg = "#93a1a1" })
    end,
  },
}
