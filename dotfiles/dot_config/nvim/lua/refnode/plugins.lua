-- packer.nvim configuration
--
-- This module defines all modules that need to be present for my
-- nvim setup.
-- All plugin use definitions should be pinned to a tag or commit,
-- to avoid bad surprises on latest upstream changes.

-- autorun packer clean and sync on plugin.lua changes

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerClean
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local conf = {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

local packer = require "packer"
packer.init(conf)
return packer.startup{
  function(use)
    use {
      "wbthomason/packer.nvim",
      commit = "dcd2f380bb49ec2dfe208f186236dd366434a4d5",
    }
    use {
      "nvim-lua/plenary.nvim",
      commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7",
    }
    use {
      "nvim-lua/popup.nvim",
      commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac",
    }
    use {
      "tpope/vim-surround",
      commit = "aeb933272e72617f7c4d35e1f003be16836b948d",
    }
    use {
      "tpope/vim-repeat",
      commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a",
    }
    use {
      'numToStr/Comment.nvim',
      commit = "5f01c1a89adafc52bf34e3bf690f80d9d726715d",
      config = function()
        require('Comment').setup()
      end
    }
  end
}
