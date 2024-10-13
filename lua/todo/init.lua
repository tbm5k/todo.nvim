--[[ 
-- We should be able to log the total number of todos in the file
-- We should let the user query for the new number of todos
-- We should provide a terminal with all the todos listed in the open buffer
]]--
local M = {}

-- TODO: write a test to this
local patternMatcher = function(pattern)
    local bufnr = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false);

    local result = {}
    local count = 0

    local commentPattern = "^%s*%-%-" -- pattern matcher

    for key, line in ipairs(lines) do
        if line:match(commentPattern) and line:match(pattern) then
            count = count + 1
            table.insert(result, string.format("%d: %s", key, line))
        end
    end

    return result, count
end

-- TODO: write a test to this
local renderResults = function(result, pattern, count)
    vim.cmd("new")
    vim.cmd('setlocal buftype=nofile')
    vim.cmd('setlocal bufhidden=hide')
    vim.cmd('setlocal noswapfile')

    table.insert(result, 1, "")
    table.insert(result, 1, string.format("Total %s: %d", pattern, count))
    vim.api.nvim_buf_set_lines(0, 0, -1, false, result)

    -- wipe out buffer on close
    vim.api.nvim_create_autocmd("BufDelete", {
        buffer = 0,  -- Current buffer
        callback = function()
            vim.cmd("bwipeout")
        end,
    })
end

M.findFixes = function()
    local pattern = "FIX";
    local results, count = patternMatcher(pattern)
    renderResults(results, pattern, count)
end

M.findTodos = function()
    local pattern = "TODO";
    local results, count = patternMatcher(pattern)
    renderResults(results, pattern, count)
end

M.findTodos()

return M

