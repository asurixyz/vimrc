syntax on
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
"map <F5> :w <CR> :!g++ % -o %< && ./%< <CR>

function! CompileAndRun()
    write
    vertical botright new
    vertical resize 50
    let l:source_file = expand('%:p')
    let l:output_file = expand('%:p:r') . '_out'
    let l:cmd = printf('g++ "%s" -o "%s" && "%s" && read -n1', 
                \ l:source_file, 
                \ l:output_file, 
                \ l:output_file)
    call term_start([&shell, '-c', l:cmd], {"curwin": 1})
endfunction


augroup AutoCloseTerm
    autocmd!
    autocmd TerminalOpen * nnoremap <buffer> <CR> :q<CR>
augroup END

nnoremap <F5> :call CompileAndRun()<CR>

augroup AutoCloseTerm
    autocmd!
    autocmd TerminalOpen * nnoremap <buffer> <CR> :q<CR>
augroup END

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
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

set undofile
set undodir=~/.vim/undodir

set encoding=utf-8

set laststatus=2

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{getcwd()}
set statusline+=/
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

set statusline+=%#IncSearch#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffAdd#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffChange#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#Cursor#%{(mode()=='c')?'\ \ COMMAND\ ':''}

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e
