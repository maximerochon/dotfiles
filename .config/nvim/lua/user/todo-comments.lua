require("todo-comments").setup({
    keywords = {
        FIX = {
            icon = " ",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
    },
})

vim.keymap.set("n", "<leader>td", "<CMD>TodoTelescope<CR>")
vim.keymap.set("n", "<leader>tl", "<CMD>TodoLocList<CR>")
vim.keymap.set("n", "<leader>tp", '<CMD>lua require("todo-comments").jump_prev()<CR>')
vim.keymap.set("n", "<leader>tn", '<CMD>lua require("todo-comments").jump_next()<CR>')
