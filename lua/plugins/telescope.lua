return {
	{
		'nvim-telescope/telescope.nvim', 
		tab = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },

		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files)
			vim.keymap.set('n', '<C-f>', builtin.find_files)
			vim.keymap.set('n', '<leader>fg', builtin.git_files)
			vim.keymap.set('n', '<leader>gs', builtin.grep_string)
			vim.keymap.set('n', '<leader>lg', builtin.live_grep)
		end
	}
}
