--- Zen Mode Mini-Plugin

vim.cmd "command! Zen lua Zen.toggle()"

local disabled = true

local function toggle()
    if disabled then
        vim.o.laststatus  = 0
        vim.o.showtabline = 0
        vim.fn.execute "silent only"
        disabled = false

        vim.cmd "echo 'Zen Mode On'"
    else
        vim.o.laststatus = 2
        vim.o.showtabline = 1
        vim.fn.execute "silent Vexplore"
        vim.fn.execute "silent wincmd p"
        disabled = true

        vim.cmd "echo 'Zen Mode Off'"
    end
end

Zen = { toggle = toggle }

