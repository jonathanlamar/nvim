local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions
-- local hover = null_ls.builtins.hover
-- local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			filetypes = { "html", "json", "yaml", "markdown" },
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		formatting.black.with({
			command = require("this_computer").python_env_path .. "/bin/black",
			extra_args = { "--fast" },
		}),
		formatting.isort.with({
			filetypes = { "python" },
			args = { "--stdout", "--profile", "black", "-" }, -- these are default
		}),
		formatting.google_java_format,
		-- formatting.yapf,
		formatting.stylua,
		diagnostics.flake8.with({
			command = require("this_computer").python_env_path .. "/bin/flake8",
		}),
	},
})
