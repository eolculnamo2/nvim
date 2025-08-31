return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig", "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                "ts_ls"
            }
        }
    }
}
