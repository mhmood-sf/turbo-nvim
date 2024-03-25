-- LSP Config

local lspcfg = require "lspconfig"

-- Taken from https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
-- Opens diagnostics in float.
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
-- vim.o.updatetime = 500
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

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

--[ Mappings ]--
vim.cmd [[
nnoremap <leader>i <CMD>lua vim.lsp.buf.hover()<Enter>
nnoremap <leader>e <CMD>lua vim.diagnostic.open_float(nil, {focus=false})<Enter>
nnoremap <leader>d <CMD>lua vim.lsp.buf.definition()<Enter>
nnoremap <leader>r <CMD>lua vim.lsp.buf.references()<Enter>
]]

-- Lua
local lua_ls = vim.fn.stdpath('data') .. "/mason/bin/lua-language-server"
local lua_runtime  = vim.split(package.path, ";")
table.insert(lua_runtime, "lua/?.lua")
table.insert(lua_runtime, "lua/?/init.lua")

lspcfg.lua_ls.setup {
    cmd = { lua_ls },
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    },
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    library = { vim.env.VIMRUNTIME }
                }
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
    end
}

-- Deno
local HOME = os.getenv("HOME")
local deno_bin = HOME .. "/.deno/bin/deno"
lspcfg.denols.setup {
    cmd = {deno_bin, "lsp"}
}

-- AST-Grep
lspcfg.ast_grep.setup {
    filetypes = { "c", "cpp", "rust", "java", "python", "html", "css" }
}
