local options = {
  under_cursor = true,
  max_file_lines = nil,
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  filetypes_denylist = {
    "NvimTree",
    "Trouble",
    "Outline",
    "TelescopePrompt",
    "Empty",
    "dirvish",
    "fugitive",
    "alpha",
    "packer",
    "neogitstatus",
    "spectre_panel",
    "toggleterm",
    "DressingSelect",
    "aerial",
  },
  delay = 200,
  large_file_cutoff = 2000,
  large_file_overrides = {
    providers = { "lsp" },
  },
  keys = {
    { "]]", desc = "Next Reference" },
    { "[[", desc = "Prev Reference" },
  },
}
return options
