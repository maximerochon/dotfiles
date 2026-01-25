-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Better tab navigation
map("n", "<Tab>", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<S-Tab>", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close tab" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close tab" })

-- Move text up and down
map("n", "<A-Down>", ":m .+1<CR>==")
map("n", "<A-Up>", ":m .-2<CR>==")
map("v", "<A-Down>", ":move '>+1<CR>gv-gv")
map("v", "<A-Up>", ":move '<-2<CR>gv-gv")

-- Window navigation with Ctrl+Arrow keys
map("n", "<C-Left>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-Right>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-Up>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-Down>", "<C-w>j", { desc = "Move to lower window" })

-- Window resizing with Alt+Shift+Arrow keys
map("n", "<A-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<A-S-Up>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-S-Down>", "<cmd>resize +2<cr>", { desc = "Increase window height" })

-- Tab key
map("i", "<S-Tab>", "<C-d>")
map("v", "<S-Tab>", "<gv")
map("v", "<Tab>", ">gv")
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Terminal
map("t", "<leader><leader>", "<C-\\><C-n>", { silent = true })
map("t", "<leader><leader>q", "<C-\\><C-n><CMD>close<CR>", { silent = true })

local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- Grep Notes
vim.keymap.set("n", "<leader>dn", function()
  builtin.live_grep({
    hidden = true,
    search_dirs = { "~/notes/" },
    prompt_prefix = "   ",
    prompt_title = " Grep Notes",
    path_display = { "smart" },
  })
end, { desc = "Notes: Grep" })

-- Browse Notes
vim.keymap.set("n", "<leader>dN", function()
  telescope.extensions.file_browser.file_browser({
    prompt_title = " Browse Notes",
    prompt_prefix = " ﮷ ",
    cwd = "~/notes/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  })
end, { desc = "Notes: Browse" })
