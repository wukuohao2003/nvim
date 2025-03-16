local M = {}
local status, commenter = pcall(require, "Comment")

if not status then
	require("notify")("Comment is not found ...", "error", { title = "nvim" })

	return false
end

function M.Config()
	commenter.setup({})
end

return M
