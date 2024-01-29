require('spectre').setup()

vim.keymap.set('n', '<leader>S', '<CMD>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<CMD>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<ESC><CMD>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<CMD>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})