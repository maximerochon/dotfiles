local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = {
        "arduino",
        "astro",
        "awk",
        "bash",
        "c",
        "css",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "graphql",
        "go",
        "gpg",
        "hcl",
        "html",
        "http",
        "java",
        "javascript",
        "jq",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "passwd",
        "pem",
        "php",
        "phpdoc",
        "promql",
        "python",
        "requirements",
        "rust",
        "scss",
        "ssh_config",
        "sql",
        "svelte",
        "terraform",
        "toml",
        "tsx",
        "twig",
        "typescript",
        "vim",
        "vue",
        "xml",
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
