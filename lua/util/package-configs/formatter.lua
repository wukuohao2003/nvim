local status, fmt = pcall(require, "formatter")
local M = {}

if not status then
	M.Config = function()
		vim.notify("formatter is no found ...", vim.log.levels.ERROR, { title = "Nvim" })
	end
	return false
end

function M.Config()
	fmt.setup({
		logging = false,
		filetype = {
			json = { require("formatter.filetypes.json").prettier },
			javascript = { require("formatter.filetypes.javascript").prettier },
			javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
			typescript = { require("formatter.filetypes.typescript").prettier },
			typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
			html = { require("formatter.filetypes.html").prettier },
			vue = { require("formatter.filetypes.vue").prettier },
			css = { require("formatter.filetypes.css").prettier },
			scss = { require("formatter.filetypes.css").prettier },
			less = { require("formatter.filetypes.css").prettier },
			java = { require("formatter.filetypes.java").clangformat },
			lua = { require("formatter.filetypes.lua").stylua },
			python = { require("formatter.filetypes.python").ruff },
			markdown = { require("formatter.filetypes.markdown").prettier },
			go = { require("formatter.filetypes.go").gofumpt },
			bash = { require("formatter.filetypes.sh").shfmt },
			sh = { require("formatter.filetypes.sh").shfmt },
			c = { require("formatter.filetypes.c").clangformat },
			cpp = { require("formatter.filetypes.cpp").clangformat },
			cs = { require("formatter.filetypes.cs").clangformat },
			dart = { require("formatter.filetypes.dart").dartformat },
			rust = { require("formatter.filetypes.rust").rustfmt },
		},
	})
end

return M
