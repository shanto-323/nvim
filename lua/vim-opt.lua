vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set linespace=2")
vim.cmd("set number")
vim.g.mapleader = " "
vim.opt.cursorline = true
vim.o.updatetime = 150
vim.opt.list = true

vim.opt.backupcopy = "yes"


vim.diagnostic.config({
    virtual_text = true, -- Show inline error text
    underline = true,    -- Show underline under errors
    signs = true,        -- Show signs in gutter
    update_in_insert = false,
    float = { border = "single" }
})

