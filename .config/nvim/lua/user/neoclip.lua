local neoclip_ok, neoclip = pcall(require, "neoclip")

if neoclip_ok then
    neoclip.setup({
        history = 100,
        enable_persistent_history = true,
        continuous_sync = true,
        db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
        default_register = { '"', "+", "*" },
        on_select = {
            move_to_front = true,
            close_telescope = true,
        }
    })
end
