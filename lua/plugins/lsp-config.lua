return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",
          "lua_ls",
          "clangd",
          "kotlin_language_server",
          "html",
          "jsonls",
          "buf_ls",
          "dockerls",
          "docker_compose_language_service",
          "nginx_language_server",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {     -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        float = {
          transparent = true,           -- enable transparent floating windows
          solid = false,                -- use solid styling for floating windows
        },
        show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
        term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = true,               -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,            -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,              -- Force no italic
        no_bold = false,                -- Force no bold
        no_underline = false,           -- Force no underline
        styles = {                      -- Handles the styles of general hi groups
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        auto_integrations = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })

      -- Load the colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Optional: global float border style for consistency (affects diagnostics, hover, etc.)
      vim.api.nvim_set_hl(0, "FloatBorder", { link = "NormalFloat" }) -- or customize color

      local border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      }

      -- Apply rounded border to hover
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = border, -- or simply "rounded" (see below)
          -- max_width = 80,        -- optional: limit width
          -- max_height = 20,
        }
      )

      -- Apply same border style to diagnostics float (your K mapping)
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
          border = border,
        }
      )

      -- Your keymaps (unchanged, but now hover should have border)
      vim.keymap.set("n", "I", function()
        vim.lsp.buf.hover({ border = "rounded" })     -- ← border here!
      end, { desc = "LSP Hover" })
      vim.keymap.set("n", "II", vim.lsp.buf.definition, { desc = "LSP Definition" })
      vim.keymap.set("n", "K", vim.diagnostic.open_float, { desc = "Diagnostics Float" })

      -- Optional: nicer diagnostic float too
      vim.diagnostic.config({
        float = { border = "rounded" },
      })
    end,
  },
}
