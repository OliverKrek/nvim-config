-- ~/.config/nvim/lua/plugins/fugitive.lua

return {
    "tpope/vim-fugitive",
    config = function()
        -- The main "Status" window
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status (Fugitive)" })

        -- Quick shortcuts for common tasks
        -- Push and Pull
        vim.keymap.set("n", "<leader>gp", function() vim.cmd.Git('push') end, { desc = "Git Push" })
        vim.keymap.set("n", "<leader>gP", function() vim.cmd.Git('pull') end, { desc = "Git Pull" })
        
        -- Resolve Merge Conflicts
        -- 'gh' (get left/target) and 'gl' (get right/merge)
        vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>", { desc = "Git Diff Get Target" })
        vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>", { desc = "Git Diff Get Merge" })
    end
}
