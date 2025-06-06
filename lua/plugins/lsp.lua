return {
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim"
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            local on_attach = function(client, bufnr)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
                vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
                vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            end

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls",
                    "dockerls",
                    "html",
                    "jdtls",
                    "ts_ls",
                    "lua_ls",
                    "pyright",
                    "terraformls",
                },
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({
                            on_attach = on_attach,
                            capabilities = capabilities
                        })
                    end
                }
            })

        end
    }
}
