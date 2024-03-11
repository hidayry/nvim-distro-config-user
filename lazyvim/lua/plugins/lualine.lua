return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",

  config = function()
    local lualine = require("lualine")

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#0D131A',
  bg_alt   = '#131A24',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
  grey     = '#202328',
}

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        theme = "tokyonight",
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        -- theme = {
        --   -- We are going to use lualine_c an lualine_x as left and
        --   -- right section. Both are highlighted by c theme .  So we
        --   -- are just setting default looks o statusline
        --   normal = { c = { fg = colors.fg, bg = colors.bg_alt } },
        --   inactive = { c = { fg = colors.fg, bg = colors.bg_alt } },
        -- },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }
    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left({
      function()
        return ""
      end,
      color = { fg = colors.blue }, -- Sets highlighting of component
      padding = { left = 0, right = 0 }, -- We don't need space before this
    })

    ins_left({
      function()
        return " "
      end,
      color = { fg = colors.bg, bg = colors.blue }, -- Sets highlighting of component
      padding = { left = 0, right = 0 }, -- We don't need space before this
    })

    -- ins_left({
    --   -- mode component
    --   function()
    --     return ""
    --   end,
    --   color = function()
    --     -- auto change color according to neovims mode
    --     local mode_color = {
    --       n = colors.red,
    --       i = colors.green,
    --       v = colors.blue,
    --       [""] = colors.blue,
    --       V = colors.blue,
    --       c = colors.magenta,
    --       no = colors.red,
    --       s = colors.orange,
    --       S = colors.orange,
    --       [""] = colors.orange,
    --       ic = colors.yellow,
    --       R = colors.violet,
    --       Rv = colors.violet,
    --       cv = colors.red,
    --       ce = colors.red,
    --       r = colors.cyan,
    --       rm = colors.cyan,
    --       ["r?"] = colors.cyan,
    --       ["!"] = colors.red,
    --       t = colors.red,
    --     }
    --     return { fg = mode_color[vim.fn.mode()], color = { bg = colors.blue } }
    --   end,
    --   padding = { right = 1, left = 0 },
    -- })

    ins_left({ "mode", color = { bg = colors.grey, fg = colors.blue, gui = "bold" } })

    ins_left({
      function()
        return ""
      end,
      color = { fg = colors.grey }, -- Sets highlighting of component
      padding = { left = 0, right = 0 }, -- We don't need space before this
    })

    ins_left({
      function()
        return ""
      end,
      color = { fg = colors.red }, -- Sets highlighting of component
      padding = { left = 1, right = 0 }, -- We don't need space before this
    })

    ins_left({
      "filetype",
      colored = false,
      icon_only = true,
      color = { bg = colors.red, fg = colors.bg },
      padding = { left = 0, right = 1 },
    })

    -- ins_left({
    --   -- filesize component
    --   "filesize",
    --   padding = { left = 1, right = 0 }, -- We don't need space before this
    --   color = { bg = colors.grey }, -- Sets highlighting of component
    --   cond = conditions.buffer_not_empty,
    -- })

    ins_left({
      "filename",
      file_status = true,
      -- path = 1,
      symbols = {
        modified = "", -- Text to show when the file is modified.
        readonly = "", -- Text to show when the file is non-modifiable or readonly.
        unnamed = "[No Name]", -- Text to show for unnamed buffers.
        newfile = "", -- Text to show for newly created file before first write
      },
      cond = conditions.buffer_not_empty,
      color = { fg = colors.red, bg = colors.grey, gui = "bold" },
    })

    ins_left({
      function()
        return ""
      end,
      color = { fg = colors.grey }, -- Sets highlighting of component
      padding = { left = 0, right = 0 }, -- We don't need space before this
    })

    -- ins_left({
    --   function()
    --     return ""
    --   end,
    --   color = { fg = colors.yellow }, -- Sets highlighting of component
    --   padding = { left = 1, right = 0 }, -- We don't need space before this
    -- })
    --
    -- ins_left({
    --   "fileformat",
    --   fmt = string.upper,
    --   -- symbols = {
    --   --   unix = "", -- e712
    --   --   dos = "", -- e70f
    --   --   mac = "", -- e711
    --   -- },
    --   icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    --   color = { fg = colors.green, gui = "bold" },
    -- })

    ins_left({
      "branch",
      icon = "󰊢",
      color = { fg = colors.violet, gui = "bold" },
    })

    ins_left({
      "diff",
      -- Is it me or the symbol for modified us really weird
      symbols = { added = " ", modified = " ", removed = " " },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    })

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_left({
      function()
        return "%="
      end,
    })

    ins_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " ", hint = "󰌵" },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
        color_hint = { fg = colors.blue },
      },
    })

    -- Add components to right sections
    -- ins_right({
    --   "o:encoding", -- option component same as &encoding in viml
    --   fmt = string.upper, -- I'm not sure why it's upper case either ;)
    --   cond = conditions.hide_in_width,
    --   color = { fg = colors.green, gui = "bold" },
    -- })

    ins_right({
      function()
        return require("noice").api.status.command.get()
      end,
      cond = function()
        return package.loaded["noice"] and require("noice").api.status.command.has()
      end,
      -- color = Util.ui.fg("Statement"),
      color = { fg = colors.green, gui = "bold" },
    })

    ins_right({
      function()
        return require("noice").api.status.mode.get()
      end,
      cond = function()
        return package.loaded["noice"] and require("noice").api.status.mode.has()
      end,
      -- color = Util.ui.fg("Constant"),
      color = { fg = colors.blue, gui = "bold" },
    })

    -- ins_right({
    --   function()
    --     return "  " .. require("dap").status()
    --   end,
    --   cond = function()
    --     return package.loaded["dap"] and require("dap").status() ~= ""
    --   end,
    --   -- color = Util.ui.fg("Debug"),
    --   color = { fg = colors.yellow, gui = "bold" },
    -- })

    -- ins_right({
    --   require("lazy.status").updates,
    --   cond = require("lazy.status").has_updates,
    --   -- color = Util.ui.fg("Special"),
    --   color = { fg = colors.red, gui = "bold" },
    -- })

    -- ins_right({
    --   "aerial",
    --   color = { fg = colors.green, gui = "bold" },
    -- })

    --lsp section
    ins_right({
      function()
        return ""
      end,
      color = { fg = colors.green }, -- Sets highlighting of component
      padding = { left = 1, right = 0 }, -- We don't need space before this
    })

    ins_right({
      function()
        return " "
      end,
      color = { fg = colors.bg, bg = colors.green }, -- Sets highlighting of component
      padding = { left = 0, right = 1 }, -- We don't need space before this
    })

    ins_right({
      -- Lsp server name .
      function()
        local msg = "No Active Lsp"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      -- icon = " LSP :",
      color = { fg = colors.green, bg = colors.grey, gui = "bold" },
    })

    ins_right({
      function()
        return ""
      end,
      color = { fg = colors.grey },
      padding = { left = 0, right = 0 },
    })

    --folder section
    ins_right({
      function()
        return ""
      end,
      color = { fg = colors.magenta }, -- Sets highlighting of component
      padding = { left = 1, right = 0 }, -- We don't need space before this
    })

    ins_right({
      function()
        return ""
      end,
      color = { fg = colors.bg, bg = colors.magenta }, -- Sets highlighting of component
      padding = { left = 0, right = 1 }, -- We don't need space before this
    })

    -- ins_right({ "filename", path = 4, padding = { left = 1, right = 1 } })
    ins_right({
      function()
        return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      end,
      color = { fg = colors.magenta, bg = colors.grey, gui = "bold" },
    })

    ins_right({
      function()
        return ""
      end,
      color = { fg = colors.grey },
      padding = { left = 0, right = 0 },
    })

    -- ins_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

    -- location section
    ins_right({
      function()
        return ""
      end,
      color = { fg = colors.orange }, -- Sets highlighting of component
      padding = { left = 1, right = 0 }, -- We don't need space before this
    })

    ins_right({
      function()
        return ""
      end,
      color = { fg = colors.bg, bg = colors.orange }, -- Sets highlighting of component
      padding = { left = 0, right = 1 }, -- We don't need space before this
    })

    ins_right({ "location", color = { fg = colors.orange, gui = "bold", bg = colors.grey } })

    ins_right({
      function()
        return ""
      end,
      color = { fg = colors.grey },
      padding = { left = 0, right = 0 },
    })

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end,
}
