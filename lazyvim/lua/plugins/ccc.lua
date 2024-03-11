return {
  "uga-rosa/ccc.nvim",
  event = { "InsertEnter" },
  cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
  keys = {
    { "<leader>tC", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle colorizer" },
    { "<leader>tc", "<cmd>CccConvert<cr>", desc = "Convert color" },
    { "<leader>tp", "<cmd>CccPick<cr>", desc = "Pick Color" },
  },
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  },
  config = function(_, opts)
    require("ccc").setup(opts)
    if opts.highlighter and opts.highlighter.auto_enable then
      vim.cmd.CccHighlighterEnable()
    end
  end,
}
