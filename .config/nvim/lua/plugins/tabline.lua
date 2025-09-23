return {
  -- Disable bufferline
  { "akinsho/bufferline.nvim", enabled = false },

  -- Enable Vim's built-in tabline
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.section_separators = ""
      opts.options.component_separators = ""
      opts.options.icons_enabled = true
      opts.options.theme = "auto"

      -- Enable tabline
      opts.tabline = {
        lualine_a = {
          {
            "tabs",
            mode = 2,
          },
        },
      }

      vim.o.showtabline = 2
    end,
  },
}
