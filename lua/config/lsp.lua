local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("pyright", {
    capabilities = capabilities,
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
    },
})

vim.lsp.config("ruff", {
    capabilities = capabilities,
})

vim.lsp.config("clangd", { capabilities = capabilities })
vim.lsp.config("rust_analyzer", { capabilities = capabilities })
vim.lsp.config("lua_ls", { capabilities = capabilities })

vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("lua_ls")
vim.lsp.enable("ruff")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.textwidth = 0
    vim.opt_local.colorcolumn = "89"
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
