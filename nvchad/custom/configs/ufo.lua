-- {
--   "kevinhwang91/nvim-ufo",
--   event = { "InsertEnter" },
--   init = function()
--     vim.o.foldcolumn = "auto"
--     vim.o.foldlevel = 99 -- Using ufo provider need a large value
--     vim.o.foldlevelstart = 99
--     vim.o.foldnestmax = 0
--     vim.o.foldenable = true
--     vim.o.foldmethod = "indent"
--
--     vim.opt.fillchars = {
--       fold = " ",
--       foldopen = "",
--       foldsep = " ",
--       foldclose = "",
--       stl = " ",
--       eob = " ",
--     }
--   end,
--   dependencies = { "kevinhwang91/promise-async" },
--   opts = {
--
--     preview = {
--       mappings = {
--         scrollB = "<C-b>",
--         scrollF = "<C-f>",
--         scrollU = "<C-u>",
--         scrollD = "<C-d>",
--       },
--     },
--     provider_selector = function(_, filetype, buftype)
--       local function handleFallbackException(bufnr, err, providerName)
--         if type(err) == "string" and err:match "UfoFallbackException" then
--           return require("ufo").getFolds(bufnr, providerName)
--         else
--           return require("promise").reject(err)
--         end
--       end
--
--       return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
--         or function(bufnr)
--           return require("ufo")
--             .getFolds(bufnr, "lsp")
--             :catch(function(err)
--               return handleFallbackException(bufnr, err, "treesitter")
--             end)
--             :catch(function(err)
--               return handleFallbackException(bufnr, err, "indent")
--             end)
--         end
--     end,
--   },
-- },
