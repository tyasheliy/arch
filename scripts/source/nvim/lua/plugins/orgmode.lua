return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	config = function()
		require("orgmode").setup({
			org_agenda_files = "~/org/*",
			org_default_notes_file = "~/org/refile.org",
			win_split_mode = "vertical"
		})
	end,
}
