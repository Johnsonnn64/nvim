local status_ok, nvimtree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, silent = true, noremap = true}
  end

  -- default keympas 
  api.config.mappings.default_on_attach(bufnr)

  -- custom keympas
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'd', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'D', api.fs.remove, opts('Delete'))
end

nvimtree.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = true,
  hijack_netrw = true,
  sort_by = "name",
  sync_root_with_cwd = true,
  reload_on_bufenter = true,
  respect_buf_cwd = true,
  on_attach = my_on_attach,
  view = {
    adaptive_size = true,
    float = {
      enable = false,
      open_win_config = {
        relative = 'cursor',
        height = 15,
        width = 10,
        row = 2,
        col = 5,
      }
    },
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "all",
    special_files = { },
    icons = {
      padding = " ",
      show = {
        git = true,
        file = true,
        folder = true,
        folder_arrow = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌"
        },
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
    indent_markers = {
      enable = true,
      icons = {
        edge = "│ ",
        item = "│",
        corner = "╰",
        bottom = "─",
        none = " ",
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = {"^.git$"},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    change_dir = {
      enable = true,
      global = true,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
} -- END_DEFAULT_OPTS

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
