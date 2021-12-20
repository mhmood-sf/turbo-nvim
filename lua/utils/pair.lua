--- Auto-Pairs Mini-Plugin

local map = vim.api.nvim_set_keymap
local fn  = vim.fn

local pairs = {}
local RIGHT = vim.api.nvim_eval('"\\<Right>"')
local LEFT  = vim.api.nvim_eval('"\\<Left>"')
local BS    = vim.api.nvim_eval('"\\<BS>"')

-- Inserts a full pair when left
-- char is entered.
local function insert(left_char_nr)
    local col_nr   = fn.getpos(".")[3]
    local cur_line = fn.getline(".")
    local char     = fn.nr2char(left_char_nr)

    -- return if at end of line
    if col_nr > string.len(cur_line) then
        return char .. pairs[char] .. LEFT
    end

    local chars = vim.split(cur_line, "")
    local next  = chars[col_nr]

    -- don't insert pair if next char is
    -- alphanumeric.
    if string.match(next, "%w") ~= nil then
        return char
    else
        return char .. pairs[char] .. LEFT
    end
end

-- Skips over next char if it is a
-- pair's second half.
local function skip(right_char_nr)
    local col_nr   = fn.getpos(".")[3]
    local cur_line = fn.getline(".")
    local char     = fn.nr2char(right_char_nr)

    -- return if at end of line
    if col_nr > string.len(cur_line) then
        return char
    end

    local chars = vim.split(cur_line, "")
    local next  = chars[col_nr]

    -- if next char is a pair, skip it,
    -- otherwise insert it.
    if next == char then
        return RIGHT
    else
        return char
    end
end

-- On <BS> check if cursor is between
-- a pair, if so delete both.
local function delete()
    local col_nr   = fn.getpos(".")[3]
    local cur_line = fn.getline(".")

    -- return if at end of line
    if col_nr > string.len(cur_line) then
        return BS
    end

    -- get left/right chars
    local chars      = vim.split(cur_line, "")
    local left_char  = chars[col_nr - 1]
    local right_char = chars[col_nr]

    if pairs[left_char] == right_char then
        return RIGHT .. BS .. BS
    else
        return BS
    end
end

local function create_pair(leftright)
    local left  = vim.split(leftright, "")[1]
    local right = vim.split(leftright, "")[2]
    pairs[left] = right

    -- Expand left char to full pair.
    local s = "'require\"utils.pair\".insert(" .. fn.char2nr(left) .. ")'"
    map("i", left, "<C-R>=luaeval(" .. s .. ")<CR>", {
        noremap = false,
        silent  = true
    })

    -- If they're the same, this mapping would overwrite the
    -- previous.
    if left ~= right then
        -- Skip right char of a pair.
        local s = "'require\"utils.pair\".skip(" .. fn.char2nr(right) .. ")'"
        map("i", right, "<C-R>=luaeval(" .. s .. ")<CR>", {
            noremap = false,
            silent  = true
        })
    end
end

local function create(tbl)
    for _, leftright in ipairs(tbl) do
        create_pair(leftright)
    end
end

-- <BS> between a pair deletes both chars.
map("i", "<BS>", "<C-R>=luaeval('require\"utils.pair\".delete()')<CR>", {
    noremap = false,
    silent  = true
})

return {
    insert = insert,
    delete = delete,
    skip   = skip,
    create = create
}

