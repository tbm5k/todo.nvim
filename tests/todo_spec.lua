describe("todo", function()
    before_each(function()
        vim.cmd("enew")
        vim.bo.filetype = "lua"
        vim.api.nvim_buf_set_lines(0, 0, -1, false, {
            "-- TODO: todo comment",
            "-- FIX: first fix comment",
            "-- FIX: second fix comment",
        })
    end)

    it("should return list of todos", function()
        require("todo").findTodos()

        local buf = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        -- assert.is.True(true)
        assert.True(vim.tbl_contains(buf, "Total TODO: 1"))
    end)

    it("it should find fixes", function()
        require("todo").findFixes()
    
        local buf = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        assert.True(vim.tbl_contains(buf, "Total FIX: 2"))
    end)
end)
