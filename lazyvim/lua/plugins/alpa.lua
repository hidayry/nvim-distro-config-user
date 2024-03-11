return {
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
    -- opts.config.layout = {
    --   { type = "padding", val = vim.fn.max({ 1, vim.fn.floor(vim.fn.winheight(0) * 0.2) }) },
    --   opts.section.header,
    --   { type = "padding", val = 2 },
    --   opts.section.buttons,
    --   { type = "padding", val = 1 },
    --   opts.section.footer,
    --   { type = "padding", val = 1 },
    -- }
    opts.opts.layout[1].val = 2
    -- opts.config.opts.noautocmd = true
    -- vim.o.showtabline = 0
    --
    -- local augroup = vim.api.nvim_create_augroup("after/ftplugin/alpha", {})
    -- vim.api.nvim_create_autocmd("BufUnload", {
    --   group = augroup,
    --   callback = function()
    --     vim.o.showtabline = 2
    --   end,
    -- })
    vim.cmd([[autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2 ]])
    return opts
  end,
}
