return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { "kkharji/sqlite.lua", module = "sqlite" },
    { "nvim-telescope/telescope.nvim" },
  },
  config = function()
    require("neoclip").setup({
      history = 1000,
      enable_persistent_history = true,
      db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
      filter = nil,
      keys = {
        telescope = {
          i = {
            select = "<cr>",
            paste = "<c-p>",
            paste_behind = "<c-k>",
            replay = "<c-q>",
            delete = "<c-d>",
            custom = {},
          },
        },
      },
    })
    require("telescope").load_extension("neoclip")
    vim.keymap.set("n", "<leader>y", "<cmd>Telescope neoclip<cr>", {
      desc = "Clipboard history (neoclip)",
    })
  end,
}
