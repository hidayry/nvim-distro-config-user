local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "html",
    "javascript",
    "json",
    "json5",
    "jsonc",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "rasi",
    "regex",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
    "css",
    "scss",
    "xml",
    "yuck",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
  tree_setter = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  vim.filetype.add {
    extension = { rasi = "rasi" },
    pattern = {
      [".*/waybar/config"] = "jsonc",
      [".*/sway/config"] = "bash",
      [".*/mako/config"] = "dosini",
      [".*/kitty/*.conf"] = "bash",
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",

    -- markdown
    -- "markdownlint",
    "marksman",

    -- sh/bash/zsh
    "bashls",
    "shfmt",
    "beautysh",

    -- c/cpp stuff
    -- "clangd",
    -- "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  -- root_dirs = {},
  disable_netrw = false,
  hijack_cursor = false,
  filters = {
    dotfiles = false,
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
  modified = {
    enable = true,
  },
  renderer = {
    root_folder_label = ":t",
    highlight_git = true,
  },
}

M.telescope = {
  extensions_list = {
    "themes",
    "terms",
    "notify",
    "undo",
    "fzf",
    "projects",
    "luasnip",
  },
}

M.blankline = {
  main = "ibl",
  show_trailing_blankline_indent = true,
  show_first_indent_level = true,
  indent = {
    char = "│",
  },
  current_indent = {
    enabled = true,
    show_start = false,
    show_end = false,
  },
  scope = {
    enabled = true,
  },
  whitespace = {
    remove_blankline_trail = true,
  },
  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "nvdash",
    "nvcheatsheet",
    "notify",
    "NvimTree",
    "",
  },
  buftype_exclude = { "terminal", "prompt", "nofile" },
}

M.cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "cmp_yanky" },
  },
}
-- M.comment = {
--   keys = {
--     --   { "gcc", mode = "n", desc = "Comment toggle current line" },
--     --   { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
--     --   { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
--     --   { "gbc", mode = "n", desc = "Comment toggle current block" },
--     --   { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
--     --   { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
--     },
-- }

-- M.nvterm = {
--   terminals = {
--     shell = vim.o.shell,
--     list = {},
--     type_opts = {
--       float = {
--         relative = "editor",
--         row = 0.1,
--         col = 0.1,
--         width = 0.8,
--         height = 0.7,
--         border = "single",
--       },
--       horizontal = { location = "rightbelow", split_ratio = 0.3 },
--       vertical = { location = "rightbelow", split_ratio = 0.25 },
--     },
--   },
--   behavior = {
--     autoclose_on_quit = {
--       enabled = false,
--       confirm = true,
--     },
--     close_on_exit = true,
--     auto_insert = true,
--   },
-- }
return M
