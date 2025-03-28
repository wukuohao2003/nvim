local M = {}

local status, cmp = pcall(require, "cmp")
if not status then
	M.Config = function()
		vim.notify("cmp is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	end
	return false
end

local lsp_configure = require("util.lsp-configs.lsp-configure")
local diagnostic_signs = require("util.lsp-configs.kinds.kinds").DiagnosticSign

local function setup_diagnostic_signs()
	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

local function setup_cmp()
	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = lsp_configure.LspWindow,
		mapping = cmp.mapping.preset.insert(lsp_configure.LspMapping),
		sources = cmp.config.sources(lsp_configure.LspSource.default),
		formatting = lsp_configure.LspFormat,
		experimental = {
			ghost_text = true,
		},
	})
end

local function setup_cmdline()
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources(lsp_configure.LspSource.cmdline.search),
		formatting = lsp_configure.LspFormat,
		experimental = {
			ghost_text = true,
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources(lsp_configure.LspSource.cmdline.comamnd),
		formatting = lsp_configure.LspFormat,
		experimental = {
			ghost_text = true,
		},
	})
end

function M.Config()
	setup_diagnostic_signs()
	setup_cmp()
	setup_cmdline()
end

return M
