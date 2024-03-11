return {
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
                height_ratio = 0.8
            })
        end
    }
