return {
  "codota/tabnine-nvim",
  build = "./dl_binaries.sh",
  opts = {
    disable_auto_comment = true,
    accept_keymap = "<C-q>",
    dismiss_keymap = "<C-w>",
    debounce_ms = 800,
    suggestion_color = { gui = "#808080", cterm = 244 },
    exclude_filetypes = { "TelescopePrompt" },
    log_file_path = nil,
  },
  config = function(_, opts)
    require("tabnine").setup(opts)

    -- Manual trigger for Tabnine inline completion
    vim.keymap.set("i", "<C-Space>", function()
      vim.cmd("TabnineRefresh")
    end, { desc = "Tabnine: Refresh suggestion" })

    -- Open Tabnine Chat
    vim.keymap.set("n", "<leader>ai", function()
      vim.cmd("TabnineChat")
    end, { desc = "Tabnine: Open Chat" })
  end,
}
