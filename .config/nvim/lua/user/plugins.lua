local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install plugins
return packer.startup(function(use)
    -- Packer plugins
    use("wbthomason/packer.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")

    -- Completion plugins
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use("saadparwaiz1/cmp_luasnip")

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- Linter
    use("mfussenegger/nvim-lint")

    -- Telescope
    use({ "nvim-telescope/telescope.nvim" })
    use("nvim-telescope/telescope-file-browser.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use("nvim-telescope/telescope-project.nvim")

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter")

    -- Autopairs
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

    -- Surround
    use("kylechui/nvim-surround")

    -- Git
    use("lewis6991/gitsigns.nvim")
    use("f-person/git-blame.nvim")
    use("kdheepak/lazygit.nvim")
    use("ThePrimeagen/git-worktree.nvim")

    -- Tree
    use("nvim-tree/nvim-web-devicons")
    use("nvim-tree/nvim-tree.lua")

    -- Tabline
    use({ "crispgm/nvim-tabline", requires = { "nvim-tree/nvim-web-devicons" } })

    -- Lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })

    -- Terminal
    use("akinsho/toggleterm.nvim")
    use("numToStr/Fterm.nvim")

    -- Formatter
    use("mhartington/formatter.nvim")

    -- Neoclip
    use({ "AckslD/nvim-neoclip.lua", requires = { "kkharji/sqlite.lua", module = "sqlite" } })

    -- Comment
    use("numToStr/Comment.nvim")

    -- Kitty Conf Highlighting
    use("fladson/vim-kitty")

    -- Auto indent detection
    use("tpope/vim-sleuth")

    -- Blank line
    use("lukas-reineke/indent-blankline.nvim")

    -- Emmet
    use("mattn/emmet-vim")

    -- Markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })

    -- Terraform
    use("hashivim/vim-terraform")

    -- Scrollbar
    use("petertriho/nvim-scrollbar")

    -- Colorscheme
    use({ "catppuccin/nvim", as = "catppuccin" })

    -- DAP
    use("mfussenegger/nvim-dap")
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")
    use("nvim-telescope/telescope-dap.nvim")
    use("mfussenegger/nvim-dap-python")

    -- Base64
    use("taybart/b64.nvim")

    -- Arduino
    use({ "stevearc/vim-arduino" })

    -- Tabnine
    use({ "codota/tabnine-nvim", run = "./dl_binaries.sh" })

    -- Icon picker
    use("stevearc/dressing.nvim")
    use({
        "ziontee113/icon-picker.nvim",
        config = function()
            require("icon-picker").setup({
                disable_legacy_commands = true,
            })
        end,
    })

    -- Python venv
    use 'AckslD/swenv.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
