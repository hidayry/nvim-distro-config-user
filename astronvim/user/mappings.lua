-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local utils = require "astronvim.utils"
local get_icon = utils.get_icon

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>z"] = { name = "ColorPicker" },
    -- ["<leader>s"] = { name = get_icon("DiagnosticInfo", 1, true) .. "Notification" },

    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },

    -- swap command keybind
    [";"] = { ":" },
    [":"] = { ";" },

    -- find and replace text
    -- ["<Leader>fg"] = { ":%s/\\v//g<Left><Left>", desc = "Find and Replace text" },
  },

  i = {
    -- quick save
    ["<C-s>"] = { "<Esc>:w<CR>a", desc = "Save File insert" },
  },

  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
