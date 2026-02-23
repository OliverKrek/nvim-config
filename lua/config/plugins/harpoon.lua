return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim", -- Added as a dependency for the integration
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    -- --- Telescope Integration Setup ---
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
    end

    -- --- Keymaps ---

    -- 1. Add current file
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, 
      { desc = "Harpoon: Add File" })

    -- 2. Toggle UI (Telescope version)
    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
      { desc = "Harpoon: Open UI (Telescope)" })

    -- 3. Toggle UI (Basic Editor version - helpful for reordering)
    vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon: Edit List (Basic)" })

    -- 4. QWERTY Home Row Jumps (C-h, C-j, C-k, C-l)
    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

    -- 5. Cycle through list (Next/Prev)
    -- Shift+P and Shift+N for Quick Toggling
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon: Prev File" })
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon: Next File" })
  end,
}
