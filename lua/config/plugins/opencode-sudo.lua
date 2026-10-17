return {
  "sudo-tee/opencode.nvim",
  enabled = true,
  lazy = false,
  config = function()
    require("opencode").setup({
        ui = {
            input = {
                text = {
                    wrap = true,
                },
            },
        },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
        file_types = { 'markdown', 'opencode_output' },
      },
      ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
    },
    'saghen/blink.cmp',
    'nvim-telescope/telescope.nvim',
  },
}
