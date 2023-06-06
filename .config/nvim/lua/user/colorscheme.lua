local colorscheme = "catppuccin-mocha"

require("catppuccin").setup({
    transparent_background = true,
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.cmd("colorscheme default")
end
