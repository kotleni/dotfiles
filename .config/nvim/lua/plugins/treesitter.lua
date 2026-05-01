-- require("nvim-treesitter").install { "javascript", "typescript", "c", "cpp", "python", "markdown" }
require("nvim-treesitter").setup({
    ensure_installed = { 
        "javascript", 
        "typescript", 
        "c", 
        "cpp", 
        "python", 
        "markdown",
        "lua" 
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
