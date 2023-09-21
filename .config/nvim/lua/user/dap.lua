local dap = require("dap")

local dap_virtual_text = require("nvim-dap-virtual-text")
dap_virtual_text.setup()

local dap_python = require("dap-python")
dap_python.setup()

dap.adapters.python = {
    type = "executable",
    command = "/usr/local/bin/python3",
    args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",

        program = "${file}",
        pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                return cwd .. "/.venv/bin/python"
            else
                return "/usr/local/bin/python3"
            end
        end,
    },
}

local dapui = require("dapui")
dapui.setup()

vim.keymap.set("n", "<leader>bb", "<CMD>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>br", "<CMD>lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>bc", "<CMD>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<F9>", "<CMD>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", "<CMD>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F11>", "<CMD>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F12>", "<CMD>lua require'dap'.step_out()<CR>")

vim.keymap.set("n", "<leader>dm", "<CMD>lua require'dap-python'.test_method()<CR>")
vim.keymap.set("n", "<leader>dc", "<CMD>lua require'dap-python'.test_class()<CR>")
vim.keymap.set("n", "<leader>ds", "<CMD>lua require'dap-python'.debug_selection()<CR>")

vim.keymap.set("v", "<leader>de", "<CMD>lua require'dapui'.eval()<CR>")
