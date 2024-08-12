set background=dark
colorscheme ron
set number
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
filetype plugin indent on
set omnifunc=ccomplete#Complete

" Map F5 to compile and run C++ code
function! CompileAndRun()
    write
    let l:filename = expand('%:t:r')
    execute '!g++ -std=c++11 ' . shellescape(expand('%')) . ' -o ' . shellescape(l:filename) . ' && chmod +x ' . shellescape(l:filename) . ' && ./' . shellescape(l:filename)
endfunction
nnoremap <F5> :call CompileAndRun()<CR>

set hlsearch
set incsearch
set mouse=a
set showcmd
set wildmenu
set cursorline
set foldenable
set foldmethod=indent
set foldlevel=99
set laststatus=2
set undofile
set undodir=~/.vim/undodir
set encoding=utf-8

" Simplified statusline
set statusline=
set statusline+=%f\                          " File name
set statusline+=%h%m%r%w\                    " Flags
set statusline+=%=                           " Right align
set statusline+=\ [%{&fileformat}]           " File format
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}] " File encoding
set statusline+=\ %l:%c\                     " Line and column number
set statusline+=\ %P                         " Percentage through file
