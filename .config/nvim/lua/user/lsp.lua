local lsp_ok, lsp = pcall(require, "lspconfig")
local cmp_ok, cmp = pcall(require, "cmp")
local cmp_lsp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")

local servers = {
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
    "vimls",
    "vuels",
    "yamlls",
}

local server_settings = {}

local lsp_flags = {
    debounce_text_changes = 150,
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>dv", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>dd", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.default_capabilities(capabilities)

for _, server in pairs(servers) do
    if server == "rust_analyzer" then
        lsp["rust_analyzer"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = {
                "rustup",
                "run",
                "stable",
                "rust-analyzer",
            },
        })
    elseif server == "arduino_language_server" then
        lsp["arduino_language_server"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = {
                "arduino-language-server",
                "-cli-config",
                "~/.arduino15/arduino-cli.yaml",
                "-fqbn",
                "arduino:avr:uno",
                "-cli",
                "arduino-cli",
                "-clangd",
                "clangd",
            },
        })
    else
        lsp[server].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = server_settings[server],
            flags = lsp_flags,
        })
    end
end
