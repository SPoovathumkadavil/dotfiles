return {
  {
    "lervag/vimtex",
    lazy = false, -- lazy-loading will disable inverse search
    config = function()
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"

      vim.g.vimtex_indent_enable = 0
      vim.g.tex_indent_items = 0

      -- skim viewer
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_sync = 1
      vim.g.vimtex_view_skim_activate = 1

      -- Set up forward search
      vim.g.vimtex_view_skim_reading_bar = 1
      vim.g.vimtex_view_skim_sync_forward = 1

      -- Ensure Skim is the default PDF viewer
      vim.g.vimtex_view_general_viewer = "/Applications/Skim.app/Contents/SharedSupport/displayline"
      vim.g.vimtex_view_general_options = "-r @line @pdf @tex"
    end,
    keys = {
      { "<localLeader>l", "", desc = "+vimtext" },
    },
  },
}
