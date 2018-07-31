if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


set nocompatible
set t_Co=256


filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'Afoucaul/vim-snippets'
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
"Plug 'vim-syntastic/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'tpope/vim-abolish'                        " Case-preservating substitution, eg: :%S/goodjob/badjob : GoodJob -> BadJob
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-surround'

call plug#end()


" Colorscheme configuration
set background=dark                     " Select dark solarized
"set background=light                    " Select light solarized
color solarized                         " Select solarized
hi Normal guibg=NONE ctermbg=NONE       " Enable transparent background




" NERDTree configuration: open an explorer when vim is launched without file
" to edit
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Incsearch and easymotion configuration
map /  <Plug>(incsearch-easymotion-/)
map ?  <Plug>(incsearch-easymotion-?)
map g/ <Plug>(incsearch-easymotion-stay)


" Disable highlight search results, because incsearch does it
set nohls


" Displaying line numbers
set number relativenumber


" Underline the line under the cursor
set cursorline


" Setting tabs up

" The width of a hard tabstop measured in spaces -- effectively the (maximum) width of an actual tab character.
set tabstop=8 
" The size of an indent. It's also measured in spaces.
set softtabstop=0 
" Setting this to a non-zero value other than tabstop will make the tab key (in insert mode) insert a combination of spaces (and possibly tabs) to simulate tab stops at this width.
set expandtab 
" Enabling this will make the tab key (in insert mode) insert spaces instead of tab characters. This also affects the behavior of the retab command.
set shiftwidth=4
" Enabling this will make the tab key (in insert mode) insert spaces or tabs to go to the next indent of the next tabstop when the cursor is at the beginning of a line.
" set smarttab



" Allow backspace over autoindent and insert start, but not over line breaks
set backspace=indent,start,eol


" POTENTIALLY USEFUL make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:SuperTabDefaultCompletionType = '<C-n>'


" UltiSnips keybindings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" Syntastic checkers
"let g:syntastic_javascript_checkers = ['jshint']

set runtimepath+=~/.vim/my-snippets


" Statusline
set laststatus=2


" Type // in visual mode to search currently selected text as raw
vnoremap // y/\V<C-R>"<CR>

" Don't override the register content when pasting
vnoremap p "_dP

let g:elixir_autobuild=1
let g:elixir_showerror=1

" Display the folds in the left column
set foldcolumn=1

augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent loadview
augroup END
