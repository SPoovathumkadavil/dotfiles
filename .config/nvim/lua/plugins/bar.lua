return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.theme = require("lib.bar-theme").theme()
    opts.options.section_separators = ""
    opts.options.component_separators = ""
    opts.options.disabled_filetypes = { "ministarter" }
  end,
}
