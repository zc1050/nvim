return {
  -- 主插件：Avante AI 助手
  {
    "yetone/avante.nvim",
    build = "make",
    opts = {
      provider = "deepseek",
      -- 设置系统提示，要求始终使用中文输出
      system_prompt = "请始终使用中文进行回复和思考。无论用户使用什么语言提问，你都必须用中文回答。只提供建议，不要对用户文件进行任何更改，除非用户明确要求。",
      providers = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
          max_tokens = 8192,
          -- 使用 thinking 参数启用推理模式
          -- extra_body = {
          --   thinking = {
          --     type = "enabled",
          --   },
          -- },
        },
      },
      -- 自定义快捷方式
      shortcuts = {
        {
          name = "refactor",
          description = "使用最佳实践重构代码",
          details = "自动重构代码以提高可读性、可维护性，并遵循最佳实践，同时保持功能不变",
          prompt = "请按照最佳实践重构此代码，提高可读性和可维护性，同时保持功能不变。",
        },
        {
          name = "test",
          description = "生成单元测试",
          details = "创建全面的单元测试，涵盖边界情况、错误场景和各种输入条件",
          prompt = "请为此代码生成全面的单元测试，涵盖边界情况和错误场景。",
        },
        -- 添加更多自定义快捷方式...
      },
    },
    dependencies = {
      {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = function(_, ft)
          vim.list_extend(ft, { "Avante" })
        end,
      },
      {
        "folke/which-key.nvim",
        opts = {
          spec = {
            { "<leader>a", group = "ai" },
          },
        },
      },
    },
  },

  -- 输入和选择 UI 增强
  {
    "stevearc/dressing.nvim",
    lazy = true,
    opts = {
      input = { enabled = false },
      select = { enabled = false },
    },
  },

  {
    "saghen/blink.cmp",
    optional = true,
    specs = { "Kaiser-Yang/blink-cmp-avante" },
    opts = {
      sources = {
        default = { "avante" },
        providers = { avante = { module = "blink-cmp-avante", name = "Avante" } },
      },
    },
  },
}
