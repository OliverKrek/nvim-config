vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

require("config.lsp")
require("config.lazy_init")
require("config.remap")
require("config.set")
