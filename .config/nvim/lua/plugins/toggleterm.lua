return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return vim.o.lines * 0.4
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = nil,
    hide_numbers = true,
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,

    float_opts = {
      border = "single",
      width = function()
        return math.floor(vim.o.columns * 0.8)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.8)
      end,
      winblend = 10,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },

    winbar = {
      enabled = false,
    },
  },

  config = function(_, opts)
    require("toggleterm").setup(opts)

    local Terminal = require("toggleterm.terminal").Terminal

    local main_term = Terminal:new({
      direction = "float",
      hidden = true,
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
    })

    local opencode_term = Terminal:new({
      cmd = "opencode",
      direction = "float",
      hidden = true,
      close_on_exit = false,
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
    })

    _G.toggle_main_term = function()
      main_term:toggle()
    end

    _G.toggle_opencode_term = function()
      opencode_term:toggle()
    end

    local map = vim.keymap.set

    map("n", "<leader>tt", "<cmd>lua toggle_main_term()<CR>", { desc = "Toggle terminal", silent = true })
    map(
      "n",
      "<leader>th",
      "<cmd>ToggleTerm direction=horizontal<CR>",
      { desc = "Toggle horizontal term", silent = true }
    )
    map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle vertical term", silent = true })

    map("n", "<leader>ao", "<cmd>lua toggle_opencode_term()<CR>", { desc = "OpenCode terminal", silent = true })

    map("t", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Go to left window", silent = true })
    map("t", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Go to down window", silent = true })
    map("t", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Go to up window", silent = true })
    map("t", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Go to right window", silent = true })
    map("t", "<C-Left>", "<Cmd>wincmd h<CR>", { desc = "Go to left window", silent = true })
    map("t", "<C-Down>", "<Cmd>wincmd j<CR>", { desc = "Go to down window", silent = true })
    map("t", "<C-Up>", "<Cmd>wincmd k<CR>", { desc = "Go to up window", silent = true })
    map("t", "<C-Right>", "<Cmd>wincmd l<CR>", { desc = "Go to right window", silent = true })

    map("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode", silent = true })
  end,
}
