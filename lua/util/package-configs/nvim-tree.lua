local M = {}
local status, ntree = pcall(require, "nvim-tree")

local screen_width = vim.opt.columns:get()
local screen_height = vim.opt.lines:get()

local float_width = math.floor(vim.api.nvim_win_get_width(0) / 1.5)
local float_height = math.floor(vim.api.nvim_win_get_height(0) / 1.5)
local float_col = math.floor((screen_width - float_width) / 2)
local float_row = math.floor((screen_height - float_height) / 2)

if not status then
	M.Config = function()
		vim.notify("nvim-tree is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	end
	return false
end

function M.Config()
	ntree.setup({
		git = {
			enable = true,
		},
		filters = {
			custom = {
				".git",
				"node_modules",
			},
			exclude = {
				".gitignore",
				".env",
			},
			dotfiles = true,
		},
		view = {
			width = 20,
			float = {
				enable = true,
				quit_on_focus_loss = true,
				open_win_config = {
					relative = "editor",
					border = "rounded",
					width = float_width,
					height = float_height,
					col = float_col,
					row = float_row,
				},
			},
		},
		renderer = {
			special_files = {},
			icons = {
				glyphs = {
					default = "󱧶",
					symlink = "󰈝",
					bookmark = "󰩋",
					folder = {
						arrow_closed = "",
						arrow_open = "",
						default = "󰚝",
						open = "󰝰",
						empty = "󱃫",
						empty_open = "",
						symlink = "",
						symlink_open = "",
					},
					git = {
						unstaged = "󰜎",
						staged = "󰜘",
						unmerged = "",
						renamed = "󰴒",
						untracked = "",
						deleted = "󱂦",
						ignored = "◌",
					},
				},
			},
		},
	})
end

return M
