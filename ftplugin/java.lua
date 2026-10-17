-- ~/.config/nvim/ftplugin/java.lua

-- 1. Grab the Mason installation path for jdtls
local mason_registry = require("mason-registry")
local jdtls_pkg = mason_registry.get_package("jdtls")
local jdtls_path = jdtls_pkg:get_install_path()

-- 2. Determine the project name and unique workspace directory
-- This prevents different projects from colliding or overriding cache files.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name

-- 3. Find the project root directory
-- Looks for typical markers like build files or git directories
local root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })

-- 4. Build our JDTLS command line
local cmd = {
  -- Use the Mason binary wrapper directly
  jdtls_path .. "/bin/jdtls",
  
  -- Specify where JDTLS should drop its workspace project data
  "-data", workspace_dir,

  -- JVM Arguments
  -- You can bump up the memory (-Xmx) if you work on large repos
  "--jvm-arg=-Xmx2G",
  -- Prevents Eclipse from polluting your project folder with .project/.settings files
  "--jvm-arg=-Djava.import.generatesMetadataFilesAtProjectRoot=false",
}

-- 5. Set up your LSP configuration options
local config = {
  cmd = cmd,
  root_dir = root_dir,
  
  -- Enable standard capabilities (auto-completion, etc.)
  capabilities = vim.lsp.protocol.make_client_capabilities(),

  settings = {
    java = {
      -- You can configure compiler compliance, code formatting, signatures etc. here
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" }, -- Use decompiled code for external libraries
    },
  },
}

-- 6. Boot or attach nvim-jdtls to the buffer
require("jdtls").start_or_attach(config)

-- 7. Java-specific Keymaps
vim.keymap.set("n", "<leader>jo", "<Cmd>lua require('jdtls').organize_imports()<CR>", { desc = "Java Organize Imports", buffer = 0 })
vim.keymap.set("n", "<leader>jv", "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = "Java Extract Variable", buffer = 0 })
vim.keymap.set("v", "<leader>jv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { desc = "Java Extract Variable (Selection)", buffer = 0 })
vim.keymap.set("n", "<leader>jc", "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = "Java Extract Constant", buffer = 0 })
