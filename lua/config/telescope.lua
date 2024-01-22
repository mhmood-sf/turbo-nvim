local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = " 󰮯  ",
    selection_caret = " ▶ ",
    entry_prefix = "   ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules", "git", "dist-newstyle" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { " ", "  ", " ", " ", " ", " ", " ", " " },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },

  extensions_list = { "themes", "terms" },
}

-- Mappings
local map  = vim.api.nvim_set_keymap
local opts = { noremap = true }

map("n", "<Leader>ff", "<CMD>Telescope find_files<CR>", opts)
map("n", "<Leader>fg", "<CMD>Telescope live_grep<CR>", opts)
map("n", "<Leader>fb", "<CMD>Telescope buffers<CR>", opts)

-- Colorscheme
local hi = require(vim.g.colors_name).hi
local color = require(vim.g.colors_name).colors

hi("TelescopePromptCounter", { fg = color.shade7, bg = color.shade1 })
hi("TelescopePromptNormal",  { fg = color.shade7, bg = color.shade1 })
hi("TelescopePromptBorder",  { fg = color.shade7, bg = color.shade1 })
hi("TelescopePromptTitle",   { bg = color.accent3, fg = color.shade1 })
hi("TelescopePreviewTitle",  { bg = color.accent5, fg = color.shade1 })
hi("TelescopeResultsTitle",  { bg = color.shade1, fg = color.shade1 })

hi("TelescopeNormal", { fg = color.shade7, bg = color.shade1 })

require("telescope").setup(options)
