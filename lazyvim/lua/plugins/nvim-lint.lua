return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      markdownlint = {
        args = { "--disable", "MD013", "--" },
      },
    },
  },
}
