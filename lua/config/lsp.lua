-- LSP Config

-- Taken from https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
-- Opens diagnostics in float.
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 500
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Add borders
-- See: https://vi.stackexchange.com/a/39075
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = "single"
    }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = "single"
    }
)

vim.diagnostic.config {
  float = {
      border = "single"
  },
  virtual_text = false
}

-- TODO: sumneko deprecated, use lua_ls instead.
--[[
local sumneko_root = vim.fn.stdpath('data') .. "/lspconfig/sumneko/"
local sumneko_bin  = sumneko_root .. "/bin/Linux/lua-language-server"
local lua_runtime  = vim.split(package.path, ";")
table.insert(lua_runtime, "lua/?.lua")
table.insert(lua_runtime, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_bin, "-E", sumneko_root .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                version = "LuaJTI",
                path = runtime_path
            },
            diagnostics = {
                globals = {"vim"}
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            },
            telemetry = {
                enable = false
            }
        }
    }
}
--]]

-- Deno
local HOME = os.getenv("HOME")
local deno_bin = HOME .. "/.deno/bin/deno"
require'lspconfig'.denols.setup {
    cmd = {deno_bin, "lsp"}
}
