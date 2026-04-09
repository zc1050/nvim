return {
  "nvim-lualine/lualine.nvim",
  -- enabled = false,
  config = function()
    local icons = LazyVim.config.icons

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local mode = {
      "mode",
      fmt = function(str)
        return " " .. str
        -- return " " .. str:sub(1, 1) -- displays only the first character of the mode
      end,
    }

    local lsp_status = {
      function()
        local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
        if #buf_clients == 0 then
          return "LSP Inactive"
        end

        local buf_client_names = {}

        for _, client in pairs(buf_clients) do
          table.insert(buf_client_names, client.name)
        end

        local unique_client_names = table.concat(buf_client_names, ", ")
        local language_servers = string.format("[%s]", unique_client_names)

        return language_servers
      end,
      cond = hide_in_width,
    }

    local filetype = {
      "filetype",
      icon_only = true,
      separator = "",
      padding = { left = 1, right = 0 },
    }

    local fileformat = {
      "fileformat",
      cond = hide_in_width,
    }

    local filename = {
      "filename",
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
      padding = { left = 0, right = 1 },
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info", "hint" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      colored = true,
      update_in_insert = true,
      always_visible = false,
      -- cond = hide_in_width,
    }

    local encoding = {
      "encoding",
      colored = true,
      padding = { left = 1, right = 1 },
      cond = hide_in_width,
    }

    local diff = {
      "diff",
      symbols = { added = icons.git.added, modified = icons.git.modified, removed = icons.git.removed },
      source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end,
      cond = hide_in_width,
    }

    local dap_status = {
      function()
        return "  " .. require("dap").status()
      end,
      cond = function()
        return package.loaded["dap"] and require("dap").status() ~= ""
      end,
      color = function()
        return { fg = Snacks.util.color("Debug") }
      end,
    }

    local copilot = LazyVim.lualine.status(LazyVim.config.icons.kinds.Copilot, function()
      local clients = package.loaded["copilot"] and vim.lsp.get_clients({ name = "copilot", bufnr = 0 }) or {}
      if #clients > 0 then
        local status = require("copilot.status").data.status
        return (status == "InProgress" and "pending") or (status == "Warning" and "error") or "ok"
      end
    end)

    require("lualine").setup({
      options = {
        icons_enabled = true,
        -- theme = "solarized_dark", -- Set theme based on environment variable

        theme = "auto", -- Set theme based on environment variable
        -- Some useful glyphs:
        -- https://www.nerdfonts.com/cheat-sheet
        --        
        section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "neo-tree" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { "branch" },
        lualine_c = {
          -- LazyVim.lualine.root_dir(),
          filetype,
          -- filename,
          { LazyVim.lualine.pretty_path(), padding = { left = 0, right = 1 } },
        },
        lualine_x = {
          dap_status,
          diagnostics,
          diff,
          copilot,
          lsp_status,
          encoding,
          -- fileformat,
          "filetype",
        },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { { "location", padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive", "avante" },
    })
  end,
}
