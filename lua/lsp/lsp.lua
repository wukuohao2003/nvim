local M = {}
local status, cmp = pcall(require, "cmp")
local luasnip = require("luasnip")

if not status then
	vim.notify("cmp is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	return false
end

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

function M.Config()
	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<Tab>"] = cmp.mapping(function(callback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					callback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(callback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					callback()
				end
			end, { "i", "s" }),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "lua_cmp" },
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				vim_item.kind =
					string.format("%s %s", require("lsp.kinds.kinds").kinds[vim_item.kind], vim_item.kind .. "  ")
				vim_item.menu = ({
					luasnip = "   󰬚",
					nvim_lsp = "   󰬓",
					buffer = "   󰬉",
					path = "   󰬗",
					lua_cmp = "   󰬊",
				})[entry.source.name]
				return vim_item
			end,
		},
		experimental = {
			ghost_text = true,
		},
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "buffer" },
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				vim_item.kind =
					string.format("%s %s", require("lsp.kinds.kinds").kinds[vim_item.kind], vim_item.kind .. "  ")
				vim_item.menu = ({
					buffer = "   󰬉",
				})[entry.source.name]
				return vim_item
			end,
		},
		experimental = {
			ghost_text = true,
		},
	})

	cmp.setup.cmdline({ ":" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
			{
				name = "codecompanion",
			},
		}, {
			{ name = "cmdline" },
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				vim_item.kind =
					string.format("%s %s", require("lsp.kinds.kinds").kinds[vim_item.kind], vim_item.kind .. "  ")
				vim_item.menu = ({
					path = "   󰬗",
					cmdline = "   󰬊",
				})[entry.source.name]
				return vim_item
			end,
		},
		experimental = {
			ghost_text = true,
		},
	})
end

return M
