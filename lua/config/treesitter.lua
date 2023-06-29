-- Treesitter config

-- https://github.com/nvim-treesitter/nvim-treesitter

require'nvim-treesitter.configs'.setup {

    ensure_installed = {"lua", "typescript", "haskell", "elixir", "python"},

    highlight = {
        enable = true
    },

    incremental_selection = {
        enable = false
    },

    indent = {
        enable = false
    }
}

