local formatter_ok, formatter = pcall(require, "formatter")

if not formatter_ok then
    do
        return
    end
end

formatter.setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        css = {
            require("formatter.filetypes.css").prettier,
        },
        go = {
            require("formatter.filetypes.go").goimports,
        },
        graphql = {
            require("formatter.filetypes.graphql").prettier,
        },
        html = {
            require("formatter.filetypes.html").prettier,
        },
        javascript = {
            require("formatter.filetypes.javascript").prettier,
        },
        javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettier,
        },
        json = {
            require("formatter.filetypes.json").prettier,
        },
        lua = {
            require("formatter.filetypes.lua").stylua,
        },
        markdown = {
            require("formatter.filetypes.markdown").prettier,
        },
        php = {
            require("formatter.filetypes.php").phpcbf,
        },
        python = {
            require("formatter.filetypes.python").autopep8,
        },
        sh = {
            require("formatter.filetypes.sh").shfmt,
        },
        svelte = {
            require("formatter.filetypes.svelte"),
        },
        typescript = {
            require("formatter.filetypes.typescript").prettier,
        },
        typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier,
        },
        vue = {
            require("formatter.filetypes.vue").prettier,
        },
        yaml = {
            require("formatter.filetypes.yaml").prettier,
        },
    },
})
