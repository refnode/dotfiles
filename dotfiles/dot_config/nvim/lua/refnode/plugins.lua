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
  end
}
