-- LSP Config

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
local deno_bin = HOME .. "/.deno/bin/bin/deno"
require'lspconfig'.denols.setup {
    cmd = {deno_bin, "lsp"}
}
