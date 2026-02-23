return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "┆", -- you can also try "▏" or "┆" for thinner look
      tab_char = "┆",
    },
    scope = {
      enabled = true,
      show_start = false,       -- no underline at beginning of scope
      show_end = false,         -- no underline at end of scope
    },
  },
  config = function(_, opts)
    local highlight = {
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    opts.indent.highlight = highlight

    require("ibl").setup(opts)
  end,
}
