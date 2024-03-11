return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["<leader>t"] = { name = "Lazyvim" },
      ["<leader>sx"] = { name = "Spectra" },
      { ["v]"] = { name = "Next Transitter" } },
      { ["v["] = { name = "Previous Transitter" } },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
