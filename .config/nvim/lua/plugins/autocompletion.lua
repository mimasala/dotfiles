return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
		{
			"mlaursen/vim-react-snippets",
			config = function()
				require("vim-react-snippets").lazy_load()
			end

		},
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		}
	},
	opts = function()
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
	end,
	config = function()
		local cmp = require('cmp')
		require("luasnip").config.setup({})
		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			},
			mapping = {
				['<CR>'] = cmp.mapping.confirm({
					select = true
				}),
				['<C-e>'] = cmp.mapping.abort(),
				['<S-Tab>'] = cmp.mapping.select_prev_item({
					behavior = 'select'
				}),
				['<Tab>'] = cmp.mapping.select_next_item({
					behavior = 'select'
				}),
			},
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end
			}
		})
	end,
}
