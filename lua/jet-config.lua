--- Jet configuration.

local Jet = require "jet"

-- Own plugins
Jet.pack "quintik" {
    "git@github.com:quintik/jet-nvim",
    "git@github.com:quintik/abby-nvim",

    { uri  = "git@github.com:quintik/onedark-minimal",
      cfg  =
        function()
            vim.g.onedark_contrast = true
            vim.cmd "colorscheme onedark-minimal"
        end }
}

-- Nvim stuff
Jet.pack "nvim" {
    { name = "treesitter",
      uri  = "git@github.com:nvim-treesitter/nvim-treesitter",
      cfg  = function() require "config.treesitter" end },

    { name = "lspconfig",
      uri  = "git@github.com:neovim/nvim-lspconfig",
      opt  = true,
      on   = { "CmdUndefined LspStart" },
      cfg  = function() require "config.lsp" end }
}

-- Misc. plugins
Jet.pack "misc" {
    "git@github.com:ervandew/supertab",
}
