-- -- --------------------------------------------------------------------------
-- General settings
-- -----------------------------------------------------------------------------

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.ttyfast = true

-- Font
vim.g.have_nerd_font = false

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250 -- A lower updatetime value makes your editor more responsive to actions like showing diagnostics or other plugin-triggered events that rely on the CursorHold event

-- Fix backspace indent
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Mouse support
vim.opt.mouse = "a"
vim.opt.mousemodel = "popup"

if vim.fn.has("gui_running") == 1 then
	if vim.fn.has("gui_mac") == 1 or vim.fn.has("gui_macvim") == 1 then
		vim.opt.guifont = "Menlo:h12"
		vim.opt.transparency = 7
	end
else
	if os.getenv("COLORTERM") == "gnome-terminal" then
		vim.opt.term = "gnome-256color"
	else
		if os.getenv("TERM") == "xterm" then
			vim.opt.term = "xterm-256color"
		end
	end
end

-- Inner file navigation
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.cursorline = true

-- Tab
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- No swap files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Syntax
vim.cmd("syntax on")
vim.cmd("syntax enable")
vim.opt.re = 0

-- Better command line completion
vim.opt.wildmenu = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.shortmess:remove("S")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Set highlight on search, but clear on pressing <Esc> in normal mode
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- GF (Go to file)
vim.opt.path:append("$PWD/node_modules")
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Copy/Paste/Cut
if vim.fn.has("unnamedplus") == 1 then
	vim.opt.clipboard = "unnamed,unnamedplus"
end
if vim.fn.has("macunix") == 1 then
	vim.api.nvim_set_keymap("v", "<C-x>", ":!pbcopy<CR>", { noremap = true })
	vim.api.nvim_set_keymap("v", "<C-c>", ":w !pbcopy<CR><CR>", { noremap = true })
end

vim.opt.showtabline = 2
