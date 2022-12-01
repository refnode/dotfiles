local opt = vim.opt

-- keep hidden buffers, default
opt.hidden = true
-- no bell noise
opt.belloff = "all"
-- mouse only in normal mode
opt.mouse = "n"

-- no swapfile
opt.swapfile = false

opt.backup = false
opt.undofile = true

-- show line numbers
opt.number = true
-- show relative line numbers
opt.relativenumber = true
-- reset guicursor to nothing
opt.guicursor = ""
-- display right column on 80 chars
opt.colorcolumn = "80"
-- display sign column on the left
opt.signcolumn="yes"

opt.cursorline = true

opt.showcmd = true
-- height of command bar
opt.cmdheight = 1

-- decrease updatetime default 4000ms
opt.updatetime = 50

-- window splits down and left
opt.splitbelow = true
opt.splitright = true

-- incremental search on
opt.incsearch = true
-- no highlight a previous search
opt.hlsearch = false

-- 10 lines over or below the cursor
opt.scrolloff = 10
-- 
-- 
-- tabs and spaces
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- ignore these wildcards on expansion
opt.wildignore = "*~"
opt.wildignore = opt.wildignore + {"*.o"}

vim.o.guifont = "Jetbrains Mono"
