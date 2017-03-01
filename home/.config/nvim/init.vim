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
" Based on CrisiVim by Matteo Bigoi https://github.com/crisidev/homesick-vim


set background=dark     " Assume a dark background
set nolist
" Setup Bundle Support 
let s:editor_root=expand("~/.config/nvim/")
let &rtp = &rtp . ',' . s:editor_root . '/bundle/vundle/'
call vundle#rc(s:editor_root . '/bundle')

"The default leader is '\', but many people prefer ',' as it's in a standard
"location
let mapleader = ','
" Dependency Bundles { 

"let g:python_host_prog = '/usr/bin/python2'
"let g:python3_host_prog = '/usr/bin/python3'
"let g:python_host_skip_check = 1
"let g:python3_host_skip_check = 1




Plugin 'gmarik/vundle'
"dependence for many bundles
Plugin 'MarcWeber/vim-addon-mw-utils'
"dependency for xolox bundles
Plugin 'xolox/vim-misc'
"dependancy for bundles
Plugin 'tomtom/tlib_vim'

"}


"Buffers and windows {

" Ctags Tab Bar support
Plugin 'majutsushi/tagbar'

"tagbar remap
nnoremap <silent> <leader>tt :TagbarToggle<CR>



Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"let g:airline_theme='murmur'
" vim-airline {
let g:airline_theme='violet'
let g:Powerline_symbols='fancy'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnametruncate = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#default#section_truncate_width = {
            \ 'b': 79,
            \ 'x': 60,
            \ 'y': 88,
            \ 'z': 45,
            \ 'warning': 80,
            \ 'error': 80,
            \ }
let g:airline#extensions#default#layout = [
            \ [ 'a', 'error', 'warning', 'b', 'c' ],
            \ [ 'x', 'y', 'z' ]
            \ ]
" Distinct background color is enough to discriminate the warning and
" error information.
let g:airline#extensions#ale#error_symbol = '•'
let g:airline#extensions#ale#warning_symbol = '•'
let g:airline_powerline_fonts = 1
" }


"buffexplorer plugin
"Plugin 'fholgado/minibufexpl.vim'

"let g:miniBufExplAutoStart = 1

Plugin 'jeetsukumaran/vim-buffergator'

" Fuzzy file, buffer, mru and tag finder
Plugin 'kien/ctrlp.vim'
let g:ctrlp_regexp = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(la|so|o|test)$',
  \ }

"}

Plugin 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

"Semantics and Syntax {

"vim powerfull autocompletion engine
Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion = 1     " Open documentation preview of currently selected funcion in the autocomple windows
let g:ycm_register_as_syntastic_checker = 1                 " YCM will register as the C/C++ checker for syntastic
let g:ycm_confirm_extra_conf = 0                            " Don't need to ask everytime to load the .ycm_extra_conf file
let g:ycm_collect_identifiers_from_tags_files = 1           " Get identifiers from tags
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " Get identifiers from comments and strings so it can autocomplete arrays and suchs

Plugin 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_go_checkers = ['go', 'golint']
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_yaml_yamllint_args = "-d relaxed"
" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

nnoremap <F10> :SyntasticCheck<CR>

"Eclim eclipse integrazion
"Plugin 'eclim'
"let g:EclimCompletionMethod = 'omnifunc'
"let g:EclimRubyValidate = 0
"let g:EclimRubySyntasticEnabled = 1
"let g:EclimBrowser = 'iceweasel'
"let g:EclimDefaultFileOpenAction = 'vsplit'

"ctags autogenerator for vim
Plugin 'szw/vim-tags'

"autoformatting
"Plugin 'Chiel92/vim-autoformat'
"noremap <F7> <ESC> :Autoformat<CR><CR>
"let g:formatprg_arg_expr_c = '--style=linux'
"let g:formatprg_arg_expr_cpp = '--style=linux'

"Endwise add enders to language that needs them(like ruby etc)
Plugin 'tpope/vim-endwise'

Plugin 'tpope/vim-sleuth'
"Gdb/pdb integration for vim trough netbeans socket
"Plugin 'pyclewn'


"Mediawiki syntax higlight
Plugin 'chikamichi/mediawiki.vim'

"}


" Git support {

"latest runtime git files
Plugin 'tpope/vim-git'

Plugin 'tpope/vim-fugitive'

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

Plugin 'jaxbot/github-issues.vim'
let g:github_upstream_issues = 1 

"}


"Language specific {

"GO bundle plugin still perfect this out
Plugin 'fatih/vim-go'
let g:go_fmt_fail_silently = 1
let g:go_snippet_engine = 'ultisnips'
let g:go_fmt_command = "goimports"



" Variuos python support and completion
Plugin 'klen/python-mode'
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
Plugin 'python.vim'
Plugin 'python_match.vim'
" PythonMode 
" Disable if python support not present
if !has('python')
    let g:pymode = 1
endif

"Ruby
Plugin 'vim-ruby/vim-ruby'
let g:ruby_fold = 1
let g:ruby_operators = 1
let g:ruby_space_errors = 1

" A simple highlighting file for JSON constructs
Plugin 'leshill/vim-json'

"Indent and highlight for yaml
Plugin 'shmay/vim-yaml'

"Ansibile syntax
Plugin 'pearofducks/ansible-vim'

"Click modular router syntax highlighing
Plugin 'vim-scripts/click.vim'

"Latex
Plugin 'jcf/vim-latex'
let g:tex_flavor = 'latex'  "Set defualt filetype for tex file to latex

Plugin 'xuhdev/vim-latex-live-preview'
let g:livepreview_previewer = 'okular'

"Doxygen mutlilanguage support
Plugin 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName="Francesco Berni kurojishi@gmail.com"

Plugin 'rodjek/vim-puppet'

"}


"Varies and Utilities{

" extended % matching for HTML, LaTeX, and many 
Plugin 'matchit.zip'
" Vim plugin for intensely orgasmic commenting
Plugin 'scrooloose/nerdcommenter'
" Usefull stuff
Plugin 'spf13/vim-markdown'
Plugin 'spf13/vim-preview'
" Better than grep
if executable('ack')
    Plugin 'mileszs/ack.vim'
endif

"Alias for standard unix commands generally usefull
Plugin 'tpope/vim-eunuch'

"Undo tree plugins, for now gundo is better for live moving in the three but
"the live changes on undotree are sweet
Plugin 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

"Plugin 'chrisbra/NrrwRgn'
"let g:nrrw_rgn_vert = 1
"let g:nrrw_rgn_wdth = 80
"let g:nrrw_topbot_leftright = 'topleft'

"Help align things
Plugin 'godlygeek/tabular'

"easymotion in lines
Plugin 'Lokaltog/vim-easymotion'

Plugin 'myusuf3/numbers.vim'
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

"Webapi for otherplugins, like Gist
"Plugin 'mattn/webapi-vim'
"Write a Nopaste on github's Gist
"Plugin 'mattn/gist-vim'

"}


" Code Snippets {

"" Source support_function.vim to support snipmate-snippets.
"This plugin integrate with YCM 
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger='<C-e>'
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/snippets'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}

"Non programming Tasks {

"Task organiser syntax and helper
Plugin 'aaronbieber/quicktask'


"}


"Color section {

" More colorscheme
Plugin 'flazz/vim-colorschemes'
" More colors
Plugin 'spf13/vim-colors'
Plugin 'liuchengxu/space-vim-dark'
"}

" General settings {{                                                                                     

set background=dark         " Assume a dark background
"if !has('gui')
    "set term=$TERM          " Make arrow and other keys work
"endif
filetype plugin indent on   " Automatically detect file types.
syntax on                   " syntax highlighting
scriptencoding utf-8
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" always switch to the current file directory.
set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')                 
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore         " allow for cursor beyond last character
set nospell                     " spell checking off
set hidden                      " allow buffer switching without saving
"Encrytion algorithm
"set cm=blowfish2

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

" }}

"Vim UI {
"colorscheme molokai              " load a colorscheme
colorscheme space-vim-dark
hi Comment cterm=italic


"if filereadable(expand("~/.config/nvim/bundle/space-vim-dark/colors/space-vim-dark.vim"))
    "color space-vim-dark              " load a colorscheme
"endif

set showmode                    " display the current mode
set cursorline                  " highlight current line


if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
    " selected characters/lines in visual mode
endif

"if has('statusline')

    "" Broken down into easily includeable segments
    "set statusline=%<%f\                     " Filename
    "set statusline+=%w%h%m%r                 " Options
    "set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    "set statusline+=%*
    "set statusline+=%{fugitive#statusline()} " Git Hotness
    "set statusline+=\ [%{&ff}/%Y]            " filetype
    "set statusline+=\ [%{getcwd()}]          " current dir
    "set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
"endif


set linespace=0                       " No extra spaces between rows
set number                            " Line numbers on
nmap <silent> <F12> :se invnumber<CR> " Toggle line numbers
set showmatch                         " show matching brackets/parenthesis
set winminheight=0                    " windows can be 0 line high
set ignorecase                        " case insensitive search
set smartcase                         " case sensitive when uc present
set wildmode=list:longest,full        " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]         " backspace and cursor keys wrap to
set scrolljump=5                      " lines to scroll when cursor leaves screen
set scrolloff=3                       " minimum lines to keep above and below cursor
set foldenable                        " auto fold code

" }

" Formatting {

set wrap              " wrap long lines
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

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk


" Stupid shift key fixes
"cmap W w
"cmap WQ wq
"cmap wQ wq
"cmap Q q
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

" Functions {

function! InitializeDirectories()
    let separator = "."
    let parent = $HOME . '/.config/nvim'
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

" }

"AdHoc rules for languages and filetypes {

" Ruby code.
augroup ruby
    au FileType ruby setlocal tabstop=2
    au FileType ruby setlocal shiftwidth=2
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
    setl updatetime=1
    "au FileType latex set iskeyword+=:
augroup END

augroup python
    au FileType python setlocal tabstop=4
    au FileType python setlocal shiftwidth=4
    au FileType python setlocal expandtab
augroup END

augroup java
    au FileType java setlocal tabstop=4
    au FileType java setlocal shiftwidth=4
    au FileType java setlocal noexpandtab
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

augroup yaml
    autocmd filetype yaml setlocal tabstop=2
    autocmd filetype yaml setlocal softtabstop=2
    autocmd FileType yaml setlocal shiftwidth=2
augroup END

"}

" Enable omni completion.
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


"Mail Writing
au FileType mail call FT_mail()

function! FT_mail()
    set nocindent
    set noautoindent
    set textwidth=68
    setlocal spell spelllang=en
    set fileencodings=iso8859-1,utf-8
    iabbr  gd Good Day!
endfunction
