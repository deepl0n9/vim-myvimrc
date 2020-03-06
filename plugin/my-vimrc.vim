if !exists('g:myvimrc')
	let g:myvimrc = 1
endif
if g:myvimrc
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

    "standart mapping
    inoremap jj <ESC>
    nnoremap Q @@
    map <S-o> o<ESC>k
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    "leader
    let mapleader = " "
    map <leader> :
    map <leader>q :q!<CR>
    map <leader>w :w<CR>
    map <leader>k :bnext<CR>
    map <leader>j :bprev<CR>
    map <leader>s :split<CR>
    map <leader>v :vsplit<CR>
    "localleader
    let maplocalleader = ","
    map <localleader>w ysiw
    map <localleader>a :set wrap
    "Markdown to HTML
    nmap <localleader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>
    map <localleader>v :VimuxPromptCommand<CR>
    map <C-i> :NERDTreeToggle<CR>
    """""""""""""""""""""""""""""""""""""
    
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
command! Snip :CocCommand snippets.editSnippets<CR>
augroup every
  autocmd!
  au InsertEnter * set norelativenumber | set cursorcolumn
  au InsertLeave * set relativenumber | set nocursorcolumn
augroup END " no number when insert



autocmd vimenter,colorscheme * :hi indentguidesodd   ctermbg=black
autocmd vimenter,colorscheme * :hi indentguideseven  ctermbg=black
"indent guides
let g:indent_guides_enable_on_vim_startup = 1 
let g:indent_guides_auto_colors = 0
" emmet
let g:user_emmet_expandword_key = '<c-y>1'
let g:user_emmet_update_tag = '<c-y>2'
let g:user_emmet_balancetaginward_key = '<c-y>3'
let g:user_emmet_balancetagoutward_key = '<c-y>4'
let g:user_emmet_next_key = '<c-y>5'
let g:user_emmet_prev_key = '<c-y>6'
let g:user_emmet_imagesize_key = '<c-y>7'
let g:user_emmet_togglecomment_key = '<c-y>8'
let g:user_emmet_splitjointag_key = '<c-y>9'
let g:user_emmet_anchorizeurl_key = '<c-y>10'
let g:user_emmet_anchorizesummary_key = '<c-y>11'
let g:user_emmet_mergelines_key = '<c-y>12'
let g:user_emmet_codepretty_key = '<c-y>13'

let g:user_emmet_leader_key=','
"===== fzf====
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1


" ===== gitgutter ==== 
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_sign_removed = 'x'
set updatetime=100 " update sign colum every quarter second = default is 4000
""""""""end gitgutter"""""""""""""""""""""""""""""
" nerdtree
let nerdtreeshowhidden = 1
let nerdtreeshowbookmarks = 1
let nerdtreeminimalui = 1
let nerdtreeedirarrows = 1


endif
