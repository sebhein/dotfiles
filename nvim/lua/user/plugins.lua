-- Install packer
local ensure_packer = function ()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Initialize packer
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

-- Install plugins
local use = require('packer').use

use('wbthomason/packer.nvim') -- Let packer manage itself

use('preservim/nerdcommenter')

--use('ctrlpvim/ctrlp.vim')

use({
  'nvim-tree/nvim-tree.lua',
  requires = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('user.plugins.nvim-tree')
  end,
})

use({
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
    require('user.plugins.lualine')
  end,
})

use('hashivim/vim-terraform')

use({
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  requires = {
    'nvim-treesitter/nvim-treesitter-context',
  },
  config = function()
    require('user.plugins.treesitter')
  end,
})

use({
  'neovim/nvim-lspconfig',
  requires = {
    'b0o/schemastore.nvim',
    'folke/lsp-colors.nvim',
  },
  config = function()
    require('user.plugins.lspconfig')
  end,
})

use({
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  },
  config = function()
    require('user.plugins.cmp')
  end,
})

use('skwp/greplace.vim')

use('mg979/vim-visual-multi')

use({
  'airblade/vim-gitgutter',
  config = function ()
    vim.cmd('highlight clear SignColumn')
    vim.g.gitgutter_enable = 1
  end,
})

use('nvim-lua/plenary.nvim')

use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('user.plugins.telescope')
  end,
})

use({
  'rcarriga/nvim-dap-ui',
  requires = 'mfussenegger/nvim-dap',
  config = function()
    require('user.plugins.dapui')
  end,
})

use {
  "sebhein/nvim-tron",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  }
}

--use {
  --'pwntester/octo.nvim',
  --requires = {
    --'nvim-lua/plenary.nvim',
    --'nvim-telescope/telescope.nvim',
    --'kyazdani42/nvim-web-devicons',
  --},
  --config = function ()
    --require('user.plugins.octo')
  --end
--}
--

-- ColorSchemes
--use('EdenEast/nightfox.nvim')
--use('marko-cerovac/material.nvim')
use('folke/tokyonight.nvim')


-- Automatically install plugins on first run
if packer_bootstrap then
  require('packer').sync()
end

-- Automatically regenerate compiled loader file on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
