return {{'williamboman/mason.nvim'}, {'williamboman/mason-lspconfig.nvim'}, {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({
                buffer = bufnr
            })
        end)

        -- to learn how to use mason.nvim
        -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {"lua_ls"}
            -- this is how you config an lsp installed through mason
            -- handlers = {function(server_name)
            -- require('lspconfig')[server_name].setup({})
            -- end}
        })
        require('lspconfig').lua_ls.setup({})
    end
}, {'neovim/nvim-lspconfig'}, {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/nvim-cmp'}}
