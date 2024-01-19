require("git-worktree").setup({
    change_directory_command = "cd",
    update_on_change = true,
    update_on_change_command = "e .",
    clearjumps_on_change = true,
    autopush = false,
})

vim.keymap.set("n", "<leader>gw", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
