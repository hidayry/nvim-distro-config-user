return {
  {
    -- customize alpha options
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the opts header
      opts.section.header.val = {
        "           ██╗  ██╗██╗██████╗  █████╗ ██╗   ██╗██████╗ ██╗   ██╗            Z",
        "           ██║  ██║██║██╔══██╗██╔══██╗╚██╗ ██╔╝██╔══██╗╚██╗ ██╔╝        Z    ",
        "           ███████║██║██║  ██║███████║ ╚████╔╝ ██████╔╝ ╚████╔╝      z       ",
        "           ██╔══██║██║██║  ██║██╔══██║  ╚██╔╝  ██╔══██╗  ╚██╔╝    z          ",
        "           ██║  ██║██║██████╔╝██║  ██║   ██║   ██║  ██║   ██║   z            ",
        "           ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝ z              ",
        "                   𝐼 𝒽𝑜𝓅𝑒 𝒶𝓁𝓁 𝓎𝑜𝓊𝓇 𝒹𝑒𝒸𝒾𝓈𝒾𝑜𝓃𝓈 𝒶𝓇𝑒 𝓇𝒾𝑔𝒽𝓉                       ",
      }
      opts.config.layout = {
        { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
        opts.section.header,
        { type = "padding", val = 4 },
        opts.section.buttons,
        { type = "padding", val = 2 },
        opts.section.footer,
      }
      -- opts.opts.layout[1].val = 4
      -- opts.config.opts.noautocmd = true
      -- vim.cmd [[autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2 ]]
      return opts
    end,
  },

  { "elkowar/yuck.vim" },

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
    "mrjones2014/mdpreview.nvim",
    ft = "markdown", -- you can lazy load on markdown files only
    -- requires the `terminal` filetype to render ASCII color and format codes
    dependencies = { "norcalli/nvim-terminal.lua", config = true },
  },

  { "NvChad/nvim-colorizer.lua", enabled = false },

  -- measure startuptime
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function() vim.g.startuptime_tries = 10 end,
  },
  {
    "romgrk/nvim-treesitter-context",
    event = "User AstroFile",
    config = function()
      require("treesitter-context").setup {
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
      }
    end,
  },
  -- {
  --   "lukas-reineke/headlines.nvim",
  --   opts = function()
  --     local opts = {}
  --     for _, ft in ipairs { "markdown", "norg", "rmd", "org" } do
  --       opts[ft] = {
  --         headline_highlights = {},
  --       }
  --       for i = 1, 6 do
  --         local hl = "Headline" .. i
  --         vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
  --         table.insert(opts[ft].headline_highlights, hl)
  --       end
  --     end
  --     return opts
  --   end,
  --   ft = { "markdown", "norg", "rmd", "org" },
  --   config = function(_, opts)
  --     -- PERF: schedule to prevent headlines slowing down opening a file
  --     vim.schedule(function()
  --       require("headlines").setup(opts)
  --       require("headlines").refresh()
  --     end)
  --   end,
  -- },
  -- Automatically highlights other instances of the word under your cursor.
  -- This works with LSP, Treesitter, and regexp matching to find the other
  -- instances.
  -- {
  --   "RRethy/vim-illuminate",
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

  -- {
  --   "hinell/lsp-timeout.nvim",
  --   dependencies = { "neovim/nvim-lspconfig" },
  --   init = function()
  --     vim.g.lspTimeoutConfig = {
  --       stopTimeout = 1000 * 60 * 5, -- ms, timeout before stopping all LSPs
  --       startTimeout = 1000 * 10, -- ms, timeout before restart
  --       silent = false, -- true to suppress notifications
  --       filetypes = {
  --         ignore = { -- filetypes to ignore; empty by default
  --           -- lsp-timeout is disabled completely
  --         }, -- for these filetypes
  --       },
  --     }
  --   end,
  -- },

  -- {
  --   "ellisonleao/glow.nvim",
  --   cmd = "Glow",
  --   config = function()
  --     require("glow").setup {
  --       border = "single", -- floating window border config
  --       -- style = "dark|light", -- filled automatically with your current editor background, you can override using glow json style
  --       pager = false,
  --       width = 800,
  --       height = 400,
  --       width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
  --       height_ratio = 0.8,
  --     }
  --   end,
  -- },

  ---color picker and color highlight
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   event = "User AstroFile",
  --   cmd = {
  --     "ColorizerToggle",
  --     "ColorizerAttachToBuffer",
  --     "ColorizerDetachFromBuffer",
  --     "ColorizerReloadAllBuffers",
  --   },
  --   opts = { user_default_options = { names = true } },
  -- },

  -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  -- {
  --   "folke/noice.nvim",
  --   event = { "VeryLazy" },
  --   opts = {
  --     lsp = {
  --       override = {
  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         ["vim.lsp.util.stylize_markdown"] = true,
  --         ["cmp.entry.get_documentation"] = true,
  --       },
  --     },
  --     routes = {
  --       {
  --         filter = {
  --           event = "msg_show",
  --           any = {
  --             { find = "%d+L, %d+B" },
  --             { find = "; after #%d+" },
  --             { find = "; before #%d+" },
  --           },
  --         },
  --         view = "mini",
  --       },
  --     },
  --     presets = {
  --       bottom_search = true,
  --       command_palette = true,
  --       long_message_to_split = true,
  --       inc_rename = true,
  --     },
  --   },
  --   -- stylua: ignore
  --   keys = {
  --     { "<S-Enter>",  function() require("noice").redirect(vim.fn.getcmdline()) end,                 mode = "c",                 desc = "Redirect Cmdline" },
  --     { "<leader>sl", function() require("noice").cmd("last") end,                                   desc = "Noice Last Message" },
  --     { "<leader>sh", function() require("noice").cmd("history") end,                                desc = "Noice History" },
  --     { "<leader>sa", function() require("noice").cmd("all") end,                                    desc = "Noice All" },
  --     { "<leader>sd", function() require("noice").cmd("dismiss") end,                                desc = "Dismiss All" },
  --     { "<c-f>",      function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,  silent = true,              expr = true,              desc = "Scroll forward",  mode = { "i", "n", "s" } },
  --     { "<c-b>",      function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true,              expr = true,              desc = "Scroll backward", mode = { "i", "n", "s" } },
  --   },
  -- },

  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  -- end,
  -- },

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  -- {
  --   "folke/which-key.nvim",
  --   config = function(plugin, opts)
  --     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- Add bindings which show up as group name
  --     local wk = require "which-key"
  --     wk.register({
  --       b = { name = "Buffer" },
  --     }, { mode = "n", prefix = "<leader>" })
  --   end,
  -- },
}
