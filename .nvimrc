"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add plugins to &runtimepath
call plug#begin()

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Vim templates
Plug 'lynetcha/vimtemplates'

" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

"  YCM
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" Nerdtree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Quick file browser
Plug 'ctrlpvim/ctrlp.vim'

" More colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'

" Git integration
Plug 'tpope/vim-fugitive'

" Shows a git diff in the 'gutter' (sign column)
Plug 'airblade/vim-gitgutter'

" Pymode
Plug 'klen/python-mode'

" Airline
Plug 'bling/vim-airline'

" Tmuxline
Plug 'edkolev/tmuxline.vim'

" Undotree
Plug 'mbbill/undotree'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Comment
Plug 'scrooloose/nerdcommenter'

" Surround parantheses, bracket, quotes, tags
Plug 'tpope/vim-surround'

" Align lines nicely
Plug 'godlygeek/tabular'

" requirement for the easytag
Plug 'xolox/vim-misc'

" Tag generation
Plug 'xolox/vim-easytags'

" Grammar check
Plug 'vim-scripts/LanguageTool'

" Tmux line
Plug 'edkolev/tmuxline.vim'

" Latex
Plug 'vim-latex/vim-latex'

" indentLine
Plug 'Yggdroot/indentLine'

" Realtime collaborative editing
" Plugin 'floobits/floobits-neovim'

" Vim-easymotion
Plug 'easymotion/vim-easymotion'

" Ack
Plug 'mileszs/ack.vim'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme zenburn  " very comfortable font colors
" colorscheme molokai  " very strong font colors
" Chasing_Logic, 1989, Revolution. blackboard, 256-grayvim, Benokai,
" colorsbox-greenish
" colorscheme SlateDark
colorscheme Benokai
let g:airline_theme='dark'

" Pymode settings
" Turn on code checking on every save
let g:pymode_lint_unmodified = 1
let g:pymode_lint_ignore="F999,E501,E261,C901,E262,E401,E228,E303,E201,E222,E271,E127,E221,E202,E203,W391,W191,E101,E126,F403,E128,E225,F405,E226,E302,E41,E231,W503,E265"


" Gitgutter settings
let g:gitgutter_max_signs=2000

" Vim templates Settings
let g:VIMFILESDIR="~/.vim/"
let g:author="Lyne P. Tchapmi"
let g:DoxygenToolkit_authorName=g:author

" Set 100 line limit a colorcolumn
if exists('+colorcolumn')
  " Mark from 80 to 100 to be the warning zone
  let &colorcolumn=join(range(81,100),",")
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100.\+', -1)
endif

" hlight the current line in the current window only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter,TabEnter,FocusGained,CmdwinEnter * setlocal cursorline
  au WinLeave,TabLeave,FocusLost,CmdwinLeave * setlocal nocursorline
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

"""""""""""""""""""""""""""""""""""
" Nerdtree
"""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <Leader>u :UndotreeToggle<cr>
" Stupid work around
" https://github.com/neovim/neovim/issues/2048#issuecomment-78534227
if has('nvim')
    nmap <BS> :TmuxNavigateLeft<CR>
endif

"""""""""""""""""""""""""""""""""""
" Easymotion setting
"""""""""""""""""""""""""""""""""""
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

" Dummy vim-latex keymapping
map <Leader>a <Plug>IMAP_JumpForward<CR>

" Remove all Ctrl-M
map <Leader>m :%s/\r//g<CR>

" Insert Space
nnoremap <space> a<space><esc>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default clipboard buffer
set clipboard=unnamedplus

" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=tab:>·,trail:•,extends:>,precedes:<
set list

" Tab to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Switch buffers in vim without saving to a currently modified file
set hidden

" https://github.com/neovim/neovim/issues/2093
set ttimeout
set ttimeoutlen=0

" Local tag file
set tags=./tags;

" Undo tree persistent
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir -p ' . vimDir)
    call system('mkdir -p ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin specific setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Set python interpreter
let g:python_host_prog = '/cvgl/u/lynetcha/programs/python/py3.6/bin/python3.6'

" Set python3 interpreter
" let g:python3_host_prog = '/usr/bin/python3'

" vim-latex setting
let g:tex_flavor='latex'
let g:Tex_CompileRule_pdf='pdflatex --synctex=-1 -src-specials -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_ViewRule_pdf='okular'

" Turn on EasyMotion case insensitive feature
let g:EasyMotion_smartcase = 1

" LaTeX conceallevel
set conceallevel=0

"""""""""""""""""""""""""""""""""""
" NerdTree Git
"""""""""""""""""""""""""""""""""""
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Spelling
set spell spelllang=en_us

" Disable Pydoc automatic window pop-up
set completeopt=menu

" Resize window  SHIFT+(h|j|k|l)                                                                      
noremap <S-j> :resize +6<CR>                                                                        
noremap <S-k> :resize -6<CR>                                                                        
noremap <S-h> :vertical resize -6<CR>                                                               
noremap <S-l> :vertical resize +6<CR>  

