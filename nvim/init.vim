set nocompatible
filetype off
" setglobal pastetoggle=<F2>

call plug#begin('~/.config/nvim/plugged')

" Deoplete... => its interfering with python auto suggestions
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif

" Editor plugins
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer --ts-completer --go-completer' }
Plug 'rdnetto/ycm-generator', { 'branch': 'stable' }
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()


syntax on
filetype plugin indent on

" ============ Colour Scheme ==========================
" colorscheme twilight256
" colorscheme wombat256mod
" colorscheme molokai
" colorscheme molokayo
colorscheme spacecamp
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta


autocmd BufRead,BufNewFile *.sage,*.pyx,*.spyx set filetype=python
" let g:deoplete#enable_at_startup = 1
let g:mapleader="\<Space>"
let g:maplocalleader="\<Space>"


highlight Comment ctermfg=green
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set smartindent
set backspace=indent,eol,start

set number relativenumber
set noerrorbells
set clipboard=unnamed
set ruler
set showcmd
set errorformat^=%-GIn\ file\ included\ %.%#
"set foldmethod=syntax
set conceallevel=2
set list lcs=tab:»\ ,trail:␣,extends:▶,precedes:◀

set nobackup
set noswapfile
set undofile
set undodir=~/.vim/undodir

set cindent cinoptions=N-s,g0,j1,(s,m1
set incsearch
set splitright splitbelow
set scrolloff=8
set signcolumn=yes

set title
set nojoinspaces
set mouse=a
set autoread


" Some remaps
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" System Wide copy paste
noremap <Leader>y "+y
noremap <Leader>p "+p

nnoremap gA :%y+<CR>

nnoremap Y y$

" Keep it center
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
inoremap <C-j> :m .+1<CR>==
inoremap <C-k> :m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==


autocmd BufEnter,FocusGained * checktime

" Map (Enter) <CR> to :nohl, except in quickfix windows
nnoremap <silent> <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : ":nohl\<CR>"
set nohlsearch



" Update gutters 200 ms
set updatetime=200

"let g:python_host_prog = '/usr/bin/python2'
"let g:python3_host_prog = '/usr/bin/python3'

let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_global_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1

let delimitMate_expand_cr = 1
autocmd FileType tex let b:delimitMate_autoclose = 0

let g:bufferline_rotate=1
let g:bufferline_fixed_index=-1
let g:bufferline_echo = 0


" Save and restore manual folds when we exit a file
augroup SaveManualFolds
    autocmd!
    au BufWinLeave, BufLeave ?* silent! mkview
    au BufWinEnter           ?* silent! loadview
augroup END


noremap <silent> <Leader>w :call ToggleWrap()<CR>
function WrapOn()
  setlocal wrap linebreak
  set virtualedit=
  setlocal display+=lastline
  noremap  <buffer> <silent> <Up>   g<Up>
  noremap  <buffer> <silent> <Down> g<Down>
  noremap  <buffer> <silent> <Home> g<Home>
  noremap  <buffer> <silent> <End>  g<End>
  inoremap <buffer> <silent> <Up>   <C-o>gk
  inoremap <buffer> <silent> <Down> <C-o>gj
  inoremap <buffer> <silent> <Home> <C-o>g<Home>
  inoremap <buffer> <silent> <End>  <C-o>g<End>
endfunction
function WrapOff()
  setlocal nowrap
  set virtualedit=
  silent! nunmap <buffer> <Up>
  silent! nunmap <buffer> <Down>
  silent! nunmap <buffer> <Home>
  silent! nunmap <buffer> <End>
  silent! iunmap <buffer> <Up>
  silent! iunmap <buffer> <Down>
  silent! iunmap <buffer> <Home>
  silent! iunmap <buffer> <End>
endfunction
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    call WrapOff()
  else
    echo "Wrap ON"
    call WrapOn()
  endif
endfunction
call WrapOn()

highlight! link SignColumn LineNr

"set spellfile=~/.vim/spell/en.utf-8.add

set laststatus=2

nnoremap <silent> <Leader>yy :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>yd :YcmDiags<CR>
nnoremap <Leader>yf :YcmCompleter FixIt<CR>
nnoremap <Leader>y: :YcmCompleter<Space>


" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" Nerd Tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
