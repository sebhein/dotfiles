" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible
filetype off                  " required

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'https://github.com/skwp/greplace.vim'
Plug 'mg979/vim-visual-multi'
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim'
Plug 'preservim/nerdcommenter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
"Plug 'puremourning/vimspector'

call plug#end()

" Theme
" set termguicolors
" colorscheme gotham

" Disable mouse
set mouse=

" Use system clipboard
" set clipboard+=unnamedplus

" Disable the default Vim startup message.
set shortmess+=I

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
set ruler
set wildmenu

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" navigate splits using CTRL-nav keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" remap the leader key to <space>
let mapleader = " "

set encoding=UTF-8

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Default tabs are 4 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set autoindent
set smarttab

" Python tabs
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

" Line Length marker
highlight ColorColumn ctermbg=25
call matchadd('ColorColumn', '\%121v', 100)

" Treat .hbs files as html
autocmd BufNewFile,BufRead *.hbs set filetype=html

" Highlight Trailing Whitespace
" Track which buffers have been created, and set the highlighting only once.
autocmd WinEnter,VimEnter * let w:created=1
highlight WhitespaceEOL ctermbg=red ctermfg=white guibg=#592929
autocmd WinEnter,InsertLeave *
  \ if !exists('w:created') | call matchadd('WhitespaceEOL', '\s\+$') | endif
 call matchadd('WhitespaceEOL', '\s\+$')


" Airline Theme
let g:airline_theme='luna'

" Ctrl-F search
map <C-f> :Grepper<CR>

" Turn off Ctrl-P caching
let g:ctrlp_use_caching=0

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_enable_highlighting = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
 let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry
" completion
let g:terraform_registry_module_completion = 0

" Autocomplete (Deoplete)
let g:deoplete#enable_at_startup = 1

"Git Gutter
highlight clear SignColumn
let g:gitgutter_enable = 1

"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "bottom"

" Telescope leaders
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Telescope git actions
nnoremap <leader>gd :lua require'telescope.builtin'.git_status{}<cr>

" Reload all buffers
noremap <Leader>rr :bufdo! e<CR>

" Test current file in split
function! TestCurrentFile()
  let args = input('pytest args? ')
  botright vsplit
  vertical resize 120
  if len(args) > 0
    exe "term /home/ubuntu/repos/monorepo/pants test % -- ". args
  else
    exe "term /home/ubuntu/repos/monorepo/pants test %"
  endif
endfunction
noremap <Leader>tt :exe TestCurrentFile()<cr>
"noremap <Leader>tt <cmd>belowright split <bar> resize 10 <bar> term /home/ubuntu/repos/monorepo/pants test %<cr>

" Start debug server in bottom bar
function! StartDebug()
  let args = input('pytest args? ')
  botright split
  resize 1
  if len(args) > 0
    exe "term /home/ubuntu/repos/monorepo/pants test --debug-adapter % -- ". args
  else
    exe "term /home/ubuntu/repos/monorepo/pants test --debug-adapter %"
  endif
  quit
  " race condition here, can't start the debugger before adapter has finished
  " loading up
  "lua require'dap'.continue()
endfunction
noremap <Leader>sd :exe StartDebug()<cr>
"noremap <Leader>sd <cmd>botright split <bar> resize 1 <bar> term /home/ubuntu/repos/monorepo/pants test --debug-adapter %<cr>

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" DAP Pants setup
lua << EOF
local dap = require('dap')
dap.adapters.python = {
  type = 'server';
  port = 5678;
}
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";
    request = "attach";
    justMyCode = false;
  },
}
EOF

" DAP actions
nnoremap <silent> <Leader>dc <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <Leader><Right> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <Leader><Down> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <Leader><Up> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <Leader>du <Cmd>lua require'dapui'.toggle()<CR>

" DAP UI
lua << EOF
require("dapui").setup({
  icons = { expanded = "▸", collapsed = "+", current_frame = "->" },
  mappings = {
  -- Use a table to apply multiple mappings
  expand = { "<CR>", "<2-LeftMouse>" },
  open = "o",
  remove = "d",
  edit = "e",
  repl = "r",
  toggle = "t",
  },
  layouts = {
    {
        elements = {
          "repl",
          -- "console",
          "scopes",
          -- { id = "scopes", size = 0.75 },
        },
        size = 0.25,
        position = "bottom",
    },
    {
        elements = {
          -- { id = "scopes", size = 0.25 },
          -- "breakpoints",
          "stacks",
          -- "watches",
        },
      size = 40,
      position = "left",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
EOF

" prevent `wq` and `q` typos
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
