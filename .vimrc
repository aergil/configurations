set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'vim-scripts/logstash.vim'
Plugin 'majutsushi/tagbar'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ------------------ Base configuration ------

set guifont=Monospace\ 9
set guioptions -=m 
set guioptions -=T
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab 
syntax on
" ------------------ MBE ---------------

nmap <c-Tab> :bn<CR>
nmap <c-S-Tab> :bp<CR>
nmap <c-d> :MBEbd<CR>
" ---------------- vim-compiler-go -----
" let g:golang_goroot = "/usr/local/go" 
" autocmd FileType go compiler golang
" ----------------- Global -------------
set noswapfile
colorscheme summerZorg
nmap <c-A-u> :vimgrep <c-r><c-w>  **/*.go<CR> :cw<CR>

nmap <c-s> :w<CR>
nmap <F7> mzgg=G`z :w<CR>
nmap <c-S-Up> :res +5<CR>
nmap <c-S-Down> :res -5<CR>
nmap <c-S-Left> :vertical resize -5<CR>
nmap <c-S-Right> :vertical resize +5<CR>

" ----------------  NERDTree ------------
"
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

" Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1

" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif
" ------------------ GO -----------------
set rtp+=/home/tgavard/workspace/golang/src/github.com/golang/lint/misc/vim

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_oracle_include_tests = 1

let mapleader = ","


" Show a list of interfaces which is implemented by the type under your cursor with <leader>s
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor with <leader>i (useful if you have disabled auto showing type info via g:go_auto_type_info)
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor with <leader>gd or open it vertically with <leader>gv
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Or open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

"Run commands, such as go run with <leader>r for the current file or go build and go test for the current package with <leader>b and <leader>t. Display a beautiful annotated source code to see which functions are covered with <leader>c.
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" By default the mapping gd is enabled which opens the target identifier in current buffer. You can also open the definition/declaration in a new vertical, horizontal or tab for the word under your cursor:
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

"Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

"More <Plug> mappings can be seen with :he go-mappings. Also these are just recommendations, you are free to create more advanced mappings or functions based on :he go-commands.
"

" ------------------ Tagbag -----------------
nmap <F8> :TagbarToggle<CR>
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
