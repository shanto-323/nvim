_G.toggle_floating_terminal = function()
    local api = vim.api
    if floating_win and api.nvim_win_is_valid(floating_win) then
        api.nvim_win_close(floating_win, true)
        floating_win = nil
        return
    end

    if floating_buf and api.nvim_buf_is_valid(floating_buf) then
        local width = math.floor(vim.o.columns * 0.8)
        local height = math.floor(vim.o.lines * 0.8)
        local row = math.floor((vim.o.lines - height) / 2)
        local col = math.floor((vim.o.columns - width) / 2)

        local opts = {
            relative = "editor",
            width = width,
            height = height,
            row = row,
            col = col,
            style = "minimal",
            border = "rounded",
        }

        floating_win = api.nvim_open_win(floating_buf, true, opts)
        vim.cmd("startinsert")
        return
    end

    floating_buf = api.nvim_create_buf(true, true)
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local opts = {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    }

    floating_win = api.nvim_open_win(floating_buf, true, opts)
    vim.fn.termopen(vim.o.shell)
    vim.cmd("startinsert")

    api.nvim_buf_set_keymap(floating_buf, 't', '<C-q>',
        '<C-\\><C-n>:lua vim.fn.jobstop(vim.b[vim.fn.bufnr("%")].terminal_job_id)<CR>:close<CR>',
        { noremap = true, silent = true })
end

-- keymaps
vim.keymap.set('n', '<leader>t', _G.toggle_floating_terminal)
vim.keymap.set('t', '<leader>t', '<C-\\><C-n>:lua _G.toggle_floating_terminal()<CR>')
