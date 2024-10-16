vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.title = true
vim.opt.spell = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.list = false
vim.opt.linebreak = true
vim.opt.listchars = { tab = '▸ ', trail = '·'}
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.shortmess:append({ I = true })  -- disable splash screen
vim.opt.wildmode = 'longest:full,full'
--vim.opt.signcolumn = 'yes:2'
vim.opt.termguicolors = true
--vim.cmd('colorscheme material')
--
vim.opt.clipboard = 'unnamedplus'
vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ["+"] = 'clip.exe',
    ["*"] = 'clip.exe',
  },
  paste = {
    ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = false,
}
vim.opt.titlestring = [[%{v:progname} %f]]
