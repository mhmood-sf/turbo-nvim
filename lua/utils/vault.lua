local VAULT_PATH = os.getenv("HOME") .. "/Personal/Vault"
local TASKS_PATH = VAULT_PATH .. "/Life/Tasks"
local INBOX_PATH = VAULT_PATH .. "/Life/Inbox"

local function open_today_note()
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
    vim.cmd "normal G"
end

local function open_pending_tasks()
    local path = TASKS_PATH .. "/Pending.md"

    local date = vim.fn.strftime("%d %b, %Y")
    local time = vim.fn.strftime("%H:%M")

    vim.fn.writefile({
        "",
        "## " .. time .. " | " .. date,
        ""
    }, path, "a")

    vim.cmd("edit " .. path)
    vim.cmd "normal G"
end

vim.cmd "command! Note lua require\"utils.vault\".open_today_note()"
vim.cmd "command! Task lua require\"utils.vault\".open_pending_tasks()"

return {
    open_today_note = open_today_note,
    open_pending_tasks = open_pending_tasks
}
