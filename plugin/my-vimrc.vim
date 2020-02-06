if !exists('g:myvimrc')
    let g:myvimrc = 1
endif

if g:myvimrc
    augroup every
  autocmd!
  au InsertEnter * set norelativenumber | set cursorcolumn
  au InsertLeave * set relativenumber | set nocursorcolumn
augroup END " no number when insert
    set shortmess+=c
    set lazyredraw
    set smartcase
    set ignorecase
    set formatoptions-=cro
    set tw=0
    set hidden
    set nobackup
    set nowritebackup
    set signcolumn=yes
    set backspace=indent,eol,start
    set nocompatible
    set number 
    set relativenumber
    set nowrap 
    set shiftwidth=4
    set smarttab
    set title
    set statusline+=%=%l:%c
    set statusline=[%n]\ [%t]
    set expandtab
    set laststatus=2
    set cursorline
    set background=light
    colorscheme spacegray

"======== <leader> mapping
" when make mistake while record macro just undo and fix then stop record
" paste keystroke inside reqister macro and fix/delete undo and other
" finally yank to register macro itself
nnoremap Q @@
inoremap jj <ESC>
let maplocalleader = ","
map <localleader>w ysiw
map <localleader>a :set wrap
"Markdown to HTML
nmap <localleader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>
map <localleader>v :VimuxPromptCommand<CR>
let mapleader = " "
map <leader> :
map <S-o> o<ESC>k
map <leader>q :q!<CR>
map <leader>w :w<CR>
map <leader>k :bnext<CR>
map <leader>j :bprev<CR>
map <leader>g :Git
map <leader>r :so ~/.vimrc<CR>
map <leader>ge :GitGutterLineHighlightsEnable<CR>
map <leader>gu :GitGutterLineHighlightsDisable<CR>
map <leader>s :split<CR>
map <leader>v :vsplit<CR>
map <leader>d :bw<CR>
map <leader>to :TagbarToggle<CR>
map <leader>tc :TagbarClose<CR>
nnoremap <silent> <leader><Space> :call Fzf_dev()<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"""""""""""""""""""""""""""""""""""""

" List user command
" :WipeReg to clear register in  buffer
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
command! Listspace echo 'leader space = -s r (reload) -s j&k (nextbuffer & prev) -s t, v, s (newtab, vsplit, split)'
command! Listcoma echo 'leader coma = -c w (ysiw (add <"...)) -c , (emmet trigger) '
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

endif
