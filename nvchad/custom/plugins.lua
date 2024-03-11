local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  -- {
  --   "NvChad/nvterm",
  --   opts = overrides.nvterm,
  -- },

  -- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  --treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        opts = { enable_close_on_slash = false },
      },
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        -- init = function()
        --   vim.g.skip_ts_context_commentstring_module = true
        -- end,
        -- config = function()
        --   require("ts_context_commentstring").setup {
        --     enable_autocmd = false,
        --   }
        -- end,
      },
      "filNaj/tree-setter",
      "nvim-treesitter/nvim-treesitter-textobjects",
      {
        "nvim-treesitter/nvim-treesitter-context",
        -- event = "BufReadPost",
        opts = {
          throttle = true,
          max_lines = 3,
          mode = "cursor",
          patterns = {
            default = {
              "class",
              "function",
              "method",
            },
          },
        },
      },
    },
  },

  -- nvimtree
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = overrides.nvimtree,
  },

  -- cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "chrisgrieser/cmp_yanky" },
    event = "InsertEnter",
    opts = overrides.cmp,
  },

  -- comment
  -- {
  --   "numToStr/Comment.nvim",
  --   opts = overrides.comment,
  -- },

  --telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
    dependencies = {
      "debugloop/telescope-undo.nvim",
      -- "gnfisher/nvim-telescope-ctags-plus",
      "benfowler/telescope-luasnip.nvim",
      -- "Marskey/telescope-sg",
      {
        "ahmedkhalf/project.nvim",
        event = "VeryLazy",
        config = function()
          require("project_nvim").setup { ignore_lsp = { "lua_ls" } }
        end,
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
  },

  -- WhichKey overrides
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)

      ----------------- CUSTOM -------------.
      local wk = require "which-key" --.
      wk.register { --'
        ["<leader>"] = { --'
          s = { name = "Session Manager" },
          p = { name = "Lazy" },
          l = { name = "Lsp" },
          L = { name = "Lspsaga" },
          f = { name = "Search" },
          g = { name = "Git" },
          fs = { name = "Search and Replace(Muren)" },
          fS = { name = "Search and Replace(Spectre)" },
          t = { name = "Nvchad" },
          Lj = { name = "Jump Lspsaga diagnostic(c-f and c-b)" },
          Lp = { name = "Lspsaga Peek" },
          w = { name = "whichkey" },
          c = { name = "Color Picker" },
          u = { name = "Notifications" },
          -- {"<space>"} = { name = "Hop Jump" },
          -- g = { name = "group name" }, --'
        }, --'
        ["g"] = {
          z = { name = "Surround" },
          -- ["Z"] = { name = "Surround" },
        },
        -- ["v"] = {
        --   ["["] = { name = "illuminate jump" },
        --   g = { name = "Comment" }, --'
        -- },
      } --'
      -------------------------------------'
    end,
  },
  --------------------------------plugin---------------------------------------------------------------

  --yank
  {
    "gbprod/yanky.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    opts = {
      ring = { storage = "sqlite" },
      highlight = { on_put = true, on_yank = true, timer = 250 },
    },
    keys = {
        -- stylua: ignore
      { "<leader>ty", function() require("telescope").extensions.yank_history.yank_history({ }) end, desc = "Open Yank History" },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    },
  },

  --mini-files
  {
    "echasnovski/mini.files",
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
      options = {
        -- Whether to use for editing directories
        -- Disabled by default in LazyVim because neo-tree is used for that
        use_as_default_explorer = false,
      },
    },
    keys = {
      {
        "<leader>tf",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      {
        "<leader>tF",
        function()
          require("mini.files").open(vim.loop.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)

      local show_dotfiles = true
      local filter_show = function(fs_entry)
        return true
      end
      local filter_hide = function(fs_entry)
        return not vim.startswith(fs_entry.name, ".")
      end

      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        require("mini.files").refresh { content = { filter = new_filter } }
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak left-hand side of mapping to your liking
          vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesActionRename",
        callback = function(event)
          require("lazyvim.util").lsp.on_rename(event.data.from, event.data.to)
        end,
      })
    end,
  },

  -- telescope jump
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local function flash(prompt_bufnr)
        require("flash").jump {
          pattern = "^",
          label = { after = { 0, 0 } },
          search = {
            mode = "search",
            exclude = {
              function(win)
                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
              end,
            },
          },
          action = function(match)
            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            picker:set_selection(match.pos[1] - 1)
          end,
        }
      end
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = { n = { s = flash }, i = { ["<c-s>"] = flash } },
      })
    end,
  },

  -- spectre
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      {
        "<leader>fSr",
        function()
          require("spectre").open()
        end,
        desc = "Replace in files (Spectre)",
      },
      {
        "<leader>fSv",
        mode = { "n" },
        '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
        desc = "Search current word",
      },
      {
        "<leader>fSV",
        mode = { "v" },
        '<esc><cmd>lua require("spectre").open_visual()<CR>',
        desc = "Search current word",
      },
      {
        "<leader>fSc",
        mode = { "n" },
        '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
        desc = "Search on current file",
      },
    },
  },

  --- fold nvim
  {
    "kevinhwang91/nvim-ufo",
    event = "InsertEnter",
    init = function()
      vim.o.foldcolumn = "auto"
      vim.o.foldlevel = 99 -- Using ufo provider need a large value
      vim.o.foldlevelstart = 99
      vim.o.foldnestmax = 0
      vim.o.foldenable = true
      vim.o.foldmethod = "indent"

      vim.opt.fillchars = {
        fold = " ",
        foldopen = "",
        foldsep = " ",
        foldclose = "",
        stl = " ",
        eob = " ",
      }
    end,
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        opts = function()
          local builtin = require "statuscol.builtin"
          return {
            relculright = true,
            bt_ignore = { "nofile", "prompt", "terminal", "packer" },
            ft_ignore = {
              "NvimTree",
              "dashboard",
              "nvcheatsheet",
              "dapui_watches",
              "dap-repl",
              "dapui_console",
              "dapui_stacks",
              "dapui_breakpoints",
              "dapui_scopes",
              "help",
              "vim",
              "alpha",
              "nvdash",
              "Nvdash",
              "dashboard",
              "neo-tree",
              "Trouble",
              "noice",
              "lazy",
              "toggleterm",
              "Nvdash",
            },
            segments = {
              -- Segment: Add padding
              {
                text = { " " },
              },
              -- Segment: Fold Column
              {
                text = { builtin.foldfunc },
                click = "v:lua.ScFa",
                maxwidth = 1,
                colwidth = 1,
                auto = false,
              },
              -- Segment: Add padding
              {
                text = { " " },
              },
              -- Segment : Show signs with one character width
              {
                sign = {
                  name = { ".*" },
                  maxwidth = 1,
                  colwidth = 1,
                },
                auto = true,
                click = "v:lua.ScSa",
              },
              -- Segment: Show line number
              {
                text = { " ", " ", builtin.lnumfunc, " " },
                click = "v:lua.ScLa",
                condition = { true, builtin.not_empty },
              },
              -- Segment: GitSigns exclusive
              {
                sign = {
                  namespace = { "gitsign.*" },
                  maxwidth = 1,
                  colwidth = 1,
                  auto = false,
                },
                click = "v:lua.ScSa",
              },
              -- Segment: Add padding
              {
                text = { " " },
                hl = "Normal",
                condition = { true, builtin.not_empty },
              },
            },
          }
        end,
      },
    },
    opts = {
      close_fold_kinds = { "imports" },
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
  },

  --indent rainbow
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      dofile(vim.g.base46_cache .. "rainbowdelimiters")
      local rainbow_delimiters = require "rainbow-delimiters"

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  -- esc better
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  --linter
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = { "BufWritePost", "BufReadPost", "InsertLeave" },
  --   config = function()
  --     require "custom.configs.linter"
  --   end,
  -- },

  -- formatter
  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    event = "BufWritePost",
    config = function()
      require "custom.configs.conform"
    end,
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },

  --lsp context
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      code_action = {
        show_server_name = false,
        num_shortcut = false,
      },
      request_timeout = 2000,
      lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = false,
      },
      diagnostic = {
        show_code_action = true,
      },
      symbol_in_winbar = {
        enable = true,
        separator = " ",
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
      },
      ui = {
        title = false,
        expand = "",
        collapse = "",
        code_action = "",
      },
    },
  },

  -- lsp error
  -- {
  --   "chikko80/error-lens.nvim",
  --   event = "LspAttach",
  --   opts = {},
  -- },

  -- lsp line warning
  -- {
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   event = "LspAttach",
  --   config = function()
  --     require("lsp_lines").setup()
  --   end,
  -- },

  --indent
  {
    "shellRaining/hlchunk.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.hlchunk"
    end,
  },

  -- ui and cmdline
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = function()
      return require "custom.configs.noice"
    end,
    config = function(_, opts)
      require("noice").setup(opts)
    end,
  },

  --notify
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss { silent = true, pending = true }
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

  -- symbol
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = true,
  },

  -- inverst text
  {
    "nguyenvukhang/nvim-toggler",
    event = { "InsertEnter" },
    keys = {
      {
        "<leader>i",
        desc = "Toggle Invert Text",
      },
    },
    opts = {},
  },

  -- search and replace
  {
    "AckslD/muren.nvim",
    config = true,
    cmd = { "MurenToggle", "MurenFresh", "MurenUnique" },
  },

  -- surround
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "", -- Find surrounding (to the right)
        find_left = "", -- Find surrounding (to the left)
        highlight = "", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "", -- Update `n_lines`
      },
    },
  },

  --surround
  -- {
  --   "kylechui/nvim-surround",
  --   version = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   opts = {
  --     keymaps = {
  --       insert = "<C-g>z",
  --       insert_line = "<C-g>Z",
  --       normal = "gzn",
  --       normal_cur = "gzz",
  --       normal_line = "gZn",
  --       normal_cur_line = "gZZ",
  --       visual = "gzl",
  --       visual_line = "gZl",
  --       delete = "gzs",
  --       change = "gzc",
  --       change_line = "gZc",
  --     },
  --   },
  -- },

  --jump
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  -- {
  --   "smoka7/hop.nvim",
  --   cmd = { "HopWord", "HopLine", "HopLineStart", "HopWordCurrentLine" },
  --   opts = { keys = "etovxqpdygfblzhckisuran" },
  --   init = function()
  --     require("core.mappings").hop = {
  --       n = {
  --         ["<leader><leader>w"] = { "<CMD> HopWord <CR>", "Hint all words" },
  --         ["<leader><leader>t"] = { "<CMD> HopNodes <CR>", "Hint Tree" },
  --         ["<leader><leader>c"] = { "<CMD> HopLineStart<CR>", "Hint Columns" },
  --         ["<leader><leader>l"] = { "<CMD> HopWordCurrentLine<CR>", "Hint Line" },
  --       },
  --     }
  --     --   keys = {
  --     --     {
  --     --       "s",
  --     --       function()
  --     --         require("hop").hint_words()
  --     --       end,
  --     --       mode = { "n" },
  --     --       desc = "Hop hint words",
  --     --     },
  --     --     {
  --     --       "S",
  --     --       function()
  --     --         require("hop").hint_lines()
  --     --       end,
  --     --       mode = { "n" },
  --     --       desc = "Hop hint lines",
  --     --     },
  --     --     {
  --     --       "s",
  --     --       function()
  --     --         require("hop").hint_words { extend_visual = true }
  --     --       end,
  --     --       mode = { "v" },
  --     --       desc = "Hop hint words",
  --     --     },
  --     --     {
  --     --       "S",
  --     --       function()
  --     --         require("hop").hint_lines { extend_visual = true }
  --     --       end,
  --     --       mode = { "v" },
  --     --       desc = "Hop hint lines",
  --     --     },
  --     --   },
  --     -- },
  --     require("core.utils").load_mappings "hop"
  --   end,
  -- },

  -- indent
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
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
            "nvdash",
          }
          if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.b.miniindentscope_disable = true
          end
        end,
      })
    end,
  },

  -- treesitter jump
  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorHoldI" },
    opts = function()
      return require "custom.configs.illuminate"
    end,
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
  },

  -- nvim-colorizer and picker
  {
    "uga-rosa/ccc.nvim",
    event = { "InsertEnter" },
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
    -- keys = {
    --   { "<leader>uC", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle colorizer" },
    --   { "<leader>uc", "<cmd>CccConvert<cr>", desc = "Convert color" },
    --   { "<leader>up", "<cmd>CccPick<cr>", desc = "Pick Color" },
    -- },
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

  -- ranger plugins neovim
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_draw_border = 1
    end,
  },

  -- automatically kill lsp
  {
    "hinell/lsp-timeout.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      vim.g.lspTimeoutConfig = {
        stopTimeout = 1000 * 60 * 5, -- ms, timeout before stopping all LSPs
        startTimeout = 1000 * 10, -- ms, timeout before restart
        silent = false, -- true to suppress notifications
        filetypes = {
          ignore = { -- filetypes to ignore; empty by default
            -- lsp-timeout is disabled completely
          }, -- for these filetypes
        },
      }
    end,
  },

  -- Markdown preview split view
  {
    "mrjones2014/mdpreview.nvim",
    ft = "markdown", -- you can lazy load on markdown files only
    -- requires the `terminal` filetype to render ASCII color and format codes
    dependencies = { "norcalli/nvim-terminal.lua", config = true },
  },

  --markdown preview browser
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },

  -- markdown preview floating
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    config = function()
      require("glow").setup {
        border = "single", -- floating window border config
        -- style = "dark|light", -- filled automatically with your current editor background, you can override using glow json style
        pager = false,
        width = 800,
        height = 400,
        width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
        height_ratio = 0.8,
      }
    end,
  },

  -- markdown ui
  {
    "lukas-reineke/headlines.nvim",
    opts = function()
      local opts = {}
      for _, ft in ipairs { "markdown", "norg", "rmd", "org" } do
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

  -- {
  --   "stevearc/resession.nvim",
  --   lazy = true,
  --   config = function()
  --     require("resession").setup {
  --       -- Options for automatically saving sessions on a timer
  --       autosave = {
  --         enabled = true,
  --         -- How often to save (in seconds)
  --         interval = 60,
  --         -- Notify when autosaved
  --         notify = true,
  --       },
  --       -- Save and restore these options
  --       options = {
  --         "binary",
  --         "bufhidden",
  --         "buflisted",
  --         "cmdheight",
  --         "diff",
  --         "filetype",
  --         "modifiable",
  --         "previewwindow",
  --         "readonly",
  --         "scrollbind",
  --         "winfixheight",
  --         "winfixwidth",
  --       },
  --       -- Custom logic for determining if the buffer should be included
  --       buf_filter = require("resession").default_buf_filter,
  --       -- Custom logic for determining if a buffer should be included in a tab-scoped session
  --       tab_buf_filter = function()
  --         return true
  --       end,
  --       -- The name of the directory to store sessions in
  --       dir = "session",
  --       -- Show more detail about the sessions when selecting one to load.
  --       -- Disable if it causes lag.
  --       -- load_detail = true,
  --       -- List order ["modification_time", "creation_time", "filename"]
  --       load_order = "modification_time",
  --       -- Configuration for extensions
  --       extensions = {
  --         quickfix = {},
  --       },
  --     }
  --   end,
  -- },

  -- Save Session
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    lazy = true,
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },

  --git_status
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    enabled = false,
  },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
