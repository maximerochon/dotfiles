return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.sections.lualine_a = { "mode" }
      opts.sections.lualine_b = { "branch", "diff" }
      opts.sections.lualine_c = {
        {
          "filename",
          path = 3,
          shorting_target = 170,
        },
        "diagnostics",
      }
      opts.sections.lualine_x = {
        {
          function()
            local ok, vs = pcall(require, "venv-selector")
            if not ok or not vs then
              return ""
            end
            local venv = vs.venv and vs.venv() or ""
            if venv == "" then
              return ""
            end
            return " " .. vim.fn.fnamemodify(venv, ":t")
          end,
          cond = function()
            return vim.bo.filetype == "python"
          end,
          color = { fg = "#3C873A" },
        },
        "filetype",
      }
      opts.sections.lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      }
      opts.sections.lualine_z = { "encoding", "fileformat" }
    end,
  },
}
