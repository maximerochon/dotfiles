return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          -- Override <C-t> to open selection in a new tab
          ["<C-t>"] = function(...)
            return require("telescope.actions").select_tab(...)
          end,
        },
        n = {
          ["<C-t>"] = function(...)
            return require("telescope.actions").select_tab(...)
          end,
        },
      },
    },
  },
}
