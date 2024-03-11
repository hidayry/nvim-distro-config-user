local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "marksman", "bashls", "taplo" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
-- lspconfig.bashls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     bash = {
--       format = {
--         enable = true, -- Add any other global variables you want to exclude
--       },
--     },
--   },
-- }
-- settings = {
--             json = {
--               format = {
--                 enable = true,
--               },
--               validate = { enable = true },
--             },
--           },
--yamlls = {
--   capabilities = {
--     textDocument = {
--       foldingRange = {
--         dynamicRegistration = false,
--         lineFoldingOnly = true,
--       },
--     },
--   },
-- {
--     "b0o/SchemaStore.nvim",
--     lazy = true,
--     version = false, -- last release is way too old
--   },
--   -- lazy-load schemastore when needed
--   on_new_config = function(new_config)
--     new_config.settings.yaml.schemas = vim.tbl_deep_extend(
--       "force",
--       new_config.settings.yaml.schemas or {},
--       require("schemastore").yaml.schemas()
--     )
--   end,
--   settings = {
--     redhat = { telemetry = { enabled = false } },
--     yaml = {
--       keyOrdering = false,
--       format = {
--         enable = true,
--       },
--       validate = true,
--       schemaStore = {
--         -- Must disable built-in schemaStore support to use
--         -- schemas from SchemaStore.nvim plugin
--         enable = false,
--         -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
--         url = "",
--       },
--     },
--   },
-- },
-- vim.lsp.handlers["textDocument/hover"] = require("noice").hover
-- vim.lsp.handlers["textDocument/signatureHelp"] = require("noice").signature
