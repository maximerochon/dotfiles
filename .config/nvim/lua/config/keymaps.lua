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
