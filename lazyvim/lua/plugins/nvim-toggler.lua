return {
  "nguyenvukhang/nvim-toggler",
  event = { "InsertEnter" },
  -- keys = {
  --   {
  --     "<leader>ti",
  --     desc = "Toggle Invert Text",
  --   },
  -- },
  opts = {
    -- your own inverses
    inverses = {
      ["previous"] = "next",
    },
    -- removes the default <leader>i keymap
    remove_default_keybinds = true,
    -- removes the default set of inverses
    -- remove_default_inverses = true,
  },
  keys = {
    { "<leader>i", mode = { "n", "v" }, "<CMD>lua require('nvim-toggler').toggle()<CR>", desc = "Toggle Invert Text" },
  },
}
