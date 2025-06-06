return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",

	config = function()
		ensure_installed = {
			"bash",
			"c",
			"dockerfile",
			"go",
			"html",
			"java",
			"javascript",
			"json",
			"lua",
			"python",
			"terraform",
			"vim",
			"vimdoc",
		}
		auto_install = true
		highlight = { enable = true }
		indent = { enable = true }
	end,
}
