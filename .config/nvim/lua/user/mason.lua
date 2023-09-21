require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup {
    ensure_installed = {
        "angularls",
        "ansiblels",
        "arduino_language_server",
        "astro",
        "awk_ls",
        "bashls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "emmet_ls",
        "eslint",
        "golangci_lint_ls",
        "gradle_ls",
        "grammarly",
        "graphql",
        "helm_ls",
        "html",
        "jqls",
        "jsonls",
        "lua_ls",
        "lemminx",
        "mdx_analyzer",
        "phpactor",
        "powershell_es",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "svelte",
        "tailwindcss",
        "terraformls",
        "tflint",
        "tsserver",
        "vale_ls",
        "vimls",
        "vuels",
        "yamlls",
    },
    automatic_installation = true,
}
