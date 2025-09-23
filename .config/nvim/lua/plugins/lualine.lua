return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_c, {
      swenv,
      cond = function()
        return vim.bo.filetype == "python"
      end,
      color = { fg = "#ff8800" },
    })
  end,
}
