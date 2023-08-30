" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
"call plug#begin('~/.vim/plugged')
"
"call plug#end()

"set number
"set nowrap


" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

set wildoptions=pum

" visual shifting (builtin-repeat)
vnoremap < <gv
vnoremap > >gv

set fileformat=unix
set encoding=UTF-8

"set viminfofile=NONE
set viminfo=%,<800,'10,/50,:100,h,f0,n~/.vim/cache/.viminfo
"           | |    |   |   |    | |  + viminfo file path
"           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |    |   |   |    + disable 'hlsearch' loading viminfo
"           | |    |   |   + command-line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
"filetype indent plugin on

" Enable syntax highlighting
syntax on

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set incsearch

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

set cursorline

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" save undo trees in files
set undofile
set undodir=~/.vim/undo
" number of undo saved
set undolevels=10000

set directory=.
set runtimepath^=~/.vim/pack/tpope/start/surround/plugin/surround.vim
set runtimepath^=~/.vim/pack/tpope/start/repeat/autoload/repeat.vim
set norelativenumber
set nonumber
set noshowmatch
set showmode
set autowrite
set wrapmargin=8
set report=1

" Highlight searches
set hlsearch
:let loaded_matchparen = 1
hi Search ctermbg=LightYellow
hi Search ctermfg=Red

set tabstop=8
set shiftwidth=3
set softtabstop=3
set expandtab
set nomagic
set exrc
set listchars=tab:→\ ,nbsp:␣,trail:•,precedes:«,extends:»
set list

" Switch between spit windows
"noremap <silent> <C-Right> <c-w>l
"noremap <silent> <C-Left> <c-w>h
"noremap <silent> <C-Up> <c-w>k
"noremap <silent> <C-Down> <c-w>j

" Formatting paragraph
" nnoremap <F1> gqap
nnoremap <F1> gq}
" Formatting until next %
nnoremap <F2> gq/%
" Show all special characters and spaces etc on/off
nnoremap <F3> :set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»:set list
nnoremap <F4> :set listchars=tab:→\ ,nbsp:␣,trail:•,precedes:«,extends:»:set list
"Remove all trailing whitespace by pressing F5
nnoremap <F5> ma:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>'a
"Switch of search highlightning
nnoremap <F6> :noh
" Introduce a space between each character
xnoremap <F7> s<c-r>=substitute(@", '.\ze.', '& ', 'g')<cr>
" To remove parantheses (start with cursor on a paranthes and it will remove also the matching one)
nnoremap <F8> ma%x`ax
" Vim spell checker 
nnoremap <F9> :setlocal spell! spelllang=en_us<CR>
" add index of selection
nnoremap <F10> yiWo\index{}P

"Remapping PgUp PgDw and arrow keys to work in insert mode
inoremap [6~ 
inoremap [5~ 

" mapping escape to jj in insert mode
imap jj <ESC>

" Fixing typos on command line like writing :E automatically switches to :e
cabbrev E e
cabbrev G g
cabbrev T t
cabbrev B b

" Cycling through tabs
"nnoremap <C-Left> :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>

" Cycling through buffers
nnoremap <C-Right> :bn
nnoremap <C-Left> :bp

" Cycling through vimgreps
nnoremap <A-Right> :cnext
nnoremap <A-Left> :cprev

let fortran_free_source=1
let fortran_have_tabs=0
let fortran_more_precise=1
let fortran_do_enddo=1

" Function to source only if file exists
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

autocmd FileType plaintex,tex,latex :source ~/Dropbox/systemfiles/exrc_tex
autocmd FileType fortran  :source ~/Dropbox/systemfiles/exrc_fortran


" source local .exrc file if it exist
autocmd FileType * call SourceIfExists(".exrc")
