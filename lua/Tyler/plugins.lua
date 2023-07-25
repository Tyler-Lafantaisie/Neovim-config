local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vm.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- theme(catppuccin)
  use { "catppuccin/nvim", as = "catppuccin" }
  -- treesitter
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  -- telescope
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
--   --mason(lsp) lspconfig(lsp) mason-lspconfig(lsp)
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
--   --nvim tree
    use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}
 --trouble(error finder)
    use {
 "folke/trouble.nvim",
 requires = { "nvim-tree/nvim-web-devicons" },
}

-- --undotree
use 'mbbill/undotree'
--
-- --comment
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

-- -- --compleation

use"hrsh7th/cmp-nvim-lsp"
use"hrsh7th/nvim-cmp"
use "L3MON4D3/LuaSnip"

use "rafamadriz/friendly-snippets"
use 'saadparwaiz1/cmp_luasnip'

-- lualine
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

-- indent blankline
use "lukas-reineke/indent-blankline.nvim"

-- modindicator
use {
  'mawkler/modicator.nvim',
  setup = function()
    -- These are required for Modicator to work
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  config = function()
    require('modicator').setup()
  end
}

-- blame line
use 'tveskag/nvim-blame-line'

-- sentiment
use "utilyre/sentiment.nvim"

--auto pairs
use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}

--Trim

use({
  "cappyzawa/trim.nvim",
  config = function()
    require("trim").setup({})
  end
})

  -- plugins end here
    if packer_bootstrap then
    require('packer').sync()
  end
end)
