-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  NvimTreeGitIgnored = { fg = "green" },
  NvimTreeGitIgnoredIcon = { fg = "blue" },
  NvimTreeGitNew = { fg = "green" },
  NvimTreeGitDirty = { fg = "yellow" },
  NvimTreeGitDeleted = { fg = "red" },
  NvDashAscii = { fg = "#061115", bg = "red" },
  Visual = { fg = "none", bg = "#3c1111" },
  -- DevIconGitIgnore = { fg = "yellow" },
  -- IndentBlanklineContextStart = { bg = "none" },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
