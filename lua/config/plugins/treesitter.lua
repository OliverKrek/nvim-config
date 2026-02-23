return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    require('nvim-treesitter').install({
      'javascript',
      'typescript',
      'tsx',
      'json',
      'jsdoc',
      'html',
      'css',
      'regex',
      'python',
      'lua',
      'cpp',
      -- 'vim',
      -- 'vimdoc',
      'c',
      'query',
      -- 'dart',
      'markdown',
      'markdown_inline',
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'json',
        'lua',
        'cpp',
        'c',
        'python',
        'dart',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'markdown',
      },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
