AC = vim.api.nvim_create_autocmd
AUNVIM = vim.api.nvim_create_augroup("neovim", {clear = true})

AC("BufEnter", {
  pattern = "*",
  command = "highlight CursorLine guibg=#2a2b3c | highlight IndentBlanklineChar guifg=#585b70",
  group = AUNVIM
})
AC("BufRead", {
  pattern = vim.env.HOME .. "/personal/school/*",
  command = "set filetype=markdown",
  group = AUNVIM
})
AC("FileType", {
  pattern = "markdown,org",
  command = "setlocal concealcursor=nc",
  group = AUNVIM
})
-- Keep the normal-user website workflow out of root sessions.
--if vim.fn.getuid() ~= 0 then
--AC("BufWritePost", {
--  pattern = vim.env.HOME .. "/workspace/site/*",
--  command = 'silent exec "!rsync -rtvzP ~/workspace/site/ root@johnsonnn.com:/var/www/site"',
--  group = AUNVIM
--})
--end
AC("BufEnter", {
  pattern = "*",
  command = "set formatoptions-=cro",
  group =  AUNVIM
})
-- nvimtree
AC("BufEnter", {
  pattern = "*",
  command = 'silent if (winnr("$") == 1 && &filetype == "nvimtree") | q | endif',
  group = AUNVIM
})
AC("BufEnter", {
	pattern = "*",
	nested = true,
	callback = function()
		if vim.fn.winnr "$" == 1 and vim.fn.bufname() == "NvimTree_" .. vim.fn.tabpagenr() then
			vim.api.nvim_command ":silent qa!"
		end
	end,
  group = AUNVIM
})
AC("FileType", {
  pattern = "java",
  callback = function(args)
    require'giga.lsp.jdtls_setup'.setup();
  end,
  group = AUNVIM
})
