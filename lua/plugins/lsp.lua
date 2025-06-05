return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "bashls",
            "dockerls",
            "html",
            "java_language_server",
            "ts_ls",
            "lua_ls",
            "pyright",
            "terraformls",
        }
    },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {
            }
        },
        "neovim/nvim-lspconfig",
    },

    config = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    end
}
