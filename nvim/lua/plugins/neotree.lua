return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            -- "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false,
        keys = {
            {
                "<C-e>",
                "<cmd>Neotree toggle<cr>",
                desc = "Toggle Neo-tree",
            },
        },
        opts = {
            window = {
                position = "left",
            },

            default_component_configs = {
                icon = {
                    enabled = false,
                },
                git_status = {
                    symbols = {
                        added = "",
                        deleted = "",
                        modified = "",
                        renamed = "",
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },

                name = {
                    use_git_status_colors = true,
                },
            },
        },
    }
}
