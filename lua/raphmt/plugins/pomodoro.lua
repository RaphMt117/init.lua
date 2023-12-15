-- nice pomodoro inside neovim
return {
	"epwalsh/pomo.nvim",
	version = "*", -- Recommended, use latest release instead of latest commit
	lazy = true,
	cmd = { "PomodoroStart", "PomodoroRepeat" },
	dependencies = {
		"rcarriga/nvim-notify",
	},
	opts = {},
}
