return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Go
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.diagnostics.golangci_lint,

                -- Lua
                null_ls.builtins.formatting.stylua,

                -- Kotlin
                null_ls.builtins.formatting.ktlint,

                -- JSON
                null_ls.builtins.formatting.prettier, -- works for JSON, HTML, etc.

                -- HTML
                null_ls.builtins.formatting.prettier,

                -- Protobuf
                null_ls.builtins.formatting.buf,

                -- YAML / Docker Compose
                null_ls.builtins.formatting.prettier, -- for YAML files

                -- Optional: Nginx (if you have a formatter installed)
                -- null_ls.builtins.formatting.nginx_beautifier
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
