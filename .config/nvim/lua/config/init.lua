vim.cmd("set nowrap")
vim.o.signcolumn = "yes"
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set pumheight=20")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- tabs
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { silent = true })
vim.keymap.set("n", "<C-Tab>", ":bd<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<Esc>", ':let @/ = ""<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.breakindent = true

vim.wo.relativenumber = true
vim.opt.number = true

vim.api.nvim_set_keymap("n", "K", "5k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "J", "5j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", "5k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "J", "5j", { noremap = true, silent = true })
