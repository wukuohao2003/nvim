local status, lul = pcall(require, "lualine")
local M = {}

if not status then
	M.Config = function()
		vim.notify("lualine is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	end
	return false
end

function M.Config()
	lul.setup({
		options = {
			icons_enabled = true,
			theme = "miracle-of-god",
			component_separators = { left = " ", right = " " },
			section_separators = { left = "  ", right = "  " },
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1,
				tabline = 1,
				winbar = 1,
			},
		},
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {
			lualine_a = {},
			lualine_b = {
				{
					"filetype",
					icon_only = false,
				},
				"branch",
				"diff",
				{
					"filename",
					path = 0,
					file_status = false,
					newfile_status = false,
					symbols = {
						unnamed = "",
					},
				},
			},
			lualine_c = {
				{
					symbols = {
						modified = "󰬋",
						readonly = "󰬞",
						unnamed = "󰅰",
						newfile = "󰎔",
					},
				},
			},
			lualine_x = {
				{
					"diagnostics",
					sources = { "nvim_lsp" },
					sections = { "error", "warn", "info", "hint" },
					diagnostics_color = {
						error = "DiagnosticError",
						warn = "DiagnosticWarn",
						info = "DiagnosticInfo",
						hint = "DiagnosticHint",
					},
					symbols = { error = "󰬌 ", warn = "󰬞 ", info = "󰬐 ", hint = "󰬏 " },
					colored = true,
					update_in_insert = true,
					always_visible = true,
				},
			},
			lualine_y = {
				{ "datetime", style = "󰄉 %Y˚%m˚%d | %H:%M:%S" },
			},
			lualine_z = {
				{
					"lsp-status",
					show_count = false,
					disabled_filetypes = { "mason", "NvimTree", "TelescopePrompt", "toggleterm", "codecompanion", "" },
					icons = {
						active = "",
						inactive = "",
					},
				},
			},
		},
	})
end

return M
