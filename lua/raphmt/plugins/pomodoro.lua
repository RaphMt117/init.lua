-- nice pomodoro inside neovim
return {
	"epwalsh/pomo.nvim",
	event = "VeryLazy",
	version = "*", -- Recommended, use latest release instead of latest commit
	cmd = { "PomodoroStart", "PomodoroRepeat" },
	dependencies = {
		"rcarriga/nvim-notify",
	},
	opts = {},
}
