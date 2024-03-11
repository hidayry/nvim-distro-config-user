return {
  "AckslD/muren.nvim",
  config = true,
  cmd = { "MurenToggle", "MurenFresh", "MurenUnique" },
  keys = {
    { "<leader>ts", "<cmd>lua require('muren.api').toggle_ui()<CR>", desc = "Search and Replace" },
    { "<leader>tS", "<cmd>lua require('muren.api').open_fresh_ui()<CR>", desc = "Search and Replace Fresh" },
    {
      "<leader>tU",
      "<esc><cmd>lua require('muren.api').open_unique_ui()<CR>",
      desc = "Search and Replace Unique Word",
    },
  },
}
