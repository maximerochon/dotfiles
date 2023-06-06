local Terminal = require("toggleterm.terminal").Terminal

require("toggleterm").setup({
    open_mapping = [[<C-t>]],
    direction = "float",
    float_opts = {
        border = "double",
    },
})

-- Docker
local docker_tui = "lazydocker"

local docker_client = Terminal:new({
    cmd = docker_tui,
    dir = "git_dir",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "double",
    },
})

function docker_client_toggle()
    docker_client:toggle()
end

vim.keymap.set("n", "<leader>do", "<CMD>lua docker_client_toggle()<CR>")
