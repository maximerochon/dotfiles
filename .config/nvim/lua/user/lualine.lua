local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
    do
        return
    end
end

local function arduino_status()
    local ft = vim.api.nvim_buf_get_option(0, "ft")
    if ft ~= "arduino" then
        return ""
    end
    local port = vim.fn["arduino#GetPort"]()
    local line = string.format("[%s]", vim.g.arduino_board)
    if vim.g.arduino_programmer ~= "" then
        line = line .. string.format(" [%s]", vim.g.arduino_programmer)
    end
    if port ~= 0 then
        line = line .. string.format(" (%s:%s)", port, vim.g.arduino_serial_baud)
    end
    return line
end

lualine.setup({
    options = {
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
            {
                "%f",
                color = {
                    gui = "bold",
                },
            },
            { arduino_status },
        },
        lualine_x = { "tabnine" },
        lualine_y = { "encoding", "fileformat", "progress" },
        lualine_z = { "filetype" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})

require("nvim-web-devicons").set_icon({
    astro = {
        icon = "",
        color = "#F0DB4F",
        cterm_color = "65",
        name = "Astro",
    },
})
