local heirline = require("heirline")
local lib = require("heirline-components.all") -- I call it lib for short, but you can call it as you want.

-- You can also try to run this after setup.
-- If subscribe_to_events() don't run correctly, you will see an empty tabline.
lib.init.subscribe_to_events()
heirline.load_colors(lib.hl.get_colors())

heirline.setup({
	opts = {
		disable_winbar_cb = function(args) -- We do this to avoid showing it on the greeter.
			local is_disabled = not require("heirline-components.buffer").is_valid(args.buf)
				or lib.condition.buffer_matches({
					buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
					filetype = {
						"NvimTree",
						"neo%-tree",
						"dashboard",
						"Outline",
						"aerial",
						"rnvimr",
						"yazi",
					},
				}, args.buf)
			return is_disabled
		end,
	},
	tabline = { -- UI upper bar
		lib.component.tabline_conditional_padding(),
		lib.component.tabline_buffers(),
		lib.component.fill({ hl = { bg = "tabline_bg" } }),
		lib.component.tabline_tabpages(),
	},
	-- winbar = { -- UI breadcrumbs bar
	-- 	---@class WinbarComponent
	-- 	---@field bufnr integer
	-- 	init = function(self)
	-- 		self.bufnr = vim.api.nvim_get_current_buf()
	-- 	end,
	-- 	fallthrough = false,
	-- 	-- Winbar for terminal, neotree, and aerial.
	-- 	{
	-- 		condition = function()
	-- 			return not lib.condition.is_active()
	-- 		end,
	-- 		{
	-- 			lib.component.neotree(),
	-- 			lib.component.compiler_play(),
	-- 			lib.component.fill(),
	-- 			lib.component.compiler_redo(),
	-- 			lib.component.aerial(),
	-- 		},
	-- 	},
	-- 	-- Regular winbar
	-- 	{
	-- 		lib.component.neotree(),
	-- 		lib.component.compiler_play(),
	-- 		lib.component.fill(),
	-- 		lib.component.breadcrumbs(),
	-- 		lib.component.fill(),
	-- 		lib.component.compiler_redo(),
	-- 		lib.component.aerial(),
	-- 	},
	-- },
	-- statuscolumn = { -- UI left column
	-- 	init = function(self)
	-- 		self.bufnr = vim.api.nvim_get_current_buf()
	-- 	end,
	-- 	lib.component.foldcolumn(),
	-- 	lib.component.numbercolumn(),
	-- 	lib.component.signcolumn(),
	-- } or nil,
	statusline = { -- UI statusbar
		init = function(self)
			self.bufnr = vim.api.nvim_get_current_buf()
		end,
		fallthrough = false,
		{
			condition = function()
				return not lib.condition.is_active()
			end,
			hl = { fg = "fg", bg = "bg" },
			lib.component.mode(),
			lib.component.git_branch(),
		},
		-- Active statusline
		{
			hl = { fg = "bg", bg = "bg" },
			lib.component.mode(),
			lib.component.git_branch(),
			lib.component.file_info(),
			lib.component.git_diff(),
			lib.component.diagnostics(),
			lib.component.fill(),
			lib.component.cmd_info(),
			lib.component.fill(),
			lib.component.lsp(),
			lib.component.compiler_state(),
			lib.component.virtual_env(),
			lib.component.nav(),
			lib.component.mode({ surround = { separator = "right" } }),
		},
	},
})
