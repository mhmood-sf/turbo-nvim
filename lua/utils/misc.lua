--- Misc. QOL Commands Mini-Plugin

vim.cmd [[
command! -nargs=0 InitLua    edit $MYVIMRC
command! -nargs=0 BufClean   lua require'utils/misc'.bufclean()
command! -nargs=0 LoremIpsum echo luaeval("require'utils/misc'.loremipsum()")
command! -nargs=0 TODO       exe "edit " . stdpath("data") . "/TODO.md"
command! -nargs=0 Term       split | wincmd j | setlocal nonumber | terminal
]]

local function bufclean()
    local count = 0
    for _, buf in ipairs(vim.fn.getbufinfo()) do
        if buf.listed == 1 and buf.bufnr ~= vim.fn.bufnr() then
            count = count + 1
            vim.fn.execute("bd" .. buf.bufnr)
        end
    end

    vim.cmd("echo 'Cleaned " .. count .. " buffers'")
end

local function loremipsum()
    local str = [[
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed,
do eiusmod tempor incididunt ut labore et dolore magna aliqua.,
Ut enim ad minim veniam, quis nostrud exercitation ullamco,
laboris nisi ut aliquip ex ea commodo consequat. Duis aute,
irure dolor in reprehenderit in voluptate velit esse cillum,
dolore eu fugiat nulla pariatur. Excepteur sint occaecat,
cupidatat non proident, sunt in culpa qui officia deserunt,
deserunt mollit anim id est laborum. ]]
    return str
end

return {
    bufclean = bufclean,
    loremipsum = loremipsum
}

