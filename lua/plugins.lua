return require('packer').startup(function()

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}



  -- General Functionality

  -- Repleat-plugin-with-.:
  -- TODO: Come up with better mappings for this
  use { 'tpope/vim-repeat' }

  -- Increment dates and times with C-A and C-X
  use { 'tpope/vim-speeddating' }

  -- NERDTree for file navigation
  use { 'preservim/nerdtree' }
  use { 'Xuyuanp/nerdtree-git-plugin' }

  -- Airline for nifty info in the status and tablines
  use { 'vim-airline/vim-airline' }
  use { 'vim-airline/vim-airline-themes' }

  -- Don't forget mappings
  use { 'folke/which-key.nvim' }

  -- Start Screen
  use { 'mhinz/vim-startify' }

  -- Neat icons
  use { 'ryanoasis/vim-devicons' }

  -- Distraction-free markdown writing
  use { 'junegunn/goyo.vim' }

  -- tmux integration
  use { 'christoomey/vim-tmux-navigator' }

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Comment-in-movement
  use { 'tpope/vim-commentary' }

  -- Surround-movement-with-X:
  use { 'tpope/vim-surround' }

  -- TODO: Not too happy with this one.  At least turn off for some filetypes.
  use { 'jiangmiao/auto-pairs' }



  -- IDE features.  Although nvim has its own LSP module, it is hard to
  -- configure directly
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-compe' }
  use { 'glepnir/lspsaga.nvim' }
  use { 'onsails/lspkind-nvim' }
  use { "ray-x/lsp_signature.nvim" }

  -- nvim LSP for scala
  -- TODO: Not sure if needed anymore
  -- use { 'scalameta/nvim-metals' }

  -- Code formatting
  use { 'sbdchd/neoformat' }

  -- Snippets
  use { 'hrsh7th/vim-vsnip' }
  use { 'cstrap/python-snippets' }
  use { 'ylcnfrht/vscode-python-snippet-pack' }

  -- Vim dispatch for builds.  Not needed right now.
  -- TODO: Set this up for scala.
  -- use { 'tpope/vim-dispatch' }

  -- Syntax highlighting for many languages
  use { 'sheerun/vim-polyglot' }

  use { 'derekwyatt/vim-scala' }

  -- Better syntax highlighting for java
  use { 'uiiaoo/java-syntax.vim' }

  -- Nice python syntax highlighting.  Doesn't seem to work with all
  -- colorschemes, but does with gruvbox
  use { 'vim-python/python-syntax' }

  -- list of objects and members on side bar.
  use { 'majutsushi/tagbar' }

  -- Generate python docstrings
  use { 'heavenshell/vim-pydocstring', run = 'make install' }

  -- Lua support for LSP
  -- TODO: Is there something that doesn't require installing niche software?
  -- use { 'tjdevries/nlua.nvim' }



  -- Git integration
  -- See hunks in gutter
  -- use { 'airblade/vim-gitgutter' }
  use { 'lewis6991/gitsigns.nvim' }

  -- See commit history in nice UI
  use { 'junegunn/gv.vim' }

  -- Integration for git in vim.
  use { 'tpope/vim-fugitive' }
  -- This enables GBrowse and some other github-specific functionality for fugitive.
  use { 'tpope/vim-rhubarb' }

end)
