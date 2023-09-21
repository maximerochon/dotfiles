require("lint").linters_by_ft = {
    ansible = { "ansible_lint" },
    bash = { "shellcheck" },
    css = { "stylelint" },
    docker = { "hadolint" },
    go = { "golangcilint" },
    javascript = { "eslint_d" },
    jinja = { "djlint" },
    json = { "jsonlint" },
    lua = { "luacheck" },
    markdown = { "vale" },
    php = { "phpcs" },
    python = { "pylint" },
    scss = { "stylelint" },
    sql = { "sqlfluff" },
    vim = { "vint" },
    yaml = { "yamllint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
