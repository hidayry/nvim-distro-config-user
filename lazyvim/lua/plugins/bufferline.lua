return {
  "akinsho/bufferline.nvim",
  event = "BufEnter",
  opts = {
    options = {
      -- hover = {
      --   enabled = true,
      --   delay = 200,
      --   reveal = { 'close' }
      -- },
      -- indicator = {
      --   icon = '▎', -- this should be omitted if indicator style is not 'icon'
      --   style = 'icon' | 'underline' | 'none',
      --   style = 'underline',
      -- },
      buffer_close_icon = "󰅙",
      modified_icon = "",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      -- color_icons = true,
      -- separator_style = "thick",
      -- show_buffer_icons = true, -- disable filetyp
      -- show_buffer_close_icons = true,
      -- show_close_icon = true,
      -- show_tab_indicators = true,
      -- -- separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
      always_show_bufferline = true,
    },
  },
}
