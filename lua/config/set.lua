-- settings for vim 
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"

vim.o.updatetime = 400

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    virtual_lines = false,
    update_in_insert = true
})
