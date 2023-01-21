-- TODO: Rename the whole thing from Vault to ...?

local VAULT_PATH = os.getenv("HOME") .. "/Notebook"
local INBOX_PATH = VAULT_PATH .. "/INBOX"
local TASKS_FILE = VAULT_PATH .. "/Main/tasks.txt"
local REFS_PATH  = VAULT_PATH .. "/Main/references"

local function new_today_note()
    local note_name = vim.fn.strftime("%Y-%m-%d.md")
    local note_path = INBOX_PATH .. "/" .. note_name

    local contents = vim.fn.readdir(INBOX_PATH)
    local exists
    for _, name in ipairs(contents) do
        if name == note_name then
            exists = true
        end
    end

    local date = vim.fn.strftime("%d %b, %Y")
    local time = vim.fn.strftime("%H:%M")

    if not exists then
        vim.fn.writefile({
            "# " .. date,
            "",
            "## " .. time,
            ""
        }, note_path)
    else
        vim.fn.writefile({
            "",
            "## " .. time,
            ""
        }, note_path, "a")
    end

    vim.cmd("edit " .. note_path)
    vim.cmd "normal G$a"
end

local function new_main_task()
    local date = vim.fn.strftime("%Y-%m-%d")
    local time = vim.fn.strftime("%H:%M")

    vim.fn.writefile({
        "9 | " .. date .. " | " .. time .. " | ",
    }, TASKS_FILE, "a")

    vim.cmd("edit " .. TASKS_FILE)
    vim.cmd "normal G$"
end

local function new_main_ref()
    local note_name = vim.fn.strftime("%Y-%m-%d.md")
    local note_path = REFS_PATH .. "/" .. note_name

    local contents = vim.fn.readdir(REFS_PATH)
    local exists
    for _, name in ipairs(contents) do
        if name == note_name then
            exists = true
        end
    end

    local date = vim.fn.strftime("%d %b, %Y")
    local time = vim.fn.strftime("%H:%M")

    if not exists then
        vim.fn.writefile({
            "# " .. date,
            "",
            "## " .. time,
            ""
        }, note_path)
    else
        vim.fn.writefile({
            "",
            "## " .. time,
            ""
        }, note_path, "a")
    end

    vim.cmd("edit " .. note_path)
    vim.cmd "normal G"
end

vim.cmd "command! Note lua require\"utils.vault\".new_today_note()"
vim.cmd "command! Task lua require\"utils.vault\".new_main_task()"
vim.cmd "command! Ref  lua require\"utils.vault\".new_main_ref()"

return {
    new_main_ref = new_main_ref,
    new_today_note = new_today_note,
    new_main_task = new_main_task
}
