local map = vim.api.nvim_set_keymap

function nm(key, command) 
	map('n', key, command, {noremap = true})
end

function im(key, command)
	map('i', key, command, {noremap = true})
end

im("kj", "<ESC>")

nm("<C-h>", "<C-w>h")
nm("<C-j>", "<C-w>j")
nm("<C-k>", "<C-w>k")
nm("<C-l>", "<C-w>l")