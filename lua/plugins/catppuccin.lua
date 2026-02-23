return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour                = "mocha",                                           -- darkest flavor — keep it
      background             = { light = "latte", dark = "mocha" },
      transparent_background = false,                                             -- important: keep background solid black-ish
      dim_inactive           = { enabled = true, shade = "dark", percentage = 0.25 }, -- ← increased dim for better focus on active window

      show_end_of_buffer     = false,
      term_colors            = true, -- optional but nice for :terminal in Go projects

      no_italic              = false,
      no_bold                = false,
      no_underline           = false,

      styles                 = {
        comments     = { "italic" },
        conditionals = { "italic" },
        loops        = {},
        functions    = { "bold" },         -- ← make func names bolder
        keywords     = { "bold" },         -- ← Go keywords (func, if, for, go, chan, etc.) bolder
        strings      = {},
        variables    = {},
        numbers      = {},
        booleans     = { "bold" },
        properties   = {},
        types        = { "bold" },         -- ← struct, interface, type names bolder
        operators    = {},
      },

      color_overrides        = {
        -- Make background even darker / blacker if your terminal allows true black
        -- base = "#000000",   -- uncomment only if you want pure black (can look flat)
      },

      custom_highlights      = function(colors)
        return {
          -- Go-specific improvements (very effective)
          ["@keyword"]            = { fg = colors.red, style = { "bold" } },                       -- func, if, else, for, return, go, defer, chan...
          ["@keyword.function"]   = { fg = colors.mauve, style = { "bold" } },                     -- func keyword
          ["@keyword.operator"]   = { fg = colors.red },                                           -- :=, ++, --
          ["@type"]               = { fg = colors.yellow, style = { "bold" } },                    -- struct, interface, map, chan
          ["@type.builtin"]       = { fg = colors.peach },                                         -- string, int, bool, error
          ["@function"]           = { fg = colors.blue, style = { "bold" } },                      -- function names
          ["@function.call"]      = { fg = colors.blue },
          ["@variable"]           = { fg = colors.text },                                          -- regular vars
          ["@variable.parameter"] = { fg = colors.maroon },                                        -- func params
          ["@string"]             = { fg = colors.green },
          ["@comment"]            = { fg = colors.overlay0, style = { "italic" } },                -- brighter comments so you can still read them
          ["@constant"]           = { fg = colors.peach, style = { "bold" } },                     -- true, false, iota, nil
          ["@constant.builtin"]   = { fg = colors.peach },

          -- Better Treesitter separation for Go structs / methods
          ["@method"]             = { fg = colors.blue, style = { "bold" } },
          ["@field"]              = { fg = colors.teal },                -- struct fields
          ["@property"]           = { fg = colors.teal },

          -- Make error / TODO stand out more
          Error                   = { fg = colors.red, bg = colors.surface0 },
          Todo                    = { fg = colors.yellow, bg = colors.surface1, style = { "bold" } },
        }
      end,

      default_integrations   = true,
      integrations           = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = { enabled = true, indentscope_color = "" },
        -- add these if you use them for Go
        -- native_lsp = { enabled = true, underlines = { errors = { "undercurl" } } },
        -- lsp_trouble = true,
        -- which_key = true,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
