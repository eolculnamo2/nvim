return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local lspconfig = require("lspconfig")
            -- local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }

                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
                        buffer = bufnr,
                        callback = function()
                            if vim.bo.filetype ~= "go" then
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end
                        end,
                    })
                end

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format { async = true } end, opts)
            end

            local servers = require("mason-lspconfig").get_installed_servers()

            for _, server_name in ipairs(servers) do
                lspconfig[server_name].setup {
                    on_attach = on_attach,
                    -- capabilities = capabilities,
                }
            end
        end
    }
}
