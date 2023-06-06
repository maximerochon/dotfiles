vim.g.arduino_dir = "~/.arduino15"

vim.keymap.set("n", "<leader>aa", "<CMD>ArduinoAttach<CR>")
vim.keymap.set("n", "<leader>am", "<CMD>ArduinoVerify<CR>")
vim.keymap.set("n", "<leader>au", "<CMD>ArduinoUpload<CR>")
vim.keymap.set("n", "<leader>ad", "<CMD>ArduinoUploadAndSerial<CR>")
vim.keymap.set("n", "<leader>ab", "<CMD>ArduinoChooseBoard<CR>")
vim.keymap.set("n", "<leader>ap", "<CMD>ArduinoChooseProgrammer<CR>")
