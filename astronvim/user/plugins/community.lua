local utils = require "astronvim.utils"
local get_icon = utils.get_icon

return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.color.ccc-nvim" },
  { import = "astrocommunity.color.headlines-nvim" },
  { import = "astrocommunity.lsp.garbage-day-nvim" },
  {
    "garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      aggressive_mode = true,
    },
  },
  { import = "astrocommunity.utility.noice-nvim" },
  {
    "noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        progress = { enabled = false },
      },
    },
  },
  { import = "astrocommunity.utility.nvim-toggler" },
  { import = "astrocommunity.split-and-window.edgy-nvim" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.project.nvim-spectre" },
  { import = "astrocommunity.bars-and-lines.heirline-mode-text-statusline" },
  -- { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  -- {
  --   "lualine.nvim",
  --   opts = {
  --     options = {
  --       theme = "auto",
  --       globalstatus = true,
  --       component_separators = { left = "┃", right = "┃" },
  --       section_separators = { left = "", right = "" },
  --       disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
  --     },
  --     sections = {
  --       lualine_a = {
  --         { "mode", separator = { left = "" }, right_padding = 2 },
  --         {
  --           "fileformat",
  --           symbols = {
  --             unix = "", -- e712
  --             dos = "", -- e70f
  --             mac = "", -- e711
  --           },
  --           separator = { right = "" },
  --           right_padding = 2,
  --         },
  --       },
  --       lualine_b = {
  --         { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
  --         {
  --           "filename",
  --           file_status = true,
  --           symbols = {
  --             modified = get_icon "FileModified", -- Text to show when the file is modified.
  --             readonly = get_icon "FileReadOnly", -- Text to show when the file is non-modifiable or readonly.
  --             unnamed = "[No Name]", -- Text to show for unnamed buffers.
  --             newfile = get_icon "FileNew", -- Text to show for newly created file before first write
  --           },
  --         },
  --         { "branch", on_click = function() require("telescope.builtin").git_branches { use_file_path = true } end },
  --         {
  --           "diff",
  --           symbols = {
  --             added = get_icon "GitAdd" .. " ",
  --             modified = get_icon "GitChange" .. " ",
  --             removed = get_icon "GitDelete" .. " ",
  --           },
  --           on_click = function() require("telescope.builtin").git_status { use_file_path = true } end,
  --         }, -- Changes the symbols used by the diff.
  --       },
  --       lualine_c = {
  --         {
  --           "filename",
  --           file_status = true,
  --           path = 1,
  --           symbols = {
  --             modified = " ", -- Text to show when the file is modified.
  --             readonly = " ", -- Text to show when the file is non-modifiable or readonly.
  --             unnamed = " ", -- Text to show for unnamed buffers.
  --             newfile = " ", -- Text to show for newly created file before first write
  --           },
  --         },
  --       },
  --       lualine_x = {
  --         {
  --           "diagnostics",
  --           symbols = {
  --             error = get_icon "DiagnosticError" .. " ",
  --             warn = get_icon "DiagnosticWarn" .. " ",
  --             info = get_icon "DiagnosticInfo" .. " ",
  --             hint = get_icon "DiagnosticHint" .. " ",
  --           },
  --           colored = true,
  --           on_click = function() require("telescope.builtin").diagnostics() end, -- Displays diagnostics status in color if set to true.
  --         },
  --       },
  --       lualine_y = {
  --         { "filetype", on_click = function() vim.cmd.LspInfo() end },
  --         { "progress" },
  --         { "location" },
  --       },
  --       lualine_z = {
  --         {
  --           function() return " " .. os.date "%R" end,
  --           separator = { right = "", left = "" },
  --           left_padding = 2,
  --         },
  --       },
  --     },
  --     inactive_sections = {
  --       lualine_a = { "filename" },
  --       lualine_b = {},
  --       lualine_c = {},
  --       lualine_x = {},
  --       lualine_y = {},
  --       lualine_z = { "location" },
  --     },
  --     extensions = {}, --[[ "neo-tree", "lazy", "mason", "fzf"  ]]
  --   },
  -- },
  -- { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  -- {
  --   "vim-illuminate",
  --   event = "User AstroFile",
  --   opts = {
  --     delay = 200,
  --     large_file_cutoff = 2000,
  --     large_file_overrides = {
  --       providers = { "lsp" },
  --     },
  --   },
  --   config = function(_, opts)
  --     require("illuminate").configure(opts)
  --
  --     local function map(key, dir, buffer)
  --       vim.keymap.set(
  --         "n",
  --         key,
  --         function() require("illuminate")["goto_" .. dir .. "_reference"](false) end,
  --         { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer }
  --       )
  --     end
  --
  --     map("]]", "next")
  --     map("[[", "prev")
  --
  --     -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
  --     vim.api.nvim_create_autocmd("FileType", {
  --       callback = function()
  --         local buffer = vim.api.nvim_get_current_buf()
  --         map("]]", "next", buffer)
  --         map("[[", "prev", buffer)
  --       end,
  --     })
  --   end,
  --   keys = {
  --     { "]]", desc = "Next Reference" },
  --     { "[[", desc = "Prev Reference" },
  --   },
  -- },
  --{ import = "astrocommunity.colorscheme.monokai-pro-nvim" },
  --{ import = "astrocommunity.colorscheme.mellow-nvim" },
  --{ import = "astrocommunity.completion.codeium-vim" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  {
    "glow.nvim",
    opts = {
      border = "single", -- floating window border config
      -- style = "dark|light", -- filled automatically with your current editor background, you can override using glow json style
      pager = false,
      width = 800,
      height = 400,
      width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
      height_ratio = 0.8,
    },
  },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
}
