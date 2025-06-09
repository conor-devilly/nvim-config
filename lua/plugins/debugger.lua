return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "jbyuki/one-small-step-for-vimkind",
        "mfussenegger/nvim-dap-python",
        "mfussenegger/nvim-jdtls",
    },
    lazy = false,

    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()

        -- DAP UI Setup
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- Keybinds
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<leader>do", dap.step_over, {})
        vim.keymap.set("n", "<leader>dO", dap.step_out, {})
        vim.keymap.set("n", "<leader>di", dap.step_into, {})
        vim.keymap.set("n", "<leader>dc", dap.continue, {})

        -- DAP configs
        -- Neovim Lua
        dap.configurations.lua = {
            {
                type = "nlua",
                request = "attach",
                name = "Attach to running Neovim instance",
            },
        }
        dap.adapters.nlua = function(callback, config)
            callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
        end

        -- Python
        require("dap-python").setup("python3")

        -- Java configured in lsp.lua
        dap.configurations.java = {
            {
                javaExec = "java",
                request = "launch",
                type = "java",
            },
        }
    end,
}
