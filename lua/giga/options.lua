-- :help options

local options = {
  lazyredraw = true,
  backup = false,                          -- creates a backup file
  clipboard = 'unnamedplus',               -- allows neovim to access the system clipboard
  cmdheight = 0,                           -- more space in the neovim command line for displaying messages
  completeopt = { 'menuone', 'noselect' }, -- mostly just for cmp
  conceallevel = 2,                        -- so that `` is visible in markdown files
  fileencoding = 'utf-8',                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  showmatch = true,                        -- show matching while searching
  incsearch = true,                        -- idk just good
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 1,                         -- 0=dont show | 1=don't show when 1| 2=always show
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = true,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  autoindent = true,                       -- auto indent
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = 'yes',                      -- always show the sign column, otherwise it would shift the text each time
  hidden = true,                           -- for some plugin
  guifont = 'monospace:h17',               -- the font used in graphical neovim applications
  linebreak = true,                        -- break words at the end of line
  foldenable = false,
  mouse = 'a',
  winborder = 'rounded',
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.clipboard = "osc52"

vim.opt.shortmess:append 'cA'
vim.opt.shortmess:remove 'T'
-- autocmd BufWritePre * %s/\s\+$//e

vim.cmd [[
  set whichwrap+=<,>,[,]
  function! FormatNumber() range
  '<,'>s/^\([0-9]*\.\s*\)*/\=(line('.') - line("'<") + 1).'. ' 
  endfunction
  command! -range FormatNumber call FormatNumber()
]]

