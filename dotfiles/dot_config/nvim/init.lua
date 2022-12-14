--                    ____                __   
--         ________  / __/___  ____  ____/ /__ 
--        / ___/ _ \/ /_/ __ \/ __ \/ __  / _ \
--       / /  /  __/ __/ / / / /_/ / /_/ /  __/
--      /_/   \___/_/ /_/ /_/\____/\__,_/\___/ 
--
--      https://github.com/refnode
--
-- 
-- This is refnode's neovim configuration.
-- 
-- The configuration tries to decouple the configuration into blocks using the
-- neovim initialization informations at 
-- https://neovim.io/doc/user/starting.html#initialization
-- 
-- I try write all my neovim configurations in lua.
-- 
-- ./init.lua
--   Main configuration file for my neovim setup.
--   I use it to refer to configurations in ./lua/refnode
--   
-- ./lua/refnode/*.lua
--   The lua configurations in this directory are not auto-sourced by neovim.
--   This configurations are included in the init.lua file.
--   * global configurations
--   * bootstrapping packer on a new installation
--   * plugin definitions
-- 
-- ./plugin/*.{lua,vim}
--   Auto-sourced by neovim after the main configuration file in
--   alphabetical order. Configurations like options, keymaps, ...
-- 
-- ./after/plugin/*.{lua,vim}
--   Auto-sourced by neovim after plugin/* resources.
-- 
-- For more informations check also notes and comments on the resources.
-- 

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- run the bootstrapping on new workplaces
if require "refnode.bootstrap".bootstrap() then
  return
end

-- load the plugin definitions
require "refnode.plugins"
