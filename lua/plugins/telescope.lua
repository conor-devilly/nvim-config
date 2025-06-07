return {
    {
        "nvim-telescope/telescope.nvim",
        tab = "0.1.8",
        dependencies = {
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local builtin = require("telescope.builtin")
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                    ["file_browser"] = {
                        hijack_netrw = true,
                    },
                },
            })
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("file_browser")

            vim.keymap.set("n", "<leader>ff", builtin.find_files)
            vim.keymap.set("n", "<C-f>", builtin.find_files)
            vim.keymap.set("n", "<leader>fg", builtin.git_files)
            vim.keymap.set("n", "<leader>gs", builtin.grep_string)
            vim.keymap.set("n", "<leader>lg", builtin.live_grep)
            vim.keymap.set("n", "<leader>fs", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
        end,
    },
}
