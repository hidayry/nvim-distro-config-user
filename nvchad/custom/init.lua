-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
-- local vim = require "vim"

--#hihglight themes
dofile(vim.g.base46_cache .. "hop")
dofile(vim.g.base46_cache .. "notify")
dofile(vim.g.base46_cache .. "lspsaga")
dofile(vim.g.base46_cache .. "rainbowdelimiters")

--Autocmd
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})

-- vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
--   callback = function()
--     local lint_status, lint = pcall(require, "lint")
--     if lint_status then
--       lint.try_lint()
--     end
--   end,
-- })

--session
-- vim.api.nvim_create_autocmd("VimLeavePre", {
--   callback = function()
--     -- Always save a special session named "last"
--     require("resession").save "last"
--   end,
-- })
