return {
  {
      'akinsho/toggleterm.nvim',
      version = "*",
      keys = {
          { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
          { "<leader>tf", "<cmd>ToggleTerm direction<cr>", desc = "Termnial (float)" },
          { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "terminal (horizontal)" },
          { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "terminal (vertial)" },

          { "<C-/>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
      },
      opts = {
          insert_mappings = true,
          terminal_mappings = true,
      },
  }
}
