return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",

      ["<CR>"] = { "fallback" },

      ["<Tab>"] = {
        function(cmp)
          if cmp.is_menu_visible() then
            return cmp.select_and_accept()
          end
          if cmp.snippet_active() then
            return cmp.snippet_forward()
          end
          return nil
        end,
        "fallback",
      },

      ["<S-Tab>"] = {
        function(cmp)
          if cmp.is_menu_visible() then
            return cmp.select_prev()
          end
          if cmp.snippet_active() then
            return cmp.snippet_backward()
          end
          return nil
        end,
        "fallback",
      },
    },

    appearance = { nerd_font_variant = "mono" },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },

    signature = { enabled = true },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        buffer = { score_offset = -3 },
      },
    },

    fuzzy = {
      implementation = "prefer_rust_with_warning",
      sorts = { "exact", "score", "sort_text" },
    },
  },
  opts_extend = { "sources.default" },
}

