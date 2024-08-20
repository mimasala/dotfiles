return {
	"rcarriga/nvim-notify",
	opts = {
		max_width = function()
			return math.floor(vim.o.lines * 0.8)
		end,
		background_colour = "#000000", -- This will be used as the default background color
		render = "compact",
		fps = 30,
		icons = {
			DEBUG = "",
			ERROR = "",
			INFO = "",
			TRACE = "✎",
			WARN = "",
		},
		level = 2,
		minimum_width = 50,
		time_formats = {
			notification = "%T",
			notification_history = "%FT%T",
		},
		stages = "fade",
		timeout = 5000,
		top_down = true,
	},
	config = function(_, opts)
		require("notify").setup(opts)
		vim.notify = require("notify")
	end,
}


