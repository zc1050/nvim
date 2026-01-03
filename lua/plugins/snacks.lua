return {
  "folke/snacks.nvim",
  opts = {
    styles = {
      terminal = {
        relative = "editor",
        border = "rounded",
        position = "float",
        backdrop = 95,
        height = 0.75,
        width = 0.8,
        zindex = 50,
      },
    },
    picker = {
      sources = {
        explorer = {
          layout = {
            layout = {
              width = 25,
            },
          },
        },
      },
    },
  },
}
