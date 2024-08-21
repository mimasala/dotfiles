return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					".venv",
				},
			},
		})
		pcall(require("telescope").load_extension, "fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "search files" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "search by grep" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "search buffers" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "search help" })
	end,
}
