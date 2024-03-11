return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {
    close_if_last_window = true,
    sources = { "filesystem", "buffers", "git_status" },
    open_files_do_not_replace_types = { "terminal", "edgy" },
    window = {
      width = 30,
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          -- ".DS_Store",
          -- "thumbs.db",
          -- "node_modules",
        },
        never_show = {},
      },
      follow_current_file = { enabled = true, leave_dirs_open = true },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
    },
    buffers = {
      follow_current_file = { enabled = true, leave_dirs_open = true },
      group_empty_dirs = true,
      show_unloaded = true,
    },
  },
}
