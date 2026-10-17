local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Python LSP --
vim.lsp.config("pyright", {
    capabilities = capabilities,
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
    },
})

-- Ruff LSP --
vim.lsp.config("ruff", {
    capabilities = capabilities,
})

-- XML LSP --
vim.lsp.enable("lemminx")

vim.lsp.config("clangd", { capabilities = capabilities })
vim.lsp.config("rust_analyzer", { capabilities = capabilities })
vim.lsp.config("lua_ls", { capabilities = capabilities })

-- YAML LSP --
vim.lsp.config("yamlls", {
    capabilities = capabilities,
    settings = {
        yaml = {
            validate = true,
            hover = true,
            completion = true,
            format = {
                enable = true,
            },

            schemas = {
                ["bundle_config_schema.json"] = {
                    "databricks.yml",
                    "resources/*.yml",
                    "resources/*.yml",
                    "resources/**/*.yml",
                    "resources/**/*.yaml",
                },
            },
        },
    },
})


vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("lua_ls")
vim.lsp.enable("ruff")
vim.lsp.enable("yamlls")

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
