--- Jet configuration.

local Jet = require "jet"

-- Own plugins
Jet.pack "mhmoooods" {
    "git@github.com:mhmoooods/jet-nvim",

    { uri = "git@github.com:mhmoooods/abby-nvim",
      opt = false },

    { uri = "git@github.com:mhmoooods/aks-nvim",
      opt = false,
      cfg =
        function()
            vim.g.aks_variant = "dark"
            vim.cmd "colorscheme aks"
            local hi = require("aks").hi
            local color = require("aks").colors

            hi("StatusLine", { fg = color.accent6, bg = color.shade0 })
            vim.o.stl = " %f %m%r%h %= %Y • %l:%c • %P "
        end
    }
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
            local hi = require"aks".hi
            local color = require"aks".colors
            require("indent_blankline").setup { show_current_context = false }
            hi("IndentBlanklineContextChar", { fg = color.shade4, bg = color.shade0 })
        end
    },

    { name = "mason",
      uri  = "git@github.com:williamboman/mason.nvim",
      cfg  = function() require("mason").setup({}) end },
}
