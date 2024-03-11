return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
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
        "xml",
        "yuck",
      })
    end,
  },

  {
    "luckasRanarison/tree-sitter-hyprlang",
    enabled = function() return vim.fn.exists ":HyprLang" == 1 end,
    event = "BufRead */hypr/*.conf",
    config = function()
      -- Fix ft detection for hyprland
      vim.cmd [[
      autocmd BufRead */hypr/*.conf set filetype=hyprlang
    ]]
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local function add(lang)
        if type(opts.ensure_installed) == "table" then
          require("astronvim.utils").list_insert_unique(opts.ensure_installed, lang)
        end
      end

      vim.tbl_extend("force", opts, {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })

      vim.tbl_extend("force", opts, {
        indent = {
          enable = true,
        },
      })

      vim.filetype.add {
        extension = { rasi = "rasi" },
        pattern = {
          [".*/waybar/config*"] = "jsonc",
          [".*/mako/config*"] = "dosini",
          [".*/kitty/.*%.conf*"] = "bash",
        },
      }

      add "git_config"

      if vim.fn.exists ":Fish" == 1 then add "fish" end

      if vim.fn.exists ":Rofi" == 1 or vim.fn.exists ":Wofi" == 1 then add "rasi" end
    end,
  },
}
