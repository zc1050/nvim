-- Lazy
return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first

  config = function()
    require("onedarkpro").setup({
      options = {
        transparency = true,
        lualine_transparence = true,
        terminal_colors = true,
        cursorline = true,
        highlight_inactive_windows = false,
      },
    })
  end,
}
