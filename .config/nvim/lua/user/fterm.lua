require("FTerm").setup({
    border = "single",
    dimensions = {
        height = 0.9,
        width = 0.9,
    },
})

vim.keymap.set("n", "<C-A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<C-A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
