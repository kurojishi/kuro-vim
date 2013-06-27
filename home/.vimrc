" kuroVim - Vim configuration with many plugins. Pathogen based.
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.
"
" Based on CrisiVim by Matteo Bigoi https://github.com/crisidev/crisiVim

set nocompatible        " must be first line
set background=dark     " Assume a dark background
set nolist
" Ctags 
set tags=./tags;/,~/.vimtags
" Setup Bundle Support 
" The next two lines ensure that the ~/.vim/bundle/ system works
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"The default leader is '\', but many people prefer ',' as it's in a standard
"location
let mapleader = ','
" Bundles required 
Bundle 'gmarik/vundle'
"dependence for many bundles
Bundle 'MarcWeber/vim-addon-mw-utils'
"dependency for xolox bundles
Bundle 'xolox/vim-misc'


"Buffers and windows {
" VIP section (very importants plugins)
" NerdTree
Bundle 'scrooloose/nerdtree'

" This plugin aims at making NERDTree feel like a true panel, independent of
" tabs.
Bundle 'jistr/vim-nerdtree-tabs'

" NerdTree Config
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=0
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" Ctags Tab Bar support
Bundle 'majutsushi/tagbar'

"tagbar remap
nnoremap <silent> <leader>tt :TagbarToggle<CR>

"GO tagbar configuration
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"ruby tags
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }


" fantastic status line with git support
Bundle 'Lokaltog/powerline'

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set noshowmode
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
let g:Powerline_stl_path_style = 'full'
let g:Powerline_symbols = 'fancy'

"buffexplorer plugin
Bundle 'fholgado/minibufexpl.vim'

" mini buffer explorer
let g:miniBufExplAutoStart = 1

noremap <F1> <nop>
inoremap <F1> <nop>
noremap <F2> <nop>
inoremap <F2> <nop>

nnoremap <silent> <F9> :MBEToggle<CR>
nnoremap <silent> <F1> <ESC>:MBEbp<CR>
inoremap <silent> <F1> <ESC>:MBEbp<CR>
nnoremap <silent> <F2> <ESC>:MBEbn<CR>
inoremap <silent> <F2> <ESC>:MBEbn<CR>

" Fuzzy file, buffer, mru and tag finder
Bundle 'kien/ctrlp.vim'
"}


"Semantics and Syntax {
"vim powerfull autocompletion engine
 Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion = 1           " Open documentation preview of currently selected funcion in the autocomple windows
let g:ycm_register_as_syntastic_checker = 1                       " YCM will register as the C/C++ checker for syntastic
let g:ycm_confirm_extra_conf = 0                                " Don't need to ask everytime to load the .ycm_extra_conf file
let g:ycm_collect_identifiers_from_tags_files = 1               "Get identifiers from tags
let g:ycm_collect_identifiers_from_comments_and_strings = 1     "Get identifiers from comments and strings so it can autocomplete arrays and suchs

Bundle "scrooloose/syntastic"
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_go_checkers = ['golint']
let g:syntastic_ruby_checkers = ['mri']
" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

nnoremap <F10> :SyntasticCheck<CR>

"Eclim eclipse integrazion
Bundle 'eclim'
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimRubyValidate = 0
let g:EclimRubySyntasticEnabled = 1
let g:EclimBrowser = 'iceweasel'

"ctags autogenerator for vim
Bundle 'szw/vim-tags'

"}


" Git support {
"
"latest runtime git files
Bundle 'tpope/vim-git'

Bundle 'tpope/vim-fugitive'

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

"}


"Language specific {

"GO bundle plugin still have to figure it out
Bundle 'jnwhiteh/vim-golang'       
"awesome autocomplete engine for golang
Bundle 'undx/vim-gocode'
"Go def for parsin of definition and simbols
Bundle 'dgryski/vim-godef'


" Variuos python support and completion
Bundle 'klen/python-mode'
let g:pymode_lint = 0
"Rope omnicomp settings
let g:pymode_rope = 1
let g:pymode_rope_extended_complete=1
let g:pymode_rope_enable_autoimport = 0
let g:pymode_rope_autoimport_generate = 0
let g:pymode_rope_autoimport_underlineds = 0
let g:pymode_rope_guess_project = 0
let g:pymode_rope_goto_def_newwin = "" 
let g:pymode_virtualenv = 1
Bundle 'python.vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'
" PythonMode 
" Disable if python support not present
if !has('python')
    let g:pymode = 1
endif

"Ruby
Bundle 'vim-ruby/vim-ruby'
let g:ruby_fold = 1
let g:ruby_operators = 1
let g:ruby_space_errors = 1

" A simple highlighting file for JSON constructs
Bundle 'leshill/vim-json'

"Indent and highlight for yaml
Bundle 'shmay/vim-yaml'

"Click modular router syntax highlighing
Bundle 'vim-scripts/click.vim'

"Latex
Bundle 'jcf/vim-latex'
let g:tex_flavor = 'latex'  "Set defualt filetype for tex file to latex

"Doxygen mutlilanguage support
Bundle 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName="Francesco Berni kurojishi@gmail.com"


"}


"Varies {


Bundle 'tomtom/tlib_vim'
" extended % matching for HTML, LaTeX, and many 
Bundle 'matchit.zip'
" Vim plugin for intensely orgasmic commenting
Bundle 'scrooloose/nerdcommenter'
"Endwise add enders to language that needs them(like ruby etc)
Bundle 'tpope/vim-endwise'
" Usefull stuff
Bundle 'spf13/vim-markdown'
Bundle 'spf13/vim-preview'
" Better than grep
if executable('ack')
    Bundle 'mileszs/ack.vim'
endif

"Undo tree plugins for now gundo is better for live moving in the three but
"the live changes on undotree are sweet
"Bundle 'mbbill/undotree'
"nnoremap <silent> <leader>ut :UndotreeToggle<CR>
"let g:undotree_TreeNodeShape = 'o'
"let g:undotree_SplitWidth = 40
"let g:undotree_SetFocusWhenToggle = 1
Bundle 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

Bundle 'chrisbra/NrrwRgn'
let g:nrrw_rgn_vert = 1
let g:nrrw_rgn_wdth = 80
let g:nrrw_topbot_leftright = 'topleft'

"Help align things
Bundle 'godlygeek/tabular'

"easymotion in lines
Bundle 'Lokaltog/vim-easymotion'

Bundle 'myusuf3/numbers.vim'
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

"}


" Code Snippets {
"" Source support_function.vim to support snipmate-snippets.
"This plugin integrate with YCM 
Bundle 'SirVer/ultisnips'
"Bundle 'honza/vim-snippets' "collection of snippets most of them are in ultisnips by default still need to check them all
let g:UltiSnipsExpandTrigger='<C-e>'
let g:UltiSnipsSnippetsDir = '~/.vim/snippets'
"}

"Non programming Tasks {

"Task organiser syntax and helper
Bundle 'aaronbieber/quicktask'

"Taking notes in vim to test real time
Bundle 'xolox/vim-notes'
let g:notes_directories = ['~/Agenda/notes']


"}


"Color section {

" More colorscheme
Bundle 'flazz/vim-colorschemes'
" More colors
Bundle 'spf13/vim-colors'
"}

" General settings {                                                                                     
set background=dark         " Assume a dark background
if !has('gui')
    set term=$TERM          " Make arrow and other keys work
endif
filetype plugin indent on   " Automatically detect file types.
syntax on                   " syntax highlighting
scriptencoding utf-8
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" always switch to the current file directory.
set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')                 
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore         " allow for cursor beyond last character
set history=1000                " Store a ton of history (default is 20)
set nospell                     " spell checking off
set hidden                      " allow buffer switching without saving

" Setting up the directories {
set backup                      " backups are nice ...
if has('persistent_undo')
    set undofile                "so is persistent undo ...
    set undolevels=1000         "maximum number of changes that can be undone
    set undoreload=10000        "maximum number lines to save for undo on a buffer reload
endif
" Could use * rather than *.*, but I prefer to leave .files unsaved
au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)
" }
" }

"Vim UI{
if filereadable(expand("~/.vim/bundle/vim-colorschemes/colors/jellybeans.vim"))
    color jellybeans              " load a colorscheme
endif

set tabpagemax=15               " only show 15 tabs
set showmode                    " display the current mode
set cursorline                  " highlight current line


if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
    " selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    "set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    "set statusline+=%*
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif


set backspace=indent,eol,start        " backspace for dummies
set linespace=0                       " No extra spaces between rows
set number                            " Line numbers on
nmap <silent> <F12> :se invnumber<CR> " Toggle line numbers
set showmatch                         " show matching brackets/parenthesis
set incsearch                         " find as you type search
set hlsearch                          " highlight search terms
set winminheight=0                    " windows can be 0 line high
set ignorecase                        " case insensitive search
set smartcase                         " case sensitive when uc present
set wildmenu                          " show list instead of just completing
set wildmode=list:longest,full        " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]         " backspace and cursor keys wrap to
set scrolljump=5                      " lines to scroll when cursor leaves screen
set scrolloff=3                       " minimum lines to keep above and below cursor
set foldenable                        " auto fold code

" }

" Formatting {
set wrap              " wrap long lines
set autoindent        " indent at the same level of the previous line
set shiftwidth=4      " use indents of 4 spaces
set expandtab         " tabs are spaces, not tabs
set tabstop=4         " an indentation every four columns
set softtabstop=4     " let backspace delete indent
set nojoinspaces
set pastetoggle=<F11> " pastetoggle (sane indentation on pastes)
 "Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" Key (re)Mappings {

" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :
" For hardcore only
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

"astyle binding on F7
map <F7> <ESC>:%!astyle --style=k/r<ESC>


" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk


" Stupid shift key fixes
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

""" Code folding options unused
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Easier horizontal scrolling
map zl zL
map zh zH
"navigate between split
nmap <silent> <C-S-Up> :wincmd k<CR>
nmap <silent> <C-S-Down> :wincmd j<CR>
nmap <silent> <C-S-Left> :wincmd h<CR>
nmap <silent> <C-S-Right> :wincmd l<CR>
" }

" Functions
function! InitializeDirectories()
    let separator = "."
    let parent = $HOME . '/.vim'
    let prefix = ''
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory',
                \ 'snippets': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . prefix . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
        NERDTreeMirror
        NERDTreeFind
        wincmd l
    endif
endfunction
" }

"AdHoc rules for languages and filetypes {
" Ruby code.
augroup ruby
    autocmd filetype ruby,eruby setlocal tabstop=2
    autocmd filetype ruby,eruby setlocal softtabstop=2
    autocmd FileType ruby,eruby setlocal shiftwidth=2
    "autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
augroup END

"C Code
augroup c
    autocmd filetype c setlocal tabstop=4
    autocmd filetype c setlocal softtabstop=2
    autocmd FileType c setlocal shiftwidth=4
    autocmd FileType c setlocal noexpandtab
augroup END

"C++ Code
augroup cpp
    autocmd FileType cpp setlocal tabstop=4
    autocmd FileType cpp setlocal shiftwidth=4
    autocmd filetype cpp setlocal softtabstop=2
    autocmd FileType cpp setlocal noexpandtab
augroup END

"GO code
augroup go
    au BufNewFile,BufRead *.go setf go 
augroup END

augroup latex
    au FileType latex setlocal tabstop=2
    au FileType latex setlocal shiftwidth=2
    "au FileType latex set iskeyword+=:
augroup END

augroup python
    au FileType python setlocal tabstop=4
    au FileType python setlocal shiftwidth=4
    "au FileType python setlocal noexpandtab
augroup END


"Click filetype detecting
augroup quicktask
    au FileType quicktask setlocal tabstop=2
    au FileType quicktask setlocal shiftwidth=2
    au FileType quicktask setlocal nospell
augroup END

"Click filetype detecting
augroup click
    au BufNewFile,BufRead *.click setf click 
augroup END

"}

" Enable omni completion.
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
