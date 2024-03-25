--- Jet configuration.

local Jet = require "jet"

-- Own plugins
Jet.pack "mhmood-sf" {
    "git@github.com:mhmood-sf/jet-nvim",

    { uri = "git@github.com:mhmood-sf/abby-nvim",
      opt = false },


    { uri = "git@github.com:mhmood-sf/aks-nvim",
      opt = true,
      cfg =
        function()
            vim.g.aks_variant = "dark"
            vim.cmd "colorscheme aks"
        end
    },

    { uri = "git@github.com:mhmood-sf/lazyfox-nvim",
      opt = false,
      cfg =
        function()
            vim.cmd "colorscheme lazyfox"
        end
    },
}

-- Nvim stuff
Jet.pack "nvim" {
    -- Dependency for lots of stuff.
    { name = "plenary",
      uri  = "git@github.com:nvim-lua/plenary.nvim" },

    { name = "treesitter",
      uri  = "git@github.com:nvim-treesitter/nvim-treesitter",
      cfg  = function() require "config.treesitter" end },

    { name = "lspconfig",
      uri  = "git@github.com:neovim/nvim-lspconfig",
      opt  = true,
      on   = { "CmdUndefined LspStart" },
      cfg  = function() require "config.lsp" end },

    { name = "telescope",
      uri  = "git@github.com:nvim-telescope/telescope.nvim",
      cfg  = function() require "config.telescope" end }
}

-- Misc. plugins
Jet.pack "misc" {
    "git@github.com:ervandew/supertab",

    { uri = "git@github.com:lukas-reineke/indent-blankline.nvim",
      cfg =
        function()
            local hi = require(vim.g.colors_name).hi
            local color = require(vim.g.colors_name).colors
            require("ibl").setup()
            hi("IblIndent", { fg = color.shade4, bg = color.shade0 })
        end
    },

    { name = "mason",
      uri  = "git@github.com:williamboman/mason.nvim",
      cfg  = function() require("mason").setup({}) end },
}
