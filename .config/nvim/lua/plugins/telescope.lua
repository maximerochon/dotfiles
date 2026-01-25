return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          -- Insert mode mappings
          ["<C-t>"] = function(...)
            return require("telescope.actions").select_tab(...)
          end,
          ["<C-x>"] = function(...)
            return require("telescope.actions").select_horizontal(...)
          end,
          ["<C-v>"] = function(...)
            return require("telescope.actions").select_vertical(...)
          end,
        },
        n = {
          -- Normal mode mappings
          ["<C-t>"] = function(...)
            return require("telescope.actions").select_tab(...)
          end,
          ["<C-x>"] = function(...)
            return require("telescope.actions").select_horizontal(...)
          end,
          ["<C-v>"] = function(...)
            return require("telescope.actions").select_vertical(...)
          end,
        },
      },
    },
  },
}
