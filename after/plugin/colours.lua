require("catppuccin").setup({
    flavour = "macchiato",
    background = {
        light = "latte",
        dark = "macchiato",
    },
     integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
    }
})
vim.cmd.colorscheme "catppuccin"
