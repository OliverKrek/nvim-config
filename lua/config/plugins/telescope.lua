return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    -- This defines the keys that TRIGGER the plugin to load
    keys = {
        { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = "Find Files" },
        { '<C-f>', function() require('telescope.builtin').git_files() end, desc = "Git Files" },
        { '<leader>ps', function() 
            require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) 
        end, desc = "Grep Search" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-c>"] = actions.close,
                    },
                },
            },
        })

        telescope.load_extension('fzf')
    end
}
