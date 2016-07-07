source $HOME/.vim/config/vundle.cfg " to load up vundle correctly
source $HOME/.vim/config/load_configs.vimrc " to load the plugin specific configs 

" My conventions:
" <Ctrl>-ALPHABET : execute command, like make, ls etc. 
" <Shift>-ALPHABET : perform routine vim actions and map scripts to these

set t_Co=256
colorscheme desert256 
"set gfn=LucidaTypeWriter\ 10

set path+=.
set path+=./*
set path+=,,
set nocompatible

"""" editing """"
set showmatch "show matching braces when the completing one is typed"
set infercase "infer the case for the completion "
"set nowrap " do not wrap lines "
set textwidth=0 " do not fix the columnwidth"
set number


"""" filetypes """"
filetype on
syntax on
filetype indent on
filetype plugin on

"""" formatting """"
" set cindent  supposedly better than autoindent and smartindent"
" set cindent " although this is best, it might cause problems with filetype
set autoindent
set shiftwidth=2 "replace tabs with spaces shiftwidth"
set tabstop=2 "insert 2 spaces if I hit a tab"
set smarttab "using backspace removes tabs even if spaces are put in"
set et "expandtabs during insert mode"

"""" copied from the perl-support customization plugin
set autoread                    " read open files again when changed outside Vim
set backspace=indent,eol,start  " backspacing over everything in insert mode
set backup                      " keep a backup file
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set showcmd                     " display incomplete commands
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode

"-------------------------------------------------------------------------------
"  highlight paired brackets
"-------------------------------------------------------------------------------
highlight MatchParen ctermbg=blue guibg=lightyellow

"""" searching """"
set incsearch
set hlsearch
set ignorecase smartcase " ignorecase in general, but if the search pattern contains upper case letters, then dont ignore "


"""" key mappings """"
map <F2> <Esc>:exe ":sp " . abh_vimrc<CR>
"open the correct snippet file based on filetype"
map <F3> <Esc>:exe ":sp " . abh_vimdir . "/bundle/snipmate.vim/snippets/" . &filetype . ".snippets"<CR>
"save the file without confirmation"
"noremap   <silent> <F4>         :write<CR> 
map <F4> <Esc>:exe ":vsp " .abh_vimdir . "/bundle/mine/shortcuts.txt"<CR>



nmap f :NERDTreeToggle<CR> 

" increase/decrease the current window size by 5
"map = :resize +5<CR> " makes problems with formatting key = @t 
map @ :resize +5<CR>
map - :resize -5<CR>
map + :vertical resize +5<CR>
map _ :vertical resize -5<CR>
set pastetoggle=<C-p>


" moving across regions
noremap <C-k> :wincmd k<CR>
noremap <C-j> :wincmd j<CR>
noremap <C-h> :wincmd h<CR>
noremap <C-l> :wincmd l<CR>
noremap <Left> :tabp<CR>
noremap <Right> :tabn<CR>



"""" save views """"
"map <C-m> :mkview<CR> " save the current view state for this file "
"map <C-n> :loadview<CR> " load the stored view state for this file "
"set viminfo='1000,:1000,/100         " this customizes the information that is stored everytime I exit vim "
" '1000 = store information about 1000 files (e.g. marks, location etc)
" :1000 = number of lines to save from the command line history
" /100 = number of lines to save from search history
"set sessionoptions+=unix,slash " allow use of the saved session files on both unix and windows "
"au BufWinLeave *.tex mkview " save the view when closing a latex file"
"au BufWinEnter *.tex silent loadview " load the view when opening a latex file "
"au BufWinLeave *.py mkview " save the view when closing a python file"
"au BufWinEnter *.py silent loadview " load the view when opening a python file "

"""" folding """"
set foldcolumn=6 " show +, -, | for folds"
set foldclose=all " folds close automatically when you move out of it "
set foldmethod=indent " fold according to indent "
set foldlevel=4 " all text with 4 times of shiftwidth is folded "
" set foldmethod=marker " based on certain marker "


"""" special runtimes to load always """"
runtime! ftplugin/man.vim " always load the man pages. To search for man page, use :Man <word>"


"""" abbreviations to avoid spelling mistakes """"
source $HOME/.vim/config/abbrev.cfg

"""" abbreviations to save typing effort """"
noreabbrev @t TODO 
noreabbrev @f FODO
noreabbrev ~/ $HOME

"""" filetypes """"
au! BufNewFile * silent! 0r ~/.vim/templates/tmpl.%:e " use the appropriate template for creating a new file

" quickfix related "
botright cwindow " occupy the full width during vertical splits"
noremap <F6> :copen<CR> " open the quickfix window "
noremap <F7> :.cc<CR> " go to the error under the cursor"
noremap <F8> :cn<CR> " display the next error "
noremap <F5> :make<CR>:copen<CR>


" disable arrow keys for forced usage of hjkl
"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>

" Filetype specific stuff 
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType latex setlocal textwidth=80
"autocmd FileType python compiler pylint

" vim path
set path=.,,**,~/src/**
" avoid looking into included files for completions
set complete-=i


" running programs "
noremap <f9> :make

" changing the leader from default \ to ,
let mapleader=","

" git related 
nnoremap <leader>gc :!git commit -a<CR>
nnoremap <leader>gp :!git push origin<CR>
