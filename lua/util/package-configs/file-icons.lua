local M = {}
local status, icons = pcall(require, "nvim-web-devicons")

if not status then
	M.Config = function()
		vim.notify("icon is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	end
	return false
end

function M.Config()
	icons.setup({
		override = {
			c = { icon = "", color = "#c0fbfd", name = "C" },
			cpp = { icon = "", color = "#c0fbfd", name = "Cpp" },
			cs = { icon = "", color = "#c0fbfd", name = "CSharp" },
			out = { icon = "", color = "#ffa6a6", name = "Cout" },
			py = { icon = "", color = "#f6f5bd", name = "Python" },
			js = { icon = "", color = "#f6f5bd", name = "Js" },
			ts = { icon = "", color = "#c0fbfd", name = "Ts" },
			vue = { icon = "", color = "#bcfdde", name = "Vue" },
			css = { icon = "", color = "#ffc0b6", name = "Css" },
			html = { icon = "", color = "#dae0ff", name = "Html" },
			mov = { icon = "󰿎", color = "#dae0ff", name = "Mov" },
			mp3 = { icon = "󰈣", color = "#dae0ff", name = "Mp3" },
			mp4 = { icon = "󰁧", color = "#dae0ff", name = "Mp4" },
			xls = { icon = "", color = "#bcfdde", name = "Xls" },
			xlsx = { icon = "", color = "#bcfdde", name = "Xlsx" },
			doc = { icon = "", color = "#c0fbfd", name = "Doc" },
			docx = { icon = "", color = "#c0fbfd", name = "Docx" },
			txt = { icon = "󱩼", color = "#dae0ff", name = "Txt" },
			json = { icon = "󰘦", color = "#f6f5bd", name = "Json" },
			md = { icon = "󰯃", color = "#ebedcb", name = "Markdown" },
			csv = { icon = "", color = "#c0fbfd", name = "Csv" },
			png = { icon = "󰸭", color = "#dae0ff", name = "Png" },
			jpeg = { icon = "󰈥", color = "#dae0ff", name = "Jpeg" },
			jpg = { icon = "󰈥", color = "#dae0ff", name = "Jpg" },
			webp = { icon = "󰜫", color = "#dae0ff", name = "Webp" },
			avif = { icon = "󰬈", color = "#dae0ff", name = "Avif" },
			zip = { icon = "", color = "#dae0ff", name = "Zip" },
			go = { icon = "", color = "#c0fbfd", name = "Go" },
			xml = { icon = "", color = "#ffc0b6", name = "Xml" },
			jade = { icon = "", color = "#dae0ff", name = "Jade" },
			log = { icon = "", color = "#c0fbfd", name = "Log" },
			scss = { icon = "", color = "#ffc0b6", name = "Scss" },
			less = { icon = "󰅯", color = "#ffc0b6", name = "Less" },
			snippets = { icon = "", color = "#dae0ff", name = "Snippets" },
			gif = { icon = "󰵸", color = "#dae0ff", name = "Gif" },
			sh = { icon = "", color = "#f6f5bd", name = "Sh" },
			bash = { icon = "", color = "#f6f5bd", name = "Bash" },
			jsx = { icon = "", color = "#f6f5bd", name = "Jsx" },
			tsx = { icon = "", color = "#c0fbfd", name = "Tsx" },
			svg = { icon = "", color = "#dae0ff", name = "Svg" },
			npmrc = { icon = "", color = "#c0fbfd", name = "Npmrc" },
			yaml = { icon = "", color = "#ffc0b6", name = "Yaml" },
			java = { icon = "󰬷", color = "#ffc06b", name = "Java" },
			class = { icon = "", color = "#dae0ff", name = "Class" },
			ttf = { icon = "", color = "#ffc0b6", name = "Ttf" },
			dat = { icon = "󱎔", color = "#ffc0b6", name = "Dat" },
			woff = { icon = "", color = "#ffc0b6", name = "Woff" },
			mod = { icon = "󰕏", color = "#ffc0b6", name = "Mod" },
			so = { icon = "", color = "#dae0ff", name = "So" },
			http = { icon = "󰭄", color = "#ffc0b6", name = "Http" },
			dart = { icon = "", color = "#c9d2f0", name = "Dart" },
			toml = { icon = "󰰥", color = "#ffd3aa", name = "Toml" },
			lua = { icon = "󱨇", color = "#ebedcb", name = "Lua" },
			vim = { icon = "", color = "#e0fdcd", name = "Vim" },
			conf = { icon = "", color = "#bfdaff", name = "Config" },
			rs = { icon = "", color = "#fad4bf", name = "Rust" },
		},
		override_by_filename = {
			["readme.md"] = { icon = "󰯃", color = "#ebedcb", name = "Markdown" },
			["tsconfig.json"] = { icon = "", color = "#ffc0b6", name = "TsConfig" },
			[".env"] = { icon = "", color = "#f8e2ef", name = "Env" },
			["favicon.ico"] = { icon = "󱞈", color = "#c0fbfd", name = "Favicon" },
			["init.lua"] = { icon = "󱤁", color = "#c9d2f0", name = "Init" },
			["package.json"] = { icon = "󰏔", color = "#c0fbfd", name = "Package" },
			["commands.lua"] = { icon = "󰇄", color = "#dae0ff", name = "AutoCommands" },
			["custom.lua"] = { icon = "󰬎", color = "#dae0ff", name = "GlobalSettings" },
			["keymaps.lua"] = { icon = "󰌌", color = "#dae0ff", name = "keyMaps" },
			["www"] = { icon = "󰇧", color = "#ffc06b", name = "Network" },
			["LICENSE"] = { icon = "", color = "#ffd3aa", name = "LICENSE" },
			[".gitignore"] = { icon = "", color = "#ffc0b6", name = "GitIgnore" },
			[".zshrc"] = { icon = "󰬡", color = "#e9fdfe", name = "Zshrc" },
			["server.js"] = { icon = "󰒋", color = "#dae0ff", name = "Server" },
			["tags"] = { icon = "", color = "#dae0ff", name = "Tag" },
		},
	})
end

return M
