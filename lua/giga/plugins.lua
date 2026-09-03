-- local fn = vim.fn

-- autoinstall lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- set leader key before lazy.nvim
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- popup packer
--[[ require ('packer').init {
  display = {
    open_fn = function()
      return require ('packer.util').float { border = 'rounded' }
    end,
  },
} ]]

return require ('lazy').setup({

  'dstein64/vim-startuptime', -- startuptime measure
  'mbbill/undotree', -- undo tree
  { 'lukas-reineke/indent-blankline.nvim', main = "ibl" }, -- line in indentions 

  { -- highlight css color codes
    'brenoprata10/nvim-highlight-colors',
    opt = true,
    ft = { 'css' },
    config = function()
      require 'nvim-highlight-colors'.setup {}
    end
  },

  { -- commenter
    'numToStr/Comment.nvim',
    opt = true,
    keys = {
      { 'gcc' },
      { 'gbb' },
      { 'gc', mode = 'x' },
      { 'gb', mode = 'x' },
    },
    config = function()
      require 'giga.commenter'
    end
  },

  { -- auto pairs
    'windwp/nvim-autopairs',
    opt = true,
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function()
      require 'giga.autopair'
    end
  },

  { -- color scheme
    "catppuccin/nvim",
    as = "catppuccin",
    build = ":CatppuccinCompile"
  },

  { -- status line
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' } -- file icon
  },

  { -- toggleterm
    'akinsho/toggleterm.nvim',
    opt = true,
    cmd = 'TermExec',
    keys = "<c-\\>",
    config = function()
      require 'giga.toggleterm'
    end
  },

  { -- file tree
    'kyazdani42/nvim-tree.lua',
    opt = true,
    cmd = 'NvimTreeToggle',
    config = function()
      require 'giga.nvimtree'
    end
  },

  { -- buffers
    'akinsho/bufferline.nvim',
    opt = true,
    event = 'BufAdd',
    config = function()
      require 'giga.bufferline'
    end
  },

  { -- git signs
    'lewis6991/gitsigns.nvim',
    -- opt = true,
    -- cmd = 'Gitsigns',
    config = function()
      require 'giga.gitsigns'
    end
  },


  { -- better hop motion
    'Borber/hop.nvim',
    opt = true,
    cmd = 'HopWord',
    config = function()
      require 'hop'.setup { keys = 'qweruiopasdfghjklcvnm' }
    end
  },

  { -- cmp plugins
    'hrsh7th/nvim-cmp',
    opt = true,
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      -- 'uga-rosa/cmp-dictionary',
    },
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function()
      require 'giga.cmp'
    end
  },

  { -- snippets
    'neovim/nvim-lspconfig',
    config = function ()
      require 'giga.lspconfig'
    end,
  },

  {
    'williamboman/mason.nvim',
    opts = {}
  },

  {
    'williamboman/mason-lspconfig',
    opts = {
      automatic_enable = {
        exclude = {
          'jdtls'
        }
      }
    }
  },

  {
    'mfussenegger/nvim-jdtls',
    ft = 'java',
  },

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text'
    },
    config = function()
      require 'giga.dap'
    end
  },

  { -- telescope
    'nvim-telescope/telescope.nvim', -- fzf
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    opt = true,
    cmd = 'Telescope',
    config = function()
      require 'giga.telescope'
    end
  },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    branch = "main",
    dependencies = {
      "windwp/nvim-ts-autotag"
    },
    build = ':TSUpdate',
  },

  {
    'nvim-treesitter/playground',
    opt = true,
    cmd = 'TSPlaygroundToggle'
  },

  { -- notification for nvim
    'rcarriga/nvim-notify',
    config = function()
      require 'giga.notify'
    end
  },

  { -- smooth scrolling
    'karb94/neoscroll.nvim',
    config = function ()
      require 'neoscroll'.setup()
    end
  },

  -- todo comment highlights
  {
    'folke/todo-comments.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { }
  },

  -- pictures in nvim
  -- {
  --   '3rd/image.nvim',
  --   config = function()
  --     require 'image'.setup({
  --       backend = "ueberzug"
  --     })
  --   end
  -- }
})
