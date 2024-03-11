--jump
return {
  "smoka7/hop.nvim",
  cmd = { "HopWord", "HopLine", "HopLineStart", "HopWordCurrentLine" },
  opts = { keys = "etovxqpdygfblzhckisuran" },
  keys = {
    { "s", mode = { "n" }, "<CMD> HopWord <CR>", desc = "Hint all words" },
    { "S", mode = { "n" }, "<CMD> HopNodes <CR>", desc = "Hint Tree" },
    { "r", mode = { "n" }, "<CMD> HopLineStart<CR>", desc = "Hint Columns" },
    { "R", mode = { "n" }, "<CMD> HopWordCurrentLine<CR>", desc = "Hint Line" },
  },
}
