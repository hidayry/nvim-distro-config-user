-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- custom mappings
lvim.keys.normal_mode["<c-s>"] = ":w<CR>"
lvim.keys.insert_mode["<c-s>"] = "<Esc>:w<CR>a"
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")
-- lvim.builtin.which_key.mappings["sg"] = { ":%s/\\v//g<Left><Left>", "Find and Replace text" }
lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- colorscheme
lvim.colorscheme = "catppuccin"

-- custom plugins
lvim.plugins = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
  },
  {
    "nguyenvukhang/nvim-toggler",
    event = { "InsertEnter" },
    keys = {
      {
        "<leader>i",
        desc = "Toggle CursorWord",
      },
    },
    opts = {},
  },
  {
    "nvim-pack/nvim-spectre",
    event = "BufRead",
    cmd = "Spectre",
    config = function()
      require("spectre").setup({
        opts = { open_cmd = "noswapfile vnew" },
      })
    end,
    keys = {
      {
        "<leader>sz",
        function()
          require("spectre").open()
        end,
        desc = "Replace in files (Spectre)",
      },
      {
        "<leader>sx",
        function()
          require("spectre").open_file_search()
        end,
        desc = "Spectre (current file)",
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,    -- use a classic bottom cmdline for search
          command_palette = true,  -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,      -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,  -- add a border to hover docs and signature help
        },
      })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",    mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",    mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",    mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",    mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-n", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
  },

  -- better vim.ui
  {
    "stevearc/dressing.nvim",
    opts = {},
  },

  {
    "echasnovski/mini.indentscope",
    event = { "bufreadpre", "bufnewfile" },
    opts = {
      options = { --[[ border = "top", ]]
        try_as_border = true,
      },
      symbol = "▏",
    },
    config = function(_, opts)
      require("mini.indentscope").setup(opts)

      -- Disable for certain filetypes
      vim.api.nvim_create_autocmd({ "FileType" }, {
        desc = "Disable indentscope for certain filetypes",
        callback = function()
          local ignore_filetypes = {
            "aerial",
            "dashboard",
            "help",
            "lazy",
            "alpha",
            "leetcode.nvim",
            "mason",
            "neo-tree",
            "NvimTree",
            "neogitstatus",
            "notify",
            "startify",
            "toggleterm",
            "Trouble",
          }
          if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.b.miniindentscope_disable = true
          end
        end,
      })
    end,
  },

  {
    "echasnovski/mini.surround",
    version = false,
    config = function()
      require("mini.surround").setup({
        mappings = {
          add = "gua",       -- Add surrounding in Normal and Visual modes
          delete = "gud",    -- Delete surrounding
          find = "guf",      -- Find surrounding (to the right)
          find_left = "guF", -- Find surrounding (to the left)
          highlight = "guh", -- Highlight surrounding
          replace = "gur",   -- Replace surrounding
          update_n_lines = "gun", -- Update `n_lines`
        },
      })
    end,
  },

  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            "class",
            "function",
            "method",
          },
        },
      })
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    event = { "InsertEnter" },
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
    keys = {
      { "<leader>uC", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle colorizer" },
      { "<leader>uc", "<cmd>CccConvert<cr>",           desc = "Convert color" },
      { "<leader>up", "<cmd>CccPick<cr>",              desc = "Pick Color" },
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
  },
  {
    "lukas-reineke/headlines.nvim",
    opts = function()
      local opts = {}
      for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
        opts[ft] = {
          headline_highlights = {},
        }
        for i = 1, 6 do
          local hl = "Headline" .. i
          vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
          table.insert(opts[ft].headline_highlights, hl)
        end
      end
      return opts
    end,
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      -- PERF: schedule to prevent headlines slowing down opening a file
      vim.schedule(function()
        require("headlines").setup(opts)
        require("headlines").refresh()
      end)
    end,
  },
  {
    "mrjones2014/mdpreview.nvim",
    ft = "markdown", -- you can lazy load on markdown files only
    -- requires the `terminal` filetype to render ASCII color and format codes
    -- dependencies = { "norcalli/nvim-terminal.lua", config = true },
  },

  -- measure startuptime
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_draw_border = 1
    end,
  },

  {
    "hinell/lsp-timeout.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    init = function()
      vim.g.lspTimeoutConfig = {
        stopTimeout = 1000 * 60 * 5, -- ms, timeout before stopping all LSPs
        startTimeout = 1000 * 10, -- ms, timeout before restart
        silent = false,          -- true to suppress notifications
        filetypes = {
          ignore = {             -- filetypes to ignore; empty by default
            -- lsp-timeout is disabled completely
          },                     -- for these filetypes
        },
      }
    end,
  },

  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    config = function()
      require("glow").setup({
        border = "single", -- floating window border config
        -- style = "dark|light", -- filled automatically with your current editor background, you can override using glow json style
        pager = false,
        width = 800,
        height = 400,
        width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
        height_ratio = 0.8,
      })
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    lazy = true,
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    keys = {
      -- stylua: ignore
      { "<leader>E", function() require("edgy").toggle() end, desc = "Toggle Sidebars" },
      {
        "<leader>F",
        function()
          require("edgy").select()
        end,
        desc = "Pick Sidebar",
      },
    },
    opts = {
      exit_when_last = true,
      bottom = {
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- don't open help files in edgy that we're editing
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
      },
      left = {
        {
          title = "Files",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          pinned = true,
          open = "Neotree position=left filesystem",
          size = { height = 0.5 },
        },
        {
          title = "Git Status",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "git_status"
          end,
          pinned = true,
          open = "Neotree position=right git_status",
        },
        {
          title = "Buffers",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "buffers"
          end,
          pinned = true,
          open = "Neotree position=top buffers",
        },
        "neo-tree",
      },
      right = {
        {
          ft = "aerial",
          title = "Symbol Outline",
          pinned = true,
          open = function()
            require("aerial").open()
          end,
        },
      },
      keys = {
        -- increase width
        ["<C-Right>"] = function(win)
          win:resize("width", 2)
        end,
        -- decrease width
        ["<C-Left>"] = function(win)
          win:resize("width", -2)
        end,
        -- increase height
        ["<C-Up>"] = function(win)
          win:resize("height", 2)
        end,
        -- decrease height
        ["<C-Down>"] = function(win)
          win:resize("height", -2)
        end,
      },
    },
  },
}

-- lualine
-- local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } }
lvim.builtin.lualine.sections.lualine_z = { { "progress", separator = { right = "" }, left_padding = 2 } }

-- lsp
lvim.format_on_save.enabled = true
lvim.lsp.automatic_servers_installation = false

--treesitter
lvim.builtin.treesitter.ensure_installed = {
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
  "regex",
  "tsx",
  "typescript",
  "toml",
  "vim",
  "yaml",
  "css",
  "scss",
}
lvim.builtin.treesitter.highlight.enable = true

-- lsp
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "marksman"
end, lvim.lsp.automatic_configuration.skipped_servers)

require("lvim.lsp.manager").setup("marksman")

-- -- formatter
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { name = "prettier",
--     args = { "--print-width", "100" },
--     filetypes = {
--       "javascript",
--       "javascriptreact",
--       "typescript",
--       "typescriptreact",
--       "css",
--       "html",
--       "json",
--       "yaml",
--       "markdown",
--     },
--   },
--   {
--     name = "shfmt",
--     filetypes = {
--       "sh",
--       "zsh",
--       "bash"
--     },
--   },
-- }

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   {
--     name = "marksman",
--     filetypes = {
--       "markdown"
--     },
--   },

-- }

-- alpha
table.insert(
  lvim.builtin.alpha.dashboard.section.buttons.entries,
  { "s", "  Restore Last Session", "<cmd>lua require('persistence').load()<cr>" }
)
