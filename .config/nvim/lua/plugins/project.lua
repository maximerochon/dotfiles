return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-project.nvim",
    },
    opts = function(_, opts)
      opts.extensions = vim.tbl_deep_extend("force", opts.extensions or {}, {
        project = {
          base_dirs = {
            "~/projects",
          },
          hidden_files = true,
          theme = "dropdown",
          order_by = "recent",
        },
      })
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("project")
    end,
    keys = {
      { "<leader>fp", "<cmd>Telescope project<cr>", desc = "Find Project" },
    },
  },
}
