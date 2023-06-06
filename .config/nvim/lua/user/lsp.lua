local lsp_ok, lsp = pcall(require, "lspconfig")
local cmp_ok, cmp = pcall(require, "cmp")
local cmp_lsp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")

local servers = {
    "ansiblels",
    "arduino_language_server",
    "astro",
    "bashls",
    "cssls",
    "dockerls",
    "emmet_ls",
    "eslint",
    "golangci_lint_ls",
    "graphql",
    "html",
    "jsonls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "svelte",
    "tailwindcss",
    "terraformls",
    "tflint",
    "tsserver",
    "vuels",
}

local server_settings = {}

local lsp_flags = {
    debounce_text_changes = 150,
}

-- Mappings.
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>dv", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>dd", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
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

-- capabilities
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
