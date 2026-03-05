local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("pyright", { capabilities = capabilities })
vim.lsp.config("clangd", { capabilities = capabilities })
vim.lsp.config("rust_analyzer", { capabilities = capabilities })
vim.lsp.config("lua_ls", { capabilities = capabilities })

vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("lua_ls")
