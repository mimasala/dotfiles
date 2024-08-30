return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		config = function()
			local lsp_zero = require("lsp-zero")

			lsp_zero.on_attach(function(client, bufnr)
				local maps = vim.keymap.set
				local opts_l = { silent = true, noremap = true }
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = client.buf, desc = "LSP: " .. desc })
				end
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				maps("n", "K", vim.lsp.buf.hover, opts_l)
				maps({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, opts_l)
				lsp_zero.default_keymaps({
					buffer = bufnr,
				})
			end)

			-- to learn how to use mason.nvim
			-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
				-- this is how you config an lsp installed through mason
				-- handlers = {function(server_name)
				-- require('lspconfig')[server_name].setup({})
				-- end}
			})
			require("lspconfig").lua_ls.setup({})
		end,
	},
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
}
