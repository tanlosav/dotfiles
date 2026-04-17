return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    opts = {
        provider = "openai",
        instructions_file = "AGENTS.md",
        providers = {
            openai = {
                endpoint = "http://srv-spugpu/generative/v1",
                model = "Qwen3-32B",
                api_key = "OPENAI_API_KEY",
                max_tokens = 8000,
                timeout = 60000,
            },
        },

        -- rag_service = {
        --     enabled = true,
        --     host_mount = os.getenv("HOME"),
        --     runner = "docker",
        --     llm = {
        --         provider = "openai",
        --         endpoint = "http://srv-spugpu/generative/v1",
        --         api_key = "OPENAI_API_KEY",
        --         model = "Qwen3-32B",
        --         extra = nil,
        --     },
        --     embed = {
        --         provider = "openai",
        --         endpoint = "http://srv-spugpu/generative/v1",
        --         api_key = "OPENAI_API_KEY",
        --         model = "Qwen3-32B",
        --         extra = nil,
        --     },
        --     docker_extra_args = "",
        -- },

        selector = {
            provider = "telescope",
            provider_opts = {},
        },

        input = {
            provider = "snacks",
            provider_opts = {
                title = "Avante Input",
                icon = "󰚩",
            },
        },
    },

    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-tree/nvim-web-devicons",
        "folke/snacks.nvim",
        -- Исправленная конфигурация render-markdown.nvim
        {
            "MeanderingProgrammer/render-markdown.nvim",
            ft = { "markdown", "Avante" },
            opts = {
                file_types = { "markdown", "Avante" },
            },
        },
    },
}
