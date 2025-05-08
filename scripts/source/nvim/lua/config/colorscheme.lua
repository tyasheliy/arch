local time = os.date("*t")

if time.hour < 8 or time.hour >= 19 then
	vim.cmd("colorscheme github_dark")
	vim.cmd("hi Normal guibg=#000000")
else
	vim.cmd("colorscheme github_light_default")
end
