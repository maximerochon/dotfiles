local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = {
        "vim",
        "astro",
        "bash",
        "c",
        "css",
        "dockerfile",
        "go",
        "hcl",
        "html",
        "javascript",
        "java",
        "json",
        "jsonc",
        "jq",
        "lua",
        "markdown",
        "markdown_inline",
        "pug",
        "php",
        "python",
        "rust",
        "scss",
        "sql",
        "terraform",
        "tsx",
        "typescript",
        "yaml",
    },
    ignore_install = { "phpdoc" },
    highlight = {
        enable = true,
        disable = { "css" },
    },
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    indent = { enable = true, disable = { "python", "css", "yaml" } },
})
