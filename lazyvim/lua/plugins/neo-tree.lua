return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  opts = {
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline", "edgy" },
    enabled_git_status = true,
    filesystem = {
      bind_to_cwd = true,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          -- ".DS_Store",
          -- "thumbs.db",
          -- "node_modules",
        },
        never_show = {},
      },
    },
    follow_current_file = { enabled = true, leave_dirs_open = true },
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
    window = {
      width = 30,
      mappings = {
        ["<space>"] = "none",
        ["Y"] = "none",
      },
    },
    default_component_configs = {
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = "󰈙",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = "",
        highlight = "NeoTreeModified",
      },
      -- name = {
      --   trailing_slash = false,
      --   use_git_status_colors = true,
      --   highlight = "NeoTreeFileName",
      -- },
      git_status = {
        symbols = {
          -- Change type
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "", -- this can only be used in the git_status source
          renamed = "󰁕", -- this can only be used in the git_status source
          -- Status type
          untracked = "★",
          ignored = "◌",
          unstaged = "✗",
          staged = "✓",
          conflict = "",
        },
      },
    },
    buffers = {
      follow_current_file = { enabled = true, leave_dirs_open = true },
    },
  },
}
