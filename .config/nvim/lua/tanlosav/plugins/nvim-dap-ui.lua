return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
        local dap = require("dap")
        local dapui = require('dapui')

        dapui.setup()

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

        -- Adding symbols for breakpoints and such
        vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "" })

        require("which-key").add({
            { "<leader>d",  group = "Debug" },
            { "<leader>db", function() dap.toggle_breakpoint() end, desc = "Toggle breakpoint" },
            { "<leader>dB", function() dap.clear_breakpoints() end, desc = "Clear all breakpoints" },
            {
                "<leader>ds",
                function()
                    dap.continue()
                    dapui.toggle({})
                end,
                desc = "Launch debug session"
            },
            { "<leader>do", function() dap.step_over() end, desc = "Step over" },
            { "<leader>di", function() dap.step_into() end, desc = "Step into" },
            { "<leader>dO", function() dap.step_out() end,  desc = "Step out" },
            { "<leader>dc", function() dap.continue() end,  desc = "Continue" },
            {
                "<leader>dS",
                function()
                    dapui.toggle({})
                    dap.terminate()
                end,
                desc = "Close debug session"
            },
            { "<leader>dk", function() dapui.eval() end, desc = "Eval current" },
        })
    end
}
