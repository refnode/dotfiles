-- refnode.bootstrap
-- 
-- Perform bootstrap actions on a fresh neovim installation.


local M = {}

M.packer_install = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  print "Installing packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    result = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    print(result)
    vim.cmd [[packadd packer.nvim]]
  end
  vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

M.bootstrap = function()
  -- check if packer plugin manager is present.
  if not pcall(require, "packer") then
    M.packer_install()
    return true
  end
end

return M
