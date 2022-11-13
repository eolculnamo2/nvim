
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'navarasu/onedark.nvim'
  use 'lewis6991/impatient.nvim'
  use 'stevearc/dressing.nvim'
  use 'itchyny/lightline.vim'
  use 'MunifTanjim/nui.nvim'
  use 'MunifTanjim/prettier.nvim'
  use {'nvim-lua/plenary.nvim', module = "plenary" }
  use 'APZelos/blamer.nvim'
  use 'vim-test/vim-test'
  -- strangely ehough, I had to manually clone this in packer start directory
  use 'rescript-lang/vim-rescript'

   -- use { 'rescript-lang/vim-rescript', tag = 'v2.1.0' }
  use 'leafOfTree/vim-svelte-plugin'
  use 'hashivim/vim-terraform'
  use {'akinsho/flutter-tools.nvim', 
    requires = {{'nvim-lua/plenary.nvim'}},
  }
  use {'kyazdani42/nvim-web-devicons',
    event = "VimEnter",
     -- config = function() require "configs.icons" end,
  }

  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    -- Formatting and linting
  use {"jose-elias-alvarez/null-ls.nvim",
    event = { "BufRead", "BufNewFile" }
  }

  use {"onsails/lspkind.nvim",
    module = "lspkind",
    config = function() require "configs.lspkind" end,
  }
  use {"akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    module = { "toggleterm", "toggleterm.terminal" },
    config = function() require "configs.toggleterm" end,
  }

  use {'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    module = "telescope",
    setup = function()
    defaults = {
      mappings = {
          i = {
            ["<CR>"] = "open_newtab"
          }
        }
      }
    end
  }

  use {'nvim-neo-tree/neo-tree.nvim', 
    branch = "v2.x",
    module = "neo-tree",
    cmd = "Neotree",
    requires = { 
      { 
       "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim", module = "nui" } 
    },
    setup = function() vim.g.neo_tree_remove_legacy_commands = true end,
    config = function() require "configs.neo-tree" end,
  }

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  use {"hrsh7th/nvim-cmp",
    event = "InsertEnter",
  }

  -- LSP completion source
  use {"hrsh7th/cmp-nvim-lsp",
    after = "nvim-cmp",
  }

  -- Package Manager
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }

  use {"WhoIsSethDaniel/mason-tool-installer.nvim",
    after = "mason.nvim",
  }


  -- LSP symbols
  use {"stevearc/aerial.nvim",
    module = "aerial",
    cmd = { "AerialToggle", "AerialOpen", "AerialInfo" },
  }
  
  use { "declancm/cinnamon.nvim",
    config = function() require('cinnamon').setup({
      extra_keymaps = true,
      override_keymaps = true,
      max_length = 500,
      scroll_limit = -1,
    }) end
  }

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  use {"mrjones2014/smart-splits.nvim",
    module = "smart-splits",
  }

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }
  use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }

  use_rocks 'penlight'
  use_rocks {'lua-resty-http', 'lpeg'}


  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
end)

