-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- save
-- vim.keymap.set("n", "<c-s>", ":w<CR>")
-- vim.keymap.set("i", "<c-s>", "<Esc>:w<CR>a")

-- cmd
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")
-- vim.keymap.set('n', '<Leader>lg', [[:%s/\v//g<Left><Left>]],
--   { desc = "Find and Replace text", noremap = true, silent = true })

--Home
vim.keymap.set("n", "<Leader>h", ":Alpha<CR>", { desc = "Home Screen" })

--Spectre
vim.keymap.set("n", "<leader>sxt", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>sxc", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
vim.keymap.set("v", "<leader>sxC", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
vim.keymap.set("n", "<leader>sxf", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})
