---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- ["<leader>fc"] = { ":%s/\\v//g<Left><Left>", "Find and Replace text" },
    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
    -- ["<leader>te"] = { "<CMD>ErrorLensToggle<CR>", "󱇭 Toggle error lens" },
    ["<leader>tn"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
    ["<leader>tm"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
    ["<leader>q"] = { "<cmd>confirm q<cr>", "Quit" },
    ["<leader>Q"] = { "<cmd>confirm qall<cr>", "Quit all" },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
  i = {
    ["<C-s>"] = { "<Esc>:w<CR>a", "Save file in Insert" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>gh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },
    ["<leader>gg"] = { "<CMD>LazyGit<CR>", "Open LazyGit" },
  },
}

M.lspconfig = {
  n = {
    --  format with conform
    ["<leader>lm"] = {
      function()
        require("conform").format()
      end,
      "LSP formatting conform",
    },
    -- format with null-Ls
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    ["<leader>lh"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["<leader>lk"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },
    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
    ["<leader>d"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },
  },
}

M.lspsaga = {
  n = {
    ["<leader>Lf"] = { "<CMD>Lspsaga finder def+ref+imp<CR>", "Finder lsp" },
    ["<leader>Ljn"] = { "<CMD>Lspsaga diagnostic_jump_next<CR>", "Jump next diagnostic" },
    ["<leader>Ljp"] = { "<CMD>Lspsaga diagnostic_jump_prev<CR>", "Jump previous diagnostic" },
    ["<leader>Lpd"] = { "<CMD>Lspsaga peek_definition<CR>", "lspsaga peek" },
    ["<leader>Lpt"] = { "<CMD>Lspsaga peek_type_definition<CR>", "lspsaga peek type" },
    ["<leader>Lh"] = { "<CMD>Lspsaga hover_doc<CR>", "lspsaga hover(++keep)" },
  },
}

M.telescope = {
  n = {
    ["<leader>fu"] = { "<CMD>Telescope undo<CR>", "Find undo" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
    ["<leader>gm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>tp"] = { "<cmd> Telescope projects <CR>", "Project" },
    ["<leader>fr"] = { "<cmd>Telescope registers<cr>", "Registers" },
    ["<leader>ft"] = { "<cmd>Telescope autocommands<cr>", "Auto Commands" },
    ["<leader>fc"] = { "<cmd>Telescope command_history<cr>", "Command History" },
    ["<leader>fC"] = { "<cmd>Telescope commands<cr>", "Commands" },
    ["<leader>fd"] = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document diagnostics" },
    ["<leader>fD"] = { "<cmd>Telescope diagnostics<cr>", "Workspace diagnostics" },
  },
}

M.session = {
  n = {
    -- ["<leader>ss"] = { "<CMD>lua require('resession').save() <CR>", "Save Session" },
    -- ["<leader>sl"] = { "<CMD>lua require('resession').load() <CR>", "Load Session" },
    -- ["<leader>sd"] = { "<CMD>lua require('resession').delete() <CR>", "Delete Session" },
    ["<leader>sd"] = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    ["<leader>sl"] = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    ["<leader>sq"] = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
  },
}

M.lazy = {
  n = {
    ["<leader>pi"] = { "<cmd>Lazy install<cr>", "Install plugins" },
    ["<leader>ps"] = { "<cmd>Lazy sync<cr>", "Sync plugins" },
    ["<leader>pu"] = { "<cmd>Lazy update<cr>", "Update plugins" },
  },
}

M.mason = {
  n = {
    ["<leader>li"] = { "<cmd>Mason<cr>", "Mason" },
    ["<leader>lu"] = { "<cmd>MasonUpdate<cr>", "Mason Update" },
    ["<leader>lI"] = { "<cmd>LspInfo<cr>", "Info Lsp" },
  },
}

M.muren = {
  n = {
    ["<leader>fso"] = { "<cmd>lua require('muren.api').toggle_ui()<CR>", "Search and Replace" },
    ["<leader>fss"] = { "<cmd>lua require('muren.api').open_fresh_ui()<CR>", "Search and Replace Fresh" },
    ["<leader>fsc"] = { "<esc><cmd>lua require('muren.api').open_unique_ui()<CR>", "Search and Replace Unique Word" },
  },
}

M.noice = {
  n = {
    ["<S-Enter>"] = { "function() require('noice').redirect(vim.fn.getcmdline()) end", "Redirect Cmdline" },
    ["<leader>ul"] = { "function() require('noice').cmd('last') end", "Noice Last Message" },
    ["<leader>uh"] = { "function() require('noice').cmd('history') end", "Noice History" },
    ["<leader>ua"] = { "function() require('noice').cmd('all') end", "Noice All" },
  },
}

M.NvimColorizeCCC = {
  n = {
    ["<leader>cc"] = { "<cmd>CccHighlighterToggle<cr>", "Toggle colorizer" },
    ["<leader>cv"] = { "<cmd>CccConvert<cr>", "Convert color" },
    ["<leader>cp"] = { "<cmd>CccPick<cr>", "Pick Color" },
  },
}

M.symbolsOutline = {
  n = {
    ["<leader>ts"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
  },
}

M.disabled = {
  n = {
    ["<leader>fm"] = "",
    ["<leader>ca"] = "",
    ["<leader>cm"] = "",
    ["<leader>ch"] = "",
    ["<leader>ma"] = "",
    ["<leader>ra"] = "",
    ["<leader>rh"] = "",
    ["<leader>rn"] = "",
  },
}

-- more keybinds!

return M
